#!/usr/bin/env bash

source ./libs/debian.sh

if ! dpkg -s ${DRIVERS} &> /dev/null; then
    tput reset
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
    tput reset
    info "Editing PulseAudio configuration files... "
    clear edit_pulseaudio_file
    ok

    info "Rebooting PulseAudio... "
    clear reboot_pulseaudio
    ok

    info "Installing FireWall... "
    clear install_firewall
    ok

    info "Configuring FireWall... "
    clear configure_firewall
    ok

    info "Installing fonts... "
    clear install_fonts
    ok

    info "Activating fonts... "
    clear activate_fonts
    ok

    info "Configuring Font Manager... "
    clear configure_font_manager
    ok

    info "Configuring Gedit... "
    clear configure_gedit
    ok

    info "Installing software... "
    clear install_software
    ok

    info "Configuring Plank... "
    clear configure_plank
    ok

    info "Installing Zsh... "
    clear install_zsh
    ok

    info "Installing zplug... "
    clear install_zplug
    ok

    echo -e "${WHITE}Now you have to ${GREEN}restart your terminal${WHITE} and zplug will take care of everything!"
    read -p "Press enter to continue..."
    exit 0
elif ! command -v pipenv; then
    info "Generating SSH key... "
    clear generate_ssh_key
    ok

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

    info "Installing pyenv... "
    clear install_pyenv
    ok

    info "Installing Pipenv... "
    clear install_pipenv
    ok

    echo -e "${WHITE}Now you have to ${GREEN}restart your terminal${WHITE}!"
    read -p "Press enter to continue..."
    exit 0
fi
