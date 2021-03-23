#!/bin/bash

URL_GOOGLE_CHROME="https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb"

DIR_DL="/tmp/chrome-temp"

## Download and install external software
mkdir "$DIR_DL"

wget -c "$URL_GOOGLE_CHROME"  -P "$DIR_DL"

sudo dpkg -i $DIR_DL/*.deb

