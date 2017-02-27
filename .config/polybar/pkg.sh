#!/bin/bash
pac=$(checkupdates | wc -l 2> /dev/null)
aur=$(cower -u | wc -l 2> /dev/null)

check=$((pac + aur))
if [[ "$check" != "0" ]]
then
    echo -n "$pac %{F#5b5b5b}%{F-} $aur"
else
    echo -n ""
fi
