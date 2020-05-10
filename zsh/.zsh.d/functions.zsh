autogit () {
  git add -A && git commit -m "$1" && git push
}

ix () { [ -z "$1" -o -r "$1" ] && curl -F "f:1=<${1:--}" ix.io || printf '$ %s\n\n%s' "$*" "$("$@")" | ix ; }
sprunge () { [ -z "$1" -o -r "$1" ] && curl -F "sprunge=<${1:--}" http://sprunge.us || printf '$ %s\n\n%s' "$*" "$("$@")" | sprunge ; }
imgur () { [ -z "$1" -o -r "$1" ] &&  curl -s -F "image=<${1:--}" -F "key=486690f872c678126a2c09a9e196ce1b" https://imgur.com/api/upload.xml || printf '$ %s\n\n%s' "$*" "$("$@")" | imgur ; }
pbx () { curl -sF "c=@${1:--}" -w "%{redirect_url}" 'https://ptpb.pw/?r=1' -o /dev/stderr | wl-copy }

news () {
  read -r -d '' sed_trt <<EOF
  /<title\|<pubDate\|<rss /!d;
    s/\t*//g;
    /<rss /  {
    s/.*/\t\t\\\\e[31m>> News Archlinux.fr <<\\\\e[0m/
  }
  /<title>/  {
    s,</*title>, - ,g
    s/&#8217;/’/g
    h
    D
  }
  /<pubDate>/ {
    s/^.\{14\}\(.\{11\}\).*$/\\\\e[34m\1\\\\e[0m/
    H
    g
    s/\n//;
  }
EOF
  echo -e "$(curl -s https://archlinux.fr/feed | sed """$sed_trt""")"

}

omx () {
  # use omxplayer to play medias (on RPi)
  regex='^(https?://)?(www\.)?(youtu(be\.(com|([a-z]{2}))|\.be)|nvimeo\.com|twitch\.tv)/[^ ]+$'

  if grep -Ee "${regex}" <<< "$1"; then
    omxplayer -o local `youtube-dl -g -f 22/18/43/36/17 "$@"`
  else
    omxplayer -o local "$@"
  fi
}

open () {
  nohup mimeopen $@ &> /dev/null &
}

mk () {
  mkdir -p "$@" && cd "$@"
}

# vim: ft=zsh:
