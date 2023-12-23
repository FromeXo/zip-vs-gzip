#!/usr/bin/env bash

source ./vars.sh

clean_path=`echo "$SCRIPT_DIR" | sed 's/\//\\\\\//g'`

awk 'BEGIN {printf "%-33s %-10s %-15s %s\n", "NAME", "SIZE", "BLOCK SIZE", "BLOCKS"}' 

for subject in "${subjects[@]}"
do
    zip_out_file="${SCRIPT_DIR}/zip/${subject:0:-3}zip"
    gz_out_file="${SCRIPT_DIR}/gz/${subject}.gz"
    in_file="${SCRIPT_DIR}/subjects/${subject}"

    stat --format=%n:%s:%B:%b "${in_file}" | sed "s/${clean_path}\/subjects\///g" | awk -F: '{printf "%-33s %-10s %-15s %s\n", $1,$2,$3,$4}'
    stat --format=%n:%s:%B:%b "${zip_out_file}" | sed "s/${clean_path}\/zip\///g" | awk -F: '{printf "%-33s %-10s %-15s %s\n", $1,$2,$3,$4}'
    stat --format=%n:%s:%B:%b "${gz_out_file}" | sed "s/${clean_path}\/gz\///g" | awk -F: '{printf "%-33s %-10s %-15s %s\n", $1,$2,$3,$4}'
    echo "---"

done
echo "Done."
exit



