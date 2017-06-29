HOSTNAME=$(hostname)

all: $(HOSTNAME)
	@echo "$@"



fry: common laptop
	@echo "$@"
	@sed -i "s/^interface = .*$/interface = wlp2s0/g" "$HOME/.config/polybar/config"

lili: common laptop
	@echo "$@"

isaac: common server
	@echo "$@"



common:
	@echo "$@"
	stow nano
	stow neovim
	stow tmux
	stow zsh

laptop:
	@echo "$@"
	stow dunst
	stow firefox
	stow gtk-theme
	stow homePage
	stow i3
	stow locker
	stow luakit
	stow polybar
	stow sounds
	stow termite
	stow volumeicon
	stow wallpaper
	stow xcompose
	stow xorg
	stow xscreensaver

server:
	@echo "$@"
