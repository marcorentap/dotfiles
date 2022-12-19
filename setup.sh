#!/bin/bash

#<Install packages>
sudo apt install git -y
sudo apt install curl -y
sudo apt install command-not-found -y

curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.2/install.sh | bash

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
nvm install node

sudo apt install neovim -y
sudo apt install ripgrep -y
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

git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install --key-bindings


curl -fsSL https://pkgs.tailscale.com/stable/ubuntu/focal.noarmor.gpg | sudo tee /usr/share/keyrings/tailscale-archive-keyring.gpg >/dev/null
curl -fsSL https://pkgs.tailscale.com/stable/ubuntu/focal.tailscale-keyring.list | sudo tee /etc/apt/sources.list.d/tailscale.list
sudo apt update
curl -fsSL https://tailscale.com/install.sh | sh
#</Install packages>

# Config files
mkdir -p ~/.config/nvim
mkdir -p ~/.config/tmuxinator

ln -sf "$HOME/dotfiles/init.vim" "$HOME/.config/nvim/init.vim"
ln -sf "$HOME/dotfiles/.vimrc" "$HOME/.vimrc"
ln -sf "$HOME/dotfiles/.zshrc" "$HOME/.zshrc"
ln -sf "$HOME/dotfiles/.tmux.conf" "$HOME/.tmux.conf"
ln -sf "$HOME/dotfiles/tmuxinator.yml" "$HOME/.config/tmuxinator/tmuxinator.yml"

# Localisation
sudo localectl set-locale LC_TIME=en_US.utf-8
sudo timedatectl set-timezone Asia/Seoul
