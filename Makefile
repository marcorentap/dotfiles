all:
	ln -sf "$(HOME)/dotfiles/init.vim" "$(HOME)/.config/nvim/init.vim"
	ln -sf "$(HOME)/dotfiles/.vimrc" "$(HOME)/.vimrc"
	ln -sf "$(HOME)/dotfiles/.zshrc" "$(HOME)/.zshrc"
	ln -sf "$(HOME)/dotfiles/.tmux.conf" "$(HOME)/.tmux.conf"
	ln -sf "$(HOME)/dotfiles/tmuxinator.yml" "$(HOME)/.config/tmuxinator/tmuxinator.yml"
