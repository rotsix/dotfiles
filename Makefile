default:          #
	@command -v "stow" &> /dev/null &> /dev/null || echo "[*] install stow first"
	@grep -E "^[a-z]+:" Makefile

common:           #
	stow bin
	@command -v git &> /dev/null || echo "[*] install git"
	stow git
	@command -v mpd &> /dev/null || echo "[*] install mpd"
	stow mpd
	@command -v mutt &> /dev/null || echo "[*] install mutt"
	stow mutt
	@command -v neovim &> /dev/null || echo "[*] install neovim"
	stow neovim
	curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	@command -v ncmpdpp &> /dev/null || echo "[*] install ncmpdpp"
	stow ncmpcpp
	@command -v tmux &> /dev/null || echo "[*] install tmux"
	stow tmux
	@command -v zsh &> /dev/null || echo "[*] install zsh"
	stow zsh

laptop: graphic   #
	@echo "# TODO: tlp, lid closing"

graphic: common   #
	@command -v dunst &> /dev/null || echo "[*] install dunst"
	stow dunst
	stow homepage
	@command -v i3 &> /dev/null || echo "[*] install i3"
	stow i3
	@command -v mpv &> /dev/null || echo "[*] install mpv"
	stow mpv
	@command -v qutebrowser &> /dev/null || echo "[*] install qutebrowser"
	stow qutebrowser
	@command -v termite &> /dev/null || echo "[*] install termite"
	stow termite
	@command -v startx &> /dev/null || echo "[*] install startx"
	stow xorg
	@command -v zathura &> /dev/null || echo "[*] install zathura"
	stow zathura
	ln -sf ${HOME}/.tmux.conf.laptop ${HOME}/.tmux.conf
	#@bash font/mk.sh

server:           #
	rm -rf ${HOME}/.zprofile
	ln -sf ${HOME}/.tmux.conf.server ${HOME}/.tmux.conf
