#!/usr/bin/env bash

source ./vars.sh

in_dir="$SCRIPT_DIR/subjects"
out_dir="$SCRIPT_DIR/gz"

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
		out_file="$in_dir/${subject}.gz"
		# -9 Compress better
		# -k Keep input files
		# -t Test compressed file integrity
		# -v Verbose
		gzip -9kv "$in_file"
		gzip -tv "$out_file"
		mv "$out_file" "$out_dir"
	fi
done
echo "Done."
exit
