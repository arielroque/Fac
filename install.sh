#!/bin/bash
#FAC install
#(C) 2019 Ariel Roque / UFCG

function progress(){
   echo -ne '\e[93m .....              (32%)\r'
   sleep 1
   echo -ne '\e[93m ............       (70%)\r'
   sleep 1
   echo -ne '\e[93m .................. (100%)\r'
   sleep 1
}

function startAmbiance(){
   mkdir ~/fac
   mkdir ~/fac/conf
   mkdir ~/fac/alias
   touch ~/fac/conf/fac-alias.sh
   cp conf/fac-module.sh  ~/fac/conf
   cp conf/setup.sh ~/fac/conf
   cp remove.sh ~/fac/conf
   source ~/fac/conf/fac-alias.sh
   echo "alias facgui='source ~/fac/conf/setup.sh'" >> ~/fac/conf/fac-alias.sh
   echo "source ~/fac/conf/fac-module.sh" >> ~/.bashrc
   echo "source ~/fac/conf/fac-alias.sh" >> ~/.bashrc
}

if [ ! -d ~/fac ];then
    startAmbiance
else
   rm -r ~/fac
   sed -i "/fac-module.sh/d" ~/.bashrc
   sed -i "/fac-alias.sh/d" ~/.bashrc

   startAmbiance
fi

progress

echo -e "\e[32m Instalation completed successfully \e[0m"
echo -e "\e[0m Close the terminal to apply the changes"

