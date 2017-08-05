HOSTNAME := $(shell hostname)


default: $(HOSTNAME)

all: default
	@echo "stow $@"



fry: common laptop
	@echo "stow $@"

lili: common laptop
	@echo "stow $@"

isaac: common server
	@echo "stow $@"



common:
	@echo "stow $@"
	@stow git
	@stow nano
	@stow neovim
	@stow tmux
	@stow zsh

laptop:
	@echo "stow $@"
	@stow compton
	@stow dunst
	@stow firefox
	@stow greenclip
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
	@echo "stow $@"
	@ln -sf "${HOME}/.tmux.conf.rpi" "${HOME}/.tmux.conf"
