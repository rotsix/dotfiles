#!/bin/bash

actual="$(cat /sys/class/power_supply/BAT0/capacity)"

if [ "$actual" -eq "100" -a "$(cat /sys/class/power_supply/BAT0/status)" = "Charging" ]
then
	notify-send --urgency=critical 'Batterie pleine' 'Retirez le chargeur'
fi

if [ "$actual" -le "15" -a "$(cat /sys/class/power_supply/BAT0/status)" = "Discharging" ]
then
	notify-send --urgency=critical 'Batterie faible !' 'Branchez le chargeur'
fi

