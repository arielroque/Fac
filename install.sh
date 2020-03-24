#!/bin/bash
#fac install

function facLabel(){
   echo -e '\e[95m _____      _        ____'  
   echo -e '\e[95m|" ___|U   /"\  u U /"___|' 
   echo -e '\e[95mU| |_  u \/ _ \/  \| | u'   
   echo -e '\e[95m\|  _|/  / ___ \   | |/__'  
   echo -e '\e[95m |_|    /_/   \_\   \____|' 
   echo -e '\e[95m)(\\,-  \\    >>  _// \\'  
   echo -e '\e[95m(__)(_/ (__)  (__)(__)(__)' 
   echo ""
   echo  -e '\e[96mFast Automatization Command'
   echo ""
}

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
   cp conf/fac-cli.sh  ~/fac/conf
   cp conf/fac-gui.sh ~/fac/conf
   cp remove.sh ~/fac/conf
   source ~/fac/conf/fac-alias.sh

   echo "alias facgui='source ~/fac/conf/setup.sh'" >> ~/fac/conf/fac-alias.sh
   echo "source ~/fac/conf/fac-cli.sh" >> ~/.bashrc
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

facLabel

progress

echo -e "\e[32m--> Instalation completed successfully \e[0m"
echo -e "\e[0m    Close the terminal to apply the changes"

