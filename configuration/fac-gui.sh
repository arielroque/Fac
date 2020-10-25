#!/bin/bash
#fac GUI

source ~/fac/configuration/utils/dialogs.sh

function addIde() {
	URL=$(whiptail --title "$2" --inputbox "Enter the desire path:" 10 60 3>&1 1>&2 2>&3)
	EXITSTATUS=$?

	if [ -n "$URL" ]; then
		if [ $EXITSTATUS == 0 ]; then
			echo "$1 $URL&" >>~/fac/alias/$ALIAS.sh
			show_sucessfully_alias_dialog "$2"
		fi
	else
		show_empty_alias_dialog
	 'Path'
	fi
}

function addApp() {
	echo "$1&" >>~/fac/alias/$ALIAS.sh
	show_sucessfully_alias_dialog "$2"
}

function addUrlBrowser() {
	URL=$(whiptail --title "Select URL" --inputbox "Enter the desire URL:" 10 60 3>&1 1>&2 2>&3)
	EXITSTATUS=$?

	if [ -n "$URL" ]; then
		if [ $EXITSTATUS = 0 ]; then
			echo "$1 $URL&" >>~/fac/alias/$ALIAS.sh
			show_sucessfully_alias_dialog "$2"
		fi
	else
		show_empty_alias_dialog
	 'Url'
	fi
}

function startSetup() {
	OPTION=$(whiptail --title "Fac Wizard" --menu "Choose #aplications:" 18 60 11 \
		"1" "Google Chrome url" \
		"2" "Google Chrome url (Anonymous)" \
		"3" "Google Chrome url (Security Disable)" \
		"4" "Mozila Firefox url" \
		"5" "Visual Code project" \
		"6" "Sublime Ide project" \
		"7" "Libre Office" \
		"8" "Calculator" \
		"9" "Slack" \
		"10" "Spotify" \
		"11" "Save the command" 3>&1 1>&2 2>&3)

	case $OPTION in
	1)
		addUrlBrowser "google-chrome" "Google Chrome"
		;;
	2)
		addUrlBrowser "google-chrome --incognito" "Google Chrome (Anonymous)"
		;;
	3)
		addUrlBrowser "google-chrome-stable --disable-web-security --user-data-dir=~/.config/google-chrome/Default" "Google Chrome (Security Disabled)"
		;;
	4)
		addUrlBrowser "firefox" "Mozila Firefox"
		;;
	5)
		addIde "code" "Visual Code"
		;;
	6)
		addIde "subl" "Sublime"
		;;
	7)
		addApp "libreoffice" "Libre Office"
		;;
	8)
		addApp "gnome-calculator" "Calculator"
		;;
	9)
		addApp "slack" "Slack"
		;;
	10)
		addApp "spotify" "Spotify"
		;;
	11)
		show_progress_bar

		whiptail --title "Finish Add Command" --msgbox "Command succesfuly saved. Please close the terminal to apply the changes" 8 78

		echo " alias $ALIAS='source ~/fac/alias/$ALIAS.sh'" >>~/fac/configuration/fac-alias.sh

		exit
		;;
	*)
		show_edit_dialog
		;;
	esac

	EXITSTATUS=$?

	if [ $EXITSTATUS = 0 ]; then
		echo "teste"
	else
		exit
	fi
}

function removeAlias() {
	ALIAS=$(whiptail --title "Remove Command" --inputbox "Enter the command name:" 10 60 3>&1 1>&2 2>&3)
	EXITSTATUS=$?
	if [ -e ~/fac/alias/$ALIAS.sh ]; then
		rm ~/fac/alias/$ALIAS.sh
		sed -i "/$ALIAS.sh/d" ~/.bashrc
		show_removed_alias_dialog "$ALIAS"
	else
		show_invalid_alias_dialog "$ALIAS"
	fi
}

function listCreatedCommands() {
	ARCHIVES=$(ls ~/fac/alias)
	COMMANDS=${ARCHIVES//.sh/''}
	whiptail --title "All created commands" --msgbox --scrolltext "        PRESS KEYBOARD KEY UP OR KEY DOWN TO SCROLL \n$COMMANDS" 10 60
}

function createAlias() {
	ALIAS=$(whiptail --title "Create command" --inputbox "Enter the command name:" 10 60 3>&1 1>&2 2>&3)
	EXITSTATUS=$?
}

function menu() {
	MENU=$(whiptail --title "Menu" --menu "Select one option:" 15 60 8 "1" "Add new command" \
		"2" "Show all created commands" \
		"3" "Remove command" 3>&1 1>&2 2>&3)

	EXITSTATUS=$?
	if [ $EXITSTATUS == 1 ]; then
		exit
	fi

	case $MENU in

	1)
		createAlias
		if [ -n "$ALIAS" ]; then
			if [ ! -e ~/fac/alias/$ALIAS.sh ]; then
				while [ true ]; do
					if [ ! -d ~/fac ]; then
						prepareAmbience
					fi
					startSetup
				done
			else
				show_already_added_alias_dialog
			fi

		else
			show_empty_alias_dialog
		 'Command'
			main
		fi
		;;
	2)
		listCreatedCommands
		;;

	3)
		removeAlias
		;;
	esac
}

function prepareAmbience() {
	mkdir ~/fac
	mkdir ~/fac/conf
	mkdir ~/fac/alias
	touch ~/fac/conf/fac-alias.sh
	cp conf/fac-module.sh ~/fac/conf
	echo "source ~/fac/conf/fac-module.sh" >>~/.bashrc
	echo "source ~/fac/conf/fac-alias.sh" >>~/.bashrc
}

function main() {
	if (whiptail --title "Fac Wizard" --yes-button "Ok" --no-button "Cancel" --yesno "Welcome to the Fast Automatization Command (FAC). Choose <Ok> to continue or <cancel> to exit." 10 60); then
		while [ true ]; do
			menu
		done
	else
		exit
	fi
}
main
