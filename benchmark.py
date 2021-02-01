#!/usr/bin/env python3

import argparse
import json
import os
import re
import shlex
import shutil
import subprocess
import sys
import time


# number of jobs to compile stuff
COMPILE_JOBS = 8
# number of jobs for debuggers
DEBUGGER_JOBS = 8
# whether to use slurm or local execution
SUBMIT_TO_SLURM = False


is_set_up_cvc4         = False
is_set_up_ddsexpr      = False
is_set_up_ddsmt_master = False
is_set_up_ddsmt_dev    = False
is_set_up_delta        = False
is_set_up_linedd       = False
is_set_up_pydelta      = False
is_set_up_yices        = False
is_set_up_z3           = False
is_set_up_z3_ref       = False


def setup_confidential():
    """Integrate confidential benchmarks"""
    if not os.path.isdir('confidential'):
        subprocess.run(['git', 'clone', 'git@github.com:ddsmt/artifact-2021-confidential.git', 'confidential'])
    else:
        subprocess.run(['git', 'pull'], cwd='confidential')


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
    global is_set_up_cvc4
    is_set_up_cvc4 = True


def setup_ddsexpr():
    """Download and compile ddsexpr"""
    if not os.path.isdir('build/ddsexpr'):
        subprocess.run(['wget', '-O', 'ddsexpr.tar.gz', 'http://fmv.jku.at/ddsexpr/ddsexpr1.tar.gz'])
        subprocess.run(['tar', '-xvzf', 'ddsexpr.tar.gz'])
        subprocess.run(['rm', 'ddsexpr.tar.gz'])
        subprocess.run(['mv', 'ddsexpr1', 'build/ddsexpr'])
        subprocess.run(['./configure.sh'], cwd = 'build/ddsexpr')
        subprocess.run(['make'], cwd = 'build/ddsexpr')
    global is_set_up_ddsexpr
    is_set_up_ddsexpr = True


def setup_ddsmt_master():
    """Download ddsmt-master"""
    if not os.path.isdir('build/ddsmt-master'):
        subprocess.run(['git', 'clone', 'https://github.com/aniemetz/ddSMT', 'build/ddsmt-master'])
    global is_set_up_ddsmt_master
    is_set_up_ddsmt_master = True


def setup_ddsmt_dev():
    """Download ddsmt-dev"""
    if not os.path.isdir('build/ddsmt-dev'):
        subprocess.run(['git', 'clone', 'https://github.com/aniemetz/ddSMT', 'build/ddsmt-dev'])
        subprocess.run(['git', 'checkout', 'development'], cwd = 'build/ddsmt-dev')
        subprocess.run(['git', 'apply', '../../stuff/ddsmt-progress.patch'], cwd = 'build/ddsmt-dev')
    else:
        subprocess.run(['git', 'checkout', '.'], cwd = 'build/ddsmt-dev')
        subprocess.run(['git', 'pull'], cwd = 'build/ddsmt-dev')
        subprocess.run(['git', 'apply', '../../stuff/ddsmt-progress.patch'], cwd = 'build/ddsmt-dev')
    global is_set_up_ddsmt_dev
    is_set_up_ddsmt_dev = True


def setup_delta():
    """Download and build SMT-RAT's delta"""
    if not os.path.isdir('build/delta'):
        subprocess.run(['git', 'clone', 'https://github.com/smtrat/smtrat', 'build/delta'])
        subprocess.run(['git', 'apply', '../../stuff/delta-gcc.patch'], cwd = 'build/delta')
        subprocess.run(['git', 'apply', '../../stuff/delta-progress.patch'], cwd = 'build/delta')
        os.makedirs('build/delta/build')
        subprocess.run(['cmake', '..'], cwd='build/delta/build')
        if os.path.isdir('build/delta/build/resources/src/CArL-EP'):
            subprocess.run(['git', 'apply', '../../../../../../stuff/delta-gcc.patch'], cwd='build/delta/build/resources/src/CArL-EP')
            subprocess.run(['cmake', '..'], cwd='build/delta/build')
        subprocess.run(['make', f'-j{COMPILE_JOBS}', 'delta'], cwd='build/delta/build')
    else:
        subprocess.run(['git', 'pull'], cwd = 'build/delta')
    global is_set_up_delta
    is_set_up_delta = True


def setup_linedd():
    """Download linedd"""
    if not os.path.isdir('build/linedd'):
        subprocess.run(['git', 'clone', 'https://github.com/sambayless/linedd', 'build/linedd'])
        subprocess.run(['git', 'apply', '../../stuff/pydelta.patch'], cwd = 'build/linedd')
    global is_set_up_linedd
    is_set_up_linedd = True


