#!/bin/bash
#FAC module 
#(C) 2019 Ariel Roque / UFCG

function facAddApp(){
    if [ -e ~/fac/$2.sh ];then
       echo $1 >> ~/fac/$2.sh
       echo -e "\e[32m App successfully added"
    else
       echo -e "\e[31m Command \e[0m $2 \e[31m do not exist"
    fi
}

function facListApps(){
   apps=cat ~/fac/$1.sh
   echo $apps
}

function facRemoveApp(){
   if [ -e ~/fac/$2.sh ];then
      sed -i "/$1.sh/d" ~/fac/$2.sh
      echo -e "\e[32m App successfully unistalled"
   else 
      echo -e "\e[31m Command \e[0m $2 \e[31m do not exist"
   fi
}

function fac(){
  if [ -z "$1" -a -z "$2" -a -z "$3" ];then
     echo  -e '\e[96mFast Automatization Command'
     echo ""
     echo 'Available commands:'
     echo -e "   \e[95mopen\e[0m Open the Fac Graphic User Interface"
     echo -e "   \e[95madd\e[0m Add app in created commands"
     echo -e "   \e[95muninstall\e[0m Uninstall Fac in your computer"
  else
     if [ "$1" == "open" -a  -z "$2" -a -z "$3" ];then
        source ~/fac/conf/setup.sh
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