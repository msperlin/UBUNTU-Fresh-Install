#!/usr/bin/env bash

# Bash Script for installing r packages in file pkgs_to_install.txt

echo "Installing R packages:"

# 1) r script for single package and loop (no messages in output)
# 2) 

# install system requirements by package 

# first run script to check sys dependencies
bash ./R-pkgs/S_pkg-sysdep_to_bash.R 

while read line; 
do 
  echo $line
	sudo $line
done < R-pkgs/commands_to_run.txt

rm ./R_pkg/commands_to_run.txt

# install individual packages
for R_pkg in $(cat R-pkgs/pkgs_to_install.txt)
do
	./R-pkgs/S_Install-R-Pkgs.R $R_pkg 
done

echo ""
echo "DONE! R packages installed"