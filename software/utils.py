from pathlib import Path

import subprocess
import sys




def print_info(text):
    run_command('echo -n "{text}"'.format(text=text), sleep=1, clear=False)


def print_success():
    run_command('echo \u001b[32m[ok]\u001b[0m', sleep=1, clear=False)


def print_error():
    run_command('echo \u001b[31m[error]\u001b[0m', sleep=1, clear=False)


def update_system(new_line=True):
    command = 'sudo apt-get update && sudo apt-get upgrade'

    if new_line:
        command = 'echo "" && ' + command

    run_command(command)


def install_debian_packages(packages, new_line=True):
    command = 'sudo apt-get install {packages}'.format(packages=packages)

    if new_line:
        command = 'echo "" && ' + command

    run_command(command)


def load_dconf_settings(file):
    command = 'dconf load / < {file}'.format(file=file)
    run_command(command, sleep=1)
