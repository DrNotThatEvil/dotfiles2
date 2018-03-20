#!/usr/bin/env sh

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

MONITOR="HDMI-0" BAR_RIGHT="mocp pkg vpncheck date" polybar main_bar &
MONITOR="DVI-D-0" BAR_RIGHT="mocp pkg vpncheck date" polybar main_bar &

echo "Bars launched..."
