#!/bin/bash
function showNotificationInvalidALias(){
     whiptail -- "Notification" --msgbox "Alias name is empty. Please enter a name"
}

function showNotificationAppAlreadyUsed(){
    whiptail --title "Notification" --msgbox "$1 already added. Please select another app"
}

function showNotificationAdded(){
    whiptail --title "Notification" --msgbox "$1 was succesfully added" 10 60
}

function addApp(){
	echo "$1" >> ~/fac1/$alias.sh
	showAddedNotification "$2"
}
function addUrlBrowser(){
   URL=$(whiptail --title "Select URL" --inputbox "Enter the desire URL:" 10 60 3>&1 1>&2 2>&3)
   existStatus=$?

   if [ $exitStatus = 0 ]; then
      echo "$1 $URL" >> ~/fac1/$alias.sh
	  showAddedNotification "$2"
   fi
}

function startSetup (){
	OPTION=$(whiptail --title "Fac Wizard" --menu "Choose #aplications:" 15 60 8 \
	"1" "Google Chrome"\
	"2" "Google Chrome (Anônimo)"\
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

		*) whiptail --title  "Finish fac" --msgbox "Alias succesfuly saved" 8 78
		   
		   echo " alias $alias='source ~/fac1/$alias.sh'" >> ~/.bashrc

		   exit		
	esac

    exitStatus=$?
	
	if [ $exitStatus = 0 ]; then

	     echo "teste"
	else 

	    exit
	fi	
}

function createAlias(){
	alias=$(whiptail --title "Alias Name" --inputbox "Enter the alias name:" 10 60 3>&1 1>&2 2>&3)
	exitStatus=$?

	if [ $exitStatus = 1 ]; then
	    #improve the user's exit 
	    exit
	fi
}

if ( whiptail --title "Fac Wizard" --yes-button "Ok" --no-button "Cancel"  --yesno "Welcome to the Fast Automatization Command (FAC). Choose <Ok> to continue or <cancel> to exit." 10 60 ); then
    
	createAlias

	while [ true ]; do

     if [ ! -d ~/fac1 ]; then	    
		 mkdir ~/fac1
	 fi

     startSetup

    done
else
	exit
fi
