#!/bin/bash
# A simple copy script

echo Running script with PID $$ as $USER on $HOSTNAME

echo Detected $# arguments: $@

cp $1 $2

# Let's verify the copy worked

echo Details for $2
ls -lh $2

sleep 5

echo Name of script: $0

echo Completed with status $? after $SECONDS seconds
echo Final line number: $LINENO
