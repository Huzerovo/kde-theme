#!/usr/bin/bash

function warn() {
    printf "\033[33m%s\033[0m\n" "$*"
}

function die() {
    printf "\033[31m%s\033[0m\n" "$*"
    exit 1
}

if [[ ! -f "$PWD/package.sh" ]]; then 
    die "Can not find package.sh"
fi

INSTALL_SCRIPT="$PWD/package.sh"
THEME_NAME="Huzerowo"

cd "desktopthemes" || die "Failed before install plasma theme"

bash "$INSTALL_SCRIPT" "$THEME_NAME" || warn "Failed to install: Plasma Theme"

cd "../look-and-feel" || die "Failed before install"

bash "$INSTALL_SCRIPT" "$THEME_NAME" || warn "Failed to install: Global Theme(Look and Feel)"
