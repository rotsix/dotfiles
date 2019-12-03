#alias ls='ls -FhNv --color=auto'
#alias la='ls -A'
#alias ll='ls -l '
#alias lla='ll -A'
#alias lll='ll | less'
#alias llla='ll -A | less'
alias ls='exa -s name'
alias la='ls -a'
alias ll='ls -l'
alias lla='la -l'
alias lll='\ls -FhNv --color=auto | less'
alias llla='\ls -AFhNv --color=auto | less'

# can't waste time typing
alias nano='nano -c -w'
alias grep='grep --color=auto'
alias vim='nvim'
alias hoogle='hoogle --color=true'
alias s='ssh'
alias p='trizen'
alias g='git'
alias agh='git add -A && git commit -am "$(hostname)" && git push'
alias mkt='mk /tmp/$$'
alias swapy='sudo swapon $HOME/usr/swapfile'
alias cat='bat'
alias mutt='neomutt'
alias dc='docker-compose'

# sorry i'm drunk
alias sl='ls'
alias xs='cd'

# sorting files in dir by size
alias lh='du -hsc * | sort -hr'
alias lha='du -hsc .* | sort -hr'
alias lhs='(lh;lha) | sort -hr'

# clean trash
alias trash-clean='rm -fr -- ${HOME}/trash/* 2>&1 > /dev/null; rm -rf -- ${HOME}/trash/.* 2>&1 > /dev/null'

# mh
alias youtube-audio='youtube-dl -ix --audio-quality 0 --audio-format mp3'

# pacman
alias up='p -Syu'
alias orphans='pacman -Qdtq | sudo pacman -Rnsc --noconfirm - 2> /dev/null || echo "Nothing to delete"'
alias mirrorlist-update='sudo reflector --verbose -l 10 -p http --sort rate --threads 1 --save /etc/pacman.d/mirrorlist && sudo pacman -Syy'
alias pkgfile='sudo pacman -Fy && pacman -Fs'

# ps dump sorted by memory
alias ps_mem='/usr/bin/sudo ps_mem'

# fix sudo
alias sudo='sudo '

# rlwrap
alias ocaml='rlwrap \ocaml'
alias eclipse-clp='rlwrap \eclipse-clp'
alias hopix='rlwrap /home/victor/cours/M1/S1/IDP/compilation-m1-2018/flap/flap -i true -s hopix -V true'
alias retrolix='rlwrap /home/victor/cours/M1/S2/Compilation/compilation-m1-2018/flap/flap -s retrolix -d true -r true -i true'

# pip
alias pip-update="pip list --outdated --format=freeze 2> /dev/null | grep -v '^\-e' | cut -d = -f 1  | xargs -n1 pip install -U"
