#!/usr/bin/env python3

import json
import os
import re
import shutil
import sqlite3
import subprocess
import time


def setup_cvc4():
    """Prepare a cvc4 checkout for compilation"""
    if not os.path.isdir('build/cvc4'):
        subprocess.run(['git', 'clone', 'https://github.com/CVC4/CVC4.git', 'build/cvc4'])
    if not os.path.isdir('build/cvc4/deps/antlr-3.4'):
        subprocess.run(['./contrib/get-antlr-3.4', 'cvc4'], cwd = 'build/cvc4')
    if not os.path.isdir('build/cvc4/deps/poly'):
        subprocess.run(['./contrib/get-poly', 'cvc4'], cwd = 'build/cvc4')
    if not os.path.isdir('build/cvc4/deps/symfpu-CVC4'):
        subprocess.run(['./contrib/get-symfpu', 'cvc4'], cwd = 'build/cvc4')
    if not os.path.isdir('build/cvc4/build'):
        subprocess.run(['./configure.sh', 'production', '--assertions', '--static', '--static-binary', '--poly', '--symfpu'], cwd = 'build/cvc4')


def setup_ddsexpr():
    """Download and compile ddsexpr"""
    if not os.path.isdir('build/ddsexpr'):
        subprocess.run(['wget', '-O', 'ddsexpr.tar.gz', 'http://fmv.jku.at/ddsexpr/ddsexpr1.tar.gz'])
        subprocess.run(['tar', '-xvzf', 'ddsexpr.tar.gz'])
        subprocess.run(['rm', 'ddsexpr.tar.gz'])
        subprocess.run(['mv', 'ddsexpr1', 'build/ddsexpr'])
        subprocess.run(['./configure.sh'], cwd = 'build/ddsexpr')
        subprocess.run(['make'], cwd = 'build/ddsexpr')


def setup_ddsmt_master():
    """Download ddsmt-master"""
    if not os.path.isdir('build/ddsmt-master'):
        subprocess.run(['git', 'clone', 'https://github.com/aniemetz/ddSMT', 'build/ddsmt-master'])


def setup_ddsmt_dev():
    """Download ddsmt-dev"""
    if not os.path.isdir('build/ddsmt-dev'):
        subprocess.run(['git', 'clone', 'https://github.com/aniemetz/ddSMT', 'build/ddsmt-dev'])
        subprocess.run(['git', 'checkout', 'development'], cwd = 'build/ddsmt-dev')


def setup_pydelta():
    """Download pydelta"""
    if not os.path.isdir('build/pydelta'):
        subprocess.run(['git', 'clone', 'https://github.com/nafur/pydelta.git', 'build/pydelta'])


def setup_yices():
    """Prepare a yices checkout for compilation"""
    if not os.path.isdir('build/yices'):
        subprocess.run(['git', 'clone', 'https://github.com/SRI-CSL/yices2.git', 'build/yices'])

    if not os.path.isdir('build/yices/libpoly'):
        subprocess.run(['git', 'clone', 'https://github.com/SRI-CSL/libpoly.git', 'build/yices/libpoly'])
        subprocess.run(['cmake', '-DCMAKE_INSTALL_PREFIX=install', '..'], cwd = 'build/yices/libpoly/build')
        subprocess.run(['make', '-j8', 'install'], cwd = 'build/yices/libpoly/build')
        subprocess.run('rm *', shell = True, cwd = 'build/yices/libpoly/build/install/lib')
        subprocess.run('cp src/libpicpoly.a install/lib/libpoly.a', shell = True, cwd = 'build/yices/libpoly/build')

    if not os.path.isdir('build/yices/cudd'):
        subprocess.run(['git', 'clone', 'https://github.com/ivmai/cudd', 'build/yices/cudd'])
        subprocess.run(['./configure', '--with-pic', '--prefix={}/build/yices/cudd/install'.format(os.getcwd())], cwd = 'build/yices/cudd')
        # stupid monkey-patching
        subprocess.run("grep -rlZ aclocal-1.14 . | xargs -0 sed -i 's/aclocal-1.14/aclocal/g'", shell = True, cwd = 'build/yices/cudd')
        subprocess.run("grep -rlZ automake-1.14 . | xargs -0 sed -i 's/automake-1.14/automake/g'", shell = True, cwd = 'build/yices/cudd')
        subprocess.run(['make', '-j8', 'install'], cwd = 'build/yices/cudd')


