HOSTNAME := $(shell hostname)


default: $(HOSTNAME)
	@echo "stow $@"


fry: common laptop
	@echo "stow $@"

lili-linux: common laptop
	@echo "stow $@"

isaac: common server
	@echo "stow $@"

tati: common server
	@echo "stow $@"

abraham: common server
	@echo "stow $@"

franklin: common server
	@echo "stow $@"


common:
	@echo "stow $@"
	@stow bin
	@stow git
	@stow mpd
	@stow mutt
	@stow neovim
	@curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    	https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	@stow ncmpcpp
	@stow tmux
	@stow zsh

laptop:
	@echo "stow $@"
	@stow dunst
	@stow homepage
	@stow i3
	@stow mpv
	@stow qutebrowser
	@stow termite
	@stow xorg
	@stow zathura
	@ln -sf "${HOME}/.tmux.conf.laptop" "${HOME}/.tmux.conf"

server:
	@echo "stow $@"
	@rm -rf ${HOME}/.zprofile
	@ln -sf "${HOME}/.tmux.conf.server" "${HOME}/.tmux.conf"
