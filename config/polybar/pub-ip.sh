#! /bin/bash

if [ $(ps aux | grep openvpn | wc -l) -gt 1 ]; then
    echo "%{F${xrdb:color2:#222}}  VPN Connected %{F-}"
else
    echo "%{F${xrdb:color1:#222}}  UNSECURE NO VPN %{F-}"
fi
