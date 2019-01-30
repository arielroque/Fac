#!/bin/bash
#FAC install
#(C) 2018 Ariel Roque / UFCG

function progress(){
   echo -ne '\e[93m .....              (32%)\r'
   sleep 1
   echo -ne '\e[93m ............       (70%)\r'
   sleep 1
   echo -ne '\e[93m .................. (100%)\r'
   sleep 1
}

function startAmbiance(){
   mkdir ~/fac1
   mkdir ~/fac1/conf
   touch ~/fac1/conf/fac-alias.sh
   cp conf/fac-module.sh  ~/fac1/conf
   cp conf/setup.sh ~/fac1/conf
   echo "alias facgui='source ~/fac1/conf/setup.sh'" >> ~/fac1/conf/fac-alias.sh
   echo "source ~/fac1/conf/fac-module.sh" >> ~/.bashrc
   echo "source ~/fac1/conf/fac-alias.sh" >> ~/.bashr
   source ./conf/fac-module.sh
}

if [ ! -d ~/fac1 ];then
    startAmbiance
else
   rm -r ~/fac1
   sed -i "/fac-module.sh/d" ~/.bashrc
   sed -i "/fac-alias.sh/d" ~/.bashrc

   startAmbiance
fi

progress

echo -e "\e[32m Instalation completed successfully \e[0m"
echo -e "\e[0m Start Fac typing in the terminal --> \e[96m fac open\e[0m"
