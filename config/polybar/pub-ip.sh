#! /bin/bash

if [ $(ps aux | grep openvpn | wc -l) -gt 1 ]; then
    echo "%{F#0F0}  VPN Connected %{F-}"
else
    echo "%{F#F00}  UNSECURE NO VPN %{F-}"
fi
