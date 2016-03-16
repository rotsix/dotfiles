#!/bin/bash

zenity --question --text="Etes vous sûr de vouloir quitter i3 ?"
if [ $? = 0 ]; then
	kill $(pidof Xorg)
else
	exit
fi
