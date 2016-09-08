#!/bin/zsh

if [ -d /etc/X11/xinit/xinitrc.d ]; then
  for f in /etc/X11/xinit/xinitrc.d/*; do
    [ -x "$f" ] && . "$f"
  done
  unset f
fi

xset +fp /usr/share/fonts/local
xset +fp /usr/share/fonts/TTF
xset +fp ~/.local/share/fonts
xset fp rehash


[[ -f ~/.Xdefaults ]] && xrdb -merge ~/.Xdefaults


# no pad while writing
syndaemon -i 0.3 -d

#urxvtd -q -o -f

#auto numlock
numlockx &
# hide idle
unclutter -idle 5&

# Wallpaper
hsetroot -fill /home/victor/.wallpaper/lines.png &
# transparency
xcompmgr &
#  locker
#xautolock -time 8 -locker "/home/victor/.lock_screen/lock" -notify 30 -notifier "notify-send 'Screen lock' 'Screen will be locked in 30s' -t 5000" &
xautolock -time 8 -locker "/home/victor/.lock_screen/lock" -notify 30 -notifier "popup -t 5 -g 210x40+1650+20 -B \#888 -F \#000 -p '%{r}' -f 'Roboto-11' 'Screen will be locked in 30s   '" &
#internet
#nm-applet &
#sound
pulseaudio --start


#clipit &

# keybinds
#sxhkd -m 1 &
# battery reminder
bat.sh &

# workspaces initialization
#workspace.sh -i
# bar
#start_lemonbar.sh &

exec bspwm
#exec /home/victor/src/swm/swm

