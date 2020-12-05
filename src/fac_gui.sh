#!/bin/bash
#fac gui

source ~/fac/src/utils/dialogs.sh
source ~/fac/src/utils/fac_utils.sh
source ~/fac/src/operations/operations.sh

function handle_add_url_browser() {
	URL=$(whiptail --title "Select URL" --inputbox "Enter the desire URL:" 10 60 3>&1 1>&2 2>&3)
	EXITSTATUS=$?

	add_browser "$1" "$2" $URL $ALIAS
}

function handle_add_app() {
	add_app "$1" "$2" $ALIAS
}

function handle_add_ide() {
	PATH=$(whiptail --title "$2" --inputbox "Enter the desire path:" 10 60 3>&1 1>&2 2>&3)
	EXITSTATUS=$?

	add_ide "$1" "$2" $PATH $ALIAS
}

function handle_remove_command() {
	ALIAS=$(whiptail --title "Remove Command" --inputbox "Enter the command name:" 10 60 3>&1 1>&2 2>&3)
	EXITSTATUS=$?

	remove_command $ALIAS
}

function startSetup() {

	ARRAY=()
	INPUT=~/fac/src/resources/applications.csv
	OLDIFS=$IFS
	IFS=';'
	COUNT=0
	INDEX=0;

	[ ! -f $INPUT ] && {
		echo "$INPUT file not found"
		exit 99
	}

	while read name type; do
		if [ ! -z $name ] && [ ! -z $type ]; then
			ARRAY[$((COUNT += 1))]="$((INDEX+=1))"
			ARRAY[$((COUNT += 1))]="$name"
		fi
	done <$INPUT
	IFS=$OLDIFS

	ARRAY[$((COUNT += 1))]="$((INDEX+=1))"
	ARRAY[$((COUNT += 1))]="Finalizar"
	

	OPTION=$(whiptail --title "Fac Wizard" --menu "Choose #aplications:" 18 60 11 \
		"${ARRAY[@]}" 3>&1 1>&2 2>&3)

	case $OPTION in
	1)
		handle_add_url_browser "google-chrome" "Google Chrome"
		;;
	2)
		handle_add_url_browser "google-chrome --incognito" "Google Chrome (Anonymous)"
		;;
	3)
		handle_add_url_browser "google-chrome-stable --disable-web-security --user-data-dir=~/.config/google-chrome/Default" "Google Chrome (Security Disabled)"
		;;
	4)
		handle_add_url_browser "firefox" "Mozila Firefox"
		;;
	5)
		handle_add_url_browser "code" "Visual Code"
		;;
	6)
		handle_add_ide "subl" "Sublime"
		;;
	7)
		handle_add_app "libreoffice" "Libre Office"
		;;
	8)
		handle_add_app "gnome-calculator" "Calculator"
		;;
	9)
		handle_add_app "slack" "Slack"
		;;
	10)
		handle_add_app "spotify" "Spotify"
		;;
	11)
		show_progress_bar

		whiptail --title "Finish Add Command" --msgbox "Command succesfuly saved. Please close the terminal to apply the changes" 8 78

		echo " alias $ALIAS='source ~/fac/alias/$ALIAS.sh'" >>~/fac/src/fac_alias.sh

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
		handle_remove_command
		;;
	esac
}

function prepare_enviroment() {
	mkdir ~/fac
	mkdir ~/fac/src
	mkdir ~/fac/alias

	touch ~/fac/src/fac_alias.sh
	cp conf/fac-module.sh ~/fac/src

	echo "source ~/fac/conf/fac_module.sh" >>~/.bashrc
	echo "source ~/fac/conf/fac_alias.sh" >>~/.bashrc
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
