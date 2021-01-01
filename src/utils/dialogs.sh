#!/bin/bash

function show_exit_dialog(){
	if ( whiptail --title "FAC Exit" --yes-button "Yes" --no-button "No" --yesno "Are you have sure that want to exit?" 10 60 ); then
		rm ~/.fac/alias/$ALIAS.sh
		exit
	fi
}

function show_removed_alias_dialog(){
	whiptail --title "Notification" --msgbox "Command $1 was removed succesfully" 10 60
}

function show_already_added_alias_dialog(){
    whiptail --title "Notification" --msgbox "Command $1 already added. Please try another name" 10 60
}

function show_invalid_alias_dialog(){
    whiptail --title "Notification" --msgbox "Command $1 does not exist. Please try again" 10 60
}

function show_empty_alias_dialog(){
    whiptail --title "Notification" --msgbox "$1 name is empty. Please enter again" 10 60
}

function showNotificationAppAlreadyUsed(){
    whiptail --title "Notification" --msgbox "$1 already added. Please select another app" 10 60
}

function showNotificationAppNotInstalled(){
	whiptail --title "Notification" --msgbox "$1 is not installed. Please install and try again." 10 60
}

function show_sucessfully_alias_dialog(){
    whiptail --title "Notification" --msgbox "$1 was succesfully added. Make sure that the application is installed on your pc to run" 10 60
}

function show_progress_bar(){
    {
        for ((i = 0 ; i<=100; i+=25)); do  
		    sleep 0.5;
			echo $i;
		done
	} | whiptail --gauge "Please wait while saving the command" 6 60 0
}

export -f show_exit_dialog show_removed_alias_dialog show_already_added_alias_dialog show_invalid_alias_dialog show_empty_alias_dialog show_sucessfully_alias_dialog