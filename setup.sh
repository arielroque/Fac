#!/bin/bash

function showNotificationRemoveAlias(){
	whiptail --title "Notification" --msgbox "Command $1 was removed succesfully" 10 60
}

function showNotificationInvalidAlias(){
     whiptail --title "Notification" --msgbox "Command $1 not exit. Please try again" 10 60
}

function showNotificationEmptyAlias(){
     whiptail --title "Notification" --msgbox "Command name is empty. Please enter a name" 10 60
}

function showNotificationAppAlreadyUsed(){
    whiptail --title "Notification" --msgbox "$1 already added. Please select another app" 10 60
}

function showNotificationAppNotInstalled(){
	whiptail --title "Notification" --msgbox "$1 is not installed. Please install and try again." 10 60
}

function showNotificationAdded(){
    whiptail --title "Notification" --msgbox "$1 was succesfully added" 10 60
}

function showProgressBar(){
    {
        for ((i = 0 ; i<=100; i+=25)); do  
		    sleep 0.5;
			echo $i;
		done
	} | whiptail --gauge "Please wait while saving the alias" 6 60 0
}

function isAppInstaled(){

    if [ ! -x "$(command -v $1)" ]; then
	   return 0
	else
	   return 1
	fi
}

function addApp(){

    if [ isAppInstaled "$1" -eq 0]; then

		echo "$1" >> ~/fac1/$ALIAS.sh
		showNotificationAdded "$2"
	else
	    showNotificationAppNotInstalled "$1"
	fi
}
function addUrlBrowser(){
   URL=$(whiptail --title "Select URL" --inputbox "Enter the desire URL:" 10 60 3>&1 1>&2 2>&3)
   existStatus=$?

    if [ -n "$URL" ]; then
       if [ $exitStatus = 0 ]; then
			echo "$1 $URL" >> ~/fac1/$ALIAS.sh
			showNotificationAdded "$2"
	   fi
	
    else 
	     showNotificationEmptyAlias
	fi
}

function startSetup (){
	OPTION=$(whiptail --title "Fac Wizard" --menu "Choose #aplications:" 15 60 8 \
	"1" "Google Chrome"\
	"2" "Google Chrome (Anonymous)"\
	"3" "Google Chrome (Security Disable)"\
	"4" "Mozila Firefox"\
	"5" "Libre Office"\
	"6" "Calculator"\
	"7" "Slack"\
	"8" "Spotify" 3>&1 1>&2 2>&3)

	case $OPTION in
		1)
			addUrlBrowser "google-chrome" "Google Chrome";;
		2)
		    addUrlBrowser "google-chrome --incognito" "Google Chrome (Anonymous)";;
		3)
		    addUrlBrowser "google-chrome-stable --disable-web-security --user-data-dir=~/.config/google-chrome/Default" "Google Chrome (Security Disabled)";;
		4) 
			addUrlBrowser "firefox" "Mozila Firefox";;
		5)
		    addApp "libreoffice" "Libre Office";;
		6)
		    addApp "gnome-calculator" "Calculator";;
		7)  
		    addApp "slack" "Slack";;
		8)
		    addApp "spotify" "Spotify";;		

		*) 
           showProgressBar

		   whiptail --title  "Finish Add Alias" --msgbox "Alias succesfuly saved. Please close the terminal to apply the changes" 8 78
		   
		   echo " alias $ALIAS='source ~/fac1/$ALIAS.sh'" >> ~/.bashrc

		   exit		
	esac

    exitStatus=$?
	
	if [ $exitStatus = 0 ]; then
	     echo "teste"
	else 
	    exit
	fi	
}

function removeAlias(){
	ALIAS=$(whiptail --title "Remove Command" --inputbox "Enter the command name:" 10 60 3>&1 1>&2 2>&3)
	exitStatus=$?

	if [ -e ~/fac1/$ALIAS.sh ];then
	   rm ~/fac1/$ALIAS.sh
	   showNotificationRemoveAlias "$ALIAS"
       
	else

	   showNotificationInvalidAlias "$ALIAS"
      
	fi
}

function createAlias(){
	ALIAS=$(whiptail --title "Create command" --inputbox "Enter the command name:" 10 60 3>&1 1>&2 2>&3)
	exitStatus=$?

	if [ $exitStatus = 1 ]; then
	    exit
	fi
}

function menu(){
   MENU=$(whiptail --title "Menu" --menu "Select one option:" 15 60 8\
   "1" "Add alias command"\
   "2" "Remove alias command"\
   "3" "Extra" 3>&1 1>&2 2>&3)

   case $MENU in

    1)
	  createAlias
		if [ -n "$ALIAS" ]; then
			while [ true ]; do
				if [ ! -d ~/fac1 ]; then	    
					mkdir ~/fac1
				fi
				startSetup
			done
		else
		showNotificationEmptyAlias
		main
		fi;;
	2)

	  removeAlias;;

	   
	
	3) echo "extra";;

	esac
}
function main(){
	if ( whiptail --title "Fac Wizard" --yes-button "Ok" --no-button "Cancel"  --yesno "Welcome to the Fast Automatization Command (FAC). Choose <Ok> to continue or <cancel> to exit." 10 60 ); then
		menu
	else
		exit
	fi
}

main
