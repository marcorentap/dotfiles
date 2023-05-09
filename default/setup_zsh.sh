#!/bin/bash
# Sets up zsh and ohmyzsh
#set -e

SCRIPTDIR="$(dirname -- $0)"
SHAREDDIR="$SCRIPTDIR/../shared"

main() {
    setup_dependencies
    setup_zsh
    make_links
}

# Setup dependencies for plugins
setup_dependencies() {
    sudo apt install ripgrep -y # For fzf
}

# Setup zsh
setup_zsh() {
    sudo apt install zsh -y
    sudo apt install command-not-found -y

    sudo locale-gen en_US.UTF-8
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
    curl -sL --proto-redir -all,https https://raw.githubusercontent.com/zplug/installer/master/installer.zsh | zsh
    git clone https://github.com/Aloxaf/fzf-tab ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/fzf-tab
    git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

    git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
    yes | ~/.fzf/install --key-bindings
}

# Setup zsh links
make_links() {
    ln -sf "$(realpath $SHAREDDIR/.zshrc)" "$HOME/.zshrc"
}

main "$@"
