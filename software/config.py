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

DCONF_FONTS_SETTINGS = '~/.dotfiles/gnome/fonts.dconf.settings'

# Gedit Configuration
DCONF_GEDIT_SETTINGS = '~/.dotfiles/gnome/gedit.dconf.settings'

# Software list
SOFTWARE = 'htop strace lshw qt4-qtconfig acpi acpi-support aspell-it hddtemp '
SOFTWARE += 'hunspell-it mythes-it menulibre p7zip-rar plank lm-sensors'


MEGA_LINK = 'https://mega.nz/linux/MEGAsync/Debian_9.0/amd64/megasync-Debian_9.0_amd64.deb'


# echo '\n[redshift]\nallowed=true\nsystem=false\nusers=' | sudo tee -a /etc/geoclue/geoclue.conf
