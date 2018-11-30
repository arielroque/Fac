#!/bin/bash

function startSetup (){
	
	OPTION=$(whiptail --title "Fac Wizard" --menu "Choose #aplications:" 15 60 2 \
	"1" "Google Chrome"\
 	"2" "Mozila Firefox" 3>&1 1>&2 2>&3 )

	case $OPTION in

		1)
			whiptail --title "option" --msgbox "google chrome" 10 60 ;;
		2) 
			whiptail --title "option" --msgbox "firefox" 10 60;;

	esac
}


if ( whiptail --title "Fac Wizard" --yes-button "Ok" --no-button "Cancel"  --yesno "Welcome to the Fast Automatization Command (fac). Choose Ok to <continue> or <cancel> to exit." 10 60 ); then
	startSetup
else
	exit
fi

