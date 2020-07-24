#!/bin/bash

ifcontinue=true
wordlen="$1"

while $ifcontinue; do
	dictloc=/usr/share/dict/words

	dictcontents=$(grep -v "'" $dictloc)
	#echo -E Dictionary Contents after Grep: $dictcontents

	if [ -z "$wordlen" ]; then
		#echo No arguments supplied
		:
	else
		#echo Word length: $1
		dictcontents=$(grep "^[A-Za-z]\{$wordlen\}$" <<< $dictcontents)
		#echo Dict Contents Limit String Size: $dictcontents
	fi

	numwords=$(wc -l <<< $dictcontents)
	numwords=$(echo $numwords | cut -d ' ' -f1)
	#echo $numwords
	
	randnum=$(shuf -i 0-$numwords -n 1)
	#echo $randnum

	#randword=$(sed -n "$randnum"p $dictloc)
	randword=$(sed -n "$randnum"p <<< $dictcontents)
	echo $randword

	# -n nchars return only after reading exactly NCHAR characters
	#    unless EOF is encountered or read times out, ignoring
	#    any delimiter
	# -r do not allow backslashes to escape any characters
	# -s do not echo input coming from a terminal
	read -n 1 -r -s keypressed
	numre='^[1-9]+$'
	if [ "$keypressed" = '' ] || [[ $keypressed =~ $numre ]]; then
		wordlen=$keypressed
	else
		ifcontinue=false
	fi
done
