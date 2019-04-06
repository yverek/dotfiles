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

SOFTWARE = 'htop strace lshw qt4-qtconfig acpi acpi-support aspell-it '
SOFTWARE += 'hunspell-it mythes-it menulibre p7zip-rar redshift-gtk '
SOFTWARE += 'plank lm-sensors hddtemp'

# Fonts
# If you don't like some of these fonts, just change it
FONTS = 'font-manager fonts-freefont-ttf fonts-freefont-otf fonts-roboto'

LOCAL_FONTS_PATH = '~/.local/share/fonts/'

NERD_FONTS = [  # every tuple of this list contains (font_name, font_link)
    (
        'Roboto Mono Nerd Font Complete Mono.ttf',
        'https://github.com/ryanoasis/nerd-fonts/blob/master/patched-fonts/RobotoMono/Regular/complete/Roboto%20Mono'
        '%20Nerd%20Font%20Complete%20Mono.ttf'
    ),
]

DCONF_FONTS_SETTINGS = '~/.dotfiles/gnome/fonts.dconf.settings'


MEGA_LINK = 'https://mega.nz/linux/MEGAsync/Debian_9.0/amd64/megasync-Debian_9.0_amd64.deb'


#####