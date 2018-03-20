#!/usr/bin/env sh

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

echo $LAPTOP

if [ -z "$MAINDISABLE" ]; then
  if [ ! -z "$LAPTOP" ]; then
    echo "LAPTOP DETECTED"
    MONITOR="eDP1" BAR_RIGHT="mocp pkg vpncheck battery date" polybar main_bar &
  else
    # Launch bar1 and bar2
    MONITOR="HDMI-0" BAR_RIGHT="mocp pkg vpncheck date" polybar main_bar &
    #MONITOR="DP-4.1" BAR_RIGHT="mocp pkg vpncheck date" polybar main_bar &
    MONITOR="DVI-D-0" BAR_RIGHT="mocp pkg vpncheck date" polybar main_bar &
  fi
else
  MONITOR="DVI-D-0" BAR_RIGHT="mocp pkg vpncheck date" polybar main_bar &
fi

echo "Bars launched..."
