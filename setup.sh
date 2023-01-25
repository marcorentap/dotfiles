#!/bin/bash
# Setup everything with prompts
set -e

SCRIPTDIR="$(dirname -- $0)"

main() {
    setup_dependencies

    read -p "Do you want to setup localisation? [y/n] " -n 1 -r
    if [[ $REPLY =~ ^[Yy]$ ]]; then
        bash "$SCRIPTDIR/setup_localisation.sh"
    fi

    read -p "Do you want to setup neovim? [y/n] " -n 1 -r
    if [[ $REPLY =~ ^[Yy]$ ]]; then
        bash "$SCRIPTDIR/setup_neovim.sh"
    fi

    read -p "Do you want to setup tailscale? [y/n] " -n 1 -r
    if [[ $REPLY =~ ^[Yy]$ ]]; then
        bash "$SCRIPTDIR/setup_tailscale.sh"
    fi

    read -p "Do you want to setup tmux? [y/n] " -n 1 -r
    if [[ $REPLY =~ ^[Yy]$ ]]; then
        bash "$SCRIPTDIR/setup_tmux.sh"
    fi

    read -p "Do you want to setup hacking tools? [y/n] " -n 1 -r
    if [[ $REPLY =~ ^[Yy]$ ]]; then
        bash "$SCRIPTDIR/setup_hacking_tools.sh"
    fi

    read -p "Do you want to setup zsh? [y/n] " -n 1 -r
    if [[ $REPLY =~ ^[Yy]$ ]]; then
        bash "$SCRIPTDIR/setup_zsh.sh"
    fi
}

setup_dependencies() {
    sudo apt install git -y
    sudo apt install curl -y
}

main "$@"
