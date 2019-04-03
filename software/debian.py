from pathlib import Path

import subprocess

from .utils import print_info, print_success, print_error
from .utils import read_status_from_file, write_status_to_file


def rewrite_sources():
    print_info('Rewriting /etc/apt/source.list... ')
    sources_list_old = Path('/etc/apt/sources.list')
    sources_list_new = Path.cwd() / 'software' / 'files' / 'sources.list'

    sources_list_old.write_text(sources_list_new.read_text())
    print_success()

    print_info('Updating system... ')
    try:
        # Note that quiet level 2 (-qq) implies -y
        subprocess.run('apt-get update -qq && apt-get upgrade -qq', check=True, shell=True)
    except subprocess.CalledProcessError as e:
        print_error()
        print(e.output)
    print_success()


def install_firmware_and_drivers():
    print_info('Installing firmwares and drivers... ')
    try:
        subprocess.run('apt-get install amd64-microcode firmware-amd-graphics xserver-xorg-video-radeon',
                       check=True, shell=True)
    except subprocess.CalledProcessError as e:
        print_error()
        print(e.output)
    print_success()
    print('Please reboot your system!')
    input("Press Enter to continue...")


def edit_audio_config():
    print_info('Editing audio configuration files... ')
    file = Path('/etc/pulse/daemon.conf')

    with file.open() as f:
        content = f.read()

    content = content.replace('; resample-method = speex-float-1\n', 'resample-method = src-sinc-best-quality\n')
    content = content.replace('; default-sample-format = s16le\n', 'default-sample-format = s24le\n')
    content = content.replace('; default-sample-rate = 44100\n', 'default-sample-rate = 96000\n')

    with file.open(mode='w') as f:
        f.write(content)

    print_success()
    print_info('Rebooting PulseAudio... ')
    try:
        # kill the process and start a new one
        subprocess.run('pulseaudio -k && pulseaudio --start', check=True, shell=True)
    except subprocess.CalledProcessError as e:
        print_error()
        print(e.output)


# TODO: Firewall

"""
Per installare UFW, lanciamo

# aptitude install gufw

Questo comando installerà sia la GUI che il software. Aggiungiamo le regole di negazione predefinite e siamo a posto con un firewall di base.

# ufw default deny

Il comando seguente è sufficiente ad abilitare il firewall e aggiungerlo all'avvio del sistema.

# ufw enable

Possiamo controllare lo stato del firewall, in qualsiasi momento, lanciando i seguenti comandi

# ufw status
# ufw status verbose
"""


def main():
    status = read_status_from_file()

    if status == 'First run':
        rewrite_sources()
        install_firmware_and_drivers()
        write_status_to_file('Drivers installed')

    elif status == 'Drivers installed':
        pass
