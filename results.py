#!/usr/bin/env python3

import glob
import jinja2
import json
import os
import re
import sqlite3
import subprocess
import sys

import benchmark


jenv = jinja2.Environment(
    loader=jinja2.FileSystemLoader('stuff/'),
    variable_start_string='\\VAR{',
    variable_end_string='}',
)


def do_test_run(dbentry, filename):
    binary = benchmark.get_binary(dbentry, dbentry['prefix'])
    cmd = [binary] + dbentry.get('args', [])

    if dbentry['match'] == 'incorrect':
        cmd = ['stuff/result_differs.py'] + cmd
    elif dbentry['match'] == 'incorrect-unknown':
        cmd = ['stuff/result_differs_unknown.py'] + cmd
    cmd = cmd + [filename]
    
    res = subprocess.run(cmd, stdout=subprocess.PIPE, stderr=subprocess.PIPE)
    out = res.stdout.decode()
    err = res.stderr.decode()
    exitcode = res.returncode

    return out, err, exitcode


def do_check_run(dbentry, filename):
    out, err, exitcode = do_test_run(dbentry, filename)

    if dbentry['match'] == 'incorrect':
        return exitcode == 1
    elif dbentry['match'] == 'incorrect-unknown':
        return exitcode == 1
    elif dbentry['match'] == 'stderr':
        return dbentry['stderr'] in err
    elif dbentry['match'] == 'stdout':
        return dbentry['stdout'] in out
    elif dbentry['match'] == 'exitcode':
        return exitcode == dbentry['exitcode']
    else:
        print("Unknown matcher")
        sys.exit(1)


class ResultLoader:
    TIMEOUT = 60*60

    def __init__(self, dbname):
        if os.path.isfile(dbname):
            os.unlink(dbname)
        self.db = sqlite3.connect(dbname)
        self.db.row_factory = sqlite3.Row
        self.__setup_database()
        self.database = {}

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

    def __has_parser_error(self, fullname, err, out):
        """Check whether the err/out outputs indicate a debugger parser error"""
        
        # ddSMT errors
        m = re.search('\[ddsmt\] .* unknown command (\'[^\']+\')', err)
        if m is not None:
            if not fullname.startswith('out/ddsmt-master'):
                print(f'ddSMT parser error: unknown command {m.group(1)} in {fullname}')
            return True
        m = re.search('\[ddsmt\] .* function (\'[^\']+\') undeclared', err)
        if m is not None:
            if not fullname.startswith('out/ddsmt-master'):
                print(f'ddSMT parser error: unknown function{m.group(1)} in {fullname}')
            return True
        m = re.search('\[ddsmt\] .* function argument (\'[^\']+\') undeclared', err)
        if m is not None:
            if not fullname.startswith('out/ddsmt-master'):
                print(f'ddSMT parser error: unknown function argument {m.group(1)} in {fullname}')
            return True
        m = re.search('\[ddsmt\] .* \'\)\' expected', err)
        if m is not None:
            if not fullname.startswith('out/ddsmt-master'):
                print(f'ddSMT parser error: expected ")" in {fullname}')
            return True

        # delta errors
        m = re.search('Parsing error in line', err)
        if m is not None:
            if not fullname.startswith('out/delta/'):
                print(f'delta parser error in {fullname}')
            return True

        return False

    def __has_error(self, fullname, err, out):
        m = re.search('Traceback', err)
        if m is not None:
            print(f'ERROR: traceback in {fullname}.err')
            return True
        m = re.search('AssertionError', err)
        if m is not None:
            print(f'ERROR: assertion in {fullname}.err')
            return True

        m = re.search('Segmentation fault', err)
        if m is not None:
            print(f'ERROR: segfault in {fullname}.err')
            return True

        return False

    def load_inputs(self, basedir=''):
        """Load all input files"""
        print(f'Loading inputs{f" from {basedir}" if basedir else ""}...')
        database = json.load(open(f'{basedir}database.json'))
        for filename in database:
            fullname = f'{basedir}inputs/{filename}'
            database[filename]['prefix'] = basedir
            size = os.stat(fullname).st_size
            database[filename]['insize'] = size
            out, err, exitcode = do_test_run(database[filename], fullname)
            database[filename]['exitcode'] = exitcode
        self.database.update(database)

    def load_solver(self, solver):
        """Load all results for one solver"""
        print(f'Loading results from {solver}...')
        for filename in self.database:
            fullname = f'out/{solver}/{filename}'
            insize = self.database[filename]['insize']
            if not os.path.isfile(f'{fullname}.err'):
                print(f'ERROR: {fullname}.err does not exist')
                self.__add_result(filename, solver, insize, insize, -5)
                continue
            if not os.path.isfile(f'{fullname}.out'):
                print(f'ERROR: {fullname}.out does not exist')
                self.__add_result(filename, solver, insize, insize, -5)
                continue
            err = open(f'{fullname}.err').read()
            out = open(f'{fullname}.out').read()

            if self.__has_parser_error(fullname, err, out):
                self.__add_result(filename, solver, insize, insize, -1)
                continue

            if self.__has_error(fullname, err, out):
                self.__add_result(filename, solver, insize, insize, -2)
                continue

            resfile = None
            if os.path.isfile(fullname):
                outsize = os.stat(fullname).st_size
                resfile = fullname
            else:
                if os.path.isfile(f'{fullname}.dir/delta.last.smt2'):
                    resfile = f'{fullname}.dir/delta.last.smt2'
                    outsize = os.stat(resfile).st_size
                else:
                    m = re.search('unable to minimize input file', err)
                    if m is not None:
                        outsize = insize
                    else:
                        print(f'Warning: {fullname} does not exist, assume it could not be minimized')
                        outsize = insize

            if resfile is not None:
                if not do_check_run(self.database[filename], fullname):
                    print(f'ERROR: {fullname} does not trigger the issue')
                    self.__add_result(filename, solver, insize, outsize, -3)
                    continue

            
            if os.path.isfile(f'{fullname}.time'):
                runtime = float(open(f'{fullname}.time').read())
            elif re.search('CANCELLED AT .* DUE TO TIME LIMIT', err) is not None:
                self.__add_result(filename, solver, insize, outsize, -4)
                continue
            else:
                print(f'Warning: {fullname}.time does not exist, but was not cancelled')
                self.__add_result(filename, solver, insize, outsize, -5)
                continue

            self.__add_result(filename, solver, insize, outsize, runtime)


