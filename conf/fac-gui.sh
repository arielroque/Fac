#!/bin/bash
#fac GUI

function showDialogExit(){
	if ( whiptail --title "FAC Exit" --yes-button "Yes" --no-button "No" --yesno "Are you have sure that want to exit?" 10 60 ); then
		rm ~/fac/alias/$ALIAS.sh
		exit
	fi
}

function showNotificationRemoveAlias(){
	whiptail --title "Notification" --msgbox "Command $1 was removed succesfully" 10 60
}

function showNotificationAliasAlreadyCreate(){
    whiptail --title "Notification" --msgbox "Command $1 already added. Please try another name" 10 60
}

function showNotificationInvalidAlias(){
    whiptail --title "Notification" --msgbox "Command $1 does not exist. Please try again" 10 60
}

function showNotificationEmpty(){
    whiptail --title "Notification" --msgbox "$1 name is empty. Please enter again" 10 60
}

function showNotificationAppAlreadyUsed(){
    whiptail --title "Notification" --msgbox "$1 already added. Please select another app" 10 60
}

function showNotificationAppNotInstalled(){
	whiptail --title "Notification" --msgbox "$1 is not installed. Please install and try again." 10 60
}

function showNotificationAdded(){
    whiptail --title "Notification" --msgbox "$1 was succesfully added. Make sure that the application is installed on your pc to run" 10 60
}

function showProgressBar(){
    {
        for ((i = 0 ; i<=100; i+=25)); do  
		    sleep 0.5;
			echo $i;
		done
	} | whiptail --gauge "Please wait while saving the command" 6 60 0
}

function addIde(){
   URL=$(whiptail --title "$2" --inputbox "Enter the desire path:" 10 60 3>&1 1>&2 2>&3)
   EXITSTATUS=$?
   
    if [ -n "$URL" ]; then
       if [ $EXITSTATUS == 0 ]; then
			echo "$1 $URL&" >> ~/fac/alias/$ALIAS.sh
			showNotificationAdded "$2"
	   fi
    else 
	     showNotificationEmpty 'Path'
	fi
}

function addApp(){
	echo "$1&" >> ~/fac/alias/$ALIAS.sh
	showNotificationAdded "$2"	
}

function addUrlBrowser(){
   URL=$(whiptail --title "Select URL" --inputbox "Enter the desire URL:" 10 60 3>&1 1>&2 2>&3)
   EXITSTATUS=$?
   
    if [ -n "$URL" ]; then
       if [ $EXITSTATUS = 0 ]; then
			echo "$1 $URL&" >> ~/fac/alias/$ALIAS.sh
			showNotificationAdded "$2"
	   fi
    else 
	     showNotificationEmpty 'Url'
	fi
}

function startSetup (){
	OPTION=$(whiptail --title "Fac Wizard" --menu "Choose #aplications:" 18 60 11 \
	"1" "Google Chrome url"\
	"2" "Google Chrome url (Anonymous)"\
	"3" "Google Chrome url (Security Disable)"\
	"4" "Mozila Firefox url"\
	"5" "Visual Code project"\
	"6" "Sublime Ide project"\
	"7" "Libre Office"\
	"8" "Calculator"\
	"9" "Slack"\
	"10" "Spotify"\
	"11" "Save the command" 3>&1 1>&2 2>&3)

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
		    addIde "code" "Visual Code";;
		6)  
		    addIde "subl" "Sublime";;
		7)
		    addApp "libreoffice" "Libre Office";;
		8)
		    addApp "gnome-calculator" "Calculator";;
		9)  
		    addApp "slack" "Slack";;
		10)
		    addApp "spotify" "Spotify";;		
		11) 
           showProgressBar

		   whiptail --title  "Finish Add Command" --msgbox "Command succesfuly saved. Please close the terminal to apply the changes" 8 78
		   
		   echo " alias $ALIAS='source ~/fac/alias/$ALIAS.sh'" >> ~/fac/conf/fac-alias.sh
		   
		   exit;;
		*)
		   showDialogExit;;	  	
	esac

    EXITSTATUS=$?
	
	if [ $EXITSTATUS = 0 ]; then
	     echo "teste"
	else 
	    exit
	fi	
}

function removeAlias(){
	ALIAS=$(whiptail --title "Remove Command" --inputbox "Enter the command name:" 10 60 3>&1 1>&2 2>&3)
	EXITSTATUS=$?
	if [ -e ~/fac/alias/$ALIAS.sh ];then
	   rm ~/fac/alias/$ALIAS.sh
	   sed -i "/$ALIAS.sh/d" ~/.bashrc
	   showNotificationRemoveAlias "$ALIAS"
	else
	   showNotificationInvalidAlias "$ALIAS" 
	fi
}

function listCreatedCommands(){
	ARCHIVES=$(ls ~/fac/alias)
	COMMANDS=${ARCHIVES//.sh/''}
	whiptail --title "All created commands" --msgbox --scrolltext "        PRESS KEYBOARD KEY UP OR KEY DOWN TO SCROLL \n$COMMANDS" 10 60
}

function createAlias(){
	ALIAS=$(whiptail --title "Create command" --inputbox "Enter the command name:" 10 60 3>&1 1>&2 2>&3)
	EXITSTATUS=$?
}

function menu(){ 
	MENU=$(whiptail --title "Menu" --menu "Select one option:" 15 60 8\
   	"1" "Add new command"\
   	"2" "Show all created commands"\
   	"3" "Remove command" 3>&1 1>&2 2>&3)

   	EXITSTATUS=$?
   	if [ $EXITSTATUS == 1 ];then
		exit
   	fi

   	case $MENU in

    1)
	  createAlias
		if [ -n "$ALIAS" ]; then
		    if [ ! -e ~/fac/alias/$ALIAS.sh ];then
				while [ true ]; do
					if [ ! -d ~/fac ]; then	    
						prepareAmbience
					fi
					startSetup
				done
			else
				showNotificationAliasAlreadyCreate
			fi
			    
		else
			showNotificationEmpty 'Command'
			main
		fi;;
	2)
	  listCreatedCommands;;
	
	3)
	  removeAlias;;
	esac
}

function prepareAmbience(){
	mkdir ~/fac
	mkdir ~/fac/conf
	mkdir ~/fac/alias
	touch ~/fac/conf/fac-alias.sh
	cp conf/fac-module.sh  ~/fac/conf
	echo "source ~/fac/conf/fac-module.sh" >> ~/.bashrc
	echo "source ~/fac/conf/fac-alias.sh" >> ~/.bashrc
}

function main(){
	if ( whiptail --title "Fac Wizard" --yes-button "Ok" --no-button "Cancel" --yesno "Welcome to the Fast Automatization Command (FAC). Choose <Ok> to continue or <cancel> to exit." 10 60 ); then
		while [ true ];do
			menu
		done
	else
		exit
	fi
}
main

