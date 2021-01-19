#!/usr/bin/env python3

import glob
import jinja2
import os
import re
import sqlite3
import subprocess


jenv = jinja2.Environment(
    loader=jinja2.FileSystemLoader('stuff/'),
	variable_start_string='\VAR{',
	variable_end_string='}',
)


class ResultLoader:
    TIMEOUT = 60*60

    def __init__(self, dbname):
        if os.path.isfile(dbname):
            os.unlink(dbname)
        self.db = sqlite3.connect(dbname)
        self.db.row_factory = sqlite3.Row
        self.__setup_database()

    def __setup_database(self):
        """Create the database"""
        self.db.execute('''
CREATE TABLE IF NOT EXISTS data (
    input TEXT, solver TEXT, insize INT, outsize INT, time INT,
    UNIQUE(input, solver)
)
''')

    def __add_result(self, input, solver, insize, outsize, time):
        """Add one result to the database"""
        self.db.execute('INSERT INTO data (input,solver,insize,outsize,time) VALUES (?,?,?,?,?)', [input, solver, insize, outsize, time])
        self.db.commit()

    def __has_parser_error(self, err, out):
        """Check whether the err/out outputs indicate a debugger parser error"""
        
        # ddSMT errors
        m = re.search('\[ddsmt\] .* unknown command (\'[^\']+\')', err)
        if m is not None:
            print('ddSMT parser error: unknown command {}'.format(m.group(1)))
            return True
        m = re.search('\[ddsmt\] .* function (\'[^\']+\') undeclared', err)
        if m is not None:
            print('ddSMT parser error: unknown function {}'.format(m.group(1)))
            return True
        m = re.search('\[ddsmt\] .* function argument (\'[^\']+\') undeclared', err)
        if m is not None:
            print('ddSMT parser error: unknown function argument {}'.format(m.group(1)))
            return True
        m = re.search('\[ddsmt\] .* \'\)\' expected', err)
        if m is not None:
            print('ddSMT parser error: expected ")"')
            return True
        m = re.search('AssertionError', err)
        if m is not None:
            print('ddSMT error: assertion')
            return True
        
        # delta errors
        m = re.search('Parsing error in line', err)
        if m is not None:
            print('delta parser error')
            return True
        m = re.search('Segmentation fault.*build/delta/build/delta', err)
        if m is not None:
            print('delta error: segfault')
            return True
        
        return False
    
    def __get_result_size(self, fullname, insize, err, out):
        if os.path.isfile(fullname):
            return os.stat(fullname).st_size
        m = re.search('unable to minimize input file', err)
        if m is not None:
            return insize
        if os.path.isfile(f'{fullname}.dir/delta.last.smt2'):
            return os.stat(f'{fullname}.dir/delta.last.smt2').st_size
        print(f'Warning: {fullname} does not exist, assume it could not be minimized')
        return insize


    def __get_runtime(self, fullname, err):
        if os.path.isfile(f'{fullname}.time'):
            return float(open(f'{fullname}.time').read())
        elif re.search('CANCELLED AT .* DUE TO TIME LIMIT', err) is not None:
            return self.TIMEOUT
        else:
            print(f'Warning: {fullname}.time does not exist, but was not cancelled')
            return None

    def load_inputs(self):
        """Load all input files"""
        res = {}
        for filename in sorted(glob.iglob('inputs/*.smt2')):
            size = os.stat(filename).st_size
            res[os.path.basename(filename)] = size
        return res

    def load_solver(self, inputs, solver):
        """Load all results for one solver"""
        for filename in inputs:
            fullname = f'out/{solver}/{filename}'
            insize = inputs[filename]
            if not os.path.isfile(f'{fullname}.err'):
                print(f'ERROR: {fullname}.err does not exist')
                continue
            if not os.path.isfile(f'{fullname}.out'):
                print(f'ERROR: {fullname}.out does not exist')
                continue
            err = open(f'{fullname}.err').read()
            out = open(f'{fullname}.out').read()
            if self.__has_parser_error(err, out):
                continue
        
            outsize = self.__get_result_size(fullname, insize, err, out)

            runtime = self.__get_runtime(fullname, err)
            if runtime is None:
                continue

            self.__add_result(filename, solver, insize, outsize, runtime)


def solver_name(s):
    d = {
        'ddsmt-master': 'ddsmt',
        'ddsmt-dev-ddmin': 'ddmin',
        'ddsmt-dev-ddmin-j1': 'ddmin-j1',
        'ddsmt-dev-hierarchical': 'hierarchical',
        'ddsmt-dev-hierarchical-j1': 'hierarchical-j1',
    }
    return d.get(s, s)


def render_to_file(filename, tplfile, **kwargs):
    with open(filename, 'w') as file:
        tpl = jenv.get_template(tplfile)
        file.write(tpl.render(**kwargs))