def solver_name(s):
    d = {
        'ddsmt-master': 'ddsmt',
        'ddsmt-dev-ddmin': 'ddmin',
        'ddsmt-dev-ddmin-j1': 'ddmin-j1',
        'ddsmt-dev-hierarchical': 'hier',
        'ddsmt-dev-hierarchical-j1': 'hier-j1',
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
    errors = {
        -1: 'PE',  # parser error
        -2: 'SEG',  # assertion / segfault
        -3: 'IO',  # incorrect output
        -5: 'AB',  # aborted, no output files
    }
    soft_errors = {
        -4: 'TO',  # timeout enforced by slurm
    }
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
            if data[i][s]['time'] < 0:
                continue
            best = min(best, data[i][s]['outsize'])
        for s in data[i]:
            if s == 'insize':
                continue
            t = data[i][s]['time']
            if t in errors:
                data[i][s]['time'] = errors[t]
                data[i][s]['outsize'] = '--'
                continue
            if t in soft_errors:
                data[i][s]['time'] = soft_errors[t]
            else:
                data[i][s]['time'] = f'{t:0.1f}'
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
    WHERE a.solver = ? AND a.time >= 0

    UNION ALL

    SELECT b.insize AS insize, a.outsize AS aout, b.outsize AS bout, a.time AS atime, b.time AS btime
    FROM data AS b
    LEFT JOIN data AS a ON (a.input = b.input AND a.solver = ?)
    WHERE b.solver = ? AND b.time >= 0 AND a.input IS NULL
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

loader.load_inputs()
if os.path.isdir('confidential'):
    loader.load_inputs('confidential/')
solvers = sorted([
    s for s in os.listdir('out/') if os.path.isdir(f'out/{s}')
])
for solver in solvers:
    loader.load_solver(solver)

do_analysis()
