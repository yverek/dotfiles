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

function is_installed() {
    dpkg -s $1 &> /dev/null
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
NERDFONT_URLS=('https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/RobotoMono/Regular/complete/\
Roboto%20Mono%20Nerd%20Font%20Complete%20Mono.ttf' 'https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/\
DroidSansMono/complete/Droid%20Sans%20Mono%20Nerd%20Font%20Complete.otf')

DCONF_FONTS_SETTINGS=gnome/fonts.dconf.settings

DCONF_GEDIT_SETTINGS=gnome/gedit.dconf.settings

SOFTWARE="htop strace lshw qt4-qtconfig acpi acpi-support aspell-it hddtemp hunspell-it mythes-it\
 menulibre p7zip-rar plank lm-sensors tree neofetch"

CHROME_URL="https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb"

PLANK_THEME_PATH=~/.local/share/plank/themes/

TMP_DIR=~/delete_me

FROST_THEME_REPOSITORY="https://github.com/dikiaap/frost-plank-theme.git"
DCONF_PLANK_SETTINGS=gnome/plank.dconf.settings

GITHUB_SSH_URL="https://help.github.com/en/articles/adding-a-new-ssh-key-to-your-github-account"
BITBUCKET_SSH_URL="https://confluence.atlassian.com/bitbucket/set-up-an-ssh-key-728138079.html"

# Python
PYTHON_DEV_LIB="libpq−dev python3−dev"

PYENV_PACKAGES_DEP="make build-essential libssl-dev zlib1g-dev libbz2-dev libreadline-dev libsqlite3-dev\
 wget llvm libncurses5-dev libncursesw5-dev xz-utils tk-dev libffi-dev liblzma-dev python-openssl"

# PostgreSQL
PG_HBA_PATH=/etc/postgresql/11/main/pg_hba.conf

# JetBrains
JETBRAINS_TOOLBOX_URL="https://data.services.jetbrains.com/products/download?platform=linux&code=TBA"

THEME_DEPENDECIES="autoconf automake sassc pkg-config libgtk-3-dev gnome-themes-standard gtk2-engines-murrine"
THEME_URL="https://github.com/andreisergiu98/arc-flatabulous-theme"

ICONS_URL="https://raw.githubusercontent.com/gusbemacbe/suru-plus/master/install.sh"

CURSORS_PATH=~/.icons/capitaine-cursors
CURSORS_URL="https://github.com/keeferrourke/capitaine-cursors"

GNOME_SHELL_EXTENSIONS="['impatience@gfxmonk.net', 'openweather-extension@jenslody.de',\
 'dynamic-panel-transparency@rockon999.github.io', 'suspend-button@laserb',\
 'TopIcons@phocean.net', 'sound-output-device-chooser@kgshank.net',\
 'arc-menu@linxgem33.com', 'drive-menu@gnome-shell-extensions.gcampax.github.com',\
 'user-theme@gnome-shell-extensions.gcampax.github.com', 'clipboard-indicator@tudmotu.com',\
 'windowsNavigator@gnome-shell-extensions.gcampax.github.com', 'lockkeys@vaina.lt',\
 'status-area-horizontal-spacing@mathematical.coffee.gmail.com']"

DCONF_SHELL_SETTINGS=gnome/shell.dconf.settings

EXA_URL="https://github.com/ogham/exa/releases/download/v0.8.0/exa-linux-x86_64-0.8.0.zip"

# ============================== #
#           Functions            #
# ============================== #

function update_sources_list() {
    echo "$SOURCES_LIST_CONTENT" | sudo tee "$SOURCES_LIST_FILE" > /dev/null
}

function update_hosts_file() {
    # https://someonewhocares.org/hosts/ is the project
    curl https://someonewhocares.org/hosts/hosts | sudo tee /etc/hosts
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

function install_chrome() {
    mkdir -p ${TMP_DIR} && cd ${TMP_DIR}
    curl -L ${CHROME_URL}
    sudo apt-get install ./google-chrome-stable_current_amd64.deb
    cd .. && rm -rf ${TMP_DIR}
}

function install_albert() {
    echo 'deb http://download.opensuse.org/repositories/home:/manuelschneid3r/Debian_Testing/ /' | \
         sudo tee /etc/apt/sources.list.d/home:manuelschneid3r.list
    wget -nv https://download.opensuse.org/repositories/home:manuelschneid3r/Debian_Testing/Release.key -O Release.key
    sudo apt-key add - < Release.key
    sudo apt-get update
    sudo apt-get install albert
}

function configure_plank() {
    if is_installed "plank"; then
        mkdir -p ${PLANK_THEME_PATH}
        mkdir -p ${TMP_DIR} && cd ${TMP_DIR}
        git clone ${FROST_THEME_REPOSITORY} .
        cp -r Frost ${PLANK_THEME_PATH}
        cd .. && rm -rf ${TMP_DIR}

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

function open_gedit_with_ssh_key() {
    gedit ~/.ssh/id_rsa.pub
    echo -e "${WHITE}Now you have to ${GREEN}copy${WHITE} your ${RED}SSH key${WHITE}!"
    echo "Close the application when you are done..."
}

function add_ssh_key_to_github() {
    echo -e "\n${WHITE}Now you have to add your ${RED}SSH key${WHITE} to ${BLUE}GitHub${WHITE}."
    echo -e "Wait for your ${GREEN}browser${WHITE} and follow the guide."
    echo "Close the application when you are done..."
    sleep 2
    xdg-open ${GITHUB_SSH_URL}
}

function add_ssh_key_to_bitbucket() {
    echo -e "\n${WHITE}Now you have to add your ${RED}SSH key${WHITE} to ${BLUE}Bitbucket${WHITE}."
    echo -e "Wait for your ${GREEN}browser${WHITE} and follow the guide."
    echo "Close the application when you are done..."
    sleep 2
    xdg-open ${BITBUCKET_SSH_URL}
}

function install_python3() {
    if ! is_installed "python3"; then
        install_deb_packages 'python3'
    fi

    install_deb_packages ${PYTHON_DEV_LIB}
}

function install_python3_pip() {
    install_deb_packages 'python3-pip'
}

function install_pyenv() {
    install_debian_packages ${PYENV_PACKAGES_DEP}

    curl https://pyenv.run | bash
}

function install_pipenv() {
    # why --user? https://pipenv.readthedocs.io/en/latest/install/#installing-pipenv
    pip3 install --user pipenv
}

function install_postgresql() {
    install_deb_packages 'postgresql postgresql-contrib'
}

function configure_postgresql() {
    echo -e "Insert new postgres password"!
    sleep 1
    sudo -su postgres psql -c "ALTER USER postgres PASSWORD '$postgres';"
    sudo sed -i 's/peer/md5/' ${PG_HBA_PATH}
    sudo systemctl restart postgresql
}

function install_jetbrains_toolbox() {
    mkdir -p ${TMP_DIR} && cd ${TMP_DIR}
    wget -cO jetbrains-toolbox.tar.gz ${JETBRAINS_TOOLBOX_URL}
    tar -xzf jetbrains-toolbox.tar.gz
    cd jetbrains-toolbox*/ && ./jetbrains-toolbox
    cd .. && rm -rf ${TMP_DIR}
}

function install_gnome_extensions() {
    gsettings set org.gnome.shell disable-user-extensions false
    gsettings set org.gnome.shell enabled-extensions ${GNOME_SHELL_EXTENSIONS}
    load_dconf_settings ${GNOME_SHELL_EXTENSIONS}
}

function install_themes() {
    install_debian_packages ${THEME_DEPENDECIES}
    mkdir -p ${TMP_DIR} && cd ${TMP_DIR}
    git clone ${THEME_URL} --depth 1
    cd arc-flatabulous-theme
    ./autogen.sh --prefix=/usr
    sudo make install
    cd .. && rm -rf ${TMP_DIR}

    gsettings set org.gnome.desktop.interface gtk-theme 'Arc-Flatabulous-Darker'
    gsettings set org.gnome.shell.extensions.user-theme name 'Arc-Flatabulous-Dark'
}

function install_icons() {
    mkdir -p ${TMP_DIR} && cd ${TMP_DIR}
    wget -qO- ${ICONS_URL} | sh
    cd .. && rm -rf ${TMP_DIR}

    gsettings set org.gnome.desktop.interface icon-theme 'Suru++'
}

function install_cursors() {
    mkdir -p ${CURSORS_PATH}
    mkdir -p ${TMP_DIR} && cd ${TMP_DIR}
    git clone ${CURSORS_URL}
    cp -pr capitaine-cursors/dist/* ${CURSORS_PATH}
    cd .. && rm -rf ${TMP_DIR}

    gsettings set org.gnome.desktop.interface cursor-theme 'capitaine-cursors'
}

function install_grub_theme() {
    sudo bash -c "$(curl -fsSL https://raw.githubusercontent.com/lfelipe1501/Atomic-GRUB2-Theme/master/install.sh)"
}

function configure_gnome_settings() {
    # Show desktop icons
    gsettings set org.gnome.desktop.background show-desktop-icons true

    # Hide top bar applications menu
    gsettings set org.gnome.settings-daemon.plugins.xsettings overrides "{'Gtk/ShellShowsAppMenu': <0>}"

    # Show date and seconds in top bar's clock
    gsettings set org.gnome.desktop.interface clock-show-date true
    gsettings set org.gnome.desktop.interface clock-show-seconds true

    # Show weeks on left side of the calendar
    gsettings set org.gnome.desktop.calendar show-weekdate true

    # Show "minimize", "maximize" and "close" button in every window
    gsettings set org.gnome.desktop.wm.preferences button-layout 'appmenu:minimize,maximize,close'

    # Turn on NumLock on login
    gsettings set org.gnome.settings-daemon.peripherals.keyboard numlock-state on
}

function install_exa() {
    mkdir -p ${TMP_DIR} && cd ${TMP_DIR}
    curl -Lo exa.zip ${EXA_URL}
    unzip exa.zip
    sudo mv exa-linux-x86_64 /usr/local/bin/exa
    cd .. && rm -rf ${TMP_DIR}
}