def setup_pydelta():
    """Download pydelta"""
    if not os.path.isdir('build/pydelta'):
        subprocess.run(['git', 'clone', 'https://github.com/nafur/pydelta.git', 'build/pydelta'])
        subprocess.run(['git', 'apply', '../../stuff/pydelta.patch'], cwd = 'build/pydelta')
    global is_set_up_pydelta
    is_set_up_pydelta = True


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
    global is_set_up_yices
    is_set_up_yices = True


def setup_z3():
    """Prepare a z3 checkout for compilation"""
    if not os.path.isdir('build/z3'):
        subprocess.run(['git', 'clone', 'https://github.com/Z3Prover/z3.git', 'build/z3'])
        subprocess.run(['mkdir', 'build/z3/build'])
    else:
        subprocess.run(['git', 'checkout', '.'], cwd = 'build/z3')
        subprocess.run(['git', 'checkout', 'master'], cwd='build/z3')
        subprocess.run(['git', 'pull'], cwd = 'build/z3')
    global is_set_up_z3
    is_set_up_z3 = True


def setup_z3_ref():
    """Download and compile z3 reference version"""
    if not os.path.isdir('build/z3-ref'):
        subprocess.run(['git', 'clone', 'https://github.com/Z3Prover/z3.git', 'build/z3-ref'])
        subprocess.run(['git', 'checkout', 'z3-4.8.10'], cwd='build/z3-ref')
        subprocess.run(['mkdir', 'build/z3-ref/build'])
        subprocess.run(['cmake', '..'], cwd = 'build/z3-ref/build')
    if not os.path.isfile('bin/z3-ref'):
        subprocess.run(['make', f'-j{COMPILE_JOBS}', 'shell'], cwd = 'build/z3-ref/build')
        shutil.copy('build/z3-ref/build/z3', 'bin/z3-ref')
    global is_set_up_z3_ref
    is_set_up_z3_ref = True


def setup():
    """Setup all tools and output folders"""
    os.makedirs('bin', exist_ok = True)
    os.makedirs('build', exist_ok = True)
    if SUBMIT_TO_SLURM:
        os.makedirs('slurm/venv', exist_ok = True)
        subprocess.run(['python3.6', '-m', 'venv', 'slurm/venv'])
    for d in ddebuggers:
        os.makedirs(f'out/{d}', exist_ok = True)


def build_cvc4(commit):
    """Build cvc4 on the given commit and put the binary to bin"""
    binfile = 'bin/cvc4-{}'.format(commit)
    if not os.path.isfile(binfile):
        subprocess.run(['git', 'checkout', commit], cwd = 'build/cvc4')
        subprocess.run(['./configure.sh', 'production', '--assertions', '--static', '--static-binary', '--poly', '--symfpu'], cwd = 'build/cvc4')
        subprocess.run(['make', f'-j{COMPILE_JOBS}', 'cvc4-bin'], cwd = 'build/cvc4/build')
        res = subprocess.run(['build/cvc4/build/bin/cvc4', '--version'], stdout=subprocess.PIPE)
        if res.stdout.decode().find(f'git HEAD {commit}') == -1:
            print(f'Compiled cvc4 binary should be at commit {commit}, but something went wrong.')
            sys.exit(1)
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
        subprocess.run(cmd, cwd = 'build/yices', env = my_env)
        subprocess.run(['make', f'-j{COMPILE_JOBS}', f'MODE={opts["yices-mode"]}', 'bin'], cwd = 'build/yices')
        binary = list(filter(os.path.isfile, [
            f'build/yices/build/x86_64-pc-linux-gnu-{opts["yices-mode"]}/dist/bin/yices-smt2',
            f'build/yices/build/x86_64-pc-linux-gnu-{opts["yices-mode"]}/bin/yices_smt2',
        ]))
        if binary:
            binary = binary[0]
        else:
            print('No yices binary found')
            sys.exit(1)
        res = subprocess.run([binary, '--version'], stdout=subprocess.PIPE)
        out = res.stdout.decode()
        if out.find('Revision: ') != -1:
            if out.find(f'Revision: {commit}') == -1:
                print(f'Compiled yices binary should be at commit {commit}, but something went wrong.')
                sys.exit(1)
        else:
            print('WARNING: yices did not provide a version.')
        shutil.copy(binary, binfile)
    return binfile


