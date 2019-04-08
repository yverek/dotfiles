from pathlib import Path

import subprocess
import sys


def run_command(command, clear=True, sleep=2):
    if clear:
        if sleep > 0:
            command = 'tput sc; {cmd}; sleep {sleep}; tput rc; tput ed;'.format(cmd=command, sleep=sleep)
        else:
            command = 'tput sc; {cmd}; tput rc; tput ed;'.format(cmd=command)

    try:
        subprocess.run(command, check=True, shell=True)
    except subprocess.CalledProcessError as e:
        print_error()
        print(e.output)
        sys.exit(-1)


def read_status_from_file():
    file = Path.cwd() / 'software' / 'status.txt'

    # -2 because last one (-1) is empty, -2 is the line we need
    status = file.read_text().split('\n')[-2]

    return status


def write_status_to_file(text):
    file = Path.cwd() / 'software' / 'status.txt'

    with file.open(mode='a') as f:
        f.write(text + '\n')


def print_info(text):
    print(text, end='')


def print_success():
    print('\u001b[32m[ok]\u001b[0m')


def print_error():
    print('\u001b[31m[error]\u001b[0m')
