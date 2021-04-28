#!/usr/bin/env python3

import argparse
import glob
import jinja2
import json
import os
import re
import sqlite3
import subprocess
import sys

import benchmark


ERROR_PARSER = -1
ERROR_SEGFAULT = -2
ERROR_INCORRECT = -3
ERROR_TIMEOUT = -4
ERROR_ABORTED = -5

args = None

jenv = jinja2.Environment(
    loader=jinja2.FileSystemLoader('stuff/'),
    variable_start_string='\\VAR{',
    variable_end_string='}',
)


def do_test_run(input, dbentry, filename):
    binary = benchmark.get_binary(input, dbentry, dbentry['prefix'])
    cmd = [binary] + dbentry.get('args', [])

    if dbentry['match'] == 'incorrect':
        cmd = ['stuff/result_differs.py'] + cmd
    elif dbentry['match'] == 'incorrect-unknown':
        cmd = ['stuff/result_differs_unknown.py'] + cmd
    cmd = cmd + [filename]
    
    try:
        res = subprocess.run(cmd, stdout=subprocess.PIPE, stderr=subprocess.PIPE, timeout=15)
        out = res.stdout.decode()
        err = res.stderr.decode()
        exitcode = res.returncode
    except:
        out = ""
        err = ""
        exitcode = None

    return out, err, exitcode


