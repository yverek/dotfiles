import apt
import os
import sys
import subprocess
import time

from .config import SOURCES_LIST_CONTENT, SOURCES_LIST_FILE, DRIVERS,\
                    SOFTWARE, FONTS, LOCAL_FONTS_PATH, NERD_FONTS,\
                    DCONF_FONTS_SETTINGS, DCONF_GEDIT_SETTINGS, \
                    PLANK_THEMES_PATH, FROST_THEMES_REPOSITORY, \
                    DCONF_PLANK_SETTINGS, ZPLUG_INSTALLER_URL, \
                    GITHUB_SSH_URL, BITBUCKET_SSH_URL, PYTHON_DEV_LIB, \
                    PYENV_PACKAGES_DEP, PYENV_INSTALLER_URL, POETRY_INSTALLER_URL, \
                    PG_HBA_PATH, JETBRAINS_TOOLBOX_URL, GNOME_SHELL_EXTENSIONS, \
                    THEME_DEPENDECIES, TMP_DIR, CURSORS_PATH, CURSORS_URL

from .utils import print_info, print_success, run_command, update_system, install_debian_packages, load_dconf_settings
from .utils import read_status_from_file, write_status_to_file


def install_python3_libs():
    cache = apt.Cache()
    if not cache['python3'].is_installed:
        command = 'sudo apt-get install python3'
        run_command(command)

    print_info("Installing Python3 libs... ")
    install_debian_packages(PYTHON_DEV_LIB)
    print_success()

    print_info("Installing Python3 PIP... ")
    install_debian_packages('python3-pip')
    print_success()

    print_info("Installing pyenv... ")
    install_debian_packages(PYENV_PACKAGES_DEP)

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
    install_debian_packages('postgresql postgresql-contrib')
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


def install_themes_and_icons():
    install_debian_packages(THEME_DEPENDECIES)
    command = 'mkdir -p {tmp}'.format(tmp=TMP_DIR)
    run_command(command)
    command = 'cd {tmp} && git clone https://github.com/andreisergiu98/arc-flatabulous-theme --depth 1 && ' \
              'cd arc-flatabulous-theme && ./autogen.sh --prefix=/usr && sudo make install'
    run_command(command)

    command = 'wget -qO- https://raw.githubusercontent.com/gusbemacbe/suru-plus/master/install.sh | sh'
    run_command(command)

    command = 'mkdir -p {path}'.format(path=CURSORS_PATH)
    run_command(command)
    command = 'cd {tmp} && git clone {cursors_url} && cp -pr capitaine-cursors/dist/* {cursors_path}'.format(
        tmp=TMP_DIR,
        cursors_url=CURSORS_URL,
        cursors_path=CURSORS_PATH
    )
    run_command('gsettings set org.gnome.shell disable-user-extensions false', sleep=0)
    run_command('gsettings set org.gnome.shell enabled-extensions {exts}').format(ext=GNOME_SHELL_EXTENSIONS)



def main():
    status = read_status_from_file()

    install_fonts()
    # if status == "First run":
    #     rewrite_sources()
    #     install_firmwares_and_drivers()
    #     write_status_to_file("Drivers installed")
    #     sys.exit(0)
    #
    # elif status == "Drivers installed":
    #     edit_audio_config()
    #     install_firewall()
    #     install_fonts()
    #     configure_gedit()
    #     install_zsh()
    #     write_status_to_file("Zsh installed")
    #     sys.exit(0)
    #
    # elif status == "Zsh installed":
    #     generate_ssh_key()
    #     install_python3_libs()
    #     install_postgresql()
    #     install_jetbrains_toolbox()
        # hosts file from the internet
        # jetbrains .jar settings
