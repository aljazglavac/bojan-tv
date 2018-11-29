#!/bin/bash

# paths for local and remote text files otput
LOCAL='/home/pi/tv/local.txt'
REMOTE='/home/pi/tv/remote.txt'

# paths to local MEDIA and remote files aka .listing
LPATH='/home/pi/tv/MEDIA/'
RPATH='/home/pi/tv/MEDIA/.listing'

# local path listing
ls -ll $LPATH | tail -n +2 | rev | cut -d ' ' -f 1 | rev > $LOCAL

# remote path listig
cat $RPATH | tail -n +3 | rev | cut -d ' ' -f 1 | rev > $REMOTE

# find and delete files that are in local storage but not on remote 
while read -r local <&3; do
	found=false
  while read -r remote <&4; do
	if [ "$local" = "$remote" ]; then
		found=true	
	fi
  done 4<$REMOTE
	if !  $found; then
		rm $LPATH$local -f
	fi
done 3<$LOCAL