def setup_z3():
    """Prepare a z3 checkout for compilation"""
    if not os.path.isdir('build/z3'):
        subprocess.run(['git', 'clone', 'https://github.com/Z3Prover/z3.git', 'build/z3'])
        subprocess.run(['mkdir', 'build/z3/build'])
        subprocess.run(['cmake', '-DCMAKE_POSITION_INDEPENDENT_CODE=ON', '-DCMAKE_BUILD_TYPE=Debug', '..'], cwd = 'build/z3/build')


def setup_z3_ref():
    """Download and compile z3 reference version"""
    if not os.path.isdir('build/z3-ref'):
        subprocess.run(['git', 'clone', 'https://github.com/Z3Prover/z3.git', 'build/z3-ref'])
        subprocess.run(['mkdir', 'build/z3-ref/build'])
        subprocess.run(['cmake', '..'], cwd = 'build/z3-ref/build')
        subprocess.run(['make', '-j8', 'shell'], cwd = 'build/z3-ref/build')
        shutil.copy('build/z3-ref/build/z3', 'bin/z3-ref')


def build_cvc4(commit):
    """Build cvc4 on the given commit and put the binary to bin"""
    binfile = 'bin/cvc4-{}'.format(commit)
    if not os.path.isfile(binfile):
        subprocess.run(['git', 'checkout', commit], cwd = 'build/cvc4')
        subprocess.run(['make', '-j8', 'cvc4-bin'], cwd = 'build/cvc4/build')
        shutil.copy('build/cvc4/build/bin/cvc4', binfile)
    return binfile


def build_yices(commit, opts):
    """Build yices on the given commit and put the binary to bin"""
    binfile = 'bin/yices-{}'.format(commit)
    if not os.path.isfile(binfile):
        subprocess.run(['git', 'checkout', commit], cwd = 'build/yices')
        subprocess.run(['rm', '-rf', 'build'], cwd = 'build/yices')
        subprocess.run(['autoconf'], cwd = 'build/yices')
        cwd = os.path.join(os.getcwd(), 'build/yices')
        my_env = os.environ.copy()
        my_env['LDFLAGS'] = '-L{}/libpoly/build/install/lib/ -L{}/cudd/install/lib/'.format(cwd, cwd)
        my_env['CPPFLAGS'] = '-I{}/libpoly/build/install/include/ -I{}/cudd/install/include/'.format(cwd, cwd)
        cmd = [
            './configure',
            '--with-static-libpoly-include-dir={}/libpoly/build/install/include'.format(cwd),
            '--with-static-libpoly={}/libpoly/build/install/lib/libpoly.a'.format(cwd),
        ]
        if 'args' in opts and '--mcsat' in opts['args']:
            cmd.append('--enable-mcsat')
        subprocess.run(cmd, cwd = 'yices', env = my_env)
        subprocess.run(['make', '-j8', 'MODE={}'.format(opts['yices-mode'])], cwd = 'build/yices')
        shutil.copy('build/yices/build/x86_64-pc-linux-gnu-{}/dist/bin/yices-smt2'.format(opts['yices-mode']), binfile)
    return binfile


def build_z3(commit, opts):
    """Build z3 on the given commit and put the binary to bin"""
    binfile = 'bin/z3-{}'.format(commit)
    if not os.path.isfile(binfile):
        subprocess.run(['git', 'checkout', commit], cwd = 'build/z3')
        subprocess.run(['cmake', '-DCMAKE_POSITION_INDEPENDENT_CODE=ON', '-DCMAKE_BUILD_TYPE=Release', '..'], cwd = 'build/z3/build')
        subprocess.run(['make', '-j8', 'CXX_FLAGS=-DNO_Z3_DEBUGGER=1', 'shell'], cwd = 'build/z3/build')
        shutil.copy('build/z3/build/z3', binfile)
    return binfile


