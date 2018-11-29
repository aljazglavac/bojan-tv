#!/bin/bash

HOST='ftpupload.net'
USER='b14_23069204'
PASS='zelenamandarina21'
DEST='/home/pi/tv/MEDIA/'
REMOT='./htdocs/ss/'
LPATH='/home/pi/Pictures/'

TIMESTAMP=$(date +"%Y-%m-%d-%H-%M")

# make screenshot of hdmi output
raspi2png --display hdmi -p $LPATH$TIMESTAMP.PNG
ls $LPATH$TIMESTAMP.PNG

# upload
ftp -p -n -v $HOST << EOT
ascii
user $USER $PASS
prompt
cd $REMOT
mdelete *.PNG |yes
lcd $LPATH
mput *.PNG
bye
EOT

# remove local screenshot
rm $LPATH* -f

exit 0;
