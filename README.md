# UBUNTU-Fresh-Install

This bash script was written for Linux Mint (Ubuntu) and will install all required software in a fresh computer. 
The main innovation in the bash file is that it **always** install the latest available version using apt, snap, direct download and some webscrapping.

This bash script includes the following software:

## Main software

- R ([latest](https://www.r-project.org/))
- RStudio ([latest](https://rstudio.com/))
- Google Chrome ([latest](https://www.google.com/chrome/))
- Microsoft code ([latest by snap](https://snapcraft.io/code))
- libreoffice ([lastest](https://www.libreoffice.org/))
- textudio and texlive
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
chmod +x UBUNTU_Install-Bash.sh
./UBUNTU_Install-Bash.sh
```

3) type your sudo password and wait..