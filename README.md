# Dot-files

Here are my dot-files.

## Introduction

I've been managing my dot-files for a few years, and also always did everything I could to ease their management.
I finally started liking the way I manage them.

My main goal is to set-up a new machine quickly, and with the least human-interaction.
I also want my dot-files to be portable and easily deployed on different environments.

I previously used a Makefile to manage everything, but the more I added files and configurations, the more it became uglier and uglier.
A script is now available to manage and deploy them.

My dot-files work using symbolic links, and are deployed using [stow](https://www.gnu.org/software/stow/).
Each folder in this repository contains an application configuration.
Within these folders, they are structured as if being on `$HOME`.

Here is an example with `mpd`:

```
mpd/
└── .config/
    └── mpd/
        ├── database
        ├── log
        ...
```

## Installation

My dot-files are mostly self-contained, and deployed by `stow`.
It should be available on most platforms (at least on Arch Linux).

Cloning this repository and there it is.

> Note: to build fonts, Python's `virtualenv2` must be installed.

## Deployment

> As my dot-files are.. mine, everything is made to match *my* set-up.

A deployment script is available (`./deploy.sh`).
Here are the usage:

```
./deploy.sh CONF
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
		tlp - wpa_supplicant/dhcpcd

	server:
		remove unwanted files
		:common:
		tmux

	minimal:
		on user-only machine (VM, work..)
		nano - nvim - zsh
```

A few remarks to read before deploying:

- i use arch btw, so a pacman configuration is deployed.
- I'm also using dhcpcd/wpa_supplicant combo to provide Wi-Fi.
- TLP is enabled to reduce battery consumption.

## To-do list and improvements

- [ ] automate arch install
- [ ] install packages on deployment
- [X] fix pacman deployment
- [ ] clean 'nvim' config for 'minimal' set
- [ ] clean this dirty 'zsh' config
