export EDITOR=nvim
export BROWSER=qutebrowser

export PATH=$HOME/src/sh/vem:$PATH
export PATH=$HOME/bin:$PATH
export PATH=$HOME/.local/bin:$PATH
export PATH=$HOME/.cargo/bin:$PATH

MAKEFLAGS="-j$(nproc)"
export MAKEFLAGS

export HISTFILE=$HOME/.zsh_history
export HISTSIZE=100000
export SAVEHIST=100000

export GREP_COLOR=31

export GOPATH=$HOME/src/go
export GOROOT=/usr/lib/go
export PATH=$GOROOT/bin:$PATH
export PATH=$GOPATH/bin:$PATH

export NPM_PACKAGES="$HOME/.npm-packages"
export PATH=$NPM_PACKAGES/bin:$PATH
export NODE_PATH=$NPM_PACKAGES/lib/node_modules:$NODE_PATH

export XKB_DEFAULT_LAYOUT=fr

# vim: ft=sh:
