#!/bin/bash
pac=$(checkupdates 2> /dev/null | wc -l)
aur=$(trizen -Su --aur --quiet | awk  '{print NR ". " substr($2, 1, length($2) - 1) " " $3 " -> " $5}' | wc -l)

echo "$pac %{F#5b5b5b}%{F-} $aur"
