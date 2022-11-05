all: nvim_init vimrc zshrc tmux_conf

nvim_init:
	ln -sf "$(HOME)/dotfiles/init.vim" "$(HOME)/.config/nvim/init.vim"

vimrc:
	ln -sf "$(HOME)/dotfiles/.vimrc" "$(HOME)/.vimrc"

zshrc:
	ln -sf "$(HOME)/dotfiles/.zshrc" "$(HOME)/.zshrc"

tmux_conf:
	ln -sf "$(HOME)/dotfiles/.tmux.conf" "$(HOME)/.tmux.conf"
