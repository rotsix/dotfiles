#####################
###
###   _________  _   _ ____   ____ 
###  |__  / ___|| | | |  _ \ / ___|
###    / /\___ \| |_| | |_) | |    
### _ / /_ ___) |  _  |  _ <| |___ 
###(_)____|____/|_| |_|_| \_\\____|
###
###
##################### 



export EDITOR=nano

autoload -U compinit
compinit

zstyle ':completion:*:descriptions' format '%U%B%d%b%u'
zstyle ':completion:*:warnings' format '%BSorry, no matches for: %d%b'
zstyle ':completion:*:sudo:*' command-path /usr/local/sbin /usr/local/bin \
                             /usr/sbin /usr/bin /sbin /bin /usr/X11R6/bin


zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path ~/.zsh_cache

zmodload zsh/complist
setopt extendedglob
zstyle ':completion:*:*:kill:*:processes' list-colors "=(#b) #([0-9]#)*=36=31"
 

setopt correctall
setopt autocd

autoload -U promptinit
promptinit
#prompt swaggy 

alias ls='ls -F --color=auto'
alias la='ls -AF '
alias ll='ls -lh '
alias lla='ls -AFlh '
alias lll='ls -lh | less'
alias llla='ls -lhA | less'
alias xs='cd'
alias sl='ls'
alias rrm='\rm'
alias rm='\mv --target-directory ${HOME}/Corbeille'
alias CLEAN='rrm -fr ${HOME}/Corbeille/*; rrm -fr ${HOME}/Corbeille/.*; rrm -fr ${HOME}/Corbeille/..*'
alias nano='nano -c'
alias syu='pacman -Syu'

alias youtube-audio='youtube-dl -ix --audio-quality 0 --audio-format mp3 --output=${HOME}/Musique/ATrier'


alias -s pdf="evince "

function SWAP(){
	local TMPFILE=tmp.$$
	cp --reflink=auto -- "$1" "$TMPFILE"
	mv -- "$2" "$1"
	mv -- "$TMPFILE" "$2"
}


### mega alias
alias f='firefox'



#alias wifi='sudo create_ap wlp4s0 enp3s0 --no-virt  wifiswag mdpwifi1'
alias mplayerfb='mplayer -vo fbdev -vf scale=1920:1080'

export GREP_COLOR=31
alias grep='grep --color=auto'
alias xte='nohup xterm &' # xte lancera un xterm qui ne se fermera pas si on ferme le terminal

alias curlix="curl -F 'f:1=<-' ix.io"
alias curlsprunge="curl -F 'sprunge=<-' http://sprunge.us"


bindkey -e
bindkey "^[[5~"	beginning-of-line
bindkey "^[[6~"	end-of-line
bindkey "^[[2~"	overwrite-mode
bindkey "^[[3~"	delete-char
[[ -n "${key[Up]}"       ]]  && bindkey  "${key[Up]}"       up-line-or-history
[[ -n "${key[Down]}"     ]]  && bindkey  "${key[Down]}"     down-line-or-history
[[ -n "${key[Left]}"     ]]  && bindkey  "${key[Left]}"     backward-char
[[ -n "${key[Right]}"    ]]  && bindkey  "${key[Right]}"    forward-char
[[ -n "${key[PageUp]}"   ]]  && bindkey  "${key[PageUp]}"   beginning-of-buffer-or-history
[[ -n "${key[PageDown]}" ]]  && bindkey  "${key[PageDown]}" end-of-buffer-or-history



local text=${1:-'red'}
local punctuation=${2:-'blue'}
PROMPT="%F{$text}┌── [%F{$punctuation} %~%F{$text} ]$prompt_newline%F{$text}└────%#%f "



#################
#pour chromium os
#export PATH=`pwd`/depot_tools:"$PATH"

#################
# Adapted from code found at <https://gist.github.com/1712320>.

setopt prompt_subst
autoload -U colors && colors # Enable colors in prompt

# Modify the colors and symbols in these variables as desired.
GIT_PROMPT_SYMBOL="%{$fg[blue]%}±"
GIT_PROMPT_PREFIX="%{$fg[green]%}[%{$reset_color%}"
GIT_PROMPT_SUFFIX="%{$fg[green]%}]%{$reset_color%}"
GIT_PROMPT_AHEAD="%{$fg[red]%}ANUM%{$reset_color%}"
GIT_PROMPT_BEHIND="%{$fg[cyan]%}BNUM%{$reset_color%}"
GIT_PROMPT_MERGING="%{$fg_bold[magenta]%}⚡︎%{$reset_color%}"
GIT_PROMPT_UNTRACKED="%{$fg_bold[red]%}●%{$reset_color%}"
GIT_PROMPT_MODIFIED="%{$fg_bold[yellow]%}●%{$reset_color%}"
GIT_PROMPT_STAGED="%{$fg_bold[green]%}●%{$reset_color%}"

# Show Git branch/tag, or name-rev if on detached head
parse_git_branch() {
  (git symbolic-ref -q HEAD || git name-rev --name-only --no-undefined --always HEAD) 2> /dev/null
}

# Show different symbols as appropriate for various Git repository states
parse_git_state() {

  # Compose this value via multiple conditional appends.
  local GIT_STATE=""

  local NUM_AHEAD="$(git log --oneline @{u}.. 2> /dev/null | wc -l | tr -d ' ')"
  if [ "$NUM_AHEAD" -gt 0 ]; then
    GIT_STATE=$GIT_STATE${GIT_PROMPT_AHEAD//NUM/$NUM_AHEAD}
  fi

  local NUM_BEHIND="$(git log --oneline ..@{u} 2> /dev/null | wc -l | tr -d ' ')"
  if [ "$NUM_BEHIND" -gt 0 ]; then
    GIT_STATE=$GIT_STATE${GIT_PROMPT_BEHIND//NUM/$NUM_BEHIND}
  fi

  local GIT_DIR="$(git rev-parse --git-dir 2> /dev/null)"
  if [ -n $GIT_DIR ] && test -r $GIT_DIR/MERGE_HEAD; then
    GIT_STATE=$GIT_STATE$GIT_PROMPT_MERGING
  fi

  if [[ -n $(git ls-files --other --exclude-standard 2> /dev/null) ]]; then
    GIT_STATE=$GIT_STATE$GIT_PROMPT_UNTRACKED
  fi

  if ! git diff --quiet 2> /dev/null; then
    GIT_STATE=$GIT_STATE$GIT_PROMPT_MODIFIED
  fi

  if ! git diff --cached --quiet 2> /dev/null; then
    GIT_STATE=$GIT_STATE$GIT_PROMPT_STAGED
  fi

  if [[ -n $GIT_STATE ]]; then
    echo "$GIT_PROMPT_PREFIX$GIT_STATE$GIT_PROMPT_SUFFIX"
  fi

}

# If inside a Git repository, print its branch and state
git_prompt_string() {
  local git_where="$(parse_git_branch)"
  [ -n "$git_where" ] && echo "$GIT_PROMPT_SYMBOL$(parse_git_state)$GIT_PROMPT_PREFIX%{$fg[yellow]%}${git_where#(refs/heads/|tags/)}$GIT_PROMPT_SUFFIX"
}

# Set the right-hand prompt
RPS1='$(git_prompt_string)'
                  

                                
