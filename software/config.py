# This file contains every settings you can modify to fit your needs

SOURCES_LIST_FILE = '/etc/apt/sources.list'

SOURCES_LIST_CONTENT = '''# Official Debian Repositories
deb http://deb.debian.org/debian/ testing main contrib non-free
deb-src http://deb.debian.org/debian/ testing main contrib non-free

deb http://deb.debian.org/debian/ testing-updates main contrib non-free
deb-src http://deb.debian.org/debian/ testing-updates main contrib non-free

deb http://deb.debian.org/debian-security testing/updates main
deb-src http://deb.debian.org/debian-security testing/updates main
'''

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
        'https://github.com/ryanoasis/nerd-fonts/blob/master/patched-fonts/RobotoMono/Regular/complete/Roboto%20Mono'
        '%20Nerd%20Font%20Complete%20Mono.ttf'
    ),
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
ZPLUG_INSTALLER_LINK = 'https://raw.githubusercontent.com/zplug/installer/master/installer.zsh'

# SSH
GITHUB_SSH_LINK = 'https://help.github.com/en/articles/adding-a-new-ssh-key-to-your-github-account'
BITBUCKET_SSH_LINK = 'https://confluence.atlassian.com/bitbucket/set-up-an-ssh-key-728138079.html'

MEGA_LINK = 'https://mega.nz/linux/MEGAsync/Debian_9.0/amd64/megasync-Debian_9.0_amd64.deb'

# echo '\n[redshift]\nallowed=true\nsystem=false\nusers=' | sudo tee -a /etc/geoclue/geoclue.conf
# echo file:///home/yverek/MEGA >> ~/.config/gtk-3.0/bookmarks
# dock-items=['org.gnome.Evolution.dockitem', 'eog.dockitem', 'firefox-esr.dockitem', 'org.gnome.Totem.dockitem',
#             'org.gnome.Totem-1.dockitem', 'org.gnome.Evolution-1.dockitem', 'org.gnome.Terminal.dockitem']
