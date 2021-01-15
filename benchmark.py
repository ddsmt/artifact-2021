#!/usr/bin/env python3

import json
import os
import re
import shutil
import subprocess
import time


# number of jobs to compile stuff
COMPILE_JOBS = 8
# number of jobs for debuggers
DEBUGGER_JOBS = 8
# whether to use slurm or local execution
SUBMIT_TO_SLURM = False


def setup_cvc4():
    """Prepare a cvc4 checkout for compilation"""
    if not os.path.isdir('build/cvc4'):
        subprocess.run(['git', 'clone', 'https://github.com/CVC4/CVC4.git', 'build/cvc4'])
    else:
        subprocess.run(['git', 'checkout', 'master'], cwd='build/cvc4')
        subprocess.run(['git', 'pull'], cwd='build/cvc4')
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
    else:
        subprocess.run(['git', 'pull'], cwd = 'build/ddsmt-dev')


def setup_pydelta():
    """Download pydelta"""
    if not os.path.isdir('build/pydelta'):
        subprocess.run(['git', 'clone', 'https://github.com/nafur/pydelta.git', 'build/pydelta'])
        subprocess.run(['git', 'apply', '../../stuff/pydelta.patch'], cwd = 'build/pydelta')


def setup_yices():
    """Prepare a yices checkout for compilation"""
    if not os.path.isdir('build/yices'):
        subprocess.run(['git', 'clone', 'https://github.com/SRI-CSL/yices2.git', 'build/yices'])
    else:
        subprocess.run(['git', 'checkout', 'master'], cwd='build/yices')
        subprocess.run(['git', 'pull'], cwd = 'build/yices')

    if not os.path.isdir('build/yices/libpoly'):
        subprocess.run(['git', 'clone', 'https://github.com/SRI-CSL/libpoly.git', 'build/yices/libpoly'])
        subprocess.run(['cmake', '-DCMAKE_INSTALL_PREFIX=install', '..'], cwd = 'build/yices/libpoly/build')
        subprocess.run(['make', f'-j{COMPILE_JOBS}', 'install'], cwd = 'build/yices/libpoly/build')
        subprocess.run('rm *', shell = True, cwd = 'build/yices/libpoly/build/install/lib')
        subprocess.run('cp src/libpicpoly.a install/lib/libpoly.a', shell = True, cwd = 'build/yices/libpoly/build')

    if not os.path.isdir('build/yices/cudd'):
        subprocess.run(['git', 'clone', 'https://github.com/ivmai/cudd', 'build/yices/cudd'])
        subprocess.run(['./configure', '--with-pic', '--prefix={}/build/yices/cudd/install'.format(os.getcwd())], cwd = 'build/yices/cudd')
        # stupid monkey-patching
        subprocess.run("grep -rlZ aclocal-1.14 . | xargs -0 sed -i 's/aclocal-1.14/aclocal/g'", shell = True, cwd = 'build/yices/cudd')
        subprocess.run("grep -rlZ automake-1.14 . | xargs -0 sed -i 's/automake-1.14/automake/g'", shell = True, cwd = 'build/yices/cudd')
        subprocess.run(['make', f'-j{COMPILE_JOBS}', 'install'], cwd = 'build/yices/cudd')


def setup_z3():
    """Prepare a z3 checkout for compilation"""
    if not os.path.isdir('build/z3'):
        subprocess.run(['git', 'clone', 'https://github.com/Z3Prover/z3.git', 'build/z3'])
        subprocess.run(['mkdir', 'build/z3/build'])
        subprocess.run(['cmake', '-DCMAKE_POSITION_INDEPENDENT_CODE=ON', '-DCMAKE_BUILD_TYPE=Debug', '..'], cwd = 'build/z3/build')
    else:
        subprocess.run(['git', 'checkout', 'master'], cwd='build/z3')
        subprocess.run(['git', 'pull'], cwd = 'build/z3')


