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

function install_deb_packages() {
    # Note that quiet level 2 (-qq) implies -y
    sudo apt-get install -qq $1
}

function load_dconf_settings() {
    dconf load / < $1
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

# Fonts
FONTS="font-manager fonts-freefont-ttf fonts-freefont-otf fonts-roboto"

LOCAL_FONTS_PATH=~/.local/share/fonts/

NERDFONT_NAMES=('Roboto Mono Nerd Font Complete Mono.ttf' 'Droid Sans Mono for Powerline Nerd Font Complete.otf')
NERDFONT_URLS=('https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/RobotoMono/Regular/complete/Roboto%20Mono%20Nerd%20Font%20Complete%20Mono.ttf' 'https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/DroidSansMono/complete/Droid%20Sans%20Mono%20Nerd%20Font%20Complete.otf')

DCONF_FONTS_SETTINGS=gnome/fonts.dconf.settings


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
    install_deb_packages ${DRIVERS}
}

function edit_pulseaudio_file() {
    old=('; resample-method = speex-float-1' '; default-sample-format = s16le' '; default-sample-rate = 44100')
    new=('resample-method = src-sinc-best-quality' 'default-sample-format = s24le' 'default-sample-rate = 96000')

    # Number of elements of 'old' array
    for i in "${!old[@]}"; do
        sudo sed -i "s/${old[$i]}/${new[$i]}/g" /etc/pulse/daemon.conf
    done
}

function rebooting_pulseaudio() {
    pulseaudio -k && pulseaudio --start
}

function install_firewall() {
    install_deb_packages gufw
}

function configuring_firewall() {
    sudo ufw default deny && sudo ufw enable
}

function installing_fonts() {
    install_deb_packages ${FONTS}

    mkdir -p ${LOCAL_FONTS_PATH} && cd ${LOCAL_FONTS_PATH}

    for i in "${!NERDFONT_NAMES[@]}"; do
        curl -fLo "${NERDFONT_NAMES[$i]}" ${NERDFONT_URLS[$i]}
    done
}

function activating_fonts() {
    fc-cache -f
    load_dconf_settings ${DCONF_FONTS_SETTINGS}
}

function configuring_font_manager() {
    echo -e "\n${WHITE}Now go to ${GREEN}Font Manager's Settings${WHITE} and select:"
    echo -e "  => ${RED}Rendering${WHITE} tab:"
    echo -e "    - ${BLUE}Antialias${WHITE}: ${GREEN}\xE2\x9C\x94${WHITE};"
    echo -e "    - ${BLUE}Hinting${WHITE}: ${GREEN}\xE2\x9C\x94${WHITE};"
    echo -e "    - ${BLUE}Hinting Style${WHITE}: ${GREEN}Slight${WHITE};"
    echo -e "  => ${RED}Display${WHITE} tab:"
    echo -e "    - ${BLUE}LCD Filter${WHITE}: ${GREEN}Default${WHITE};"
    echo -e "\nClose the application when you are done..."
    sleep 2
    font-manager
}