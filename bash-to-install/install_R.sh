#!/bin/bash

# defines ubuntu codename for CRAN repo 
# see: https://cloud.r-project.org/bin/linux/ubuntu/
# see: https://www.linuxmint.com/download_all.php

this_codename=$1

echo "  - Installing R"

# new ver (2022-05-18) - 
# https://cloud.r-project.org/bin/linux/ubuntu/#install-r
##  Jammy Jellyfish (22.04, amd64 only)
##  Impish Indri (21.10, amd64 only),
##  Focal Fossa (20.04; LTS and amd64 only),
##  Bionic Beaver (18.04; LTS), and
##  Xenial Xerus (16.04; LTS).

# update indices
sudo apt update -qq
# install two helper packages we need
sudo apt install --no-install-recommends software-properties-common dirmngr -y

# add the signing key (by Michael Rutter) for these repos
# To verify key, run gpg --show-keys /etc/apt/trusted.gpg.d/cran_ubuntu_key.asc 
# Fingerprint: 298A3A825C0D65DFD57CBB651716619E084DAB9
wget -qO- https://cloud.r-project.org/bin/linux/ubuntu/marutter_pubkey.asc | sudo tee -a /etc/apt/trusted.gpg.d/cran_ubuntu_key.asc

# add the R 4.0 repo from CRAN -- adjust 'focal' to 'groovy' or 'bionic' as needed
sudo add-apt-repository "deb https://cloud.r-project.org/bin/linux/ubuntu $this_codename-cran40/"

sudo apt update

sudo apt install --no-install-recommends r-base r-base-dev -y 
