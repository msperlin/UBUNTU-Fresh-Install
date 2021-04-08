#!/usr/bin/env bash

echo "Installing by bash scripts"
./bash-to-install/install_R.sh
./bash-to-install/install_Rstudio.sh
./bash-to-install/configure_Rstudio.sh

echo "R and RStudio installed and configured"