#!/bin/bash

function addVlc(){
	
}

function addCalculator(){

}

function addLibreOffice(){


}

function addSlack(){


}

function addEclipse(){


}

function addIntelijj(){


}

function addMysqlWorkbench(){

}

function addVisualCode(){


}

function addUrlMozilaNavegator(){

	URL=$(whiptail --title "Select URL" --inputbox "Enter the desire URL:" 10 60 3>&1 1>&2 2>&3)
	existStatus=$?
	if [ $existStatus = 0 ]; then
	 	echo "firefox $URL" >> ~/fac1/$alias.sh
	else
	    echo "You Choose Cancel."
	fi
}
function addUrlGoogleNavegator(){

	URL=$(whiptail --title "Select URL" --inputbox "Enter the desire URL:" 10 60 3>&1 1>&2 2>&3)
	exitStatus=$?

	if [ $exitStatus = 0 ]; then
    	echo "google-chrome $URL" >> ~/fac1/$alias.sh
	else
    	echo "You choose Cancel."
	fi
}

function startSetup (){
	
	OPTION=$(whiptail --title "Fac Wizard" --menu "Choose #aplications:" 15 60 2 \
	"1" "Google Chrome"\
 	"2" "Mozila Firefox"\
	"3" "Visual Code IDE"\
	"4" "Intellij IDE"\
	"5" "Eclipse IDE"\
	"6" "Mysql Workbench"\
	"7" "Slack"\
	"8" "Libre Office"\
	"9" "Calculator"\
	"10" "VLC Player"\
	 
	 3>&1 1>&2 2>&3 )

	case $OPTION in

		1)
			addUrlGoogleNavegator;;
		2) 
			addUrlMozilaNavegator;;

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

if ( whiptail --title "Fac Wizard" --yes-button "Ok" --no-button "Cancel"  --yesno "Welcome to the Fast Automatization Command (fac). Choose Ok to <continue> or <cancel> to exit." 10 60 ); then
    
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

