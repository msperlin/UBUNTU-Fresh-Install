#!/usr/bin/env bash
ubuntu_codename="jammy" # or jammy for ubuntu 22.04

echo "Installing by bash scripts"
./bash-to-install/install_R.sh $ubuntu_codename
./bash-to-install/install_Rstudio.sh
./bash-to-install/configure_Rstudio.sh

echo "R and RStudio installed and configured"