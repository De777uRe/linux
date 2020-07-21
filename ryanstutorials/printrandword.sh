#!/bin/bash

ifcontinue=true

while $ifcontinue; do
	dictloc=/usr/share/dict/words

	dictcontents=$(grep -v "'" $dictloc)
	#echo -E Dictionary Contents after Grep: $dictcontents

	if [ -z "$1" ]; then
		echo No arguments supplied
	else
		#echo Word length: $1
		dictcontents=$(grep "^[A-Za-z]\{$1\}$" <<< $dictcontents)
		#echo Dict Contents Limit String Size: $dictcontents
	fi

	numwords=$(wc -l <<< $dictcontents)
	numwords=$(echo $numwords | cut -d ' ' -f1)
	#echo $numwords
	
	randnum=$(shuf -i 0-$numwords -n 1)
	echo $randnum

	#randword=$(sed -n "$randnum"p $dictloc)
	randword=$(sed -n "$randnum"p <<< $dictcontents)
	echo $randword

	# -n nchars return only after reading exactly NCHAR characters
	#    unless EOF is encountered or read times out, ignoring
	#    any delimiter
	# -r do not allow backslashes to escape any characters
	# -s do not echo input coming from a terminal
	read -n 1 -r -s keypressed
	if [ "$keypressed" = '' ]; then
		continue
	else
		ifcontinue=false
	fi
done