def do_check_run(input, dbentry, filename):
    out, err, exitcode = do_test_run(input, dbentry, filename)

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

    def __has_parser_error(self, fullname, solver, log):
        """Check whether the log output indicate a debugger parser error"""
        
        # ddSMT errors
        m = re.search('\[ddsmt\] .* unknown command (\'[^\']+\')', log)
        if m is not None:
            if not fullname.startswith(f'{args.dir}/ddsmt-master'):
                print(f'{solver} parser error: unknown command {m.group(1)} in {fullname}')
            return True
        m = re.search('\[ddsmt\] .* function (\'[^\']+\') undeclared', log)
        if m is not None:
            if not fullname.startswith(f'{args.dir}/ddsmt-master'):
                print(f'{solver} parser error: unknown function{m.group(1)} in {fullname}')
            return True
        m = re.search('\[ddsmt\] .* function argument (\'[^\']+\') undeclared', log)
        if m is not None:
            if not fullname.startswith(f'{args.dir}/ddsmt-master'):
                print(f'{solver} parser error: unknown function argument {m.group(1)} in {fullname}')
            return True
        m = re.search('\[ddsmt\] .* \'\)\' expected', log)
        if m is not None:
            if not fullname.startswith(f'{args.dir}/ddsmt-master'):
                print(f'{solver} parser error: expected ")" in {fullname}')
            return True
        if 'assert(sf.find_sort_and_scope (str(t_ident)))' in log:
            assert fullname.startswith(f'{args.dir}/ddsmt-master')
            return True

        # delta errors
        m = re.search('Parsing error in line', log)
        if m is not None:
            if not fullname.startswith(f'{args.dir}/delta/'):
                print(f'{solver} parser error in {fullname}')
            return True

        return False

    def __has_error(self, fullname, solver, log):
        if 'Traceback' in log:
            if 'ddsmt-master' in fullname and 'AssertionError' in log:
                return True
            print(f'ERROR {solver}: traceback in {fullname}.log')
            return True
        if 'AssertionError' in log:
            print(f'ERROR {solver}: assertion in {fullname}.log')
            return True
        if 'Segmentation fault' in log:
            print(f'ERROR {solver}: segfault in {fullname}.log')
            return True

        return False

    def load_inputs(self, basedir=''):
        """Load all input files"""
        print(f'Loading inputs{f" from {basedir}" if basedir else ""}...')
        if args.demo:
            database = json.load(open(f'{basedir}database_demo.json'))
        else:
            database = json.load(open(f'{basedir}database.json'))
        for filename in database:
            fullname = f'{basedir}inputs/{filename}'
            database[filename]['prefix'] = basedir
            size = os.stat(fullname).st_size
            database[filename]['insize'] = size
            if args.load_times:
                out, err, exitcode = do_test_run(fullname, database[filename], fullname)
                database[filename]['exitcode'] = exitcode
        self.database.update(database)

    def load_solver(self, solver):
        """Load all results for one solver"""
        print(f'Loading results from {solver}...')
        for filename in self.database:
            fullname = f'{args.dir}/{solver}/{filename}'
            insize = self.database[filename]['insize']
            
            # Load log/err/out/time files
            err = ''
            if os.path.isfile(f'{fullname}.err'):
                err = open(f'{fullname}.err').read()
            out = ''
            if os.path.isfile(f'{fullname}.out'):
                out = open(f'{fullname}.out').read()
            log = ''
            if os.path.isfile(f'{fullname}.log'):
                log = open(f'{fullname}.log').read()
            runtime = -1
            if os.path.isfile(f'{fullname}.time'):
                runtime = float(open(f'{fullname}.time').read())
            
            # An empty log file is bad
            if log == '':
                print(f'ERROR {solver}: log file is empty {filename}.log')
                self.__add_result(filename, solver, insize, insize, ERROR_ABORTED)
                continue

            # Check log for parser errors
            if self.__has_parser_error(fullname, solver, log):
                self.__add_result(filename, solver, insize, insize, ERROR_PARSER)
                continue

            # Check log for runtime errors
            if self.__has_error(fullname, solver, log):
                self.__add_result(filename, solver, insize, insize, ERROR_SEGFAULT)
                continue
        
            # Check if the job was cancelled
            cancelled = any([
                re.search('CANCELLED AT .* DUE TO TIME LIMIT', err) is not None,
                re.search('Killing process [0-9]+ due to wall time timeout.', err) is not None,
                'terminationreason=memory' in out,
                'terminationreason=walltime' in out,
                runtime > 3600,
            ])

            # Load the output file
            resfile = None
            outsize = None

            # Check the canonical output file
            if os.path.isfile(fullname):
                outsize = os.stat(fullname).st_size
                if outsize > 0:
                    resfile = fullname
                else:
                    # This may indicate an issue with slow IO + timeout
                    print(f'Warning: {fullname} has 0 bytes')

            # Check alternative output file (for delta)
            if not resfile:
                if os.path.isfile(f'{fullname}.dir/delta.last.smt2'):
                    outsize = os.stat(f'{fullname}.dir/delta.last.smt2').st_size
                    if outsize > 0:
                        resfile = f'{fullname}.dir/delta.last.smt2'
                    else:
                        if re.search('the default timeout is set to [0-9]+ seconds\.$', log):
                            # Log ends at this point, nothing was done
                            outsize = insize
                        else:
                            print(f'Warning: {fullname}.dir/delta.last.smt2 has 0 bytes')
            
            # Check for explicit "could not minimize"
            if not resfile:
                m = re.search('unable to minimize input file', err)
                if m is not None:
                    # No minimization was possible
                    resfile = f'inputs/{filename}'
                    outsize = insize

            # Check if we have been cancelled
            if not resfile:
                if cancelled:
                    # No minimization before the timeout
                    outsize = insize
                else:
                    print(f'Warning: {fullname} has no output file and does not look like it was cancelled. We assume it could not be minimized.')
                    outsize = insize

            # With args.load_times, check if the output file is acceptable
            if args.load_times and resfile is not None:
                if not do_check_run(filename, self.database[filename], resfile):
                    if cancelled:
                        print(f'Warning: {resfile} does not trigger, but was cancelled, might be an IO issue')
                        self.__add_result(filename, solver, insize, insize, ERROR_TIMEOUT)
                    elif os.path.isfile(f'{fullname}.time'):
                        print(f'ERROR: {resfile} does not trigger the issue')
                        self.__add_result(filename, solver, insize, insize, ERROR_INCORRECT)
                    else:
                        print(f'Warning: {resfile} does not trigger the issue, but may still be running')
                        self.__add_result(filename, solver, insize, insize, ERROR_INCORRECT)
                    continue

            # Check for timeouts
            if runtime > 3600:
                self.__add_result(filename, solver, insize, outsize, ERROR_TIMEOUT)
                continue
            elif runtime == -1:
                if cancelled:
                    print(f'Warning: {fullname}.time does not exist, it was cancelled')
                    self.__add_result(filename, solver, insize, outsize, ERROR_TIMEOUT)
                    continue
                else:
                    print(f'Warning: {fullname}.time does not exist, but was not cancelled')
                    self.__add_result(filename, solver, insize, outsize, ERROR_ABORTED)
                    continue

            # We have a proper result
            self.__add_result(filename, solver, insize, outsize, runtime)


