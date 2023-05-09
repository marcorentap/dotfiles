#!/bin/bash
# Sets up NeoVim with plugins
set -e

SCRIPTDIR="$(dirname -- $0)"
SHAREDDIR="$SCRIPTDIR/../shared"

main() {
    setup_tmux
}

# Setup dependencies for plugins
setup_tmux() {
    git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
    ln -sf "$(realpath $SHAREDDIR/.tmux.conf)" "$HOME/.tmux.conf"

    # Setup links
    tmux start-server
    tmux new-session -d
    # install the plugins
    ~/.tmux/plugins/tpm/scripts/install_plugins.sh
    tmux kill-server
}

main "$@"
