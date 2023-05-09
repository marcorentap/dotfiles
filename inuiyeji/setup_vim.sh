#!/bin/bash
# Sets up NeoVim with plugins
set -e

SCRIPTDIR="$(dirname -- $0)"
SHAREDDIR="$SCRIPTDIR/../shared"

main() {
    setup_dependencies
    make_links
    setup_plugins
}

# Setup dependencies for plugins
setup_dependencies() {
    sh -c 'curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
}

setup_plugins() {
    vim +'PlugInstall --sync' +qa
}

# Setup NeoVim plugins
make_links() {
    ln -sf "$(realpath $SHAREDDIR/.vimrc)" "$HOME/.vimrc" # Vim is setup with vimscript only
}

main "$@"
