#!/bin/bash
# Setup everything with prompts
set -e

SCRIPTDIR="$(dirname -- $0)"

main() {
    setup_dependencies

    read -p "Do you want to setup localisation? [y/n] " -n 1 -r
    echo
    if [[ $REPLY =~ ^[Yy]$ ]]; then
        bash "$SCRIPTDIR/setup_localisation.sh"
    fi

    read -p "Do you want to setup helix? [y/n] " -n 1 -r
    echo
    if [[ $REPLY =~ ^[Yy]$ ]]; then
        bash "$SCRIPTDIR/setup_helix.sh"
    fi

    read -p "Do you want to setup tailscale? [y/n] " -n 1 -r
    echo
    if [[ $REPLY =~ ^[Yy]$ ]]; then
        bash "$SCRIPTDIR/setup_tailscale.sh"
    fi

    read -p "Do you want to setup tmux? [y/n] " -n 1 -r
    echo
    if [[ $REPLY =~ ^[Yy]$ ]]; then
        bash "$SCRIPTDIR/setup_tmux.sh"
    fi

    read -p "Do you want to setup zsh? [y/n] " -n 1 -r
    echo
    if [[ $REPLY =~ ^[Yy]$ ]]; then
        bash "$SCRIPTDIR/setup_zsh.sh"
    fi
}

setup_dependencies() {
    sudo apt install git -y
    sudo apt install curl -y
}

main "$@"
