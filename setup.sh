#!/bin/bash

#<Install packages>
sudo apt install git -y

sudo apt install neovim -y
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

sudo apt install zsh -y
sudo sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
curl -sL --proto-redir -all,https https://raw.githubusercontent.com/zplug/installer/master/installer.zsh | zsh

sudo apt install tmux -y
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
sudo apt install tmuxinator -y

git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install
#</Install packages>

# Config files
mkdir -p ~/.config/nvim
mkdir -p ~/.config/tmuxinator

ln -sf "$HOME/dotfiles/init.vim" "$HOME/.config/nvim/init.vim"
ln -sf "$HOME/dotfiles/.vimrc" "$HOME/.vimrc"
ln -sf "$HOME/dotfiles/.zshrc" "$HOME/.zshrc"
ln -sf "$HOME/dotfiles/.tmux.conf" "$HOME/.tmux.conf"
ln -sf "$HOME/dotfiles/tmuxinator.yml" "$HOME/.config/tmuxinator/tmuxinator.yml"
