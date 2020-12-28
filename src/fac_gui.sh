#!/bin/bash
#Fac Gui

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
	URL=$(whiptail --title "Select path" --inputbox "Enter the desire projet path:" 10 60 3>&1 1>&2 2>&3)
	EXITSTATUS=$?

	add_ide "$1" "$2" $URL $ALIAS
}

function handle_remove_command() {
	ALIAS=$(whiptail --title "Remove Command" --inputbox "Enter the command name:" 10 60 3>&1 1>&2 2>&3)
	EXITSTATUS=$?

	remove_command $ALIAS
}

function startSetup() {

	APPLICATIONS_LIST=()
	APPLICATIONS_NAMES=()
	APPLICATIONS_ALIAS=()
	APPLICATIONS_TYPE=()

	INPUT=~/fac/src/resources/applications.csv
	OLDIFS=$IFS
	IFS=';'

	EXIT_INDEX=0
	COUNT=0
	INDEX=0

	[ ! -f $INPUT ] && {
		echo "$INPUT file not found"
		exit 99
	}

	while read name alias type; do
		if [ ! -z $name ] && [ ! -z $alias ] && [ ! -z $type ]; then
			APPLICATIONS_LIST[$((COUNT += 1))]="$((INDEX += 1))"
			APPLICATIONS_LIST[$((COUNT += 1))]="$name"

			APPLICATIONS_NAMES[$((INDEX))]="$name"
			APPLICATIONS_ALIAS[$((INDEX))]="$alias"
			APPLICATIONS_TYPE[$((INDEX))]="$type"
		fi
	done <$INPUT

	IFS=$OLDIFS

	APPLICATIONS_LIST[$((COUNT += 1))]="$((INDEX += 1))"
	EXIT_INDEX=$INDEX
	APPLICATIONS_LIST[$((COUNT += 1))]="<Save Command>"

	OPTION=$(whiptail --title "Fac" --menu "Choose aplications:" 18 60 11 \
		"${APPLICATIONS_LIST[@]}" 3>&1 1>&2 2>&3)

	echo $OPTION
	echo $EXIT_INDEX

	if [ $OPTION -eq $EXIT_INDEX ]; then
		show_progress_bar

		whiptail --title "Finish Add Command" --msgbox "Command succesfuly saved. Please close the terminal to apply the changes" 8 78

		echo " alias $ALIAS='source ~/fac/alias/$ALIAS.sh'" >>~/fac/src/fac_alias.sh

		exit
	fi

	APPLICATIONS_TYPE_SELECTED="${APPLICATIONS_TYPE[$OPTION]}"

	case $APPLICATIONS_TYPE_SELECTED in
	"BROWSER")
		handle_add_url_browser "${APPLICATIONS_ALIAS[$OPTION]}" "${APPLICATIONS_NAMES[$OPTION]}"
		;;
	"IDE")
		handle_add_ide "${APPLICATIONS_ALIAS[$OPTION]}" "${APPLICATIONS_NAMES[$OPTION]}"
		;;
	"GENERAL")
		handle_add_app "${APPLICATIONS_ALIAS[$OPTION]}" "${APPLICATIONS_NAMES[$OPTION]}"
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
	MENU=$(whiptail --title "Fac" --menu "Select one option:" 15 60 8 "1" "Add new command" \
		"2" "Show all created commands" \
		"3" "Remove command" \
		"4" "Exit" 3>&1 1>&2 2>&3)

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
	4)
		exit
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
	while [ true ]; do
		menu
	done
}
main
