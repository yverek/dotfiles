#!/usr/bin/env bash

source ./libs/debian.sh

if ! dpkg -s ${DRIVERS} &> /dev/null; then
    tput reset
    info "Rewriting /etc/apt/sources.list... "
    clear rewriting_sources_list
    ok

    info "Updating system... "
    clear updating_system
    ok

    info "Installing drivers... "
    clear installing_drivers
    ok

    echo -e ${WHITE}"Now you have to "${GREEN}"reboot your system"${WHITE}"!"
    read -p "Press enter to continue..."
    exit 0
elif dpkg -s "zsh" &> /dev/null; then
    tput reset
    info "Editing PulseAudio configuration files... "
    edit_pulseaudio_file
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

    info "Installing fonts... "
    clear installing_fonts
    ok

    info "Activating fonts... "
    clear activating_fonts
    ok

    info "Configuring Font Manager... "
    clear configuring_font_manager
    ok
fi