def get_all_results():
    cur = loader.db.execute('''
SELECT input, solver, insize, outsize, time FROM data
''')
    data = {}
    solvers = []
    inputs = []
    for c in cur:
        if c['input'] not in data:
            data[c['input']] = {'insize': c['insize']}
        assert c['insize'] == data[c['input']]['insize']
        data[c['input']][solver_name(c['solver'])] = {
            'outsize': c['outsize'],
            'time': c['time'],
        }
        inputs.append(c['input'])
        solvers.append(solver_name(c['solver']))
    for i in data:
        best = data[i]['insize']
        for s in data[i]:
            if s == 'insize':
                continue
            best = min(best, data[i][s]['outsize'])
        for s in data[i]:
            if s == 'insize':
                continue
            if data[i][s]['outsize'] == best:
                data[i][s]['best'] = True
    return {
        'data': data,
        'inputs': sorted(list(set(inputs))),
        'solvers': sorted(list(set(solvers))),
    }


def ffloat(f):
    return '--' if f is None else f'{f:.2f}'


def fint(i):
    return '--' if i is None else f'{i}'


def overview_data(solvers):
    res = {
        'parse': {},
        'reduce': {},
        'avg': {},
        'avg300': {},
    }
    for s in solvers:
        res['parse'][s] = fint(loader.db.execute('SELECT COUNT(*) FROM data WHERE solver = ?', [s]).fetchone()[0])
        res['reduce'][s] = fint(loader.db.execute('SELECT COUNT(*) FROM data WHERE solver = ? AND outsize < insize', [s]).fetchone()[0])
        res['avg'][s] = ffloat(loader.db.execute('SELECT AVG(1-(outsize * 1.0 / insize)) FROM data WHERE solver = ?', [s]).fetchone()[0])
        res['avg300'][s] = ffloat(loader.db.execute('SELECT AVG(1-(outsize * 1.0 / insize)) FROM data WHERE solver = ? AND insize>300', [s]).fetchone()[0])
    return res


def get_overview_results():
    total = loader.db.execute('SELECT COUNT(DISTINCT input) FROM data').fetchone()[0]
    datanames = {'parse': 'can parse', 'reduce': 'can reduce', 'avg': 'average reduction', 'avg300': 'average reduction ($>$300 bytes)' }
    slv = [s for s in solvers if s not in ['ddsmt-dev-ddmin-j1', 'ddsmt-dev-hierarchical-j1']]
    return {
        'total': total,
        'solvers': slv,
        'solvernames': {s: solver_name(s) for s in slv if s not in ['ddsmt-dev-ddmin-j1', 'ddsmt-dev-hierarchical-j1']},
        'data': overview_data(solvers),
        'datanames': datanames,
    }



def scatter(filename_size, filename_time, A, B):
    res = loader.db.execute('''
    SELECT a.insize AS insize, a.outsize AS aout, b.outsize AS bout, a.time AS atime, b.time AS btime
    FROM data AS a
    LEFT JOIN data AS b ON (a.input = b.input AND b.solver = ?)
    WHERE a.solver = ?

    UNION ALL

    SELECT b.insize AS insize, a.outsize AS aout, b.outsize AS bout, a.time AS atime, b.time AS btime
    FROM data AS b
    LEFT JOIN data AS a ON (a.input = b.input AND a.solver = ?)
    WHERE b.solver = ? AND a.input IS NULL
    ''', [B, A, A, B])
    f = open(filename_size, 'w')
    res = res.fetchall()
    for r in res:
        r = dict(r)
        if r['aout'] is None:
            r['aout'] = r['insize'] * 1.15
        if r['bout'] is None:
            r['bout'] = r['insize'] * 1.15
        f.write('{}\t{}\n'.format(r['aout'] / r['insize'] * 100, r['bout'] / r['insize'] * 100))
    f.close()
    f = open(filename_time, 'w')
    for r in res:
        r = dict(r)
        if r['aout'] is None: continue
        if r['bout'] is None: continue
        if r['aout'] == r['insize']: continue
        if r['bout'] == r['insize']: continue
        f.write('{}\t{}\n'.format(r['atime'], r['btime']))
    f.close()


def do_analysis():
    render_to_file('out/table.tex', 'table-complete.tpl', **get_all_results())
    render_to_file('out/table-overview.tex', 'table-overview.tpl', **get_overview_results())
    scatter('out/scatter-ddmin-hierarchical-size.data', 'out/scatter-ddmin-hierarchical-time.data', 'ddsmt-dev-ddmin', 'ddsmt-dev-hierarchical')


loader = ResultLoader('out/db.db')

inputs = loader.load_inputs()
solvers = sorted([
    s for s in os.listdir('out/') if os.path.isdir(f'out/{s}')
])
for solver in solvers:
    loader.load_solver(inputs, solver)

do_analysis()
