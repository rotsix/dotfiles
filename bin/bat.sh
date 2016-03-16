#!/bin/bash

actual="$(cat /sys/class/power_supply/BAT0/capacity)"

if [ $actual -eq "100" ] #  &&  cat /sys/class/power_supply/BAT0/status -eq "Charging" ]
then
	notify-send --urgency=critical 'Batterie pleine' 'Retirez le chargeur'
fi

if [ $actual -le "15" ] # &&  cat /sys/class/power_supply/BAT0/status -eq "Discharging" ]
then
	notify-send --urgency=critical 'Batterie faible !' 'Branchez le chargeur'
fi

