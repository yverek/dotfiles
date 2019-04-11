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


