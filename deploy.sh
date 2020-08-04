#!/bin/bash
#
# dotfiles deployment manager

usage () {
    say "usage:"
    verbose "${RESET}opts:"
    verbose "  -b: add blackarch repository"
    verbose "  -a: adapt pacman to ARM architecture"
    verbose "${RESET}profiles:"
    verbose "  common"
    verbose "  graphic"
    verbose "  laptop"
    verbose "  server"
    verbose "  minimal"
}


## LOGGING

RED="\e[31m"
GREEN="\e[32m"
YELLOW="\e[33m"
BLUE="\e[34m"
GREY="\e[90m"
RESET="\e[0m"
BOLD="\e[1m"

SUDO="${RED}sudo$GREY"

# title MSG
title () {
    echo -e "${BLUE}[>]$RESET$BOLD $1$RESET"
}

# say MSG [ECHO_OPT]
say () { echo -e $2 "${GREEN}[+]$RESET $1" ;}
# yell MSG [ECHO_OPT]
yell () { echo -e $2 "${RED}[-]$RESET $1" > /dev/stderr ;}
# log MSG [ECHO_OPT]
log () { echo -e $2 "${YELLOW}[·]$RESET $1" ;}
# verbose MSG
verbose () { echo -e "    $GREY$1$RESET" ;}
# verbose_exec MSG
verbose_exec () {
    verbose "$1"
    cmd="${1//\\$RED/}"
    cmd="${cmd//\\$GREY/}"
    eval "$cmd" &> /dev/null
}


## UTILS

# exists PKG
exists () {
    if ! command -v "$1" &> /dev/null; then
	yell "package not found: '$1'"
	return 1
    fi

    if ! stow "$1" &> /dev/null; then
	yell "config not found: '$1'"
	return 1
    fi
}

# deploy PKG
deploy () {
    say "deploy '$1'"
    exists "$1" || return
    stow "$1"
}

# deploy_root PKG
deploy_root () {
    say "deploy '$1' (as root)"
    exists "$1" || return
    verbose_exec "$SUDO stow $1 -t /"
}

# deploy_pkgs PKGS
deploy_pkgs () {
    for pkg in $1; do
	deploy "$pkg"
    done
}


## PROFILES

common () {
    title "common"

    pkgs="git mpd neomutt nvim ncmpcpp zsh"
    deploy_pkgs "$pkgs"

    say "deploy 'bin'"
    stow "bin"

    if command -v "pacman" &> /dev/null; then
	verbose_exec "$SUDO rm /etc/pacman.conf"
	verbose_exec "$SUDO rm -r /etc/pacman.d"
	deploy_root "pacman"

	if [ -n "$ARM" ]; then
	    verbose_exec "echo 'Server = http://mirror.archlinuxarm.org/\$arch/\$repo' | $SUDO tee /etc/pacman.d/mirrorlist"
	    verbose_exec "echo -e '\n[alarm]\nInclude = /etc/pacman.d/mirrorlist\n\n[aur]\nInclude = /etc/pacman.d/mirrorlist' | $SUDO tee -a /etc/pacman.conf"
	else
	    verbose_exec "$SUDO reflector --country France --country Germany --latest 3 --age 12 --protocol https --sort rate --save /etc/pacman.d/mirrorlist"
	fi
	verbose_exec "$SUDO pacman-key --init"
	verbose_exec "$SUDO pacman-key --populate"

	if [ -n "$BLACKARCH" ]; then
	    verbose_exec "echo -e '\n[blackarch]\nInclude = /etc/pacman.d/blackarch-mirrorlist' | $SUDO tee -a /etc/pacman.conf"
	    verbose_exec "curl 'https://raw.githubusercontent.com/BlackArch/blackarch/master/mirror/mirror.lst' | sed -E 's:.*\|(.*)\|.*:# Server = \1:g' | $SUDO tee /etc/pacman.d/blackarch-mirrorlist"
	fi
    fi

    deploy "nano"
    verbose_exec "$SUDO rm /etc/nanorc"
    say "deploy 'nano' as root..."
    verbose "sed -r -e 's/^set (.*)color/# # set \1color/g' \n\t-e 's/# set (.*)color/set \1color/g' \n\t~/dotfiles/nano/.nanorc \n\t| $SUDO tee /etc/nanorc"
    sed -r -e 's/^set (.*)color/# # set \1color/g' -e 's/# set (.*)color/set \1color/g' ~/dotfiles/nano/.nanorc | sudo tee /etc/nanorc &> /dev/null
}

graphic () {
    common
    title "graphic"

    pkgs="mako sway mpv qutebrowser termite zathura"
    deploy_pkgs "$pkgs"

    ln -s ~/.zprofile.graphic ~/.zprofile

    say "deploy 'homepage'"
    stow homepage

    say "deploy 'wallpaper'"
    stow wallpaper
    if [ ! -e "$HOME/.wallpaper" ]; then
    	verbose "choose wallpaper"
    fi

    say "build font..." -n
    bash ./font/mk.sh &> /dev/null
    echo " done"
}

laptop () {
    graphic
    title "laptop"

    say "deploy 'tlp'"
    verbose_exec "$SUDO systemctl enable tlp.service"
    verbose_exec "$SUDO systemctl start tlp.service"

    say "set up wifi"
    verbose_exec "$SUDO systemctl enable NetworkManager.service"
    verbose_exec "$SUDO systemctl start NetworkManager.service"
}

server () {
    common
    title "server"

    deploy_pkgs "tmux"
    ln -s ~/.zprofile.server ~/.zprofile
}

minimal () {
    title "minimal"

    pkgs="nano nvim zsh"
    deploy_pkgs "$pkgs"

    log "configuring 'zsh'"
    sed -i "1d" ~/.zshrc  # remove zsh plugins
    sed -i "1,6d" ~/.zsh.d/alias.zsh  # remove 'exa' binds
    sed -i "1,6s/^#//" ~/.zsh.d/alias.zsh  # uncomment 'ls' binds
    sed -i "s/^alias cat=.*$//g" ~/.zsh.d/alias.zsh  # remove 'bat' bind

    log "configuring 'nvim'"
    verbose "TODO"
}


## MAIN


if ! command -v "stow" &> /dev/null; then
    echo "please first install stow"
    exit 1
fi

echo -e "$BLUE+------------------------+$RESET"
echo -e "$BLUE|$RESET$BOLD welcome to my dotfiles $RESET$BLUE|$RESET"
echo -e "$BLUE+------------------------+$RESET"

while getopts "ba" opt &> /dev/null; do
    case $opt in
    	b)
    	    BLACKARCH="smash mouth - all star"
    	    ;;
    	a)
    	    ARM="rick astley - never gonna give you up"
    	    ;;
	*)
	    yell "wrong option"
	    usage
	    exit 1
	    ;;
    esac
done
shift $((OPTIND-1))

say "update git modules"
git submodule update --init

test -n "$1" && log "current selection: $YELLOW'$1'$RESET"

case "$1" in
    common)
	common
	;;
    graphic)
	graphic
	;;
    laptop)
	laptop
	;;
    server)
	server
	;;
    minimal)
	minimal
	;;
    *)
    	if [ -n "$1" ]; then
    	    verbose "profile not found"
    	fi
	usage
	exit 0
	;;
esac

file ~/.zshrc &> /dev/null && (source $HOME/.zshrc &> /dev/null)

say "${BOLD}done"
echo -e "    $BLUE----$RESET"
