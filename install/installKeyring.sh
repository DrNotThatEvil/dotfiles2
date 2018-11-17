#!/usr/bin/env bash

echo -e "\n\nSetting up Keyring stuff..."
echo "=============================="

if ! sudo su -c "grep -q 'Installed by install script' /etc/pam.d/login"; then
    sudo su -c "echo -e \"\n\" >> /etc/pam.d/login"
    sudo su -c "echo \"# Installed by install script\" >> /etc/pam.d/login"
    sudo su -c "echo \"session   optional    pam_gnome_keyring.so    auto_start\" >> /etc/pam.d/login"
    sudo su -c "echo \"auth      optional    pam_gnome_keyring.so\" >> /etc/pam.d/login"
    echo "Keyring added to pam.d/login file."
else
    echo "Keyring already added to pam.d/login file."
fi

if ! sudo su -c "grep -q 'Installed by install script' /etc/pam.d/passwd"; then
    sudo su -c "echo -e \"\n\" >> /etc/pam.d/passwd"
    sudo su -c "echo \"# Installed by install script\" >> /etc/pam.d/passwd"
    sudo su -c "echo \"password  optional  pam_gnome_keyring.so\" >> /etc/pam.d/passwd"
    echo "Keyring added to pam.d/passwd file."
else
    echo "Keyring already added to pam.d/passwd file."
fi
