#!/usr/bin/env bash

# Bash Script for installing r packages in file pkgs_to_install.txt

echo "Installing R packages:"

## make sure dir exists
Rscript -e "dir.create(Sys.getenv('R_LIBS_USER'), recursive = TRUE)" > /dev/null 2>&1
for pkg in $(cat R-pkgs/pkgs_to_install.txt)
do
    echo "  - $pkg"
	Rscript -e "install.packages(\"$pkg\", repos='https://cloud.r-project.org', lib = .libPaths()[1])" > /dev/null 2>&1
done

echo ""
echo "DONE! R packages installed"