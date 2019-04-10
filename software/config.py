# This file contains every settings you can modify to fit your needs

TMP_DIR = '~/Desktop/delete_me/'

SOURCES_LIST_FILE = '/etc/apt/sources.list'

SOURCES_LIST_CONTENT = '''# Official Debian Repositories
deb http://deb.debian.org/debian/ testing main contrib non-free
deb-src http://deb.debian.org/debian/ testing main contrib non-free

deb http://deb.debian.org/debian/ testing-updates main contrib non-free
deb-src http://deb.debian.org/debian/ testing-updates main contrib non-free

deb http://deb.debian.org/debian-security testing/updates main
deb-src http://deb.debian.org/debian-security testing/updates main'''

# Switch between the two following lines: first one for my Notebook, second one for my Desktop PC
# DRIVERS = 'intel-microcode firmware-realtek firmware-atheros nvidia-driver nvidia-settings'
DRIVERS = 'amd64-microcode firmware-amd-graphics xserver-xorg-video-radeon'

# Fonts
# If you don't like some of these fonts, just change this following line
FONTS = 'font-manager fonts-freefont-ttf fonts-freefont-otf fonts-roboto'

LOCAL_FONTS_PATH = '~/.local/share/fonts/'

# You can install every Nerd Font you want, just add tuples in this list
# every tuple contains (font_name, font_link)
NERD_FONTS = [
    (
        'Roboto Mono Nerd Font Complete Mono.ttf',
        'https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/RobotoMono/Regular/complete/Roboto%20Mono'
        '%20Nerd%20Font%20Complete%20Mono.ttf'
    )
]

DCONF_FONTS_SETTINGS = '~/.dotfiles/software/gnome/fonts.dconf.settings'

# Gedit Configuration
DCONF_GEDIT_SETTINGS = '~/.dotfiles/software/gnome/gedit.dconf.settings'

# Software list
SOFTWARE = 'htop strace lshw qt4-qtconfig acpi acpi-support aspell-it hddtemp '
SOFTWARE += 'hunspell-it mythes-it menulibre p7zip-rar plank lm-sensors'

PLANK_THEMES_PATH = '~/.local/share/plank/themes/'
FROST_THEMES_REPOSITORY = 'https://github.com/dikiaap/frost-plank-theme.git'
DCONF_PLANK_SETTINGS = '~/.dotfiles/software/gnome/plank.dconf.settings'

# zplug
ZPLUG_INSTALLER_URL = 'https://raw.githubusercontent.com/zplug/installer/master/installer.zsh'

# SSH
GITHUB_SSH_URL = 'https://help.github.com/en/articles/adding-a-new-ssh-key-to-your-github-account'
BITBUCKET_SSH_URL = 'https://confluence.atlassian.com/bitbucket/set-up-an-ssh-key-728138079.html'

# Python
PYTHON_DEV_LIB = 'libpq−dev python3−dev'

PYENV_PACKAGES_DEP = 'make build-essential libssl-dev zlib1g-dev libbz2-dev libreadline-dev libsqlite3-dev wget '
PYENV_PACKAGES_DEP += 'llvm libncurses5-dev libncursesw5-dev xz-utils tk-dev libffi-dev liblzma-dev python-openssl'

PYENV_INSTALLER_URL = 'https://github.com/pyenv/pyenv-installer/raw/master/bin/pyenv-installer'
POETRY_INSTALLER_URL = 'https://raw.githubusercontent.com/sdispater/poetry/master/get-poetry.py'

# PostgreSQL
PG_HBA_PATH = '/etc/postgresql/11/main/pg_hba.conf'

# JetBrains
JETBRAINS_TOOLBOX_URL = 'https://data.services.jetbrains.com/products/download?platform=linux&code=TBA'

# Themes & Icons

CURSORS_PATH = '~/.icons/capitaine-cursors'
CURSORS_URL = 'https://github.com/keeferrourke/capitaine-cursors'

THEME_DEPENDECIES = 'autoconf automake sassc pkg-config libgtk-3-dev gnome-themes-standard gtk2-engines-murrine'

GNOME_SHELL_EXTENSIONS = "['impatience@gfxmonk.net', 'openweather-extension@jenslody.de', " \
                         "'dynamic-panel-transparency@rockon999.github.io', 'suspend-button@laserb', " \
                         "'TopIcons@phocean.net', 'sound-output-device-chooser@kgshank.net'," \
                         "'alternate-tab@gnome-shell-extensions.gcampax.github.com', 'arc-menu@linxgem33.com' " \
                         "'drive-menu@gnome-shell-extensions.gcampax.github.com'," \
                         "'user-theme@gnome-shell-extensions.gcampax.github.com', 'clipboard-indicator@tudmotu.com', " \
                         "'windowsNavigator@gnome-shell-extensions.gcampax.github.com', 'lockkeys@vaina.lt', " \
                         "'status-area-horizontal-spacing@mathematical.coffee.gmail.com', " \
                         "'workspace-indicator@gnome-shell-extensions.gcampax.github.com']"

# echo file:///home/yverek/MEGA >> ~/.config/gtk-3.0/bookmarks
# dock-items=['org.gnome.Evolution.dockitem', 'eog.dockitem', 'firefox-esr.dockitem', 'org.gnome.Totem.dockitem',
#             'org.gnome.Totem-1.dockitem', 'org.gnome.Evolution-1.dockitem', 'org.gnome.Terminal.dockitem']
