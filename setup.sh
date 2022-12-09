#!/bin/bash

#<Install packages>
sudo apt install git -y

sudo apt install nodejs -y #For CoC
sudo apt install neovim -y
sudo apt install bat -y
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

sudo apt install zsh -y
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
curl -sL --proto-redir -all,https https://raw.githubusercontent.com/zplug/installer/master/installer.zsh | zsh
git clone https://github.com/Aloxaf/fzf-tab ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/fzf-tab
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

sudo apt install tmux -y
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
sudo apt install tmuxinator -y

sudo apt install fzf -y
#</Install packages>

# Config files
mkdir -p ~/.config/nvim
mkdir -p ~/.config/tmuxinator

ln -sf "$HOME/dotfiles/init.vim" "$HOME/.config/nvim/init.vim"
ln -sf "$HOME/dotfiles/.vimrc" "$HOME/.vimrc"
ln -sf "$HOME/dotfiles/.zshrc" "$HOME/.zshrc"
ln -sf "$HOME/dotfiles/.tmux.conf" "$HOME/.tmux.conf"
ln -sf "$HOME/dotfiles/tmuxinator.yml" "$HOME/.config/tmuxinator/tmuxinator.yml"

# Locality
sudo localectl set-locale LC_TIME=en_US.utf-8
sudo timedatectl set-timezone Asia/Seoul
