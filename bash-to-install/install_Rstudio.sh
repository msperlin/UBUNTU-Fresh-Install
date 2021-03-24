#!/bin/bash

echo "  - Installing RStudio"

## Find rstudio latest ver download
wget -qO- https://rstudio.com/products/rstudio/download/ | grep -Eoi '<a [^>]+>' |  grep -Eo 'href="[^\"]+"' |  grep -Eo '(http|https)://download1.rstudio.org/desktop/bionic/amd64/rstudio-[^/"]+-amd64.deb' >| /tmp/link_dl.txt

URL_RSTUDIO=$(head -n 1 /tmp/link_dl.txt)

DIR_DL="/tmp/rstudio-temp"

## Download and install external software
mkdir "$DIR_DL"

wget -c "$URL_RSTUDIO"  -P "$DIR_DL" > /dev/null 2>&1

sudo dpkg -i $DIR_DL/*.deb > /dev/null 2>&1

