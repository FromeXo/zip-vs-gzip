#!/usr/bin/env bash

source ./vars.sh

in_dir="$SCRIPT_DIR/subjects"
out_dir="$SCRIPT_DIR/zip"


if [ ! -d "$out_dir" ]; then
	
	echo "Info: ${out_dir} does not exists."
	echo "Attempting to create folder"
	
	mkdir "$out_dir"
	
	if [ -d "$out_dir" ]; then
		echo "Success!"
	else
		echo "Could not create folder."
		echo "Exiting...."
		exit
	fi

fi

for subject in "${subjects[@]}"
do
	echo "#==== ${subject} ====#"
	in_file="$in_dir/$subject"
	if [ ! -f "$in_file"  ]; then
		echo "Error: File ${subject} missing."
	else
	
		out_file="$out_dir/${subject:0:-3}zip"
		# -9 Compress better
		# -T Test zipfile integrity
		zip -9T "$out_file" "$in_file"
	fi
done
echo "Done."
exit
