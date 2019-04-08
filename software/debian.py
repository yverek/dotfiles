import apt
import sys
import time

from .config import SOURCES_LIST_CONTENT, SOURCES_LIST_FILE, DRIVERS,\
                    SOFTWARE, FONTS, LOCAL_FONTS_PATH, NERD_FONTS,\
                    DCONF_FONTS_SETTINGS, DCONF_GEDIT_SETTINGS, \
                    PLANK_THEMES_PATH, FROST_THEMES_REPOSITORY, \
                    DCONF_PLANK_SETTINGS, ZPLUG_INSTALLER_LINK

from .utils import print_info, print_success, run_command
from .utils import read_status_from_file, write_status_to_file


def rewrite_sources():
    print_info("Rewriting /etc/apt/sources.list... ")
    command = 'sudo echo "{sources}" > {file}'.format(sources=SOURCES_LIST_CONTENT, file=SOURCES_LIST_FILE)
    run_command(command, sleep=0)
    print_success()

    print_info("Updating system... ")
    command = 'sudo apt-get update && sudo apt-get upgrade'
    run_command(command)
    print_success()


def install_firmwares_and_drivers():
    print_info("Installing firmwares and drivers... ")
    command = 'sudo apt-get install {packages}'.format(packages=DRIVERS)
    run_command(command)
    print_success()

    print("Now you have to reboot your system!")
    input("Press ENTER to continue")


def edit_audio_config():
    print_info("Editing audio configuration files... ")

    options = [
        ('; resample-method = speex-float-1', 'resample-method = src-sinc-best-quality'),
        ('; default-sample-format = s16le', 'default-sample-format = s24le'),
        ('; default-sample-rate = 44100', 'default-sample-rate = 96000')
    ]

    command = "sudo sed -i 's/{old}/{new}/g' /etc/pulse/daemon.conf"

    for line in options:
        run_command(command.format(old=line[0], new=line[1]), sleep=0)

    print_success()

    print_info("Rebooting PulseAudio... ")
    command = 'pulseaudio -k && pulseaudio --start'
    run_command(command, sleep=0)
    print_success()


def install_firewall():
    print_info("Installing UFW... ")
    command = 'sudo apt-get install gufw'
    run_command(command)
    print_success()

    print_info("Configuring UFW... ")
    command = 'sudo ufw default deny && sudo ufw enable'
    run_command(command, sleep=0)
    print_success()


def install_fonts():
    print_info("Installing fonts... ")
    command = 'sudo apt-get install {fonts}'.format(fonts=FONTS)
    run_command(command)

    command = 'mkdir -p {path} && cd {path}'.format(path=LOCAL_FONTS_PATH)
    run_command(command, sleep=0)

    for font in NERD_FONTS:
        command = 'curl -fLo "{font_name}" {font_link}'.format(font_name=font[0], font_link=font[1])
        run_command(command)

    command = 'fc-cache -f -v'
    run_command(command)
    print_success()

    print_info("Configuring fonts... ")
    command = 'dconf load / < {path}'.format(path=DCONF_FONTS_SETTINGS)
    run_command(command, sleep=0)
    print("Now go to Font Manager's Settings and select:")
    print("  - \u001b[31mRendering\u001b[0m tab: \u001b[33mAntialias\u001b[0m, \u001b[33mHinting\u001b[0m ", end="")
    print("and set on \u001b[33mSlight\u001b[0m the \u001b[34mHinting Style\u001b[0m attribute;")
    print("  - \u001b[31mDisplay\u001b[0m tab: set on \u001b[33mDefault\u001b[0m the ", end="")
    print("\u001b[34mLCD Filter\u001b[0m attribute;")
    print("Close the application when you are done")
    time.sleep(2)
    run_command('font-manager', sleep=0)
    # clear all the previous messages by going up for 5 lines (tput cuu 5) and clearing (tput ed) the prompt
    run_command('echo -n "$(tput cuu 5;tput ed)"', sleep=0)
    print_info("Configuring fonts... ")
    print_success()


def configure_gedit():
    print_info("Configuring Gedit... ")
    command = 'dconf load / < {path}'.format(path=DCONF_GEDIT_SETTINGS)
    run_command(command, sleep=0)
    print_success()


def install_software():
    print_info("Installing Software... ")
    command = 'sudo apt-get install {packages}'.format(packages=SOFTWARE)
    run_command(command)
    print_success()

    cache = apt.Cache()
    if cache['plank'].is_installed:
        print_info("Configuring Plank... ")
        command = 'mkdir -p {path} && cd {path}'.format(path=PLANK_THEMES_PATH)
        run_command(command, sleep=0)
        command = 'git clone {repository} .'.format(repository=FROST_THEMES_REPOSITORY)
        run_command(command)
        # clean the other files
        command = 'rm -rf .git && rm install.sh && rm LICENSE && rm README.md'
        run_command(command, sleep=0)
        command = 'dconf load / < {path}'.format(path=DCONF_PLANK_SETTINGS)
        run_command(command, sleep=0)
        print("\nAdd Plank to \u001b[33mStartup Applications\u001b[0m from \u001b[34mgnome-tweak-tool\u001b[0m")
        print("Close the application when you are done")
        time.sleep(2)
        run_command('gnome-tweak-tool', sleep=0)
        run_command('echo -n "$(tput cuu 3;tput ed)"', sleep=0)
        print_info("Configuring Plank... ")
        print_success()

    if cache['lm-sensors'].is_installed:
        print_info("Configuring sensors... ")
        command = 'sudo sensors-detect'
        run_command(command, sleep=5)
        print_success()


def install_zsh():
    print_info("Installing Zsh... ")
    command = 'sudo apt-get install zsh'
    run_command(command)
    print_success()

    print_info("Configuring Zsh... ")
    command = 'chsh yverek -s $(which zsh)'
    run_command(command, sleep=0)
    print_success()

    print_info("Installing zplug... ")
    command = 'curl -sL --proto-redir -all,https {installer_link} | zsh'.format(installer_link=ZPLUG_INSTALLER_LINK)
    run_command(command)
    print_success()

    print("Now you have to restart your session and zplug will take care of everything!")
    input("Press ENTER to continue")


def main():
    status = read_status_from_file()

    if status == "First run":
        rewrite_sources()
        install_firmwares_and_drivers()
        write_status_to_file("Drivers installed")
        sys.exit(0)

    elif status == "Drivers installed":
        edit_audio_config()
        install_firewall()
        install_fonts()
        configure_gedit()
        install_zsh()
        write_status_to_file("Zsh installed")
        sys.exit(0)

    elif status == "Zsh installed":
        pass
        # ssh-keygen -t rsa -b 4096 -C "your_email@example.com"
