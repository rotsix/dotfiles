default:          #
	@command -v "stow" &> /dev/null || echo "install stow first"
	@grep -E "^[a-z]+:" Makefile

common:           #
	stow bin
	stow git
	stow mpd
	stow mutt
	stow neovim
	curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	stow ncmpcpp
	stow tmux
	stow zsh

laptop: graphic   #
	@echo "# TODO: tlp, lid closing"

graphic: common   #
	stow dunst
	stow homepage
	stow i3
	stow mpv
	stow qutebrowser
	stow termite
	stow xorg
	stow zathura
	ln -sf ${HOME}/.tmux.conf.laptop ${HOME}/.tmux.conf
	#@bash font/mk.sh

server:           #
	rm -rf ${HOME}/.zprofile
	ln -sf ${HOME}/.tmux.conf.server ${HOME}/.tmux.conf
