#!/bin/bash
# Sets up NeoVim with plugins
set -e

SCRIPTDIR="$(dirname -- $0)"
SHAREDDIR="$SCRIPTDIR/../shared"

main() {
    setup_tmux

    read -p "Do you want to setup tmuxinator? [Y/n] " -n 1 -r
    echo
    if [[ $REPLY =~ ^[Yy]$ ]]; then
        setup_tmuxinator
    fi
}

# Setup dependencies for plugins
setup_tmux() {
    sudo apt install tmux -y
    git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
    ln -sf "$(realpath $SHAREDDIR/.tmux.conf)" "$HOME/.tmux.conf"

    # Setup links
    tmux start-server
    tmux new-session -d
    # install the plugins
    ~/.tmux/plugins/tpm/scripts/install_plugins.sh
    tmux kill-server
}

# Setup tmuxinator
setup_tmuxinator() {
    sudo apt install tmuxinator -y
    mkdir -p ~/.config/tmuxinator
    ln -sf "$(realpath $SHAREDDIR/tmuxinator.yml)" "$HOME/.config/tmuxinator/tmuxinator.yml"
}

main "$@"
