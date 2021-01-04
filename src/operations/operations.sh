#!/bin/bash

source ~/.fac/src/utils/dialogs.sh

function add_ide() {
	if [ -n "$3" ]; then
		if [ $EXITSTATUS = 0 ]; then
			echo "$1 $3&" >>~/.fac/alias/$4.sh
			show_sucessfully_alias_dialog "$2"
		fi
	else
		show_empty_alias_dialog
	 'Url'
	fi
}

function add_browser() {
	if [ -n "$3" ]; then
		if [ $EXITSTATUS = 0 ]; then
			echo "$1 $3&" >>~/.fac/alias/$4.sh
			show_sucessfully_alias_dialog "$2"
		fi
	else
		show_empty_alias_dialog
	 'Url'
	fi
}

function add_app() {
	if [ -n "$3" ]; then
		echo $1 >>~/.fac/alias/$3.sh
		show_sucessfully_alias_dialog "$2"
	else
		show_empty_alias_dialog
	fi
}

function remove_command() {
	if [ -e ~/.fac/alias/$1.sh ]; then
		rm ~/.fac/alias/$1.sh
		sed -i "/$1.sh/d" ~/.fac/src/fac_alias.sh
		show_removed_alias_dialog "$1"
		exit
	else
		show_invalid_alias_dialog "$1"
	fi
}

function list_created_commands() {
	ARCHIVES=$(ls ~/.fac/alias)
	COMMANDS=${ARCHIVES//.sh/''}
	whiptail --title "All created commands" --msgbox --scrolltext "        PRESS KEYBOARD KEY UP OR KEY DOWN TO SCROLL \n$COMMANDS" 10 60
}

export -f add_ide add_app remove_command list_created_commands
