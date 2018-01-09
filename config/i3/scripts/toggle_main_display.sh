#!/bin/bash
if [ "$#" -ne 1 ]; then 
    echo "You must enter exactly 1 argument"
    exit
fi

if [ "$1" == "on" ]; then
    xrandr --output DP-4.8 --mode 2560x1440 --left-of DP-1
    killall -q polybar
    MONITOR="DP-1" BAR_RIGHT="mocp pkg vpncheck date" polybar main_bar &
    MONITOR="DP-4.8" BAR_RIGHT="mocp pkg vpncheck date" polybar main_bar &
    exit
fi

if [ "$1" == "off" ]; then
    xrandr --output DP-4.8 --off
    killall -q polybar
    MONITOR="DP-1" BAR_RIGHT="mocp pkg vpncheck date" polybar main_bar &
    exit
fi
