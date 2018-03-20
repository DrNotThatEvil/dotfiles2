#!/bin/bash
if [ "$#" -ne 1 ]; then 
    echo "You must enter exactly 1 argument"
    exit
fi

killall -q polybar

if [ "$1" == "on" ]; then
    xrandr --output HDMI-0 --mode 2560x1440 --left-of DVI-D-0
    sleep 3
    MONITOR="HDMI-8" BAR_RIGHT="mocp pkg vpncheck date" polybar main_bar &
    MONITOR="DVI-D-0" BAR_RIGHT="mocp pkg vpncheck date" polybar main_bar &
    i3-msg reload
    i3-msg reload
    exit
fi

if [ "$1" == "off" ]; then
    xrandr --output HDMI-0 --off
    sleep 3
    i3-msg reload
    i3-msg reload
    MONITOR="DVI-D-0" BAR_RIGHT="mocp pkg vpncheck date" polybar main_bar &
    exit
fi
