#!/bin/bash

# defines ubuntu codename for CRAN repo 
# see: https://cloud.r-project.org/bin/linux/ubuntu/
# see: https://www.linuxmint.com/download_all.php

this_codename=$1

echo "  - Installing R"

# new ver (2024-07-31) - 
# https://cloud.r-project.org/bin/linux/ubuntu/#install-r
## Noble Numbat (24.04, amd64 only),
## Jammy Jellyfish (22.04, amd64 only),
## Focal Fossa (20.04; LTS and amd64 only),
## Bionic Beaver (18.04; LTS), and
## Xenial Xerus (16.04; LTS).

# update indices
sudo apt update -qq
# install two helper packages we need
sudo apt install --no-install-recommends software-properties-common dirmngr
# add the signing key (by Michael Rutter) for these repos
# To verify key, run gpg --show-keys /etc/apt/trusted.gpg.d/cran_ubuntu_key.asc 
# Fingerprint: E298A3A825C0D65DFD57CBB651716619E084DAB9
wget -qO- https://cloud.r-project.org/bin/linux/ubuntu/marutter_pubkey.asc | sudo tee -a /etc/apt/trusted.gpg.d/cran_ubuntu_key.asc
# add the R 4.0 repo from CRAN -- adjust 'focal' to 'groovy' or 'bionic' as needed
sudo add-apt-repository "deb https://cloud.r-project.org/bin/linux/ubuntu $(lsb_release -cs)-cran40/"

sudo apt update

sudo apt install --no-install-recommends r-base r-base-dev -y 
