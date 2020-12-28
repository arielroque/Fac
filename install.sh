#!/bin/bash
#Fac Install

source ./src/utils/fac_utils.sh

function start_enviroment(){
   mkdir ~/fac
   mkdir ~/fac/src
   mkdir ~/fac/alias

   cp -r src/*  ~/fac/src/
   cp ./uninstall.sh ~/fac
   touch ~/fac/src/fac_alias.sh
   source ~/fac/src/fac_alias.sh

   echo "alias facgui='source ~/fac/src/setup.sh'" >> ~/fac/src/fac_alias.sh
   echo "source ~/fac/src/fac_cli.sh" >> ~/.bashrc
   echo "source ~/fac/src/fac_alias.sh" >> ~/.bashrc
}

if [ ! -d ~/fac ];then
    start_enviroment
   
else
   rm -r ~/fac
   sed -i "/fac_module.sh/d" ~/.bashrc
   sed -i "/fac_alias.sh/d" ~/.bashrc

   start_enviroment

fi

fac_label

progress

echo -e "\e[32m--> Instalation completed successfully \e[0m"
echo -e "\e[0m    Close the terminal to apply the changes"

