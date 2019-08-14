#!/usr/bin/env python2

import shutil
import subprocess
from decimal import Decimal

# import os.path


def release():
    with open('buildout.cfg', 'r') as f:
        lines = f.read().split('\n')

    out = []

    found = False

    for line in lines:
        if (not found) and line.startswith('# v'):
            line = line.replace('# v', '')
            left, right = line.split(' ', 1)
            digits = left.strip()
            version = Decimal(digits)
            version += Decimal('0.01')
            line = '# v{} {}'.format(version, right).strip()
            found = True

        out.append(line)

    shutil.copyfile('buildout.cfg', 'buildout.cfg.old')
    with open('buildout.cfg', 'w') as f:
        f.write('\n'.join(out))

    subprocess.call(['git', 'tag', '-a', "v{}".format(version), '-m',
                     'Release {}'.format(version)])
    subprocess.call(['git', 'push', '--tags'])


if __name__ == "__main__":
    release()
