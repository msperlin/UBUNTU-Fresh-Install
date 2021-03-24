#!/usr/bin/env bash

# Bash Script for installing work software in Linux Mint and Ubuntu

## updating repos and upgrading
sudo apt update 
sudo apt upgrade -y
sudo apt dist-upgrade -y

# add all ppas (see file apt-to-install/ppa_to_add.txt)
for ppa in $(cat apt-to-install/ppa_to_add.txt)
do
  sudo add-apt-repository "$ppa" -y
done

## updating repo again
sudo apt update 
sudo apt upgrade -y

# install by apt
for apt_software in $(cat apt-to-install/list_to_install.txt)
do
	sudo apt install "$apt_software" -y
done


# install external software using bash
./bash-to-install/install_R.sh
./bash-to-install/install_Rstudio.sh
./bash-to-install/configure_Rstudio.sh
./bash-to-install/install_Google-Chrome.sh

# remove snap lock from linux mint
# see this post https://winaero.com/enable-or-disable-snap-in-linux-mint-20/
lock_file="/etc/apt/preferences.d/nosnap.pref"

if [ -a "$lock_file" ]
  then
       sudo rm "$lock_file"
fi

sudo apt install snapd -y

# Install all snaps
for snap_software in $(cat snap-to-install/snaps_to_install.txt)
do
	sudo snap install "$snap_software" --classic
done

## Make sure to update and clean
sudo apt update
sudo apt upgrade -y
sudo apt autoclean
sudo apt autoremove -y

echo ""
echo "DONE! All softwares are installed"