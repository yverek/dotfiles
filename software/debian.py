from pathlib import Path

import subprocess

from .utils import DRIVERS, SOFTWARE
from .utils import print_info, print_success, run_command
from .utils import read_status_from_file, write_status_to_file


def rewrite_sources():
    print_info('Rewriting /etc/apt/source.list... ')
    sources_list_old = Path('/etc/apt/sources.list')
    sources_list_new = Path.cwd() / 'software' / 'files' / 'sources.list'

    sources_list_old.write_text(sources_list_new.read_text())
    print_success()

    print_info('Updating system... ')

    # Note that quiet level 2 (-qq) implies -y
    command = 'sudo apt-get update -qq && sudo apt-get upgrade -qq'
    run_command(command)
    print_success()


def install_firmware_and_drivers():
    print_info('Installing firmwares and drivers... ')

    command = "sudo apt-get install -qq {packages}".format(packages=DRIVERS)
    run_command(command)
    print_success()
    print('Please reboot your system!')
    input("Press Enter to continue...")


def edit_audio_config():
    print_info('Editing audio configuration files... ')

    options = [
        ('; resample-method = speex-float-1', 'resample-method = src-sinc-best-quality'),
        ('; default-sample-format = s16le', 'default-sample-format = s24le'),
        ('; default-sample-rate = 44100', 'default-sample-rate = 96000')
    ]

    command = "sudo sed -i 's/{old}/{new}/g' /etc/pulse/daemon.conf"

    for line in options:
        run_command(command.format(old=line[0], new=line[1]))

    print_success()

    print_info('Rebooting PulseAudio... ')
    command = 'sudo pulseaudio -k && sudo pulseaudio --start'
    run_command(command)
    print_success()


def install_and_configure_firewall():
    print_info('Installing UFW... ')
    command = 'sudo apt-get install -qq gufw'
    run_command(command)
    print_success()

    print_info('Configuring UFW... ')
    command = 'sudo ufw default deny && sudo ufw enable'
    run_command(command)
    print_success()


def install_and_configure_fonts():
    print_info('Installing fonts... ')
    command = 'sudo apt-get install -qq font-manager fonts-freefont-ttf fonts-freefont-otf fonts-robo'
    run_command(command)
    print_success()

    print_info('Configuring fonts... ')

    command = 'mkdir -p ~/.config/fontconfig/conf.d/'
    run_command(command)
    command = 'cp ~/.dotfiles/software/files/fontconfig/* ~/.config/fontconfig/conf.d/'
    run_command(command)

    command = 'mkdir -p ~/.local/share/fonts/'
    run_command(command)
    command = 'mv ~/.dotfiles/software/files/fonts/* ~/.local/share/fonts/'
    run_command(command)
    command = 'dconf load / < ~/.dotfiles/gnome/fonts.dconf.settings'
    run_command(command)
    print_success()


def configure_gedit():
    print_info('Configuring Gedit... ')
    command = 'dconf load / < ~/.dotfiles/gnome/gedit.dconf.settings'
    run_command(command)
    print_success()


def install_and_configure_software():
    print_info('Installing Software... ')
    command = "sudo apt-get install -qq {packages}".format(packages=SOFTWARE)
    run_command(command)
    print_success()

    print_info('Configuring Plank... ')

    print_success()

    print_info('Configuring RedShift... ')
    command = "sudo echo '\n[redshift]\nallowed=true\nsystem=false\nusers=' >> /etc/geoclue/geoclue.conf"
    run_command(command)
    print_success()

    print("Put RedShift in your autostart applications (right click on RedShift icon and check 'autostart')")
    input("Press ENTER when you are done")

    print_info('Installing and configuring MEGASync... ')

    print_success()


def main():
    status = read_status_from_file()

    if status == 'First run':
        rewrite_sources()
        install_firmware_and_drivers()
        write_status_to_file('Drivers installed')

    elif status == 'Drivers installed':
        edit_audio_config()
        install_and_configure_firewall()
