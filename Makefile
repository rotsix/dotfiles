HOSTNAME := $(shell hostname)


default: $(HOSTNAME)

all: default
	@echo "$@"



fry: common laptop
	@echo "$@"
	@sed -i 's/^interface = .*$$/interface = wlp2s0/g' "$(HOME)/.config/polybar/config"

lili: common laptop
	@echo "$@"
	@sed -i 's/^interface = .*$$/interface = wlp4s0/g' "$(HOME)/.config/polybar/config"

isaac: common server
	@echo "$@"



common:
	@echo "$@"
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
	@stow polybar
	@stow sounds
	@stow termite
	@stow volumeicon
	@stow wallpaper
	@stow xcompose
	@stow xorg
	@stow xscreensaver
	@# in case of an update
	@ln -sf "$HOME/.tmux.conf.laptop" "${HOME}/.tmux.conf"

server:
	@echo "$@"
