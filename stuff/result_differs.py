#!/usr/bin/env python3

import signal
import subprocess
import sys
import os

def handler(sig, frame):
    print("Aborted")
    sys.exit(1)

signal.signal(signal.SIGTERM, handler)

def run(cmd):
    return subprocess.run(cmd, stdout=subprocess.PIPE, stderr=subprocess.PIPE).stdout.decode('utf8').strip()

z3 = 'bin/z3-ref'

if not os.path.exists(z3):
    print(f'Binary {z3} not found')
    sys.exit(2)

A = run(sys.argv[1:])
B = run([z3, sys.argv[-1]])

if A == 'sat':
    if B == 'sat':
        print('sat / sat')
        sys.exit(0)
    elif B == 'unsat':
        print('sat / unsat')
        sys.exit(1)
    else:
        print('Unexpected output for B: {}'.format(B))
        sys.exit(2)
elif A == 'unsat':
    if B == 'sat':
        print('unsat / sat')
        sys.exit(1)
    elif B == 'unsat':
        print('unsat / unsat')
        sys.exit(0)
    else:
        print('Unexpected output for B: {}'.format(B))
        sys.exit(2)
else:
    print('Unexpected output for A: {}'.format(A))
    sys.exit(2)
