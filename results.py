#!/usr/bin/env python3

import glob
import os
import sqlite3


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


os.unlink('db.db')
db = sqlite3.connect('db.db')
setup_database()

inputs = load_inputs()
for solver in os.listdir('out/'):
    load_solver(inputs, solver)
