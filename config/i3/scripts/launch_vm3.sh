#!/bin/bash

#sudo su -c 'echo "0000:0c:00.0" > /sys/bus/pci/devices/0000:0c:00.0/driver/unbind'
#sudo su -c 'echo "0x1106 0x3483" > /sys/bus/pci/drivers/vfio-pci/new_id'
#sudo su -c 'echo 1 > /sys/bus/pci/devices/0000:0c:00.0/reset'

#sudo virsh nodedev-detach pci_0000_0c_00_0

tmp=$(sudo virsh list --all | grep " win10 " | awk '{ print $3}')

if ([ "x$tmp" == "x" ] || [ "x$tmp" != "xrunning" ]); then
    sudo virsh start win10
fi

sudo ddcutil -d 1 setvcp 60 0x0f
sleep 6
xrandr --output HDMI-0 --off
sleep 3
i3-msg reload

while true; do 
    tmp=$(sudo virsh list --all | grep " win10 " | awk '{ print $3}')
    if ([ "x$tmp" == "x" ] || [ "x$tmp" != "xrunning" ]); then
        echo "VM does not exist or is shut down!"
        echo "Reseting everything back to normal...!"

        sudo ddcutil -d 1 setvcp 60 0x12 sleep 2
        xrandr --output HDMI-0 --mode 2560x1440 --left-of DVI-D-0
        sleep 2
        i3-msg reload
        break
        # Try additional commands here...
    else
        echo "VM is running!"
        sleep 5
    fi
done

killall -q polybar
MONITOR="HDMI-0" BAR_RIGHT="mocp pkg vpncheck date" polybar -r toolbar &
MONITOR="HDMI-0" BAR_RIGHT="mocp pkg vpncheck date" polybar -r bottombar &

MONITOR="DVI-D-0" BAR_RIGHT="mocp pkg vpncheck date" polybar -r toolbar &
MONITOR="DVI-D-0" BAR_RIGHT="mocp pkg vpncheck date" polybar -r bottombar &

#sudo virsh nodedev-reattach pci_0000_0c_00_0
#sudo virsh nodedev-reset pci_0000_0c_00_0
xmodmap -e 'clear Lock'
xmodmap -e 'keycode 0x42=Escape'
#sudo su -c 'echo 1 > /sys/bus/pci/devices/0000:0c:00.0/reset'
