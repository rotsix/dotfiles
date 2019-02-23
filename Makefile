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


common:
	@echo "stow $@"
	@stow bin
	@stow git
	@stow mpd
	@stow mutt
	@stow neovim
	@stow ncmpcpp
	@stow tmux
	@stow zsh

laptop:
	@echo "stow $@"
	@stow dunst
	@stow i3
	@stow mpv
	@stow qutebrowser
	@stow termite
	@stow xcompose
	@stow zathura
	@ln -sf "${HOME}/.tmux.conf.laptop" "${HOME}/.tmux.conf"

server:
	@echo "stow $@"
	@ln -sf "${HOME}/.tmux.conf.server" "${HOME}/.tmux.conf"
