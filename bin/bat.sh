#!/bin/bash

while true; do

	actual="$(cat /sys/class/power_supply/BAT0/capacity)"

	if [ "$actual" -eq "100" ] && [ "$(cat /sys/class/power_supply/BAT0/status)" = "Charging" ]
	then
		popup -t 5 -g 158x40+100+100 -F "#FFF" -B "#060" -f "Roboto 13" -p "%{c}" "Batterie pleine"
	fi

	if [ "$actual" -le "15" ] && [ "$(cat /sys/class/power_supply/BAT0/status)" = "Discharging" ]
	then
		popup -t 5 -g 158x40+100+100 -F "#FFF" -B "#F11" -f "Roboto 13" -p "%{c}" "Low battery: $actual%"
	fi

	sleep 2m

done
