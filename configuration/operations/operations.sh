#!/bin/bash

source ~/fac/configuration/utils/dialogs.sh

function add_ide() {
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

function add_app() {
	echo "$1&" >>~/fac/alias/$ALIAS.sh
	show_sucessfully_alias_dialog "$2"
}

function remove_alias() {
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

function list_created_commands() {
	ARCHIVES=$(ls ~/fac/alias)
	COMMANDS=${ARCHIVES//.sh/''}
	whiptail --title "All created commands" --msgbox --scrolltext "        PRESS KEYBOARD KEY UP OR KEY DOWN TO SCROLL \n$COMMANDS" 10 60
}

export -f add_ide add_app remove_alias list_created_commands


