#!/bin/bash
#
# thank you @amirashabani for the base script
# https://github.com/amirashabani/bain

# usage: arch.sh [FILE [FACTOR [BACKGROUND]]]
# default:
#  FILE       dirname $0/arch.png
#  FACTOR     25%
#  BACKGROUND ~/.wallpaper

TMP=/tmp/$$

create_and_set() {
	orig=$1
	perc=$2
	status=$3
	size=$(identify -format "%wx%h" "$orig")

	if [ "$perc" -eq 100 ]; then
	 	color="#FFFFFF"
	elif [ "$status" == "Charging" ]; then
		color="#909090"
	elif [ "$perc" -le 25 ]; then
		color="#BF131C"
	elif [ "$perc" -le 50 ]; then
		color="#BFAA13"
	else
		color="#5BC236"
	fi

	# apply battery percentage
	convert "$orig" -gravity South -crop x"$perc"% -fuzz 50% -fill $color -opaque "#000000" -background transparent -extent "$size" "$TMP"
	# and set it on black background
	convert "$orig" "$TMP" -resize "$factor" -gravity Center -composite -background "#000000" -extent 1920x1080 "$background"

	swaymsg output "*" background "$background" fit
}

find_battery_path() {
	local file
	for file in /sys/class/power_supply/*; do
	    read -r power_supply < "$file"/type
	    if [ "$power_supply" = "Battery" ]; then
			declare -r battery_found=1
			echo "$file"
			break
	    fi
	done

	if [ -z "$battery_found" ]; then
		echo "Couldn't find battery"
		exit 1
	fi
}


# logo to display
file=${1:-$(dirname "$0")/arch.png}
# bigger or smaller?
factor=${2:-25%}
# final background location
background=${3:-$HOME/.wallpaper}
battery_path=$(find_battery_path)

while true
do
	current=$(< "$battery_path"/capacity)
	status=$(< "$battery_path"/status)

	if [[ "$last_changed" != "$current" || "$last_status" != "$status" ]]; then
		create_and_set "$file" "$current" "$status"
		last_changed=$current
		last_status=$status
	fi
	sleep 5
done
