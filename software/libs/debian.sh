#!/usr/bin/env bash

# ============================== #
#           Utilities            #
# ============================== #

ESC_SEQ="\x1b["
RESET=$ESC_SEQ"39;49;00m"
RED=$ESC_SEQ"31;01m"
GREEN=$ESC_SEQ"32;01m"
YELLOW=$ESC_SEQ"33;01m"
BLUE=$ESC_SEQ"34;01m"
MAGENTA=$ESC_SEQ"35;01m"
CYAN=$ESC_SEQ"36;01m"
WHITE=$ESC_SEQ"37;01m"

function info() {
    echo -en "$BLUE=>$RESET $WHITE"$1"$RESET"
}

function ok() {
    echo -e "$GREEN[ok]$RESET"
}

function clear() {
    tput sc
    echo ""
    $1
    tput rc
    tput ed
}


# ============================== #
#            Settings            #
# ============================== #

SOURCES_LIST_FILE="/etc/apt/sources.list"

#SOURCES_LIST_CONTENT="# Official Debian Repositories
#deb http://deb.debian.org/debian/ testing main contrib non-free
#deb-src http://deb.debian.org/debian/ testing main contrib non-free
#
#deb http://deb.debian.org/debian/ testing-updates main contrib non-free
#deb-src http://deb.debian.org/debian/ testing-updates main contrib non-free
#
#deb http://deb.debian.org/debian-security testing/updates main
#deb-src http://deb.debian.org/debian-security testing/updates main"

SOURCES_LIST_CONTENT="# Official Debian Repositories
deb http://deb.debian.org/debian/ stable main contrib non-free
deb-src http://deb.debian.org/debian/ stable main contrib non-free

deb http://deb.debian.org/debian/ stable-updates main contrib non-free
deb-src http://deb.debian.org/debian/ stable-updates main contrib non-free

deb http://deb.debian.org/debian-security stable/updates main
deb-src http://deb.debian.org/debian-security stable/updates main

deb http://ftp.debian.org/debian stretch-backports main
deb-src http://ftp.debian.org/debian stretch-backports main"

# Switch between the two following lines: first one for my Notebook, second one for my Desktop PC
# DRIVERS = 'intel-microcode firmware-realtek firmware-atheros nvidia-driver nvidia-settings'
DRIVERS="amd64-microcode firmware-amd-graphics xserver-xorg-video-radeon"

# ============================== #
#           Functions            #
# ============================== #

function rewriting_sources_list() {
    echo "$SOURCES_LIST_CONTENT" | sudo tee "$SOURCES_LIST_FILE" > /dev/null
}

function updating_system() {
    sudo apt-get update && sudo apt-get upgrade
}

function installing_drivers() {
    sudo apt-get install ${DRIVERS}
}

function edit_pulseaudio_file() {
    old=('; resample-method = speex-float-1', '; default-sample-format = s16le', '; default-sample-rate = 44100')
    new=('resample-method = src-sinc-best-quality', 'default-sample-format = s24le', 'default-sample-rate = 96000')

    # Number of elements of 'old' array
    for i in ${#old[@]}; do
        sudo sed -i "s/old[$i]/new[$i]/g" /etc/pulse/daemon.conf
    done
}

function rebooting_pulseaudio() {
    pulseaudio -k && pulseaudio --start
}
