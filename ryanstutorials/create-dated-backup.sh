#!/bin/bash

requested_file="$1"

if [ -z "$requested_file" ]; then
  echo "Please specify a filename"
else
  echo "Creating backup..."
  current_date=$(date +"%Y-%m-%d")
  new_file_name="$current_date"_$1
  cp $1 $new_file_name
  echo $1 saved to $new_file_name
fi
