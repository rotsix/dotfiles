default:   # help #
	@command -v "stow" &> /dev/null &> /dev/null || echo "[*] install stow first"
	@grep -E "^[a-z]+:" Makefile

common:           #
	stow bin
	@command -v git &> /dev/null || echo "[*] install git"
	stow git
	@command -v mpd &> /dev/null || echo "[*] install mpd"
	stow mpd
	@command -v neomutt &> /dev/null || echo "[*] install neomutt"
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
	# 'sudo' you know
	@command -v sudo &> /dev/null || echo "[*] install and configure sudo"
	sudo stow nano -t / &> /dev/null
	sed -r -e 's/^set (.*)color/# # set \1color/g' -e 's/# set (.*)color/set \1color/g' ~/dotfiles/nano/etc/nanorc > ~/.nanorc
	sudo stow pacman -t / &> /dev/null

laptop: graphic   #
	@command -v sudo &> /dev/null || echo "[*] install and configure sudo"
	@command -v tlp &> /dev/null || echo "[*] install tlp"
	sudo systemctl enable tlp.service
	sudo systemctl start tlp.service
	@command -v wpa_supplicant &> /dev/null || echo "[*] install wpa_supplicant"
	sudo ln -sf /usr/share/dhcpcd/hooks/10-wpa_supplicant /usr/lib/dhcpcd/dhcpcd-hooks/
	sudo stow wpa_supplicant -t / &> /dev/null
	@echo '[*] get wifi card name (via `ip a`)'
	@echo '[*] run `sudo systemctl enable dhcpcd@<card name>`'
	@echo '[*] run `sudo systemctl start dhcpcd@<card name>`'


graphic: common   #
	@command -v dunst &> /dev/null || echo "[*] install dunst"
	stow dunst
	stow homepage
	@command -v sway &> /dev/null || echo "[*] install sway"
	stow sway
	@command -v mpv &> /dev/null || echo "[*] install mpv"
	stow mpv
	@command -v qutebrowser &> /dev/null || echo "[*] install qutebrowser"
	stow qutebrowser
	@command -v termite &> /dev/null || echo "[*] install termite"
	stow termite
	@command -v zathura &> /dev/null || echo "[*] install zathura"
	stow zathura
	#@bash font/mk.sh

server: common    #
	rm -rf ${HOME}/.zprofile
	@command -v tmux &> /dev/null || echo "[*] install tmux"
	stow tmux
