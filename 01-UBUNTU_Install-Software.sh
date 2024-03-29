#!/usr/bin/env bash

# Bash Script for installing work software in Linux Mint and Ubuntu

## updating repos and upgrading
sudo apt update 
sudo apt upgrade -y
sudo apt dist-upgrade -y

# install external software using bash (see folder bash-to-install/)
echo " "
echo "Installing by bash scripts"
./bash-to-install/install_Google-Chrome.sh

# install by apt
for apt_software in $(cat apt-to-install/list_to_install.txt)
do
	./apt-to-install/install_by_apt.sh "$apt_software" -y
done

# Install all snaps
echo " "
echo "Installing by snap"

# remove snap lock from linux mint
# see this post https://winaero.com/enable-or-disable-snap-in-linux-mint-20/
lock_file="/etc/apt/preferences.d/nosnap.pref"

if [ -a "$lock_file" ]
  then
       sudo rm "$lock_file"
fi

echo "  - Installing snap by apt"
sudo apt install snapd -y > /dev/null 2>&1

echo "  - Installing by snap"
for snap_software in $(cat snap-to-install/snaps_to_install.txt)
do
  echo "    - $snap_software"
	sudo snap install "$snap_software" --classic > /dev/null 2>&1
done

## Make sure to update and clean
echo " "
echo "-> Updating, upgrading and cleaning <-"
sudo apt update > /dev/null 2>&1
sudo apt upgrade -y > /dev/null 2>&1
sudo apt autoclean > /dev/null 2>&1
sudo apt autoremove -y > /dev/null 2>&1

echo " "
echo " "
echo "DONE! All required software are installed"