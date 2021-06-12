#!/bin/bash

HOST='ftp.jazzhram.si'
USER='tv@jazzhram.si'
PASS=$(/bin/cat /home/pi/bojan-tv/.password)
DEST='/home/pi/tv/MEDIA/'
REMOT='./tv1/' # SPREMENI GLEDE NA TV!!! tv1, tv2, tv3
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
mkdir $REMOT
cd $REMOT
mdelete *.PNG |yes
lcd $LPATH
mput *.PNG
bye
EOT

# remove local screenshot
rm $LPATH* -f

exit 0;
