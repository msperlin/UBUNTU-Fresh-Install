#!/bin/bash

echo "  - Installing R"

. /etc/os-release

MY_UBUNTU_VER="$UBUNTU_CODENAME"

# maybe conditional on cran40? ..
DEB_R="deb https://cloud.r-project.org/bin/linux/ubuntu $MY_UBUNTU_VER-cran40/"

# Install R and RStudio
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys E298A3A825C0D65DFD57CBB651716619E084DAB9 > /dev/null 2>&1
sudo add-apt-repository "$DEB_R" > /dev/null 2>&1
sudo apt update > /dev/null 2>&1
sudo apt upgrade > /dev/null 2>&1
sudo apt-get install r-base r-base-dev -y > /dev/null 2>&1
