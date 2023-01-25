#!/bin/bash
# Sets up NeoVim with plugins
set -e

SCRIPTDIR="$(dirname -- $0)"

main() {
    setup_dependencies
    setup_neovim
    make_links
    setup_plugins
}

# Setup dependencies for plugins
setup_dependencies() {
    curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.2/install.sh | bash

    export NVM_DIR="$HOME/.nvm"
    [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
    [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
    nvm install node

    sudo apt install ripgrep -y
    sudo apt install bat -y
    sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
}

# Setup NeoVim
setup_neovim() {
    sudo apt install neovim -y

    read -p "Do you want to customize neovim globally? [y/N] " -n 1 -r
    echo
    if [[ $REPLY =~ ^[Yy]$ ]]; then
        sudo mkdir -p /etc/xdg/nvim
        sudo ln -sf "$HOME/dotfiles/init.vim" "/etc/xdg/nvim/sysinit.vim"
    fi
}

# Setup NeoVim plugins
make_links() {
    mkdir -p ~/.config/nvim
    ln -sf "$(realpath $SCRIPTDIR/init.vim)" "$HOME/.config/nvim/init.vim"
    ln -sf "$(realpath $SCRIPTDIR/.vimrc)" "$HOME/.vimrc" # Vim is setup with vimscript only
}

# Install NeoVim plugins
setup_plugins() {
    nvim +"PlugInstall --sync" +qa
}


main "$@"
