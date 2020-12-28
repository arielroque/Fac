#!/bin/bash
#Fac Cli

source ~/fac/src/utils/fac_utils.sh
source ~/fac/src/operations/operations.sh

function fac() {
   if [ -z "$1" -a -z "$2" -a -z "$3" ]; then

      fac_label

      echo 'Usage: fac <command> [arguments]'
      echo ''

      echo 'Available commands:'
      echo ''
      echo -e "   \e[95mopen\e[0m         Open the Fac"
      echo -e "   \e[95mls\e[0m           List all created commands"
      echo -e "   \e[95mrm\e[0m           Remove a command created"
      echo -e "   \e[95muninstall\e[0m    Uninstall Fac in your computer"
   else
      if [ "$1" == "open" -a -z "$2" -a -z "$3" ]; then
         source ~/fac/src/fac_gui.sh
      else
         if [ "$1" == "rm" ]; then
            remove_command $2
         else
            if [ "$1" == "ls" ]; then
               list_created_commands

            else
               if [ "$1" == "uninstall" ]; then
                  source ~/fac/uninstall.sh

               else
                  echo -e "\e[31mOps! wrong command or arguments\e[0m"

               fi
            fi
         fi
      fi

   fi
}
