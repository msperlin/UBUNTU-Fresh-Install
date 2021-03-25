#/bin/bash

apt_soft=$1

echo -n Installing "$apt_soft"

dpkg -s $apt_soft &> /dev/null  

if [ $? -ne 0 ]
   then
       echo "  - Not installed, installing it"  
       sudo apt-get install $apt_soft -y &> /dev/null

   else
       echo    "  - already installed"
fi
