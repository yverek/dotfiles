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
else
    echo "Continuo..."
fi
