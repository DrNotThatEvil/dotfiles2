#!/usr/bin/env bash

source ./install/devices/dv6.sh

source ./install.sh
source ./install/install.sh
source ./install/installZsh.sh
source ./install/installPackages.sh
source ./install/installYaourtPackages.sh
source ./install/installFonts.sh

mkdir $HOME/.i3-logs
