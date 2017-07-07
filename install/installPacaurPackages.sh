#!/usr/bin/env bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
echo -e "\n\nInstalling all pacaur packages! Please be patient"
for x in $(cat $DIR/yaourtPackageList.txt); do
		echo -e "\n\nInstalling $x..."
		pacaur --noconfirm -S $x;
done
