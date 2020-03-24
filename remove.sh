#!/bin/bash
# fac remove

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

if [ -e ~/fac ];then 
   rm -r ~/fac
   sed -i "/fac-cli.sh/d" ~/.bashrc
   sed -i "/fac-alias.sh/d" ~/.bashrc

   facLabel
   progress

   echo -e "\e[32m--> Uninstall completed successfully \e[0m"
   echo -e "\e[0m    Close the terminal to apply the changes"
   echo ""
else
   facLabel
   echo -e "\e[31m--> Error! FAC does not installed\e[0m"
   echo ""
fi
