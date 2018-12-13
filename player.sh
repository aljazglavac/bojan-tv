#!/bin/bash

# file path to videos
VIDEOPATH="/home/pi/tv/MEDIA" 

# path to log file
VLOG='/home/pi/Documents/player.log'

# timeout for feh and sleep
SEC=10
MINUTE=60

# wait so media is downloaded
sleep $MINUTE

# check if VIDEOPATH is empty
if [ "$(ls -A $VIDEOPATH)" ]; then
     echo "Playing videos and photos inside $VIDEOPATH" >> $VLOG 2>&1
else
		 exit 0;
fi

# play videos/photos in infinite loop

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
					timeout $SEC feh -F -Y -Z -x $entry >> $VLOG 2>&1
				fi
				if [ "${entry##*.}" = "png" ]; then
					echo $(date) $(basename "$entry") >> $VLOG 2>&1
					timeout $SEC feh -F -Y -Z -x $entry >> $VLOG 2>&1
				fi
				if [ "${entry##*.}" = "jpeg" ]; then
					echo $(date) $(basename "$entry") >> $VLOG 2>&1
					timeout $SEC feh -F -Y -Z -x $entry >> $VLOG 2>&1
				fi
				if [ "${entry##*.}" = "JPG" ]; then
					echo $(date) $(basename "$entry") >> $VLOG 2>&1
					timeout $SEC feh -F -Y -Z -x $entry >> $VLOG 2>&1
				fi
				if [ "${entry##*.}" = "PNG" ]; then
					echo $(date) $(basename "$entry") >> $VLOG 2>&1
					timeout $SEC feh -F -Y -Z -x $entry >> $VLOG 2>&1
				fi
        done
done

exit 0;

