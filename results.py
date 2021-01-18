#!/usr/bin/env python3

import glob
import jinja2
import os
import sqlite3
import subprocess


jenv = jinja2.Environment(
    loader=jinja2.FileSystemLoader('stuff/'),
	variable_start_string='\VAR{',
	variable_end_string='}',
)


def solver_name(s):
    d = {
        'ddsmt-master': 'ddsmt',
        'ddsmt-dev-ddmin': 'ddmin',
        'ddsmt-dev-ddmin-j1': 'ddmin-j1',
        'ddsmt-dev-naive': 'ddnaive',
        'ddsmt-dev-naive-j1': 'ddnaive-j1',
    }
    return d.get(s, s)


def render_to_file(filename, tplfile, **kwargs):
    with open(filename, 'w') as file:
        tpl = jenv.get_template(tplfile)
        file.write(tpl.render(**kwargs))


def setup_database():
    """Create the database"""
    db.execute('''
CREATE TABLE IF NOT EXISTS data (
    input TEXT, solver TEXT, insize INT, outsize INT, time INT,
    UNIQUE(input, solver)
)
''')


def add_result(input, solver, insize, outsize, time):
    """Add one result to the database"""
    db.execute('INSERT INTO data (input,solver,insize,outsize,time) VALUES (?,?,?,?,?)', [input, solver, insize, outsize, time])
    db.commit()


def load_inputs():
    """Load all input files"""
    res = {}
    for filename in glob.iglob('inputs/*.smt2'):
        size = os.stat(filename).st_size
        res[os.path.basename(filename)] = size
    return res


def load_solver(inputs, solver):
    """Load all results for one solver"""
    for filename in inputs:
        fullname = f'out/{solver}/{filename}'
        insize = inputs[filename]
        outsize = insize
        if os.path.isfile(fullname):
            outsize = os.stat(fullname).st_size
        else:
            print(f'Warning: {fullname} does not exist, assume it could not be minimized')
        if not os.path.isfile(f'{fullname}.time'):
            print(f'Warning: {fullname}.time does not exist')
            continue
        runtime = float(open(f'{fullname}.time').read())
        add_result(filename, solver, insize, outsize, runtime)


def get_all_results():
    cur = db.execute('''
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
        print(data[i])
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


def do_analysis():
    render_to_file('out/table.tex', 'table-overview.tpl', **get_all_results())
    subprocess.run(['pdflatex', 'table.tex'], cwd='out/')


if os.path.isfile('db.db'):
    os.unlink('db.db')
db = sqlite3.connect('db.db')
db.row_factory = sqlite3.Row
setup_database()

inputs = load_inputs()
for solver in os.listdir('out/'):
    load_solver(inputs, solver)

do_analysis()