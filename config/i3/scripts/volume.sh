#!/bin/sh

pavu_status=$(pulseaudio-ctl full-status)
pavu_status=($pavu_status)

volume=${pavu_status[0]}
muted=${pavu_status[1]}
micmuted=${pavu_status[2]}

micstr=''
if [ "$micmuted" == "yes" ] ; then
  micstr=''
fi

if [ "$muted" == "yes" ] ; then
  echo "${micstr}  <span foreground='#Cd3f45'>Muted</span>"
  echo "${micstr}  <span foreground='#Cd3f45'>Muted</span>"
else
  echo "${micstr}  ${volume}"
  echo "${micstr}  ${volume}"
fi
