# UBUNTU-Fresh-Install

This bash script was written for Linux Mint and Ubuntu and will install all required software in a fresh computer. The main innovation in the bash file is that it **always** install the latest available version using apt, snap, direct download and some webscrapping. Likewise, it also installs RStudio preferences and R packages. 

This bash script includes the following software:

## Main software

- R ([latest](https://www.r-project.org/))
- R Packages
  - See file `R-pkgs/pkgs_to_install.txt`
- RStudio ([latest](https://rstudio.com/)
  - RStudio configuration -- color scheme, size font, .. (see file `my-rstudio-prefs.json`)
- Google Chrome ([latest](https://www.google.com/chrome/))
- Microsoft code ([latest by snap](https://snapcraft.io/code))
- libreoffice ([lastest](https://www.libreoffice.org/))
- textudio ([latest](https://www.texstudio.org/))
- obstudio ([latest](https://obsproject.com/wiki/install-instructions#linux))


## Others

- virtualbox
- keepass2
- git
- okular
- hunspell-pt-br 
- htop 

# How to use it

1) Download this repository as a [zip file](https://github.com/msperlin/UBUNTU-Fresh-Install/archive/refs/heads/main.zip)
2) Unpack and, within a terminal, execute the main script:

```
./UBUNTU_Install-Bash.sh
```

3) type your sudo password and wait..