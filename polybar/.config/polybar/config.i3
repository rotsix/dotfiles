;=====================================================
;
;   To learn more about how to configure Polybar
;   go to https://github.com/jaagr/polybar
;
;   The README contains alot of information
;
;=====================================================

[colors]
background = #15191B
foreground = #a6a6a6
red = #CB2B16
green = #859900
yellow = #B58900
blue = #268BD2
gray = #787878
magenta = #D33682
cyan = #2AA198
selected = #FFFFFF
unselected = ${colors.foreground}

[global/wm]
margin-top = 3
margin-bottom = 3

[bar/top]
width = 100%
height = 27
offset-x = 0
offset-y = 0

background = ${colors.background}
foreground = ${colors.foreground}

overline-size = 0
underline-size = 0
border-bottom-size = 0

spacing = 0
padding-left = 0
padding-right = 0
module-margin-left = 2
module-margin-right = 2

font-0 = Iosevka Term:pixelsize=10;2
font-1 = FontAwesome:pixelsize=10;1

modules-left = i3 xwindow
modules-center = 
modules-right = mpd github weather pkg wifi battery date

tray-position = right
tray-padding = 1
tray-maxsize = 16
tray-scale = 1

[module/menu]
type = custom/menu

label-open = " Menu"
label-close = " X"
label-separator = " | "

menu-0-0 = Multimedia
menu-0-0-exec = menu-open-1
menu-0-1 = System
menu-0-1-exec = menu-open-2

menu-1-0 = Firefox
menu-1-0-exec = firefox &
menu-1-1 = LibreOffice
menu-1-1-exec = libreoffice &

menu-2-0 = Disconnect
menu-2-0-exec = i3-msg exit
menu-2-1 = Reboot
menu-2-1-exec = reboot
menu-2-2 = Shutdown
menu-2-2-exec = poweroff

[module/wifi]
type = internal/network
; BEGIN lili
interface = wlp4s0
; END lili
; BEGIN fry
;interface = wlp2s0
; END fry

interval = 3
format-connected = <ramp-signal> <label-connected>
label-connected = %essid%
ramp-signal-0 = 

[module/battery]
type = internal/battery
; if battery never reachs 100%
full-at = 99
poll-interval = 5

time-format = %H:%M
format-charging = <animation-charging> <label-charging>
format-discharging = <ramp-capacity> <label-discharging>

label-charging = %percentage%%
label-discharging = %percentage%% (%time%)
label-full = full
label-full-foreground = ${colors.green}

; Only applies if <ramp-capacity> is used
ramp-capacity-0 = 
ramp-capacity-0-foreground = ${colors.red}
ramp-capacity-1 = 
ramp-capacity-2 = 
ramp-capacity-3 = 
ramp-capacity-4 = 

; Only applies if <bar-capacity> is used
bar-capacity-width = 10

; Only applies if <animation-charging> is used
animation-charging-0 = 
animation-charging-1 = 
animation-charging-2 = 
animation-charging-3 = 
animation-charging-4 = 
; Framerate in milliseconds
animation-charging-framerate = 500

[module/pkg]
type = custom/script
interval = 60
format = <label>
label = "%output:0:30%"
exec = ~/.config/polybar/pkg.sh
exec-if = "ping -q -w 2 -c 1 176.34.135.167 > /dev/null"

[module/mpd]
type = internal/mpd

host = localhost
port = 6600

format-online = <icon-prev> <icon-seekb> <icon-stop> <toggle> <icon-seekf> <icon-next> <icon-repeat> <icon-random> | <label-song> <bar-progress>
format-online-foreground = ${colors.foreground}
format-online-padding = 2

format-offline =

icon-play = 
icon-pause =  
icon-stop = 
icon-prev = 
icon-next = 
icon-seekb = 
icon-seekf = 
icon-random = 
icon-repeat = 

toggle-on-foreground = ${colors.red}
toggle-off-foreground = ${colors.foreground}

bar-progress-width = 10
bar-progress-indicator = |
bar-progress-fill = ─
bar-progress-fill-foreground = ${colors.blue}
bar-progress-empty = ─
bar-progress-empty-foreground = ${colors.gray}

[module/github]
type = internal/github
; set your own home !
token = ${file:/home/victor/.github/notifications.token}

label = "%notifications%"
format-prefix = " "

[module/xwindow]
type = internal/xwindow
label = "%{F#5b5b5b}%{F-} %title:0:40:…%"

[module/i3]
type = internal/i3
format = <label-state> <label-mode>
index-sort = true
wrapping-scroll = false

strip-wsnumbers = true
pin-workspaces = true

;label-mode = %mode%
label-mode-padding = 5
label-mode-foreground = ${colors.red}

; focused
label-focused-foreground = ${colors.selected}
label-focused-padding = 1

; occuped
label-unfocused-foreground = ${colors.unselected}
label-unfocused-padding = 1

; urgent
label-urgent-background = ${colors.red}
label-urgent-padding = 1

; empty
label-visible-foreground = ${colors.unselected}
label-visible-padding = 1

[module/date]
type = internal/date
date-alt = %d.%m.%Y
date = %A, %d %B %Y 
time-alt = %H:%M
time = %H:%M:%S
format-foreground = ${colors.foreground}
format-padding = 2
label = %time%   %date%

[module/volume]
type = internal/volume

format-volume = <label-volume> <bar-volume>
label-volume = 
label-volume-foreground = ${colors.foreground}

format-muted-prefix =
format-muted-foreground = ${colors.foreground}
label-muted = mute

bar-volume-width = 10
bar-volume-foreground-0 = #55aa55
bar-volume-foreground-1 = #55aa55
bar-volume-foreground-2 = #55aa55
bar-volume-foreground-3 = #55aa55
bar-volume-foreground-4 = #55aa55
bar-volume-foreground-5 = #f5a70a
bar-volume-foreground-6 = #ff5555
bar-volume-gradient = false
bar-volume-indicator = │
bar-volume-indicator-font = 2
bar-volume-indicator-foreground = #fff
bar-volume-fill = ─
bar-volume-fill-font = 2
bar-volume-empty = ─
bar-volume-empty-font = 2
bar-volume-empty-foreground = ${colors.foreground}

[module/weather]
type = custom/script
interval = 600
format = <label>
format-prefix = " "
exec = ~/.config/polybar/weather
exec-if = "ping -q -w 2 -c 1 138.201.197.100 > /dev/null"

; vim:ft=dosini
