autoload -U compinit
compinit

zmodload zsh/complist
setopt extendedglob

setopt correctall
setopt autocd

autoload -U promptinit
promptinit

zmodload zsh/terminfo


if [[ $TERM == xterm-termite ]]; then
	. /etc/profile.d/vte.sh
	__vte_osc7
fi

ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern cursor line root)

ZSH_HIGHLIGHT_STYLES[alias]='fg=blue'
ZSH_HIGHLIGHT_STYLES[builtin]='fg=blue'
ZSH_HIGHLIGHT_STYLES[function]='fg=blue'
ZSH_HIGHLIGHT_STYLES[command]='fg=blue'
ZSH_HIGHLIGHT_STYLES[single-hyphen-option]='fg=magenta'
ZSH_HIGHLIGHT_STYLES[double-hyphen-option]='fg=red'

# vim: ft=zsh:
