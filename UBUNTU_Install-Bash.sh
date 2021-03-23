#!/usr/bin/env bash

# set some ppas 
PPA_TEXSTUDIO="ppa:sunderme/texstudio"
PPA_OBSTUDIO="ppa:obsproject/obs-studio"

# set some urls for download

## Find rstudio latest ver download
wget -qO- https://rstudio.com/products/rstudio/download/ | grep -Eoi '<a [^>]+>' |  grep -Eo 'href="[^\"]+"' |  grep -Eo '(http|https)://download1.rstudio.org/desktop/bionic/amd64/rstudio-[^/"]+-amd64.deb' > /tmp/link_dl.txt

URL_RSTUDIO=$(head -n 1 /tmp/link_dl.txt)
URL_GOOGLE_CHROME="https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb"
URL_CODE="https://code.visualstudio.com/sha/download?build=stable&os=linux-deb-x64"

DIR_DL="$HOME/Downloads/dl_software"

. /etc/os-release

MY_UBUNTU_VER="$UBUNTU_CODENAME"

DEB_R="deb https://cloud.r-project.org/bin/linux/ubuntu $MY_UBUNTU_VER-cran40/"


## Removing apt locks
sudo rm /var/lib/dpkg/lock-frontend
sudo rm /var/cache/apt/archives/lock

## updating repo
sudo apt update 
sudo apt upgrade -y

# Install R and RStudio
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys E298A3A825C0D65DFD57CBB651716619E084DAB9
sudo add-apt-repository "$DEB_R"
sudo apt update
sudo apt-get install r-base -y #r-cran-dplyr r-cran-rjava r-cran-openssl -y
sudo apt-get install libcurl4-openssl-dev pandoc-* libclang-dev libxml2-dev libv8-dev libgit2-dev -y

# install others by apt
sudo apt install virtualbox libreoffice ffmpeg keepass2 -y
sudo apt install git okular hunspell-pt-br htop -y
sudo apt install default-jdk default-jre libglpk-dev -y

# install some other dependencies by PPA
sudo add-apt-repository "$PPA_OBSTUDIO" -y
sudo apt update
sudo apt install obs-studio -y

sudo apt-add-repository "$PPA_TEXSTUDIO" -y
sudo apt update
sudo apt install texstudio -y

# remove snap lock from linux mint
# see this post https://winaero.com/enable-or-disable-snap-in-linux-mint-20/
lock_file="/etc/apt/preferences.d/nosnap.pref"

if [ -a "$lock_file" ]
  then
       sudo rm "$lock_file"
fi


sudo apt install snapd -y

# Install ms code by snap
sudo snap install code --classic

## update repos
sudo apt update -y

## Download and install external software
mkdir "$DIR_DL"

wget -c "$URL_GOOGLE_CHROME"  -P "$DIR_DL"
wget -c "$URL_RSTUDIO"  -P "$DIR_DL"
wget -c "$URL_CODE"  -P "$DIR_DL"

sudo dpkg -i $DIR_DL/*.deb

## Make sure to update and clean
sudo apt update && sudo apt upgrade -y && sudo apt dist-upgrade -y

sudo apt autoclean
sudo apt autoremove -y

# install r pkgs (optional)
#Rscript -e 'install.packages("tidyverse", repos="https://cloud.r-project.org")'

# set rstudio config
rstudio_config="R-Scripts/my-rstudio-prefs.json"
target_config="/home/msperlin/.config/rstudio/rstudio-prefs.json"

cp -f "$rstudio_config" "$target_config" 

echo ""
echo "DONE! All softwares are installed"