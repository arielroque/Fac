#!/bin/bash

function fac_label() {
   echo -e '\e[95m _____      _        ____'
   echo -e '\e[95m|" ___|U   /"\  u U /"___|'
   echo -e '\e[95mU| |_  u \/ _ \/  \| | u'
   echo -e '\e[95m\|  _|/  / ___ \   | |/__'
   echo -e '\e[95m |_|    /_/   \_\   \____|'
   echo -e '\e[95m)(\\,-  \\    >>  _// \\'
   echo -e '\e[95m(__)(_/ (__)  (__)(__)(__)'
   echo ""
   echo -e '\e[96mFast Automatization Command\e[0m'
   echo ""
}

function progress() {
   echo -ne '\e[93m .....              (32%)\r'
   sleep 1
   echo -ne '\e[93m ............       (70%)\r'
   sleep 1
   echo -ne '\e[93m .................. (100%)\r'
   sleep 1
}

function list_applications() {
   ARRAY=()
   INPUT=~/.fac/src/resources/applications.csv
   OLDIFS=$IFS
   IFS=';'
   CONT=0

   [ ! -f $INPUT ] && {
      echo "$INPUT file not found"
      exit 99
   }

   while read name type; do
      if [ ! -z $name ] && [ ! -z $type ]; then
         ARRAY[$((COUNT += 1))]="\"$name\""
      fi

   done <$INPUT
   IFS=$OLDIFS
   echo "${ARRAY[@]}"
}

function list_applications_commands() {
   ARRAY=()
   INPUT=~/.fac/src/resources/applications.csv
   OLDIFS=$IFS
   IFS=';'
   CONT=0

   [ ! -f $INPUT ] && {
      echo "$INPUT file not found"
      exit 99
   }

   while read name type; do
      if [ ! -z $name ] && [ ! -z $type ]; then
         ARRAY[$((COUNT += 1))]="$type"
      fi

   done <$INPUT
   IFS=$OLDIFS
   echo ${ARRAY[@]}
}

export -f fac_label progress list_applications list_applications_commands
