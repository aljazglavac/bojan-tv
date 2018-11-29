#!/bin/bash

# paths for local and remote text files otput
LOCAL='/home/pi/tv/local.txt'
REMOTE='/home/pi/tv/remote.txt'

# path to MEDIA
MEDIA='/home/pi/tv/MEDIA/'

# paths to local MEDIA and remote files aka .listing
LPATH='/home/pi/tv/MEDIA/'
RPATH='/home/pi/tv/MEDIA/.listing'

ELOG='/home/pi/Documents/error.log' # default log file for errors

# local path listing
ls -ll $LPATH | tail -n +2 | rev | cut -d ' ' -f 1 | rev > $LOCAL

rval=$?
if [ $rval -ne 0 ]; then
    echo "Error: ls with core: " $rval >> $ELOG
fi

# remote path listig
cat $RPATH | tail -n +3 | rev | cut -d ' ' -f 1 | rev | tr -d '\r' > $REMOTE

rval=$?
if [ $rval -ne 0 ]; then
    echo "Error: cat with core: " $rval >> $ELOG
fi

# find and delete files that are in local storage but not on remote 
while read -r local <&3; do
	found=false
  while read -r remote <&4; do
	if [ "$local" = "$remote" ]; then
		found=true	
	fi
  done 4<$REMOTE
	if [ $found = false ]; then
		rm $MEDIA$local -f
	fi
done 3<$LOCAL

rval=$?
if [ $rval -ne 0 ]; then
    echo "Error: sync with core: " $rval >> $ELOG
fi
exit 0