def setup_z3_ref():
    """Download and compile z3 reference version"""
    if not os.path.isdir('build/z3-ref'):
        subprocess.run(['git', 'clone', 'https://github.com/Z3Prover/z3.git', 'build/z3-ref'])
        subprocess.run(['git', 'checkout', 'z3-4.8.9'], cwd='build/z3-ref')
        subprocess.run(['mkdir', 'build/z3-ref/build'])
        subprocess.run(['cmake', '..'], cwd = 'build/z3-ref/build')
        subprocess.run(['make', f'-j{COMPILE_JOBS}', 'shell'], cwd = 'build/z3-ref/build')
        shutil.copy('build/z3-ref/build/z3', 'bin/z3-ref')


def build_cvc4(commit):
    """Build cvc4 on the given commit and put the binary to bin"""
    binfile = 'bin/cvc4-{}'.format(commit)
    if not os.path.isfile(binfile):
        subprocess.run(['git', 'checkout', commit], cwd = 'build/cvc4')
        subprocess.run(['make', f'-j{COMPILE_JOBS}', 'cvc4-bin'], cwd = 'build/cvc4/build')
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
        subprocess.run(['make', f'-j{COMPILE_JOBS}', 'MODE={}'.format(opts['yices-mode'])], cwd = 'build/yices')
        shutil.copy('build/yices/build/x86_64-pc-linux-gnu-{}/dist/bin/yices-smt2'.format(opts['yices-mode']), binfile)
    return binfile


def build_z3(commit, opts):
    """Build z3 on the given commit and put the binary to bin"""
    binfile = 'bin/z3-{}'.format(commit)
    if not os.path.isfile(binfile):
        subprocess.run(['git', 'checkout', commit], cwd = 'build/z3')
        subprocess.run(['cmake', '-DCMAKE_POSITION_INDEPENDENT_CODE=ON', '-DCMAKE_BUILD_TYPE=Release', '..'], cwd = 'build/z3/build')
        subprocess.run(['make', f'-j{COMPILE_JOBS}', 'CXX_FLAGS=-DNO_Z3_DEBUGGER=1', 'shell'], cwd = 'build/z3/build')
        shutil.copy('build/z3/build/z3', binfile)
    return binfile


def get_timeout(cmd, input):
    """Obtain an appropriate timeout for the given command"""
    start = time.time()
    try:
        subprocess.run(cmd + [input], stdout=subprocess.PIPE, stderr=subprocess.PIPE, timeout = 10)
    except subprocess.TimeoutExpired:
        return 12
    return min((int(time.time() - start) + 1) * 2, 12)


SLURM_JOB_ID = 0


def submit_slurm_job(cmd, output, cwd=None):
    """Submit the given command to slurm"""

    global SLURM_JOB_ID
    SLURM_JOB_ID += 1

    scriptfile = f'slurm/script-{SLURM_JOB_ID}.sh'
    open(scriptfile, 'w').write(
f"""#!/bin/sh
#SBATCH --time=00:30:00
#SBATCH --cpus-per-task=8
#SBATCH --mem=32G
#SBATCH --partition=octa
{' '.join(cmd)} > {output}.out 2> {output}.err
""")

    cmd = ['sbatch', scriptfile]
    if cwd:
        cmd += ['--chdir', cwd]
    subprocess.run(cmd)


def run_debugger(cmd, output, cwd=None):
    """Actually run the command and redirect stdout and stderr."""
    if SUBMIT_TO_SLURM:
        submit_slurm_job(cmd, output, cwd)
    else:
        subprocess.run(cmd,
                    stdout=open(f'{output}.out', 'w'),
                    stderr=open(f'{output}.err', 'w'),
                    cwd=cwd)


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

    run_debugger(['build/ddsexpr/ddsexpr', '-l', '-s', *matcher, input, output, *solver], output)


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

    run_debugger(['build/ddsmt-master/ddsmt.py', '-v', *matcher, input, output, *solver], output)

    if SUBMIT_TO_SLURM:
        return

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


