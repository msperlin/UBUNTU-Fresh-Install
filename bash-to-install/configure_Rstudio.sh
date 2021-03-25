#!/bin/bash

# set rstudio config
rstudio_config="bash-to-install/Rstudio-Config/my-rstudio-prefs.json"
target_config="/home/$USER/.config/rstudio/"

cp -f "$rstudio_config" "$target_config" 
