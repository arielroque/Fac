#!/bin/bash
#Fac CLI

function facAddApp(){
    if [ -e ~/fac/alias/$2.sh ];then
       echo $1 >> ~/fac/alias/$2.sh
       echo -e "\e[32m App successfully added\e[0m"
    else
       echo -e "\e[31m Command \e[0m $2 \e[31m does not exist\e[0m"
    fi
}

function fac(){
  if [ -z "$1" -a -z "$2" -a -z "$3" ];then

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
     echo 'Available commands:'
     echo -e "   \e[95mgui\e[0m Open the Fac Graphic User Interface (GUI)"
     echo -e "   \e[95madd\e[0m Add app in created commands"
     echo -e "   \e[95mls\e[0m List all created commands"
     echo -e "   \e[95muninstall\e[0m Uninstall Fac in your computer"
  else
     if [ "$1" == "gui" -a  -z "$2" -a -z "$3" ];then
        source ~/fac/conf/fac-gui.sh
     else
        if [ "$1" == "add" -a -n "$2" -a -n "$3" ]; then
              facAddApp $2 $3
         else 
            if [ "$1" == "uninstall" ];then 
               source ~/fac/conf/remove.sh  
            else 
               echo -e "\e[31mOps! wrong command or arguments\e[0m"  
            fi
         fi
     fi
  fi   
}