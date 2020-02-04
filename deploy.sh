#!/bin/sh
#
# dotfiles deployment manager

usage () {
    echo "$(basename "$0"):"
    echo "  please refer to README.md, or read this script"
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
    echo -e "$BLUE[>]$RESET$BOLD $1$RESET"
}

# say MSG [ECHO_OPT]
say () {
    echo -e $2 "$GREEN[+]$RESET $1"
}
# yell MSG [ECHO_OPT]
yell () {
    echo -e $2 "$RED[-]$RESET $1" > /dev/stderr
}
# log MSG [ECHO_OPT]
log () {
    echo -e $2 "$YELLOW[·]$RESET $1"
}
# verbose MSG
verbose () {
    echo -e "    $GREY$1$RESET"
}
# verbose_exec MSG
verbose_exec () {
    verbose "$1"
    eval $1 &> /dev/null
}


## UTILS

PACMAN="sudo pacman -Syu --noconfirm"

# exists PKG
exists () {
    if ! command -v "$1" &> /dev/null; then
	yell "package not found: '$1'"
	return -1
    fi

    if ! stow "$1" &> /dev/null; then
	yell "config not found: '$1'"
	return
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
	deploy $pkg
    done
}

## PROFILES

common () {
    title "common"

    rm -r ~/.zshrc &> /dev/null || yell "~/.zshrc already exists"
    deploy_pkgs "git mpd neomutt nvim ncmpcpp zsh"

    if command -v "pacman" &> /dev/null; then
	verbose_exec "$SUDO rm /etc/pacman.conf"
	verbose_exec "$SUDO rm -r /etc/pacman.d"
	deploy_root "pacman"
	verbose_exec "$SUDO reflector --country France --country Germany --latest 3 --age 12 --protocol https --sort rate --save /etc/pacman.d/mirrorlist"
	verbose_exec "$SUDO pacman-key --init"
	verbose_exec "$SUDO pacman-key --populate"
    fi

    deploy "nano"
    verbose_exec "$SUDO rm /etc/nanorc"
    say "deploy 'nano' as root..."
    sed -r -e 's/^set (.*)color/# # set \1color/g' -e 's/# set (.*)color/set \1color/g' ~/dotfiles/nano/.nanorc | $SUDO tee /etc/nanorc &> /dev/null
    verbose "sed -r -e 's/^set (.*)color/# # set \1color/g' \n\t-e 's/# set (.*)color/set \1color/g' \n\t~/dotfiles/nano/.nanorc \n\t| $SUDO tee /etc/nanorc"
}

graphic () {
    common
    title "graphic"

    deploy_pkgs "mako sway mpv qutebrowser termite zathura"

    say "deploy 'homepage'"
    stow homepage

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
    verbose_exec "$SUDO ln -sf /usr/share/dhcpcd/hooks/10-wpa_supplicant /usr/lib/dhcpcd/dhcpcd-hooks/"
    verbose_exec "$SUDO rm /etc/wpa_supplicant.conf"
    verbose_exec "$SUDO rm -r /etc/wpa_supplicant"
    deploy_root "wpa_supplicant"
    wifi_card="$(ip a | grep -Eo '[0-9]+: w[a-z0-9]+:' | cut -d ':' -f 2 | sed 's/ //')"
    log "get wifi card name $GREY(found: $wifi_card)$RESET"
    verbose_exec "$SUDO systemctl enable dhcpcd@$wifi_card"
    verbose_exec "$SUDO systemctl start dhcpcd@$wifi_card"
}

server () {
    common
    title "server"

    deploy_pkgs "tmux"
    rm -- $HOME/.zprofile
}

minimal () {
    title "minimal"

    rm -f ~/.zshrc
    deploy_pkgs "nano nvim zsh"

    verbose "configure 'zsh'"
    sed -i "1d" ~/.zshrc # plugins
    sed -i "1,6d" ~/.zsh.d/alias.zsh
    sed -i "1,6s/^#//" ~/.zsh.d/alias.zsh
    sed -i "s/^alias cat=.*$//g" ~/.zsh.d/alias.zsh

    verbose "configure 'nvim'"
}


## MAIN

if ! command -v "stow" &> /dev/null; then
    echo "please first install stow"
    exit 1
fi

echo -e "$BLUE+------------------------+$RESET"
echo -e "$BLUE|$RESET$BOLD welcome to my dotfiles $RESET$BLUE|$RESET"
echo -e "$BLUE+------------------------+$RESET"

say "update git modules"
git submodule update

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
	usage
	exit 0
	;;
esac

file ~/.zshrc &> /dev/null && (source ~/.zshrc &> /dev/null)

say "${BOLD}done"
echo -e "    $BLUE----$RESET"
