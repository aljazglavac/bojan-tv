#!/bin/bash

# paths for local and remote text files otput
REMOTE='/home/pi/tv/remote.txt'

# path to MEDIA
MEDIA='/home/pi/tv/MEDIA/'

ELOG='/home/pi/Documents/error.log' # default log file for errors

# find zips and unzip them
while read -r media <&3; do
	if [ "${media##*.}" = "zip" ]; then
		unzip $MEDIA$media >> $ELOG
	fi
done 3<$REMOTE

rval=$?
if [ $rval -ne 0 ]; then
    echo "Error: sync with core: " $rval >> $ELOG
fi
exit 0

