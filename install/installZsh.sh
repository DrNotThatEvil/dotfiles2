#!/usr/bin/env bash

echo "=============================="
echo -e "Installing zprezto"
target=$HOME/.zprezto
if [ -e $target ]; then
    git clone --recursive git@github.com:DrNotThatEvil/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"
else
    echo -e "\n.zprezto already installed."
fi
