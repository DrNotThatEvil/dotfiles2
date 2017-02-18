#!/usr/bin/env bash

DOTFILES=$HOME/.dotfiles

echo -e "\nCreating symlinks"
echo "=============================="
linkables=$( find -H "$DOTFILES" -maxdepth 2 -name '*.symlink' )
for file in $linkables ; do
    target="$HOME/.$( basename $file '.symlink' )"
    if [ -e $target ]; then
        echo "~${target#$HOME} already exists... Skipping."
    else
        echo "Creating symlink for $file"
        ln -s $file $target
    fi
done

echo "=============================="
echo -e "\nLinking .i3 folder"
target="$HOME/.i3"
if [ -e $target ]; then
    echo "~${target#$HOME} already exists.... skipping"
else 
    echo "Creating symlink for .i3 folder"
    ln -s "$DOTFILES/i3" $target
fi

if [ ! -d $HOME/.i3-logs ]; then
    echo "Creating ~/.i3-logs"
    mkdir -p $HOME/.i3-logs
fi

echo "=============================="
if [ ! -d $HOME/.config ]; then
    echo "Creating ~/.config"
    mkdir -p $HOME/.config
fi
# configs=$( find -path "$DOTFILES/config.symlink" -maxdepth 1 )
for config in $DOTFILES/config/*; do
    target=$HOME/.config/$( basename $config )
    if [ -e $target ]; then
        echo "~${target#$HOME} already exists... Skipping."
    else
        echo "Creating symlink for $config"
        ln -s $config $target
    fi
done

echo "=============================="
if [ ! -d $HOME/.local/share ]; then
    echo "Creating ~/.local/share"
    mkdir -p $HOME/.local/share
fi
# configs=$( find -path "$DOTFILES/config.symlink" -maxdepth 1 )
for config in $DOTFILES/local/share/*; do
    target=$HOME/.local/share/$( basename $config )
    if [ -e $target ]; then
        echo "~${target#$HOME} already exists... Skipping."
    else
        echo "Creating symlink for $config"
        ln -s $config $target
    fi
done 

echo -e "\n\nCreating vim symlinks"
echo "=============================="

typeset -A vimfiles
vimfiles[~/.vim]=$DOTFILES/config/nvim
vimfiles[~/.vimrc]=$DOTFILES/config/nvim/init.vim

for file in "${!vimfiles[@]}"; do
    if [ -e ${file} ]; then
        echo "${file} already exists... skipping"
    else
        echo "Creating symlink for $file"
        ln -s ${vimfiles[$file]} $file
    fi
done
