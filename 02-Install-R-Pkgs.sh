#!/usr/bin/env bash

# Bash Script for installing r packages in file pkgs_to_install.txt

echo "Installing R packages:"

# 1) r script for single package and loop (no messages in output)
# 2) 

## run bash
for R_pkg in $(cat R-pkgs/pkgs_to_install.txt)
do
	./R-pkgs/S_Install-R-Pkgs.R $R_pkg
done


echo ""
echo "DONE! R packages installed"