#!/bin/bash
pac=$(checkupdates | wc -l 2> /dev/null)
aur=$(cower -u | wc -l 2> /dev/null)

check=$((pac + aur))
if [[ "$check" != "0" ]]
then
    echo "$pac %{F#5b5b5b}%{F-} $aur"
fi
