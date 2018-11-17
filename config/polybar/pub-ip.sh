#! /bin/bash

if [ $(ps aux | grep openvpn | wc -l) -gt 1 ]; then
    echo "%{F$COLOR_BASE0E}%{F-} VPN Connected"
else
    echo "%{F$COLOR_BASE0B}  %{F-}%{u$COLOR_BASE0B}UNSECURE NO VPN%{-u}"
fi