def build_z3(commit, opts):
    """Build z3 on the given commit and put the binary to bin"""
    binfile = 'bin/z3-{}'.format(commit)
    if not os.path.isfile(binfile):
        subprocess.run(['git', 'checkout', '.'], cwd = 'build/z3')
        subprocess.run(['git', 'checkout', commit], cwd = 'build/z3')
        subprocess.run(['git', 'apply', '../../stuff/z3-githash-1.patch'], cwd = 'build/z3')
        subprocess.run(['git', 'apply', '../../stuff/z3-githash-2.patch'], cwd = 'build/z3')
        cmakeopts = {
            'CMAKE_POSITION_INDEPENDENT_CODE': 'ON',
            'CMAKE_BUILD_TYPE': 'Release',
            'Z3_INCLUDE_GIT_HASH': 'ON',
            'INCLUDE_GIT_HASH': 'ON',
        }
        opts = [f'-D{k}={v}' for k,v in cmakeopts.items()]
        subprocess.run(['cmake', *opts, '..'], cwd = 'build/z3/build')
        subprocess.run(['make', f'-j{COMPILE_JOBS}', 'CXX_FLAGS=-std=c++11 -DNO_Z3_DEBUGGER=1', 'shell'], cwd = 'build/z3/build')
        res = subprocess.run(['build/z3/build/z3', '--version'], stdout=subprocess.PIPE)
        if res.stdout.decode().find(f'hashcode {commit}') == -1:
            print(f'Compiled z3 binary should be at commit {commit}, but something went wrong.')
            sys.exit(1)
        shutil.copy('build/z3/build/z3', binfile)
    return binfile


def get_timeout(cmd, input):
    """Obtain an appropriate timeout for the given command"""
    start = time.time()
    try:
        subprocess.run(cmd + [input], stdout=subprocess.PIPE, stderr=subprocess.PIPE, timeout = 20)
    except subprocess.TimeoutExpired:
        return 25
    return min((int(time.time() - start) + 1) * 2, 25)


SLURM_JOB_ID = 0


def submit_slurm_job(cmd, output, tmpout, cwd=None, cpus=DEBUGGER_JOBS):
    """Submit the given command to slurm"""

    global SLURM_JOB_ID
    SLURM_JOB_ID += 1

    cmd = list(map(shlex.quote, cmd))

    scriptfile = f'slurm/script-{SLURM_JOB_ID}.sh'
    open(scriptfile, 'w').write(
f"""#!/bin/bash
#SBATCH --time=01:00:00
#SBATCH --cpus-per-task={cpus}
#SBATCH --mem=32G
#SBATCH --partition=octa
#SBATCH --output={output}.out
#SBATCH --error={output}.err
#SBATCH --qos=max2

source {os.getcwd()}/slurm/venv/bin/activate
START=$(date +%s.%N)
pushd {cwd}

set -m
(
    while inotifywait -e modify {output}
    do
        cp {tmpout} {output}.tmp
    done
) &
timeout_pid=$!

runexec --walltimelimit 3600 --memlimit {32*1024*1024*1024} -- {' '.join(cmd)}

kill -- -${{timeout_pid}} >/dev/null 2>/dev/null
wait -- -${{timeout_pid}} >/dev/null 2>/dev/null

popd
END=$(date +%s.%N)
echo | awk "{{ print $END - $START }}" > {output}.time
""")

    cmd = ['sbatch', '--job-name', output, scriptfile]
    subprocess.run(cmd)


def run_debugger(cmd, output, tmpout, cwd=None, cpus=DEBUGGER_JOBS):
    """Actually run the command and redirect stdout and stderr."""
    if SUBMIT_TO_SLURM:
        submit_slurm_job(cmd, output, tmpout, cwd=cwd, cpus=cpus)
    else:
        start = time.time()
        subprocess.run(cmd,
                    stdout=open(f'{output}.out', 'w'),
                    stderr=open(f'{output}.err', 'w'),
                    cwd=cwd)
        duration = time.time() - start
        open(f'{output}.time', 'w').write(str(duration))


