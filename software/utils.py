import os

from pathlib import Path


def check_root():
    return os.getuid() == 0


def read_status_from_file():
    file = Path.cwd() / 'software' / 'files' / 'tmp.txt'

    # -2 because last one is empty line, -2 is the line we need, the second from last
    status = file.read_text().split('\n')[-2]

    return status


def write_status_to_file(text):
    file = Path.cwd() / 'software' / 'files' / 'tmp.txt'

    with file.open(mode='a') as f:
        f.write(text + '\n')


def print_info(text):
    print(text, end='')


def print_success():
    print('\u001b[32m[ok]\u001b[0m')


def print_error():
    print('\u001b[31m[error]\u001b[0m')
