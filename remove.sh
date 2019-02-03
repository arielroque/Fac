#!/bin/bash
# FAC remove
# (C) 2019 Ariel Roque / UFCG

function progress(){
   echo -ne '\e[93m .....              (32%)\r'
   sleep 1
   echo -ne '\e[93m ............       (70%)\r'
   sleep 1
   echo -ne '\e[93m .................. (100%)\r'
   sleep 1
}

if [ -e ~/fac ];then 
   rm -r ~/fac
   sed -i "/fac-module.sh/d" ~/.bashrc
   sed -i "/fac-alias.sh/d" ~/.bashrc

   progress

   echo -e "\e[32m Uninstall completed successfully \e[0m"
   echo -e "\e[0m Close the terminal to apply the changes"
else
   echo -e "\e[31m Error!! FAC does not installed\e[0m"
fi
