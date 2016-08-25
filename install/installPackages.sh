#!/usr/bin/env bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

echo -e "\n\nInstalling all packages! Please be patient"
echo "=============================="
for x in $(cat $DIR/pacmanPackageList.txt); do
  if grep -Fxq "$x" $DIR/yaourtPackageList.txt
  then
    echo -e "\n\nNot installing $x it will be installed by yaourt!" 
  else
    echo -e "\n\nInstalling $x..."
    sudo pacman --noconfirm -S $x;
  fi
done

