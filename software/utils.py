from pathlib import Path

import subprocess
import sys

#####
# Edit the following section to fit your needs
#####
DRIVERS = 'amd64-microcode firmware-amd-graphics xserver-xorg-video-radeon'

SOFTWARE = "htop strace lshw qt4-qtconfig acpi acpi-support aspell-it "
SOFTWARE += "hunspell-it mythes-it menulibre p7zip-rar redshift-gtk "
SOFTWARE += "plank lm-sensors hddtemp"
#####


def run_command(command):
    try:
        subprocess.run(command, check=True, shell=True, stdout=subprocess.PIPE)
    except subprocess.CalledProcessError as e:
        print_error()
        print(e.output)
        sys.exit(-1)


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