def run_ddsexpr(input, output, binary, opts):
    solver = [binary]
    if 'args' in opts:
        solver = solver + opts['args']
    if opts['match'] == 'incorrect':
        solver = ['stuff/result_differs.py', *solver]
    elif opts['match'] == 'incorrect-unknown':
        solver = ['stuff/result_differs_unknown.py', *solver]
    elif opts['match'] == 'stderr':
        timeout = get_timeout(solver, input)
        opts['stderr'] = opts['stderr'].replace('`', '\\`')
        solver = ['stuff/match_err.py', str(timeout), f'"{opts["stderr"]}"', *solver]
    elif opts['match'] == 'stdout':
        timeout = get_timeout(solver, input)
        opts['stdout'] = opts['stdout'].replace('`', '\\`')
        solver = ['stuff/match_out.py', str(timeout), f'"{opts["stdout"]}"', *solver]

    run_debugger(['build/ddsexpr/ddsexpr', '-l', '-s', input, output, *solver], output, output, cpus=2)


def run_ddsmt_master(input, output, binary, opts):
    solver = [binary]
    if 'args' in opts:
        solver = solver + opts['args']
    if opts['match'] == 'incorrect':
        solver = ['stuff/result_differs.py', *solver]
    elif opts['match'] == 'incorrect-unknown':
        solver = ['stuff/result_differs_unknown.py', *solver]
    elif opts['match'] == 'stderr':
        timeout = get_timeout(solver, input)
        solver = ['stuff/match_err.py', str(timeout), opts['stderr'], *solver]
    elif opts['match'] == 'stdout':
        timeout = get_timeout(solver, input)
        solver = ['stuff/match_out.py', str(timeout), opts['stdout'], *solver]

    run_debugger(['build/ddsmt-master/ddsmt.py', '-vv', input, output, *solver], output, output, cpus=2)

    if SUBMIT_TO_SLURM:
        return

    if not os.path.isfile(f'{output}.err'):
        return
    err = open(f'{output}.err').read()

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


def run_ddsmt_dev_ddmin(input, output, binary, opts, jobs=DEBUGGER_JOBS, cpus=DEBUGGER_JOBS):
    solver = [binary]
    if 'args' in opts:
        solver = solver + opts['args']
    matcher = []
    if opts['match'] == 'incorrect':
        matcher = ['--cross-check', 'bin/z3-ref']
    elif opts['match'] == 'incorrect-unknown':
        matcher = ['--cross-check', 'bin/z3-ref']
    elif opts['match'] == 'stderr':
        matcher = ['--match-err', opts['stderr']]
    elif opts['match'] == 'stdout':
        matcher = ['--match-out', opts['stdout']]
    elif opts['match'] == 'exitcode':
        matcher = ['--ignore-output']

    run_debugger(['build/ddsmt-dev/bin/ddsmt', '-j', str(jobs), '-v', '--strategy', 'ddmin', *matcher, input, output, *solver], output, output, cpus=cpus)


def run_ddsmt_dev_ddmin_j1(input, output, binary, opts):
    run_ddsmt_dev_ddmin(input, output, binary, opts, jobs=1, cpus=2)


def run_ddsmt_dev_hierarchical(input, output, binary, opts, jobs=DEBUGGER_JOBS, cpus=DEBUGGER_JOBS):
    solver = [binary]
    if 'args' in opts:
        solver = solver + opts['args']
    matcher = []
    if opts['match'] == 'incorrect':
        matcher = ['--cross-check', 'bin/z3-ref']
    elif opts['match'] == 'incorrect-unknown':
        matcher = ['--cross-check', 'bin/z3-ref']
    elif opts['match'] == 'stderr':
        matcher = ['--match-err', opts['stderr']]
    elif opts['match'] == 'stdout':
        matcher = ['--match-out', opts['stdout']]
    elif opts['match'] == 'exitcode':
        matcher = ['--ignore-output']

    run_debugger(['build/ddsmt-dev/bin/ddsmt', '-j', str(jobs), '-v', '--strategy', 'hierarchical', *matcher, input, output, *solver], output, output, cpus=cpus)


def run_ddsmt_dev_hierarchical_j1(input, output, binary, opts):
    run_ddsmt_dev_hierarchical(input, output, binary, opts, jobs=1, cpus=2)


def run_ddsmt_dev_hybrid(input, output, binary, opts, jobs=DEBUGGER_JOBS, cpus=DEBUGGER_JOBS):
    solver = [binary]
    if 'args' in opts:
        solver = solver + opts['args']
    matcher = []
    if opts['match'] == 'incorrect':
        matcher = ['--cross-check', 'bin/z3-ref']
    elif opts['match'] == 'incorrect-unknown':
        matcher = ['--cross-check', 'bin/z3-ref']
    elif opts['match'] == 'stderr':
        matcher = ['--match-err', opts['stderr']]
    elif opts['match'] == 'stdout':
        matcher = ['--match-out', opts['stdout']]
    elif opts['match'] == 'exitcode':
        matcher = ['--ignore-output']

    run_debugger(['build/ddsmt-dev/bin/ddsmt', '-j', str(jobs), '-v', '--strategy', 'hybrid', *matcher, input, output, *solver], output, output, cpus=cpus)


