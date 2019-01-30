#!/bin/bash
#FAC module 
#(C) 2019 Ariel Roque / UFCG

function fac(){
  if [ -z "$1" -a -z "$2" -a -z "$3" ];then
     echo  -e '\e[96mFast Automatization Command'
     echo ""
     echo 'Available commands:'
     echo -e "   \e[95mopen\e[0m Open the Fac Graphic User Interface"
     echo -e "   \e[95madd\e[0m Add apps in created commands"
     echo -e "   \e[95mdel\e[0m Delete apps in created commands"
  else
     if [ "$1" == "open" -a  -z "$2" -a -z "$3" ];then
        echo "open command"
     else
        if [ "$1" == "add" -a -n "$2" -a -n "$3" ]; then
           echo "add command" 
        else 
            if [ "$1" == "del" ]; then
                echo "del command"
            else 
                echo "Ops! wrong command or arguments"
            fi
         fi
     fi
  fi   
}