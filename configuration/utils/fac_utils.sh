#!/bin/bash

function fac_label(){
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

export -f fac_label progress