def run_ddsmt_dev_ddmin(input, output, binary, opts, jobs=DEBUGGER_JOBS):
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

    run_debugger(['build/ddsmt-dev/bin/ddsmt', '-j', str(jobs), '-v', '--strategy', 'ddmin', *matcher, input, output, *solver], output)


def run_ddsmt_dev_ddmin_j1(input, output, binary, opts):
    run_ddsmt_dev_ddmin(input, output, binary, opts, 1)


def run_ddsmt_dev_naive(input, output, binary, opts, jobs=DEBUGGER_JOBS):
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

    run_debugger(['build/ddsmt-dev/bin/ddsmt', '-j', str(jobs), '-v', '--strategy', 'naive', *matcher, input, output, *solver], output)


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

    run_debugger(['./deltasmt', *matcher, '../' + input, '../' + output, *solver], output, cwd = 'deltasmtV2')

    if SUBMIT_TO_SLURM:
        return

    out = open(f'{output}.out').read()
    err = open(f'{output}.err').read()

    if re.search('(Internal error|expected: |Expected <|expected identifier|logic must be declared|unsupported type|quantifiers unsupported|incompatible types)', out) != None:
        print('ERROR: parser error')
        os.unlink(output)
        return
    if re.search('(at Parser\.parseFormula)', err) != None:
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

    run_debugger(['build/pydelta/bin/pydelta', '--max-threads', str(DEBUGGER_JOBS), *matcher, '--mode-beautify', '--outputfile', output, input, *solver], output)


solvers = {
    'ddsexpr': run_ddsexpr,
    'ddsmt-master': run_ddsmt_master,
    'ddsmt-dev-ddmin': run_ddsmt_dev_ddmin,
    'ddsmt-dev-ddmin-j1': run_ddsmt_dev_ddmin_j1,
    'ddsmt-dev-naive': run_ddsmt_dev_naive,
    'ddsmt-dev-naive-j1': run_ddsmt_dev_naive_j1,
    #'deltasmt': run_deltasmt,
    'pydelta': run_pydelta,
}


def setup_confidential():
    """Integrate confidential benchmarks"""
    if not os.path.isdir('confidential'):
        subprocess.run(['git', 'clone', 'git@github.com:ddsmt/artifact-2021-confidential.git', 'confidential'])
    else:
        subprocess.run(['git', 'pull'], cwd='confidential')
    for s in solvers:
        os.makedirs(f'confidential/out/{s}', exist_ok = True)


def setup():
    """Setup all tools and output folders"""
    os.makedirs('bin', exist_ok = True)
    os.makedirs('build', exist_ok = True)
    os.makedirs('slurm', exist_ok = True)
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
    setup_confidential()


def run_experiments(prefix = ''):
    data = json.load(open(f'{prefix}database.json'))
    for input,opts in data.items():
        print(f'{input}: {opts}')
        if 'binary' in opts:
            binary = f'{prefix}bin/{opts["binary"]}'
        elif 'cvc4-commit' in opts:
            binary = build_cvc4(opts['cvc4-commit'])
        elif 'yices-commit' in opts:
            binary = build_yices(opts['yices-commit'], opts)
        elif 'z3-commit' in opts:
            binary = build_z3(opts['z3-commit'], opts)

        infile = f'{prefix}inputs/{input}'
        insize = os.stat(infile).st_size

        for s in solvers:
            outfile = f'{prefix}out/{s}/{input}'
            if not os.path.isfile(outfile):
                start = time.time()
                print('Running {} on {}'.format(s, input))
                solvers[s](infile, outfile, binary, opts)
                duration = time.time() - start
                open(f'{outfile}.time', 'w').write(str(duration))


if __name__ == '__main__':
    setup()
    run_experiments()
    if os.path.isdir('confidential/'):
        run_experiments('confidential/')
