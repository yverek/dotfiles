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
