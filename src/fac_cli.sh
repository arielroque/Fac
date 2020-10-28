#!/bin/bash
#fac cli

function addIde(){
   URL=$(whiptail --title "$2" --inputbox "Enter the desire path:" 10 60 3>&1 1>&2 2>&3)
   EXITSTATUS=$?
   
    if [ -n "$URL" ]; then
       if [ $EXITSTATUS == 0 ]; then
			echo "$1 $URL&" >> ~/fac/alias/$ALIAS.sh
			show_sucessfully_alias_dialog "$2"
	   fi
    else 
	     show_empty_alias_dialog 'Path'
	fi
}

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
     echo 'Available commands:'
     echo -e "   \e[95mgui\e[0m Open the Fac Graphic User Interface (GUI)"
     echo -e "   \e[95madd\e[0m Add app in created commands"
     echo -e "   \e[95mls\e[0m List all created commands"
     echo -e "   \e[95muninstall\e[0m Uninstall Fac in your computer"
  else
     if [ "$1" == "gui" -a  -z "$2" -a -z "$3" ];then
        source ~/fac/src/fac_gui.sh
     else
        if [ "$1" == "add" -a -n "$2" -a -n "$3" ]; then
              add_app
             $2 $3
         else 
            if [ "$1" == "uninstall" ];then 
               source ~/fac/src/uninstall.sh  
            else 
               echo -e "\e[31mOps! wrong command or arguments\e[0m"  
            fi
         fi
     fi
  fi   
}