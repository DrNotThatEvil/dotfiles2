#!/bin/bash
sudo ip link add virbr10-dummy address 52:54:00:f4:e9:26 type dummy
sudo brctl addbr virbr10
sudo brctl stp virbr10 on
sudo brctl addif virbr10 virbr10-dummy
sudo ip address add 192.168.100.1/24 dev virbr10 broadcast 192.168.100.255
virsh -c qemu:///system start win10
