#!/usr/bin/env bash

# Bash Script for installing r packages in file pkgs_to_install.txt

echo "Installing R packages:"

# 1) r script for single package and loop (no messages in output)
# 2) 

# install system requirements by package 
while read line; 
do 
  echo $line
	sudo $line
done < R-pkgs/commands_to_run.txt

# prompt=$(sudo -nv 2>&1)
# if [ $? -eq 0 ]; then
#   # exit code of sudo-command is 0
#   echo "user is already sudo"
#   sudo_pass=""
# 
# elif echo $prompt | grep -q '^sudo:'; then
#   echo "Please type your password"
#   read sudo_pass
# else
#   echo "no_sudo"
# fi

## run bash
for R_pkg in $(cat R-pkgs/pkgs_to_install.txt)
do
	./R-pkgs/S_Install-R-Pkgs.R $R_pkg 
done

echo ""
echo "DONE! R packages installed"