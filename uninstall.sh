#!/bin/bash
#fac uninstall

source ./src/utils/fac_utils.sh

if [ -e ~/fac ];then 
   rm -r ~/fac
   sed -i "/fac_cli.sh/d" ~/.bashrc
   sed -i "/fac_alias.sh/d" ~/.bashrc

   progress

   echo -e "\e[32m--> Uninstall completed successfully \e[0m"
   echo -e "\e[0m    Close the terminal to apply the changes"
   echo ""
else
   fac_label
   echo -e "\e[31m--> Error! FAC does not installed\e[0m"
   echo ""
fi
