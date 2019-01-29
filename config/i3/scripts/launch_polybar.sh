#!/usr/bin/env sh

# Wait until the processes have been shut down
# while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done (NOTE: What da fuck?)

colors=($(xrdb -query parmater expression get index| sed -n 's/.*color\([0-9]\)/\1/p' | sort -nu | cut -f2))

source $HOME/.dotfiles/theming/env_vars.sh
if pgrep -u $UID -x polybar > /dev/null; then
    # Terminate already running bar instances
    killall -q polybar
    while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done
fi

if [ -z "$MAINDISABLE" ]; then
  if [ ! -z "$LAPTOP" ]; then
    echo "LAPTOP DETECTED"
    MONITOR="eDP1" BAR_RIGHT="vpncheck pkg battery date clock" polybar -r toolbar 2>/dev/null 1>&2 &
    MONITOR="eDP1" BAR_RIGHT="vpncheck pkg battery date" polybar -r bottombar 2>/dev/null 1>&2 &
  else
    # Launch bar1 and bar2
    MONITOR="HDMI-0" BAR_RIGHT="vpncheck pkg date clock" polybar -r toolbar 2>/dev/null 1>&2 &
    MONITOR="HDMI-0" BAR_RIGHT="vpncheck pkg date clock" polybar -r bottombar 2>/dev/null 1>&2 &
    #MONITOR="DP-4.1" BAR_RIGHT="mocp pkg vpncheck date" polybar main_bar &
    MONITOR="DVI-D-0" BAR_RIGHT="vpncheck pkg date clock" polybar -r toolbar 2>/dev/null 1>&2 &
    MONITOR="DVI-D-0" BAR_RIGHT="vpncheck pkg date clock" polybar -r bottombar 2>/dev/null 1>&2 &
  fi
else
    MONITOR="DVI-D-0" BAR_RIGHT="vpncheck pkg date clock" polybar -r toolbar 2>/dev/null 1>&2 &
    MONITOR="DVI-D-0" BAR_RIGHT="vpncheck pkg date clock" polybar -r bottombar 2>/dev/null 1>&2 &
fi

echo "Bars launched..."
