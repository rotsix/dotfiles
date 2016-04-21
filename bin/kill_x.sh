#!/bin/bash

zenity --question --text="Etes vous sûr de vouloir quitter i3 ?"
if [ $? = 0 ]; then
	#kill $(pidof Xorg)
    i3-msg exit
else
	exit
fi
