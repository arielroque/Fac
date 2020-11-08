#!/bin/bash
#fac cli

source ~/fac/src/utils/fac_utils.sh
source ~/fac/src/operations/operations.sh

function add_app(){
    if [ -e ~/fac/alias/$2.sh ];then
       echo $1 >> ~/fac/alias/$2.sh
       echo -e "\e[32m App successfully added\e[0m"
    else
       echo -e "\e[31m Command \e[0m $2 \e[31m does not exist\e[0m"
    fi
}

function fac(){
  if [ -z "$1" -a -z "$2" -a -z "$3" ];then

     fac_label

     echo 'Usage: fac <command> [arguments]'
     echo ''

     echo 'Available commands:'
     echo ''
     echo -e "   \e[95mgui\e[0m          Open the Fac Graphic User Interface (GUI)"
     echo -e "   \e[95madd\e[0m          Add app in created commands"
     echo -e "   \e[95mls\e[0m           List all created commands"
     echo -e "   \e[95muninstall\e[0m    Uninstall Fac in your computer"
  else
     if [ "$1" == "gui" -a  -z "$2" -a -z "$3" ];then
        source ~/fac/src/fac_gui.sh
     else
        if [ "$1" == "add" -a -n "$2" -a -n "$3" ]; then
              add_app
             $2 $3
         else 
            if [ "$1" == "rm" ];then
               handle $2
            else    
               if [ "$1" == "ls" ];then
                  list_created_commands
                  
               else 
                  if [ "$1" == "uninstall" ];then 
                     source ~/fac/uninstall.sh  
                  
                  else
                     echo -e "\e[31mOps! wrong command or arguments\e[0m" 

                  fi
               fi      
            fi
         fi
     fi
  fi   
}