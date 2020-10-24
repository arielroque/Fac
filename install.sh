#!/bin/bash
#fac install

source ./configuration/utils/fac_utils.sh

function start_enviroment(){
   mkdir ~/fac
   mkdir ~/fac/configuration
   mkdir ~/fac/alias

   touch ~/fac/configuration/fac-alias.sh
   cp configuration/fac-cli.sh  ~/fac/configuration
   cp configuration/fac-gui.sh ~/fac/configuration
   cp uninstall.sh ~/fac/configuration
   source ~/fac/configuration/fac-alias.sh

   echo "alias facgui='source ~/fac/configuration/setup.sh'" >> ~/fac/configuration/fac-alias.sh
   echo "source ~/fac/configuration/fac-cli.sh" >> ~/.bashrc
   echo "source ~/fac/configuration/fac-alias.sh" >> ~/.bashrc
}

if [ ! -d ~/fac ];then
    start_enviroment
   
else
   rm -r ~/fac
   sed -i "/fac-module.sh/d" ~/.bashrc
   sed -i "/fac-alias.sh/d" ~/.bashrc

   start_enviroment

fi

fac_label

progress

echo -e "\e[32m--> Instalation completed successfully \e[0m"
echo -e "\e[0m    Close the terminal to apply the changes"

