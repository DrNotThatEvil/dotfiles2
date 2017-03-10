#!/usr/bin/env bash

echo -e "\n\nSetting up Keyring stuff..."
echo "=============================="
sudo su -c "echo \"session   optional    pam_gnome_keyring.so    auto_start\" >> /etc/pam.d/login"
sudo su -c "echo \"auth      optional    pam_gnome_keyring.so\" >> /etc/pam.d/login"
sudo su -c "echo \"password  optional  pam_gnome_keyring.so\" >> /etc/pam.d/passwd"
echo "Keyring added to pam.d..."
