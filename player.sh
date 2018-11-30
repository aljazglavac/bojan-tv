#!/bin/bash

# file path to videos
VIDEOPATH="/home/pi/tv/MEDIA" 

# path to log file
VLOG='/home/pi/Documents/player.log'

# timeout for feh and sleep
MINUTE=60

# wait so media is downloaded
sleep $MINUTE 

while true; do
        for entry in $VIDEOPATH/*
        do
				if [ "${entry##*.}" = "mp4" ]; then
					echo $(date) $(basename "$entry") >> $VLOG 2>&1
					omxplayer -o hdmi $entry >> $VLOG 2>&1
				fi
				if [ "${entry##*.}" = "mov" ]; then
					echo $(date) $(basename "$entry") >> $VLOG 2>&1
					omxplayer -o hdmi $entry >> $VLOG 2>&1
				fi
				if [ "${entry##*.}" = "jpg" ]; then
					echo $(date) $(basename "$entry") >> $VLOG 2>&1
					timeout $MINUTE*5 feh -F -Y -Z -x $entry >> $VLOG 2>&1
				fi
				if [ "${entry##*.}" = "png" ]; then
					echo $(date) $(basename "$entry") >> $VLOG 2>&1
					timeout $MINUTE*5 feh -F -Y -Z -x $entry >> $VLOG 2>&1
				fi
				if [ "${entry##*.}" = "jpeg" ]; then
					echo $(date) $(basename "$entry") >> $VLOG 2>&1
					timeout $MINUTE*5 feh -F -Y -Z -x $entry >> $VLOG 2>&1
				fi
				if [ "${entry##*.}" = "JPG" ]; then
					echo $(date) $(basename "$entry") >> $VLOG 2>&1
					timeout $MINUTE*5 feh -F -Y -Z -x $entry >> $VLOG 2>&1
				fi
				if [ "${entry##*.}" = "PNG" ]; then
					echo $(date) $(basename "$entry") >> $VLOG 2>&1
					timeout $MINUTE*5 feh -F -Y -Z -x $entry >> $VLOG 2>&1
				fi
        done
done

exit 0;

