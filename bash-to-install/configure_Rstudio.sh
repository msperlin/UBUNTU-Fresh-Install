#!/bin/bash

# set rstudio config
rstudio_config="bash-to-install/Rstudio-Config/rstudio-prefs.json"
target_config="/home/$USER/.config/rstudio/"

mkdir $target_config

cp -f "$rstudio_config" "$target_config" 
