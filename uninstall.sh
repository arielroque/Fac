#!/bin/bash
#fac remove

source ./configuration/utils/fac_utils.sh

if [ -e ~/fac ];then 
   rm -r ~/fac
   sed -i "/fac-cli.sh/d" ~/.bashrc
   sed -i "/fac-alias.sh/d" ~/.bashrc

   fac_label
   progress

   echo -e "\e[32m--> Uninstall completed successfully \e[0m"
   echo -e "\e[0m    Close the terminal to apply the changes"
   echo ""
else
   fac_label
   echo -e "\e[31m--> Error! FAC does not installed\e[0m"
   echo ""
fi
