#!/bin/bash

# file path to videos
VIDEOPATH="/home/pi/tv/MEDIA" 

# path to log file
VLOG='/home/pi/Documents/player.log'

# wait so media is downloaded
sleep 60 

while true; do
        for entry in $VIDEOPATH/*
        do
		#clear
		#echo $entry
		if [ "${entry##*.}" = "mp4" ]; then
			echo $(date) $(basename "$entry") >> $VLOG 2>&1
			omxplayer -o hdmi $entry >> $VLOG 2>&1
		fi
		if [ "${entry##*.}" = "jpg" ]; then
			echo $(date) $(basename "$entry") >> $VLOG 2>&1
			timeout 60 feh -F -Y -Z -x $entry >> $VLOG 2>&1
		fi
        done
done
exit 0;

