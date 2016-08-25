#!/usr/bin/env bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
FONTS_DIR="$DIR/../fonts"
INSTALL_DIR="$HOME/.local/share/fonts"

echo -e "\n\nInstalling your fonts!"

cp -v $FONTS_DIR/Font-Awesome/fonts/*.ttf $INSTALL_DIR/.
echo -e "\n\nFont Awesome installed"

cp -v $FONTS_DIR/YosemiteSanFranciscoFont/*.ttf $INSTALL_DIR/.
echo -e "\n\nYosemite San-Francisco Font installed"

echo -e "\n\nInstalling powerline fonts..."
source "$FONTS_DIR/fonts/install.sh"

