#!/usr/bin/env bash

# Bash Script for installing r packages in file pkgs_to_install.txt

echo "Installing latex"

sudo apt install texlive-full texstudio

sudo add-apt-repository ppa:sunderme/texstudio
sudo apt update
sudo apt install texstudio
