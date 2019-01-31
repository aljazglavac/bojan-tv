#!/bin/bash


HOST='ftpupload.net'
USER='b14_23069204'
PASS=$(/bin/cat /home/pi/bojan-tv/.password)

# paths to remote and destination dirs
RLOC='/htdocs/tv/*'
DLOC='/home/pi/tv/MEDIA/'

# ftp
#HOST='ftp.drivehq.com '
#USER='ftptv'
#PASS=$(/bin/cat /home/pi/bojan-tv/.password)

# paths to remote and destination dirs
#RLOC='./tv/*'
#DLOC='/home/pi/tv/MEDIA/'

# log files
WLOG='/home/pi/Documents/wget.log' # log file for wget
ELOG='/home/pi/Documents/error.log' # default log file for errors

# run wget
wget -Nc --ftp-user=$USER --ftp-password=$PASS ftp://$HOST$RLOC --directory-prefix=$DLOC --append-output=$WLOG --no-remove-listing

# test if wget returned any errors
retval=$?
if [ $retval -ne 0 ]; then
    echo "Error: wget with code: " $retval >> $ELOG
fi
exit $retval
