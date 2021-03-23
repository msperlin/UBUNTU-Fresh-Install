# UBUNTU-Fresh-Install

This bash script was written for Linux Mint and Ubuntu and will install all required software in a fresh computer. The main innovation is that the script **always** install the latest available version using apt, snap, or customized bash scripts. For R users, it can also install RStudio preferences and R packages. 

If you plan to use this bash file, make sure to check all .txt files in all folders. You can, for example, add or remove apt/snap software or add or remove R packages to install. 

This bash script includes the following software:

## Using Apt
- libreoffice ([lastest](https://www.libreoffice.org/))
- textudio ([latest](https://www.texstudio.org/))
- obstudio ([latest](https://obsproject.com/wiki/install-instructions#linux))
- many others (see file `apt-to-install/list_to_install.txt)`


## Using custom bash scripts
- R ([latest](https://www.r-project.org/))
- R Packages
  - See file `R-pkgs/pkgs_to_install.txt`
- RStudio ([latest](https://rstudio.com/)
  - RStudio configuration -- color scheme, size font, .. (see file `Rstudio-Config/my-rstudio-prefs.json`). You can get your own Rstudio preference file localy at `~/.config/rstudio/rstudio-pref.json`.
- Google Chrome ([latest](https://www.google.com/chrome/))


## Using snap

- Microsoft code ([latest by snap](https://snapcraft.io/code))


# How to use it

1) Download this repository as a [zip file](https://github.com/msperlin/UBUNTU-Fresh-Install/archive/refs/heads/main.zip)
2) Unpack the zip file and check all .txt files in all subfolders
3) Within a terminal, execute the main script:

```
./UBUNTU_Install-Bash.sh
```

4) type your sudo password and wait...


# Generating R package list

You can generate your own list of R packages based on your existing code. For that, use the R code below. Do notice you'll need to change the base folder in `renv::dependencies`.

```
library(dplyr)

my_r_dir <- 'YOUR-FOLDER-HERE'
df <- renv::dependencies(my_r_dir)

n_to_colect <- 50 # number of pkgs to collect (most to least frequent)

tbl_pkgs <- df %>%
  group_by(Package) %>%
  count() %>%
  arrange(-n) %>%
  #view() %>%
  ungroup() %>%
  slice(1:n_to_colect)

tbl_pkgs
```