def get_timeout(cmd, input):
    """Obtain an appropriate timeout for the given command"""
    start = time.time()
    try:
        subprocess.run(cmd + [input], capture_output = True, timeout = 10)
    except subprocess.TimeoutExpired:
        return 12
    return min((int(time.time() - start) + 1) * 2, 12)


def run_ddsexpr(input, output, binary, opts):
    solver = [binary]
    if 'args' in opts:
        solver = solver + ['--lang', 'smt2'] + opts['args']
    matcher = []
    if opts['match'] == 'incorrect':
        solver = ['stuff/result_differs.py', *solver]
    elif opts['match'] == 'stderr':
        timeout = get_timeout(solver, input)
        solver = ['stuff/match_err.py', str(timeout), "\"" + opts['stderr'] + "\"", *solver]
    subprocess.run(['build/ddsexpr/ddsexpr', '-l', '-s', *matcher, input, output, *solver], stdout = open(f'{output}.log', 'w'), stderr = open(f'{output}.err', 'w'))


def run_ddsmt_master(input, output, binary, opts):
    solver = [binary]
    if 'args' in opts:
        solver = solver + opts['args']
    matcher = []
    if opts['match'] == 'incorrect':
        solver = ['stuff/result_differs.py', *solver]
    elif opts['match'] == 'stderr':
        timeout = get_timeout(solver, input)
        solver = ['stuff/match_err.py', str(timeout), opts['stderr'], *solver]

    subprocess.run(['build/ddsmt-master/ddsmt.py', '-v', *matcher, input, output, *solver], stdout = open(f'{output}.log', 'w'), stderr = open(f'{output}.err', 'w'))

    err = open(f'{output}.err').read()

    if re.search('unable to minimize input file', err) != None:
        print('ERROR: unable to minimize input file')
        shutil.copy(input, output)
        return
    m = re.search('unknown command (\'[^\']+\')', err)
    if m is not None:
        print('ERROR: unknown command {}'.format(m.group(1)))
        return
    m = re.search('function (\'[^\']+\') undeclared', err)
    if m is not None:
        print('ERROR: unknown function {}'.format(m.group(1)))
        return
    if re.search('AssertionError', err) != None:
        print('ERROR: some assertion failed')
        return


def run_ddsmt_dev_ddmin(input, output, binary, opts, jobs=8):
    solver = [binary]
    if 'args' in opts:
        solver = solver + opts['args']
    matcher = []
    if opts['match'] == 'incorrect':
        solver = ['stuff/result_differs.py', *solver]
    elif opts['match'] == 'stderr':
        matcher = ['--match-err', opts['stderr']]
    elif opts['match'] == 'exitcode':
        matcher = ['--ignore-output']
    subprocess.run(['build/ddsmt-dev/bin/ddsmt', '-j', str(jobs), '-v', '--strategy', 'ddmin', *matcher, input, output, *solver], stdout = open(f'{output}.log', 'w'), stderr = open(f'{output}.err', 'w'))


def run_ddsmt_dev_ddmin_j1(input, output, binary, opts):
    run_ddsmt_dev_ddmin(input, output, binary, opts, 1)


def run_ddsmt_dev_naive(input, output, binary, opts, jobs=8):
    solver = [binary]
    if 'args' in opts:
        solver = solver + opts['args']
    matcher = []
    if opts['match'] == 'incorrect':
        solver = ['stuff/result_differs.py', *solver]
    elif opts['match'] == 'stderr':
        matcher = ['--match-err', opts['stderr']]
    elif opts['match'] == 'exitcode':
        matcher = ['--ignore-output']

    subprocess.run(['build/ddsmt-dev/bin/ddsmt', '-j', str(jobs), '-v', '--strategy', 'naive', *matcher, input, output, *solver], stdout = open(f'{output}.log', 'w'), stderr = open(f'{output}.err', 'w'))


