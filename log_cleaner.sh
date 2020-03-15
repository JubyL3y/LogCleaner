#!/bin/bash

CONF_DIR="/etc/LogCleaner/"
DIR_LIST="dirs.list"

function remove_files_from_directory() {
	if (($# < 1)); then
		return
	fi
	Files=`ls $1`
	Dir=$1
	for file in $Files; do
		if [[ -d "$1/$file" ]]; then
			remove_files_from_directory "$1/$file"
		elif [[ -h "$1/$file" ]]; then
			continue
		else
			rm "$1/$file"
		fi
	done
}

if [[ ! -d $CONF_DIR ]] ; then
	mkdir $CONF_DIR
fi

if [[ ! -f $CONF_DIR$DIR_LIST ]] ; then
	echo "/var/log" > $CONF_DIR$DIR_LIST
fi

files_list=()
while IFS= read -r line; do
	files_list+=("$line")
done < "$CONF_DIR$DIR_LIST"


for filename in "${files_list[@]}"; do
	echo "$filename"
	remove_files_from_directory $filename
done