#!/bin/bash

# path to MEDIA
MEDIA='/home/pi/tv/MEDIA'

ELOG='/home/pi/Documents/error.log' # default log file for errors

# find zips and unzip them
for entry in $MEDIA/*
do
	if [ "${entry##*.}" = "zip" ]; then
		unzip -o $entry -d $MEDIA >> $ELOG
		rm $entry -f
	fi
done

rval=$?
if [ $rval -ne 0 ]; then
    echo "Error: sync with core: " $rval >> $ELOG
fi
exit 0

