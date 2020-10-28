#!/bin/bash
#fac GUI

source ~/fac/configuration/utils/dialogs.sh
source ~/fac/configuration/operations/operations.sh

function add_url_browser() {
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
		add_url_browser "google-chrome" "Google Chrome"
		;;
	2)
		add_url_browser "google-chrome --incognito" "Google Chrome (Anonymous)"
		;;
	3)
		add_url_browser "google-chrome-stable --disable-web-security --user-data-dir=~/.config/google-chrome/Default" "Google Chrome (Security Disabled)"
		;;
	4)
		add_url_browser "firefox" "Mozila Firefox"
		;;
	5)
		add_ide "code" "Visual Code"
		;;
	6)
		add_ide "subl" "Sublime"
		;;
	7)
		add_app "libreoffice" "Libre Office"
		;;
	8)
		add_app "gnome-calculator" "Calculator"
		;;
	9)
		add_app "slack" "Slack"
		;;
	10)
		add_app "spotify" "Spotify"
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

function create_alias() {
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
		create_alias
		if [ -n "$ALIAS" ]; then
			if [ ! -e ~/fac/alias/$ALIAS.sh ]; then
				while [ true ]; do
					if [ ! -d ~/fac ]; then
						prepare_enviroment
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
		list_created_commands
		;;

	3)
		remove_alias
		;;
	esac
}

function prepare_enviroment() {
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
