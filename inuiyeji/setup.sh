#!/bin/bash
# Setup everything with prompts
set -e

SCRIPTDIR="$(dirname -- $0)"

main() {

    read -p "Do you want to setup vim? [y/n] " -n 1 -r
    echo
    if [[ $REPLY =~ ^[Yy]$ ]]; then
        bash "$SCRIPTDIR/setup_vim.sh"
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

main "$@"
