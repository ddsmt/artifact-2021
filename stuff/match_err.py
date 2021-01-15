#!/usr/bin/env python3

import re
import signal
import subprocess
import sys

def handler(sig, frame):
    print("Aborted")
    sys.exit(2)

signal.signal(signal.SIGTERM, handler)
timeout = int(sys.argv[1])

def run(cmd):
    try:
        return subprocess.run(cmd, stdout=subprocess.PIPE, stderr=subprocess.PIPE, timeout = timeout)
    except subprocess.TimeoutExpired:
        print("Timeout")
        sys.exit(2)

A = run(sys.argv[3:])
err = A.stderr.decode('utf8').strip()

if re.search(sys.argv[2], err) is not None:
    sys.stderr.write("Match\n")
    sys.exit(1)

sys.exit(0)
