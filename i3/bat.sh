#!/bin/bash

bat_n="$(cat /sys/class/power_supply/BAT0/energy_now)"
bat_f="$(cat /sys/class/power_supply/BAT0/energy_full)"

#let "percent=$bat_n/$bat_f*100"

percent=$(echo "$bat_n/$bat_f*100" | bc -l | cut -d"." -f1)

if [ $percent -eq "100" ]
then
	notify-send --urgency=critical 'Batterie pleine' 'Retirez le chargeur'
fi

if [ $percent -le "15" ]
then
	notify-send --urgency=critical 'Batterie faible !' 'Branchez le chargeur'
fi

