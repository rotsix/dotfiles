HOSTNAME := $(shell hostname)


default: $(HOSTNAME)

all: default
	@echo "$@"



fry: common laptop
	@echo "$@"

lili: common laptop
	@echo "$@"

isaac: common server
	@echo "$@"



common:
	@echo "$@"
	@stow git
	@stow nano
	@stow neovim
	@stow tmux
	@stow zsh

laptop:
	@echo "$@"
	@stow compton
	@stow dunst
	@stow firefox
	@stow gtk-theme
	@stow homePage
	@stow i3
	@stow locker
	@stow mpv
	@stow polybar
	@stow sounds
	@stow termite
	@stow volumeicon
	@stow wallpaper
	@stow xcompose
	@stow xorg
	@stow xscreensaver
	@# in case of an update
	@ln -sf "${HOME}/.tmux.conf.laptop" "${HOME}/.tmux.conf"

server:
	@echo "$@"
	@ln -sf "${HOME}/.tmux.conf.rpi" "${HOME}/.tmux.conf"
