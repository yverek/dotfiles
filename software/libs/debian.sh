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

DCONF_GEDIT_SETTINGS=gnome/gedit.dconf.settings

SOFTWARE="htop strace lshw qt4-qtconfig acpi acpi-support aspell-it hddtemp hunspell-it mythes-it menulibre p7zip-rar plank lm-sensors"

PLANK_THEME_PATH=~/.local/share/plank/themes/

TMP_DIR=~/delete_me

FROST_THEME_REPOSITORY="https://github.com/dikiaap/frost-plank-theme.git"
DCONF_PLANK_SETTINGS=gnome/plank.dconf.settings

# ============================== #
#           Functions            #
# ============================== #

function rewrite_sources_list() {
    echo "$SOURCES_LIST_CONTENT" | sudo tee "$SOURCES_LIST_FILE" > /dev/null
}

function update_system() {
    sudo apt-get update && sudo apt-get upgrade
}

function install_drivers() {
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

function reboot_pulseaudio() {
    pulseaudio -k && pulseaudio --start
}

function install_firewall() {
    install_deb_packages gufw
}

function configure_firewall() {
    sudo ufw default deny && sudo ufw enable
}

function install_fonts() {
    install_deb_packages ${FONTS}

    mkdir -p ${LOCAL_FONTS_PATH} && cd ${LOCAL_FONTS_PATH}

    for i in "${!NERDFONT_NAMES[@]}"; do
        curl -fLo "${NERDFONT_NAMES[$i]}" ${NERDFONT_URLS[$i]}
    done
}

function activate_fonts() {
    fc-cache -f
    load_dconf_settings ${DCONF_FONTS_SETTINGS}
}

function configure_font_manager() {
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

function configure_gedit() {
    load_dconf_settings ${DCONF_GEDIT_SETTINGS}
}

function install_software() {
    install_deb_packages ${SOFTWARE}
}

function configure_plank() {
    if dpkg -s "plank" &> /dev/null; then
        mkdir -p ${PLANK_THEME_PATH}
        mkdir -p ${TMP_DIR} && cd ${TMP_DIR}
        git clone ${FROST_THEME_REPOSITORY} .
        cp -r Frost ${PLANK_THEME_PATH}
        rm -rf ${TMP_DIR}

        load_dconf_settings ${DCONF_PLANK_SETTINGS}
        echo -e "\n${WHITE}Add Plank to ${GREEN}Startup Applications${WHITE} from ${RED}gnome-tweaks${WHITE}!"
        echo "Close the application when you are done..."
        sleep 2
        gnome-tweaks
    fi
}

function install_zsh() {
    install_deb_packages "zsh gawk"
    chsh $(whoami) -s $(which zsh)
}

function install_zplug() {
    curl -sL --proto-redir -all,https https://raw.githubusercontent.com/zplug/installer/master/installer.zsh | zsh
}

function generate_ssh_key() {
    ssh-keygen -t rsa -b 4096
}

function add_ssh_key_to_sshagent() {
    if [[ -z "${SSH_AUTH_SOCK}" ]]; then
        ssh-agent
    fi

    ssh-add ~/.ssh/id_rsa
}