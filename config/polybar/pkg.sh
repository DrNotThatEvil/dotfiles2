#!/bin/bash
pac=$(checkupdates 2> /dev/null | wc -l)
aur=$(trizen -Su --aur --quiet | awk  '{print NR ". " substr($2, 1, length($2) - 1) " " $3 " -> " $5}' | wc -l)

bg=""
if [ $pac -eq 0 ]; then
    pac="%{u$COLOR_BASE0E} $pac %{-u}"	
else
  if [ $pac -gt 5 ]; then
    pac="%{u$COLOR_BASE0B} $pac %{-u}"	
  fi

  bg="%{B$COLOR_BASE02}"
fi

if [ $aur -eq 0 ]; then 
  aur="%{u$COLOR_BASE0E} $aur %{-u}"	
else
  if [ "$aur" -gt 5 ]; then
    aur="%{u$COLOR_BASE09} $aur %{-u}"	
  fi
fi

echo "$bg$pac %{F$COLOR_BASE0E}%{F-} $aur%{B-}"
