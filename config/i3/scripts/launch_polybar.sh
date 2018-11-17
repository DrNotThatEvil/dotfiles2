#!/usr/bin/env sh


# Wait until the processes have been shut down
if pgrep -u $UID -x polybar > /dev/null; then
    # Terminate already running bar instances
    killall -q polybar
    while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done
fi

if [ -z "$MAINDISABLE" ]; then
  if [ ! -z "$LAPTOP" ]; then
    echo "LAPTOP DETECTED"
    MONITOR="eDP1" BAR_RIGHT="vpncheck pkg battery date clock" polybar -r toolbar &
    MONITOR="eDP1" BAR_RIGHT="vpncheck pkg battery date" polybar -r bottombar &
  else
    # Launch bar1 and bar2
    MONITOR="HDMI-0" BAR_RIGHT="vpncheck pkg date clock" polybar -r toolbar &
    MONITOR="HDMI-0" BAR_RIGHT="vpncheck pkg date clock" polybar -r bottombar &
    #MONITOR="DP-4.1" BAR_RIGHT="mocp pkg vpncheck date" polybar main_bar &
    MONITOR="DVI-D-0" BAR_RIGHT="vpncheck pkg date clock" polybar -r toolbar &
    MONITOR="DVI-D-0" BAR_RIGHT="vpncheck pkg date clock" polybar -r bottombar &
  fi
else
    MONITOR="DVI-D-0" BAR_RIGHT="vpncheck pkg date clock" polybar -r toolbar &
    MONITOR="DVI-D-0" BAR_RIGHT="vpncheck pkg date clock" polybar -r bottombar &
fi

echo "Bars launched..."