def run_ddsmt_dev_naive_j1(input, output, binary, opts):
    run_ddsmt_dev_naive(input, output, binary, opts, 1)


def run_deltasmt(input, output, binary, opts):
    solver = [binary]
    if 'args' in opts:
        solver = solver + opts['args']
    matcher = []
    if opts['match'] == 'incorrect':
        solver = ['../stuff/result_differs.py', *solver]
        print(solver)
    elif opts['match'] == 'stderr':
        timeout = get_timeout(solver, input)
        solver = ['../stuff/match_err.py', str(timeout), opts['stderr'], *solver]

    res = subprocess.run(['./deltasmt', *matcher, '../' + input, '../' + output, *solver], cwd = 'deltasmtV2', capture_output = True)
    if re.search('(Internal error|expected: |Expected <|expected identifier|logic must be declared|unsupported type|quantifiers unsupported|incompatible types)', res.stdout.decode('utf8')) != None:
        print('ERROR: parser error')
        os.unlink(output)
        return
    if re.search('(at Parser\.parseFormula)', res.stderr.decode('utf8')) != None:
        print('ERROR: parser error')
        os.unlink(output)
        return


def run_pydelta(input, output, binary, opts):
    solver = [binary]
    if 'args' in opts:
        solver = solver + opts['args']
    matcher = []
    if opts['match'] == 'incorrect':
        solver = ['stuff/result_differs.py', *solver]
    elif opts['match'] == 'stderr':
        matcher = ['--match-err', opts['stderr']]
    elif opts['match'] == 'exitcode':
        matcher = ['--ignore-output']

    subprocess.run(['build/pydelta/bin/pydelta', '--max-threads', '8', *matcher, '--mode-beautify', '--outputfile', output, input, *solver], stdout = open(f'{output}.log', 'w'), stderr = open(f'{output}.err', 'w'))


solvers = {
    'ddsexpr': run_ddsexpr,
    'ddsmt-master': run_ddsmt_master,
    'ddsmt-dev-ddmin': run_ddsmt_dev_ddmin,
    'ddsmt-dev-ddmin-j1': run_ddsmt_dev_ddmin_j1,
    'ddsmt-dev-naive': run_ddsmt_dev_naive,
    'ddsmt-dev-naive-j1': run_ddsmt_dev_naive_j1,
    'deltasmt': run_deltasmt,
    'pydelta': run_pydelta,
}

def setup():
    """Setup all tools and output folders"""
    os.makedirs('bin', exist_ok = True)
    os.makedirs('build', exist_ok = True)
    for s in solvers:
        os.makedirs(f'out/{s}', exist_ok = True)
    setup_cvc4()
    setup_ddsexpr()
    setup_ddsmt_master()
    setup_ddsmt_dev()
    setup_pydelta()
    setup_yices()
    setup_z3()
    setup_z3_ref()

setup()
data = json.load(open('database.json'))

for input,opts in data.items():
    print('{}: {}'.format(input, opts))
    if 'binary' in opts:
        binary = f'bin/{opts["binary"]}'
    elif 'cvc4-commit' in opts:
        binary = build_cvc4(opts['cvc4-commit'])
    elif 'yices-commit' in opts:
        binary = build_yices(opts['yices-commit'], opts)
    elif 'z3-commit' in opts:
        binary = build_z3(opts['z3-commit'], opts)
    
    infile = 'inputs/{}'.format(input)
    insize = os.stat(infile).st_size

    for s in solvers:
        outfile = f'out/{s}/{input}'
        if not os.path.isfile(outfile):
            start = time.time()
            print('Running {} on {}'.format(s, input))
            solvers[s](infile, outfile, binary, opts)
            duration = time.time() - start
            open(f'{outfile}.time', 'w').write(str(duration))
