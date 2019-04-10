#!/usr/bin/env bash

# Colors
ESC_SEQ="\x1b["
RESET=$ESC_SEQ"39;49;00m"
RED=$ESC_SEQ"31;01m"
GREEN=$ESC_SEQ"32;01m"
YELLOW=$ESC_SEQ"33;01m"
BLUE=$ESC_SEQ"34;01m"
MAGENTA=$ESC_SEQ"35;01m"
CYAN=$ESC_SEQ"36;01m"

###
# Settings
###
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

###
# Functions
###

function info() {
    echo -en "$BLUE=>$RESET "$1
}

function ok() {
    echo -e "$GREEN[ok]$RESET"
}

function clear() {
    tput sc
    $1
    tput rc
    tput ed
}