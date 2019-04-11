#!/usr/bin/env bash

source ./libs/debian.sh

tput reset

if ! dpkg -s ${DRIVERS} &> /dev/null; then
    info "Rewriting /etc/apt/sources.list... "
    clear rewrite_sources_list
    ok

    info "Updating system... "
    clear update_system
    ok

    info "Installing drivers... "
    clear install_drivers
    ok

    echo -e "${WHITE}Now you have to ${GREEN}reboot your system${WHITE}!"
    read -p "Press enter to continue..."
    exit 0
elif ! dpkg -s "zsh" &> /dev/null; then
    info "Editing PulseAudio configuration files... "
    clear edit_pulseaudio_file
    ok

    info "Rebooting PulseAudio... "
    clear reboot_pulseaudio
    ok

    if ! dpkg -s "gufw" &> /dev/null; then
        info "Installing FireWall... "
        clear install_firewall
        ok
    fi

    if [[ "$(sudo ufw status)" != "Status: active" ]]; then
        info "Configuring FireWall... "
        clear configure_firewall
        ok
    fi

    if [[ ! -d ${LOCAL_FONTS_PATH} ]]; then
        info "Installing fonts... "
        clear install_fonts
        ok
    fi

    info "Activating fonts... "
    clear activate_fonts
    ok

    info "Configuring Font Manager... "
    clear configure_font_manager
    ok

    info "Configuring Gedit... "
    clear configure_gedit
    ok

    if ! dpkg -s ${SOFTWARE} &> /dev/null; then
        info "Installing software... "
        clear install_software
        ok
    fi

    if [[ ! -e ~/.config/autostart/plank.desktop ]]; then
        info "Configuring Plank... "
        clear configure_plank
        ok
    fi

    if [[ "$(echo $SHELL)" != "/usr/bin/zsh" ]]; then
        info "Installing Zsh... "
        clear install_zsh
        ok
    fi

    if [[ ! -d ~/.zplug/ ]]; then
        info "Installing zplug... "
        clear install_zplug
        ok
    fi

    echo -e "${WHITE}Now you have to ${GREEN}restart your terminal${WHITE} and zplug will take care of everything!"
    read -p "Press enter to continue..."
    exit 0
elif ! command -v pipenv; then
    if [[ ! -e ~/.ssh/id_rsa.pub ]]; then
        info "Generating SSH key... "
        clear generate_ssh_key
        ok
    fi

    info "Adding SSH key to ssh-agent... "
    clear add_ssh_key_to_sshagent
    ok

    info "Copying SSH key to clipboard... "
    clear open_gedit_with_ssh_key
    ok

    info "Adding SSH key to GitHub... "
    clear add_ssh_key_to_github
    ok

    info "Adding SSH key to Bitbucket... "
    clear add_ssh_key_to_bitbucket
    ok

    info "Installing Python3... "
    clear install_python3
    ok

    info "Installing PIP... "
    clear install_python3_pip
    ok

    if [[ ! -d ~/.pyenv/ ]]; then
        info "Installing pyenv... "
        clear install_pyenv
        ok
    fi

    if ! command -v pipenv; then
        info "Installing Pipenv... "
        clear install_pipenv
        ok
    fi

    echo -e "${WHITE}Now you have to ${GREEN}restart your terminal${WHITE}!"
    read -p "Press enter to continue..."
    exit 0
elif true; then
    info "Installing PostgreSQL... "
    clear install_postgresql
    ok

    info "Configuring PostgreSQL... "
    clear configure_postgresql
    ok

    if [[ ! -d ~/.local/share/JetBrains/ ]]; then
        info "Installing JetBrains ToolBox... "
        clear install_jetbrains_toolbox
        ok
    fi

    info "Installing GNOME extensions... "
    clear install_gnome_extensions
    ok

    if [[ ! -d /usr/share/themes/Arc-Flatabulous/ ]]; then
        info "Installing Arc-Flatabulous theme... "
        clear install_themes
        ok
    fi

    if [[ ! -d /usr/share/icons/Suru++/ ]]; then
        info "Installing Suru++ icons... "
        clear install_icons
        ok
    fi

    if [[ ! -d ~/.icons/capitaine-cursors/ ]]; then
        info "Installing Capitaine cursors... "
        clear install_cursors
        ok
    fi

    if [[ ! -d /boot/grub/themes/Atomic/ ]]; then
        info "Installing GRUB theme... "
        clear install_grub_theme
        ok
    fi

    info "Configuring GNOME settings... "
    clear configure_gnome_settings
    ok
fi
