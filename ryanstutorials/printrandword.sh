#!/bin/bash

ifcontinue=true

while $ifcontinue; do
	numwords=$(wc -l /usr/share/dict/words)
	numwords=$(echo $numwords | cut -d ' ' -f1)
	#echo $numwords
	
	randnum=$(shuf -i 0-$numwords -n 1)
	#echo $randnum

	dictloc=/usr/share/dict/words

	randword=$(sed -n "$randnum"p $dictloc)
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
