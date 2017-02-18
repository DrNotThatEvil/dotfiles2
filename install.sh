#!/usr/bin/env bash

# git submodule update --init --recursive

source ./install/link.sh
source ./install/installZsh.sh
source ./install/installPackages.sh 
source ./install/installYaourtPackages.sh
source ./install/installFonts.sh

mkdir $HOME/.i3-logs
