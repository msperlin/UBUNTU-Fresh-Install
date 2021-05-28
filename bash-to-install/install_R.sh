#!/bin/bash

echo "  - Installing R"

# new ver

# update indices
sudo apt update -qq
# install two helper packages we need
sudo apt install --no-install-recommends software-properties-common dirmngr
# import the signing key (by Michael Rutter) for these repo
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys E298A3A825C0D65DFD57CBB651716619E084DAB9
# add the R 4.0 repo from CRAN -- adjust 'focal' to 'groovy' or 'bionic' as needed
sudo add-apt-repository "deb https://cloud.r-project.org/bin/linux/ubuntu $(lsb_release -cs)-cran40/"

sudo apt install --no-install-recommends r-base r-base-dev

# old er
#. /etc/os-release

#MY_UBUNTU_VER="$UBUNTU_CODENAME"

# maybe conditional on cran40? ..
#DEB_R="deb https://cloud.r-project.org/bin/linux/ubuntu $MY_UBUNTU_VER-cran40/"

# Install R and RStudio
#sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys E298A3A825C0D65DFD57CBB651716619E084DAB9 > /dev/null 2>&1
#sudo add-apt-repository "$DEB_R" > /dev/null 2>&1
#sudo apt update > /dev/null 2>&1
#sudo apt upgrade > /dev/null 2>&1
#sudo apt-get install r-base r-base-dev -y > /dev/null 2>&1
