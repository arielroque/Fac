#!/bin/bash

function addUrlMozilaNavegator(){

	URL=$(whiptail --title "Select URL" --inputbox "Enter the desire URL:" 10 60 3>&1 1>&2 2>&3)
	existStatus=$?
	if [ $existStatus = 0 ]; then
	 	echo "firefox $URL" >> values.sh
	else
	    echo "You Choose Cancel."
	fi
}

function addUrlGoogleNavegator(){

	URL=$(whiptail --title "Select URL" --inputbox "Enter the desire URL:" 10 60 3>&1 1>&2 2>&3)
	exitStatus=$?

	if [ $exitStatus = 0 ]; then
    	echo "google-chrome $URL" >> values.sh
	else
    	echo "You choose Cancel."
	fi
}

function startSetup (){
	
	OPTION=$(whiptail --title "Fac Wizard" --menu "Choose #aplications:" 15 60 2 \
	"1" "Google Chrome"\
 	"2" "Mozila Firefox" 3>&1 1>&2 2>&3 )

	case $OPTION in

		1)
			addUrlGoogleNavegator;;
		2) 
			addUrlMozilaNavegator;;

	esac
}


if ( whiptail --title "Fac Wizard" --yes-button "Ok" --no-button "Cancel"  --yesno "Welcome to the Fast Automatization Command (fac). Choose Ok to <continue> or <cancel> to exit." 10 60 ); then
	
	while [ true ]; do
     startSetup
    done
else
	exit
fi

