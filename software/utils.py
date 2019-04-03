import os


def check_root():
    return os.getuid() == 0


def print_info(text):
    print(text, end='')


def print_success():
    print('\u001b[32m[ok]\u001b[0m')


def print_error():
    print('\u001b[31m[error]\u001b[0m')
