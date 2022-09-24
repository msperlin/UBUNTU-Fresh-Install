#!/bin/bash

echo "  - Installing RStudio"

# set tempfile for dl url
my_temp=$(mktemp /tmp/XXXXXX.txt)
ubuntu_distro="jammy"

## Find rstudio latest ver download
wget -qO- https://rstudio.com/products/rstudio/download/ | grep -Eoi '<a [^>]+>' |  grep -Eo 'href="[^\"]+"' |  grep -Eo '(http|https)://download1.rstudio.org/desktop/$ubuntu_distro/amd64/rstudio-[^/"]+-amd64.deb' >| $my_temp

URL_RSTUDIO=$(head -n 1 $my_temp)

DIR_DL="/tmp/rstudio-temp"

## Download and install external software
mkdir "$DIR_DL"

wget -c "$URL_RSTUDIO"  -P "$DIR_DL" > /dev/null 2>&1

sudo dpkg -i $DIR_DL/*.deb > /dev/null 2>&1

