#!/usr/bin/env sh

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

if [ -z "$MAINDISABLE" ]; then
  # Launch bar1 and bar2
  MONITOR="DP-4.8" BAR_RIGHT="mocp pkg vpncheck date" polybar main_bar &
  #MONITOR="DP-4.1" BAR_RIGHT="mocp pkg vpncheck date" polybar main_bar &
  MONITOR="DP-1" BAR_RIGHT="mocp pkg vpncheck date" polybar main_bar &
else
  MONITOR="DP-1" BAR_RIGHT="mocp pkg vpncheck date" polybar main_bar &
fi

echo "Bars launched..."
