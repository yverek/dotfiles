import apt
import os
import sys
import time

from .config import SOURCES_LIST_CONTENT, SOURCES_LIST_FILE, DRIVERS,\
                    SOFTWARE, FONTS, LOCAL_FONTS_PATH, NERD_FONTS,\
                    DCONF_FONTS_SETTINGS, DCONF_GEDIT_SETTINGS, \
                    PLANK_THEMES_PATH, FROST_THEMES_REPOSITORY, \
                    DCONF_PLANK_SETTINGS, ZPLUG_INSTALLER_URL, \
                    GITHUB_SSH_URL, BITBUCKET_SSH_URL, PYTHON_DEV_LIB, \
                    PYENV_PACKAGES_DEP, PYENV_INSTALLER_URL, POETRY_INSTALLER_URL, \
                    PG_HBA_PATH, JETBRAINS_TOOLBOX_URL

from .utils import print_info, print_success, run_command, update_system, install_debian_packages
from .utils import read_status_from_file, write_status_to_file


def rewrite_sources():
    print_info("Rewriting /etc/apt/sources.list... ")
    command = 'echo "" && echo "{sources}" | sudo tee {file} > /dev/null'
    run_command(command.format(sources=SOURCES_LIST_CONTENT, file=SOURCES_LIST_FILE), sleep=0)
    print_success()

    print_info("Updating system... ")
    update_system()
    print_success()


def install_firmwares_and_drivers():
    print_info("Installing firmwares and drivers... ")
    install_debian_packages(DRIVERS)
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
    command = 'sudo apt-get install zsh gawk'  # gawk for zplug
    run_command(command)
    print_success()

    print_info("Configuring Zsh... ")
    command = 'chsh yverek -s $(which zsh)'
    run_command(command, sleep=0)
    print_success()

    print_info("Installing zplug... ")
    command = 'curl -sL --proto-redir -all,https {installer_link} | zsh'.format(installer_link=ZPLUG_INSTALLER_URL)
    run_command(command)
    print_success()

    print("Now you have to restart your session and zplug will take care of everything!")
    input("Press ENTER to continue")


def generate_ssh_key():
    print_info("Generating SSH key... ")
    command = 'ssh-keygen -t rsa -b 4096'
    run_command(command)
    print_success()

    print_info("Adding SSH key to ssh-agent... ")
    if os.environ.get('SSH_AUTH_SOCK') is None:
        command = 'ssh-agent'
        run_command(command)

    command = 'ssh-add ~/.ssh/id_rsa'
    run_command(command)
    print_success()

    print_info("Copying SSH key to clipboard... ")
    time.sleep(1)
    print("\n\u001b[32mCopy the following key (Ctrl + Shift + C)\u001b[0m")
    time.sleep(1)
    command = 'cat ~/.ssh/id_rsa.pub'
    run_command(command, sleep=5)
    run_command('echo -n "$(tput cuu 2;tput ed)"', sleep=0)
    print_info("Copying SSH key to clipboard... ")
    print_success()

    print_info("Adding SSH key to GitHub... ")
    time.sleep(1)
    print("\nNow you have to add your \u001b[32mSSH key\u001b[0m to \u001b[34mGitHub\u001b[0m.")
    print("Wait for your \u001b[31mbrowser\u001b[0m and follow the guide.")
    print("Close the application when you are done.")
    time.sleep(1)
    command = 'xdg-open {link}'.format(link=GITHUB_SSH_URL)
    run_command(command, sleep=0)
    run_command('echo -n "$(tput cuu 4;tput ed)"', sleep=0)
    print_info("Adding SSH key to GitHub... ")
    print_success()

    print_info("Adding SSH key to Bitbucket... ")
    time.sleep(1)
    print("\nNow you have to add your \u001b[32mSSH key\u001b[0m to \u001b[34mBitbucket\u001b[0m.")
    print("Wait for your \u001b[31mbrowser\u001b[0m and follow the guide.")
    print("Close the application when you are done.")
    time.sleep(1)
    command = 'xdg-open {link}'.format(link=BITBUCKET_SSH_URL)
    run_command(command, sleep=0)
    run_command('echo -n "$(tput cuu 4;tput ed)"', sleep=0)
    print_info("Adding SSH key to Bitbucket... ")
    print_success()


def install_python3_libs():
    cache = apt.Cache()
    if not cache['python3'].is_installed:
        command = 'sudo apt-get install python3'
        run_command(command)

    print_info("Installing Python3 libs... ")
    command = 'sudo apt-get install {packages}'.format(packages=PYTHON_DEV_LIB)
    run_command(command)
    print_success()

    print_info("Installing Python3 PIP... ")
    command = 'sudo apt-get install python3-pip'
    run_command(command)
    print_success()

    print_info("Installing pyenv... ")
    command = 'sudo apt-get install {packages}'.format(packages=PYENV_PACKAGES_DEP)
    run_command(command)

    command = 'curl -L {pyenv_installer_link} | bash'.format(pyenv_installer_link=PYENV_INSTALLER_URL)
    run_command(command)
    print_success()

    print_info("Installing Poetry... ")
    command = 'curl -sSL {poetry_installer_link} | python'.format(poetry_installer_link=POETRY_INSTALLER_URL)
    run_command(command)
    print_success()

    print("Now you have to restart your terminal!")
    input("Press ENTER to continue")


def install_postgresql():
    print_info("Installing PostgreSQL... ")
    command = 'sudo apt-get install postgresql postgresql−contrib'
    run_command(command)
    print_success()

    print_info("Configuring PostgreSQL... ")
    time.sleep(1)
    print("\nInsert postgres password!")
    command = 'sudo -su postgres psql -c "ALTER USER postgres PASSWORD \'$postgres\';"'
    run_command(command)

    command = 'sudo sed -i \'s/peer/md5/\' {pg_hba}'.format(pg_hba=PG_HBA_PATH)
    run_command(command)

    command = 'sudo systemctl restart postgresql'
    run_command(command)
    run_command('echo -n "$(tput cuu 2;tput ed)"')
    print_info("Installing PostgreSQL... ")
    print_success()


def install_jetbrains_toolbox():
    print_info("Installing JetBrains ToolBox... ")
    command = 'wget -cO jetbrains-toolbox.tar.gz "{link}"'.format(link=JETBRAINS_TOOLBOX_URL)
    run_command(command)
    command = 'tar -xzf jetbrains-toolbox.tar.gz'
    run_command(command)
    command = 'cd jetbrains-toolbox*/ && ./jetbrains-toolbox'
    run_command(command)
    print_success()


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
        generate_ssh_key()
        install_python3_libs()
        install_postgresql()
        install_jetbrains_toolbox()
        # hosts file from the internet
        # jetbrains .jar settings
