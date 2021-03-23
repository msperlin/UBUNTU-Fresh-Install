#!/bin/bash

. /etc/os-release

MY_UBUNTU_VER="$UBUNTU_CODENAME"

# maybe conditional on cran40? ..
DEB_R="deb https://cloud.r-project.org/bin/linux/ubuntu $MY_UBUNTU_VER-cran40/"

# Install R and RStudio
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys E298A3A825C0D65DFD57CBB651716619E084DAB9
sudo add-apt-repository "$DEB_R"
sudo apt update
sudo apt upgrade
sudo apt-get install r-base r-base-dev -y