def run_ddsmt_dev_hybrid_j1(input, output, binary, opts):
    run_ddsmt_dev_hybrid(input, output, binary, opts, jobs=1, cpus=2)


def run_delta(input, output, binary, opts, jobs=DEBUGGER_JOBS, cpus=DEBUGGER_JOBS):
    solver = [binary]
    if 'args' in opts:
        solver = solver + opts['args']
    if opts['match'] == 'incorrect':
        solver = ['stuff/result_differs.py', *solver]
    elif opts['match'] == 'incorrect-unknown':
        solver = ['stuff/result_differs_unknown.py', *solver]
    elif opts['match'] == 'stderr':
        timeout = get_timeout(solver, input)
        solver = ['stuff/match_err.py', str(timeout), f'"{opts["stderr"]}"', *solver]
    elif opts['match'] == 'stdout':
        timeout = get_timeout(solver, input)
        solver = ['stuff/match_out.py', str(timeout), f'"{opts["stdout"]}"', *solver]
    
    # Execute in a separate directory to avoid file name conflicts
    os.makedirs(f'{output}.dir', exist_ok=True)

    wrapper = f'{output}.dir/wrapper.sh'
    open(wrapper, 'w').write(f'''#!/bin/sh
cd {os.getcwd()}
{' '.join(solver)} $*
''')
    os.chmod(wrapper, 0o744)
    cmd = [os.path.abspath('build/delta/build/delta'), '--threads', str(jobs), os.path.abspath(input), '-o', os.path.abspath(output), '--solver', './wrapper.sh']
    run_debugger(cmd, output, 'delta.last.smt2', cwd=f'{output}.dir/', cpus=cpus)

def run_delta_j1(input, output, binary, opts):
    run_delta(input, output, binary, opts, jobs=1, cpus=2)

def run_deltasmt(input, output, binary, opts):
    solver = [binary]
    if 'args' in opts:
        solver = solver + opts['args']
    if opts['match'] == 'incorrect':
        solver = ['../stuff/result_differs.py', *solver]
    elif opts['match'] == 'incorrect-unknown':
        solver = ['stuff/result_differs_unknown.py', *solver]
        print(solver)
    elif opts['match'] == 'stderr':
        timeout = get_timeout(solver, input)
        solver = ['../stuff/match_err.py', str(timeout), opts['stderr'], *solver]
    elif opts['match'] == 'stdout':
        timeout = get_timeout(solver, input)
        solver = ['../stuff/match_out.py', str(timeout), opts['stdout'], *solver]

    run_debugger(['./deltasmt', '../' + input, '../' + output, *solver], output, output, cwd='deltasmtV2', cpus=2)

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


def run_linedd(input, output, binary, opts):
    solver = [binary]
    if 'args' in opts:
        solver = solver + opts['args']
    if opts['match'] == 'incorrect':
        solver = ['stuff/result_differs.py', *solver]
    elif opts['match'] == 'incorrect-unknown':
        solver = ['stuff/result_differs_unknown.py', *solver]
    elif opts['match'] == 'stderr':
        timeout = get_timeout(solver, input)
        opts['stderr'] = opts['stderr'].replace('`', '\\`')
        solver = ['stuff/match_err.py', str(timeout), f'"{opts["stderr"]}"', *solver]
    elif opts['match'] == 'stdout':
        timeout = get_timeout(solver, input)
        opts['stdout'] = opts['stdout'].replace('`', '\\`')
        solver = ['stuff/match_out.py', str(timeout), f'"{opts["stdout"]}"', *solver]

    run_debugger(['build/linedd/linedd', input, output, *solver], output, output, cpus=2)


def run_pydelta(input, output, binary, opts, jobs=DEBUGGER_JOBS, cpus=DEBUGGER_JOBS):
    solver = [binary]
    if 'args' in opts:
        solver = solver + opts['args']
    matcher = []
    if opts['match'] == 'incorrect':
        solver = ['stuff/result_differs.py', *solver]
    elif opts['match'] == 'incorrect-unknown':
        solver = ['stuff/result_differs_unknown.py', *solver]
    elif opts['match'] == 'stderr':
        matcher = ['--match-err', opts['stderr']]
    elif opts['match'] == 'stdout':
        matcher = ['--match-out', opts['stdout']]
    elif opts['match'] == 'exitcode':
        matcher = ['--ignore-output']

    run_debugger(['build/pydelta/bin/pydelta', '--max-threads', str(jobs), *matcher, '--mode-beautify', '--outputfile', output, input, *solver], output, output, cpus=cpus)

