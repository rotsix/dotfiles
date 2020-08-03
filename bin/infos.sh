#!/bin/bash

current="$(mpc current 2> /dev/null)"

notify-send "$(date '+%B %d %Y - %R')" "Battery:$(acpi -V | head -n 1 | cut -d ',' -f 2)\\n$current" --icon=dialog-information
