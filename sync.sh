#!/bin/bash

# paths for local and remote text files otput
LOCAL='/home/pi/tv/local.txt'
REMOTE='/home/pi/tv/remote.txt'

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
	echo "iscem" $local
  while read -r remote <&4; do
	echo $remote
	if [ "$local" = "$remote" ]; then
		found=true	
		echo $remote
	fi
  done 4<$REMOTE
	if [ $found = false ]; then
		#rm $LPATH$local -f
		echo "brisem" $local
	fi
done 3<$LOCAL

rval=$?
if [ $rval -ne 0 ]; then
    echo "Error: sync with core: " $rval >> $ELOG
fi
exit 0
