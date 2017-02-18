#!/usr/bin/env bash

echo "======================="
echo -e "\nInstalling laptop specific 
packages"
echo "======================="
echo -e "\nInstalling open source gpu 
driver... Nouveau"
sudo pacman --noconfirm -S xf86-video-nouveau mesa-libgl lib32-mesa-libgl

echo "======================="
echo -e "\nInstalling xorg server"
sudo pamcan --noconfirm -S xorg-server xorg-server-utils xorg-xinit

echo "======================="
echo -e "\nInstalling toch pad drivers"
sudo pacman --noconfirm -S xf86-input-synaptics

echo "======================="
echo -e "\nInstalling network manager"
sudo pacman --noconfirm -S networkmanager
sudo pacman --noconfirm -S network-manager-applet
