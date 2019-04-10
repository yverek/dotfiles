#!/usr/bin/env bash

source ./libs/debian.sh

if ! dpkg -s ${DRIVERS} &> /dev/null; then
    # update sources.list
    info "Rewriting /etc/apt/sources.list... "
    clear rewriting_sources_list
    ok

    info "Updating system... "
    clear updating_system
    ok

    # install drivers
    info "Installing drivers... "
    clear installing_drivers
    ok

    echo -e ${WHITE}"Now you have to "${GREEN}"reboot your system"${WHITE}"!"
    read -p "Press enter to continue..."
    exit 0
elif ! dpkg -s "zsh" &> /dev/null; then
    info "Editing PulseAudio configuration files... "
    clear edit_pulseaudio_file
    ok

    info "Rebooting PulseAudio... "
    clear rebooting_pulseaudio
    ok

    info "Installing FireWall... "
    clear installing_firewall
    ok

    info "Configuring FireWall... "
    clear configuring_firewall
    ok
fi
