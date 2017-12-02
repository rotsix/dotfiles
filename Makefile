HOSTNAME := $(shell hostname)


default: $(HOSTNAME)
	@echo "stow $@"
	@git config filter.qualia.clean qualia
	@git config filter.qualia.smudge "qualia $(HOSTNAME)"



fry: common laptop
	@echo "stow $@"

lili: common laptop
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
	@stow emacs
	@stow git
	@stow nano
	@stow neovim
	@stow tmux
	@stow zsh

laptop:
	@echo "stow $@"
	@stow atom
	@stow compton
	@stow dunst
	@stow firefox
	@stow greenclip
	@stow gtk-theme
	@stow homePage
	@stow i3
	@stow locker
	@stow mime
	@stow mpv
	@stow polybar
	@stow rofi-pass
	@stow sounds
	@stow termite
	@stow volumeicon
	@stow wallpaper
	@stow xcompose
	@stow xorg
	@stow xscreensaver
	@stow zathura
	@ln -sf "${HOME}/.tmux.conf.laptop" "${HOME}/.tmux.conf"

server:
	@echo "stow $@"
	@ln -sf "${HOME}/.tmux.conf.rpi" "${HOME}/.tmux.conf"
