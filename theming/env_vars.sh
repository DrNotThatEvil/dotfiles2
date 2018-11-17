#!/usr/bin/env bash
xrdb -query 2>/dev/null 1>&2

if [ "$?" -eq 0 ]; then
  colors=($(xrdb -query parmater expression get index| sed -n 's/.*color\([0-9]\)/\1/p' | sort -nu | cut -f2))
  map=(0 8 11 10 13 14 12 5 3 9 1 2 4 6 15 7)
  for ((i = 0; i < ${#colors[@]}; i++)) do
    hex=$(printf "%x" "${map[i+1]}" | tr a-z A-Z)
    var_name=COLOR_BASE0$hex
    export ${var_name}=${colors[$i+1]}
  done
fi
