#!/bin/bash

ifcontinue=true
wordlen="$1"

while $ifcontinue; do
	dictloc=/usr/share/dict/words

	dictcontents=$(grep -v "'" $dictloc)

	if [ -z "$wordlen" ]; then
		:
	else
		# Retrieve words within specified length from dictionary
		dictcontents=$(grep "^[A-Za-z]\{$wordlen\}$" <<< $dictcontents)
	fi

	# Determine how many results we received from grep
	numwords=$(wc -l <<< $dictcontents)
	numwords=$(echo $numwords | cut -d ' ' -f1)
	
	# Generate random number given number of words to choose from
	randnum=$(shuf -i 1-$numwords -n 1)

	randword=$(sed -n "$randnum"p <<< $dictcontents)
	echo $randword

	# -n nchars return only after reading exactly NCHAR characters
	#    unless EOF is encountered or read times out, ignoring
	#    any delimiter
	# -r do not allow backslashes to escape any characters
	# -s do not echo input coming from a terminal
	read -n 1 -r -s keypressed
	# Regex to detect user specifying new word length
	numre='^[1-9]+$'
	if [ "$keypressed" = '' ] || [[ $keypressed =~ $numre ]]; then
		wordlen=$keypressed
	else
		ifcontinue=false
	fi
done
