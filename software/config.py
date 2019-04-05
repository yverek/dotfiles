# This file contains every settings you can modify to fit your needs

SOURCES_LIST_FILE = '/etc/apt/sources.list'

SOURCES_LIST_CONTENT = """# Official Debian Repositories
deb http://deb.debian.org/debian/ testing main contrib non-free
deb-src http://deb.debian.org/debian/ testing main contrib non-free

deb http://deb.debian.org/debian/ testing-updates main contrib non-free
deb-src http://deb.debian.org/debian/ testing-updates main contrib non-free

deb http://deb.debian.org/debian-security testing/updates main
deb-src http://deb.debian.org/debian-security testing/updates main
"""

# DRIVERS = 'intel-microcode firmware
DRIVERS = 'amd64-microcode firmware-amd-graphics xserver-xorg-video-radeon'

SOFTWARE = "htop strace lshw qt4-qtconfig acpi acpi-support aspell-it "
SOFTWARE += "hunspell-it mythes-it menulibre p7zip-rar redshift-gtk "
SOFTWARE += "plank lm-sensors hddtemp"

#####

#####
# Edit the following if updates
#####

MEGA_LINK = 'https://mega.nz/linux/MEGAsync/Debian_9.0/amd64/megasync-Debian_9.0_amd64.deb'


#####