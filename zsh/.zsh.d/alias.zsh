alias ls='exa -s name'
alias la='ls -a'
alias ll='ls -l'
alias lla='la -l'
alias lll='\ls -FhNv --color=auto | less'
alias llla='\ls -AFhNv --color=auto | less'
#alias ls='ls -FhNv --color=auto'
#alias la='ls -A'
#alias ll='ls -l '
#alias lla='ll -A'
#alias lll='ll | less'
#alias llla='ll -A | less'

# can't waste time typing
alias nano='nano -c -w'
alias grep='grep --color=auto'
alias vim='nvim'
alias hoogle='hoogle --color=true'
alias s='ssh'
alias p='yay'
alias g='git'
alias agh='git add -A && git commit -am "$(hostname)" && git push'
alias mkt='mk /tmp/$$'
alias mkdir='mkdir -p'
alias swapy='sudo swapon $HOME/usr/swapfile'
alias cat='bat'
alias mutt='neomutt'
alias dc='docker-compose'
alias youtube-audio='youtube-dl -ix --audio-quality 0 --audio-format mp3'
alias muttr='mutt -R'

# sorting files in dir by size
alias lh='du -hsc * | sort -hr'
alias lha='du -hsc .* | sort -hr'
alias lhs='(lh;lha) | sort -hr'

# pacman
alias orphans='pacman -Qdtq | sudo pacman -Rnsc --noconfirm - 2> /dev/null || echo "Nothing to delete"'
alias mirrorlist-update='sudo reflector --country France --country Germany --latest 3 --age 12 --protocol https --sort rate --save /etc/pacman.d/mirrorlist; sudo rm -f /etc/pacman.d/mirrorlist.pacnew'
alias pkgfile='sudo pacman -Fy && pacman -F'

# ps dump sorted by memory
alias ps_mem='sudo ps_mem'

# fix sudo
alias sudo='sudo '

# rlwrap
alias ocaml='rlwrap \ocaml'

# pip
alias pip-update="pip list --outdated --format=freeze 2> /dev/null | grep -v '^\-e' | cut -d = -f 1  | xargs -n1 pip install -U"
