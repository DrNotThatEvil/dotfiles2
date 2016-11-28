#!/bin/sh

if ($(ip link show dev tun0 > /dev/null)) ; then
  echo "<span foreground='#45CD3F'>SAFE</span>"
  echo "<span foreground='#45CD3F'>SAFE</span>"
else
  echo "<span foreground='#Cd3f45'>UNSAFE</span>"
  echo "<span foreground='#Cd3f45'>UNSAFE</span>"
fi
