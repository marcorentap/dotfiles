#!/bin/bash

# TODO: Change this to makefile, use make install
# TODO: Convert into full setup script that also installs the packages and plugins, not just config files
mkdir -p ~/.config/nvim
mkdir -p ~/.config/tmuxinator

ln -sf "$HOME/dotfiles/init.vim" "$HOME/.config/nvim/init.vim"
ln -sf "$HOME/dotfiles/.vimrc" "$HOME/.vimrc"
ln -sf "$HOME/dotfiles/.zshrc" "$HOME/.zshrc"
ln -sf "$HOME/dotfiles/.tmux.conf" "$HOME/.tmux.conf"
ln -sf "$HOME/dotfiles/tmuxinator.yml" "$HOME/.config/tmuxinator/tmuxinator.yml"
