# Dot-files

Here are my dot-files.

## Introduction

I've been managing my dot-files for a few years, and so always did everything I could to ease their management.
I finally started liking the way I manage them.

My main goal is to set up a new machine quickly, and with the least human-interaction.
I also want my dot-files to be portable and easily deployed on different environments.

I previously used a Makefile to manage everything, but the more I added files and configurations, the more it became uglier and uglier.
A script is now available to manage and deploy them.

My dot-files work using symbolic links, and are deployed using [stow](https://www.gnu.org/software/stow/).
Each folder in this repository contains an application configuration.
Within these folders, they are structured as if being located at `$HOME`.

Here is an example with `mpd`:

```
mpd/
└── .config/
    └── mpd/
        └── mpd.conf
```

## Installation

My dot-files are mostly self-contained, and deployed by `stow`.
It should be available on most platforms (at least on Arch Linux).

Cloning this repository and there it is.

> Note: to build fonts, Python3's `virtualenv` must be installed.

## Deployment

> As my dot-files are.. mine, everything is made to match *my* setup.

A deployment script is available (`./deploy.sh`).
Here is the usage:

```
./deploy.sh OPTS PROFILE
    options:
	-a   adapt pacman to ARM architecture
	-b   add blackarch repository

    common:
	base configs
	git - mpd - neomutt - nvim - ncmpcpp - zsh - nano
	sudo: pacman - nano

    graphic:
	graphical machines
	:common:
	mako - sway - mpv - qutebrowser - termite - zathura - font

    laptop:
	battery and wireless
	:graphic:
	tlp - wpa_supplicant/network-manager

    server:
	remove unwanted files
	:common:
	tmux

    minimal:
	on user-only machines (VM, work..)
	nano - nvim - zsh
```

A few remarks worth reading before deployment:

- btw i use arch, a pacman configuration is deployed.
- I'm also using NetworkManager to provide Wi-Fi.
- TLP is enabled to reduce battery consumption.

Some wallpapers are available in `~/.wallpapers/`, to use one, link it to `~/.wallpaper` (without any extension).
By default, `swaylock` will use `~/.wallpaper`.
Currently, `~/.wallpapers/arch.sh` is launched, this script is inspired from [amirashabani/bain](https://github.com/amirashabani/bain)'s.
It displays arch logo with battery indicator as a background.


## To-do list and improvements

- [ ] automate arch install
- [ ] install packages on deployment
- [X] add blackarch repo (`-b` option)
- [X] fix pacman deployment
- [ ] clean 'nvim' config for 'minimal' profile
- [ ] in 'minimal' profile, copy 'nvim' to 'vim'
- [ ] clean this dirty 'zsh' config
- immuable and easily deployable config?
- ansible?
- vim autocmd groups depending on language?