def run_pydelta_j1(input, output, binary, opts):
    run_pydelta(input, output, binary, opts, jobs=1, cpus=2)

ddebuggers = {
    'ddsexpr': run_ddsexpr,
    'ddsmt-dev-ddmin': run_ddsmt_dev_ddmin,
    'ddsmt-dev-ddmin-j1': run_ddsmt_dev_ddmin_j1,
    'ddsmt-dev-hierarchical': run_ddsmt_dev_hierarchical,
    'ddsmt-dev-hierarchical-j1': run_ddsmt_dev_hierarchical_j1,
    'ddsmt-dev-hybrid': run_ddsmt_dev_hybrid,
    'ddsmt-dev-hybrid-j1': run_ddsmt_dev_hybrid_j1,
    'ddsmt-master': run_ddsmt_master,
    'delta': run_delta,
    'delta-j1': run_delta_j1,
    #'deltasmt': run_deltasmt,
    'linedd': run_linedd,
    'pydelta': run_pydelta,
    'pydelta-j1': run_pydelta_j1,
}


def get_binary(input, dbentry, prefix):
    if 'binary' in dbentry:
        return f'{prefix}bin/{dbentry["binary"]}'
    elif 'cvc4-commit' in dbentry:
        curargs = dbentry.get('args', [])
        if not '--lang' in curargs:
            if input.endswith('.smt2'):
                curargs = curargs + ['--lang', 'smt2']
            elif input.endswith('.sy'):
                curargs = curargs + ['--lang', 'sygus']
        dbentry['args'] = curargs
        return build_cvc4(dbentry['cvc4-commit'])
    elif 'yices-commit' in dbentry:
        return build_yices(dbentry['yices-commit'], dbentry)
    elif 'z3-commit' in dbentry:
        return build_z3(dbentry['z3-commit'], dbentry)


def run_experiments(prefix='', regex=None, dd=None):
    data = json.load(open(f'{prefix}database.json'))
    if not is_set_up_ddsexpr and (dd is None or dd == 'ddsexpr'):
        setup_ddsexpr()
    if not is_set_up_ddsmt_dev and (dd is None or dd.startswith('ddsmt-dev')):
        setup_ddsmt_dev()
    if not is_set_up_ddsmt_master and (dd is None or dd == 'ddsmt-master'):
        setup_ddsmt_master()
    if not is_set_up_delta and (dd is None or dd == 'delta'):
        setup_delta()
    if not is_set_up_linedd and (dd is None or dd == 'linedd'):
        setup_linedd()
    if not is_set_up_pydelta and (dd is None or dd == 'pydelta'):
        setup_pydelta()
    for input,opts in data.items():
        if regex and not re.match(regex, input):
            continue
        if not is_set_up_cvc4 and 'cvc4-commit' in opts:
            setup_cvc4()
        if not is_set_up_yices and 'yices-commit' in opts:
            setup_yices()
        if not is_set_up_z3:
            if 'z3-commit' in opts:
                setup_z3()
        if not is_set_up_z3_ref \
           and 'match' in opts \
           and opts['match'].startswith('incorrect'):
                setup_z3_ref()
        print(f'{input}: {opts}')
        binary = get_binary(input, opts, prefix)

        infile = f'{prefix}inputs/{input}'
        insize = os.stat(infile).st_size

        for d in ddebuggers:
            if dd and d != dd: continue
            outfile = f'out/{d}/{input}'
            if not os.path.isfile(outfile):
                print('Running {} on {}'.format(d, input))
                ddebuggers[d](infile, outfile, binary, opts)


if __name__ == '__main__':
    ap = argparse.ArgumentParser()
    ap.add_argument('-f',
                    metavar='regex',
                    dest='regex',
                    default=None,
                    help='only run files that match given regex')
    ap.add_argument('-d',
                    dest='dd',
                    choices=ddebuggers.keys(),
                    default=None,
                    help='delta debugger configuration')
    args = ap.parse_args()
    setup()
    if os.path.isdir('confidential/'):
        setup_confidential()
        run_experiments('confidential/', regex = args.regex, dd = args.dd)
    run_experiments(regex = args.regex, dd = args.dd)
