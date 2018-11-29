#!/bin/bash

# ftp
HOST='ftpupload.net'
USER='b14_23069204'
PASS='zelenamandarina21'

# paths to remote and destination dirs
RLOC='/htdocs/tv/*'
DLOC='/home/pi/tv/MEDIA/'

# log files
WLOG='/home/pi/Documents/wget.log' # log file for wget
ELOG='/home/pi/Documents/error.log' # default log file for errors

# run wget
wget -Nc --ftp-user=$USER --ftp-password=$PASS ftp://$HOST/$RLOC --directory-prefix=$DLOC --append-output=$WLOG --no-remove-listing

# test if wget returned any errors
rval=$?
if [ $rval -ne 0 ]; then
    echo "Error: wget with core: " $rval >> $ELOG
fi
exit $rval