def solver_name(s):
    d = {
        'ddsmt-master': '\\ddsmt',
        'ddsmt-paper-ddmin': '\\stratddmin',
        'ddsmt-paper-hierarchical': '\\strathiershort',
        'ddsmt-paper-hybrid': 'hybrid',
        'delta': '\\deltadd',
        'pydelta': '\\pydelta',
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
        -1: '\\textbf{PE}',  # parser error
        -2: '\\textbf{SEG}',  # assertion / segfault
        -3: '\\textbf{IO}',  # incorrect output
        -5: '\\textbf{AB}',  # aborted, no output files
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
            if data[i][s]['time'] in errors:
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
                data[i][s]['time'] = f'{t:0.0f}'
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
        'parsererror': {},
        'segfault': {},
        'incorrect': {},
        'timeout': {},
        'reduce': {},
        'bestreduce': {},
        #'avgbestruntime': {},
        'avg': {},
        'allavg': {},
        'avgwoto': {},
        'med': {},
        'allmed': {},
        'medwoto': {},
        #'avg300': {},
    }
    for s in solvers:
        res['parsererror'][s] = fint(loader.db.execute('SELECT COUNT(*) FROM data WHERE solver = ? AND time = -1', [s]).fetchone()[0])
        res['segfault'][s] = fint(loader.db.execute('SELECT COUNT(*) FROM data WHERE solver = ? AND time = -2', [s]).fetchone()[0])
        res['incorrect'][s] = fint(loader.db.execute('SELECT COUNT(*) FROM data WHERE solver = ? AND time = -3', [s]).fetchone()[0])
        res['timeout'][s] = fint(loader.db.execute('SELECT COUNT(*) FROM data WHERE solver = ? AND time = -4', [s]).fetchone()[0])
        res['reduce'][s] = fint(loader.db.execute('SELECT COUNT(*) FROM data WHERE solver = ? AND outsize != insize AND (time >= 0 OR time = -4)', [s]).fetchone()[0])
        res['bestreduce'][s] = fint(loader.db.execute('''
SELECT COUNT(*) FROM data
LEFT JOIN (
	SELECT MIN(outsize) AS minsize, input FROM data GROUP BY input
) AS mins ON (data.input = mins.input)
WHERE solver = ? AND data.outsize = mins.minsize
''', [s]).fetchone()[0])
#        res['avgbestruntime'][s] = ffloat(loader.db.execute('''
#SELECT AVG(time) FROM data
#LEFT JOIN (
#	SELECT MIN(outsize) AS minsize, input FROM data GROUP BY input
#) AS mins ON (data.input = mins.input)
#WHERE solver = ? AND data.outsize = mins.minsize
#''', [s]).fetchone()[0])
        res['avg'][s] = ffloat(loader.db.execute('SELECT AVG(1-(outsize * 1.0 / insize)) FROM data WHERE solver = ? AND (time >= 0 OR time = -4)', [s]).fetchone()[0])
        res['avgwoto'][s] = ffloat(loader.db.execute('SELECT AVG(1-(outsize * 1.0 / insize)) FROM data WHERE solver = ? AND time >= 0', [s]).fetchone()[0])
        res['allavg'][s] = ffloat(loader.db.execute('SELECT AVG(1-(outsize * 1.0 / insize)) FROM data WHERE solver = ?', [s]).fetchone()[0])
        data = list(loader.db.execute('SELECT 1-(outsize * 1.0 / insize) FROM data WHERE solver = ? AND (time >= 0 OR time = -4)', [s]).fetchall())
        if data:
            res['med'][s] = ffloat(data[len(data) // 2][0])
        else:
            res['med'][s] = '--'
        data = list(loader.db.execute('SELECT 1-(outsize * 1.0 / insize) FROM data WHERE solver = ?', [s]).fetchall())
        if data:
            res['allmed'][s] = ffloat(data[len(data) // 2][0])
        else:
            res['allmed'][s] = '--'
        data = list(loader.db.execute('SELECT 1-(outsize * 1.0 / insize) FROM data WHERE solver = ? AND time >= 0', [s]).fetchall())
        if data:
            res['medwoto'][s] = ffloat(data[len(data) // 2][0])
        else:
            res['medwoto'][s] = '--'
        #res['medwoto'][s] = ffloat(loader.db.execute('SELECT MED(1-(outsize * 1.0 / insize)) FROM data WHERE solver = ? AND time >= 0', [s]).fetchone()[0])
        #res['medwoto'][s] = '--'
        #res['avg300'][s] = ffloat(loader.db.execute('SELECT AVG(1-(outsize * 1.0 / insize)) FROM data WHERE solver = ? AND insize>300 AND time >= 0', [s]).fetchone()[0])
    return res


def get_overview_results():
    total = loader.db.execute('SELECT COUNT(DISTINCT input) FROM data').fetchone()[0]
    datanames = {
        'parsererror': 'Parse Errors',
        'segfault': 'Errors',
        'timeout': 'Timeouts',
        'incorrect': 'Incorrect Output',
        'reduce': 'Any Simplification',
        'bestreduce': 'Smallest Output',
        #'avgbestruntime': 'avg runtime on best',
        'med': 'Med. Reduction (w/o ERR)',
        'medwoto': 'Med. Reduction (w/o TO/ERR)',
        'avg': 'Avg. Reduction (w/o ERR)',
        'avgwoto': 'Avg. Reduction (w/o TO/ERR)',
        'allmed': 'Med. Reduction',
        'allavg': 'Avg. Reduction',
        #'avg300': 'average reduction ($>$300 bytes)',
    }
    slv = ['ddsexpr', 'ddsmt-master', 'delta', 'linedd', 'pydelta', 'ddsmt-paper-ddmin', 'ddsmt-paper-hierarchical', 'ddsmt-paper-hybrid']
    return {
        'total': total,
        'solvers': slv,
        'solvernames': {s: solver_name(s) for s in slv},
        'data': overview_data(slv),
        'datanames': datanames,
    }



def scatter(filename_size, filename_time, A, B, C=None):
    # Make sure we include data where A or B have no data, this is why we do `UNION ALL` here. Take care that this does not introduce duplicates.
    res = loader.db.execute('''
    SELECT a.input, a.insize AS insize, a.outsize AS aout, b.outsize AS bout, a.time AS atime, b.time AS btime
    FROM data AS a
    LEFT JOIN data AS b ON (a.input = b.input AND b.solver = ?)
    WHERE a.solver = ?

    UNION ALL

    SELECT a.input, b.insize AS insize, a.outsize AS aout, b.outsize AS bout, a.time AS atime, b.time AS btime
    FROM data AS b
    LEFT JOIN data AS a ON (a.input = b.input AND a.solver = ?)
    WHERE b.solver = ? AND a.input IS NULL
    ''', [B, A, A, B])
    f = open(filename_size, 'w')
    res = res.fetchall()
    for r in res:
        r = dict(r)
        # Clip at 115% output size
        if r['aout'] is None or r['aout'] > r['insize'] * 1.15:
            r['aout'] = r['insize'] * 1.15
        if r['bout'] is None or r['bout'] > r['insize'] * 1.15:
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
        if r['atime'] == -4: r['atime'] = 7200
        if r['btime'] == -4: r['btime'] = 7200
        f.write('{}\t{}\n'.format(r['atime'], r['btime']))
    f.close()


def scatter_best(filename_size, filename_time, A, B):
    # Getting the best of B would make the approach in `scatter()` even more ugly. We thus do the JOIN manually in python based on dicts, it's not that bad after all...
    adata = loader.db.execute('''
    SELECT input, insize, outsize, time
    FROM data
    WHERE solver = ?
    ''', [A])
    adata = {a['input']: dict(a) for a in adata.fetchall()}
    bquery = ', '.join(map(lambda s: f"'{s}'", B))
    bdata = loader.db.execute(f'''
    SELECT input, insize, MIN(outsize) AS outsize, MIN(time) as time
    FROM data
    WHERE solver in ({bquery}) and time >= 0
    GROUP BY input
    ''')
    bdata = {b['input']: dict(b) for b in bdata.fetchall()}

    f = open(filename_size, 'w')
    for a in adata:
        ra = adata[a]
        if not a in bdata:
            continue
        rb = bdata[a]
        # clip at 115% output file
        if ra['outsize'] is None or ra['outsize'] > ra['insize'] * 1.15:
            ra['outsize'] = ra['insize'] * 1.15
        if rb['outsize'] is None or rb['outsize'] > rb['insize'] * 1.15:
            rb['outsize'] = rb['insize'] * 1.15
        f.write('{}\t{}\n'.format(ra['outsize'] / ra['insize'] * 100, rb['outsize'] / rb['insize'] * 100))
    f.close()
    f = open(filename_time, 'w')
    for a in adata:
        ra = adata[a]
        if not a in bdata:
            continue
        rb = bdata[a]
        if ra['outsize'] is None: continue
        if rb['outsize'] is None: continue
        if ra['outsize'] == ra['insize']: continue
        if rb['outsize'] == rb['insize']: continue
        if ra['time'] == -4: ra['time'] = 7200
        if rb['time'] == -4: rb['time'] = 7200
        f.write('{}\t{}\n'.format(ra['time'], rb['time']))
    f.close()


def load_data():
    global loader

    # Start with a fresh database
    loader = ResultLoader(f'{args.dir}/db.db')

    # Load some basic data about the inputs
    loader.load_inputs()
    if os.path.isdir('confidential'):
        loader.load_inputs('confidential/')

    # Load the results for every solver
    for solver in os.listdir(f'{args.dir}/'):
        if not os.path.isdir(f'{args.dir}/{solver}'):
            continue
        loader.load_solver(solver)


def do_analysis():
    # complete table
    render_to_file(f'{args.dir}/table-complete.tex', 'table-complete.j2', **get_all_results())
    # overview table for the paper
    render_to_file(f'{args.dir}/table-overview.tex', 'table-overview.j2', **get_overview_results())
    # various scatter plots
    scatter(f'{args.dir}/scatter-ddmin-hierarchical-size.data', 'out/scatter-ddmin-hierarchical-time.data', 'ddsmt-paper-ddmin', 'ddsmt-paper-hierarchical')
    scatter(f'{args.dir}/scatter-dev-dev-size.data', 'out/scatter-dev-dev-time.data', 'ddsmt-paper-hybrid', 'ddsmt-paper-hybrid')
    scatter(f'{args.dir}/scatter-dev-dev-size.data', 'out/scatter-dev-dev-time.data', 'ddsmt-paper-hybrid', 'ddsmt-paper-hybrid')
    scatter_best(f'{args.dir}/scatter-hybrid-best-size.data', 'out/scatter-hybrid-best-time.data', 'ddsmt-paper-hybrid', ['ddsmt-paper-ddmin', 'ddsmt-paper-hierarchical'])

    scatter(f'{args.dir}/scatter-master-dev-size.data', 'out/scatter-master-dev-time.data', 'ddsmt-master', 'ddsmt-paper-hybrid')


def main():
    global args
    ap = argparse.ArgumentParser()
    ap.add_argument('--demo', default=False, action='store_true',
                    help='analyze results from demo run')
    ap.add_argument('--no-load-times', dest='load_times', default=True,
                    action='store_false',
                    help='do not run solver binary on minimized input')
    ap.add_argument('--dir', default='out',
                    help='results directory')
    args = ap.parse_args()
    args.dir = args.dir.strip('/')

    load_data()
    do_analysis()

if __name__ == '__main__':
    main()

# TODO: check if it works with demo and full

