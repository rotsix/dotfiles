#!/bin/bash

actual="$(cat /sys/class/power_supply/BAT0/capacity)"

if [ "$actual" -eq "100" ] && [ "$(cat /sys/class/power_supply/BAT0/status)" = "Charging" ]
then
	notify-send --urgency=critical 'Batterie pleine' 'Retirez le chargeur' -t 5000
fi

if [ "$actual" -le "15" ] && [ "$(cat /sys/class/power_supply/BAT0/status)" = "Discharging" ]
then
	notify-send --urgency=critical "Batterie faible ! $actual%" 'Branchez le chargeur' -t 5000
fi

