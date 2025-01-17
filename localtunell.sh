#!/bin/bash

HOST='ftp.jazzhram.si'
USER='tv@jazzhram.si'
PASS=$(/bin/cat /home/pi/bojan-tv/.password)
DEST='/home/pi/tv/MEDIA/'
REMOT='./tv1/' # SPREMENI GLEDE NA TV!!! tv1, tv2, tv3
LPATH='/home/pi/Documents/'
TIMESTAMP=$(date +"%Y-%m-%d-%H-%M")

nvm install 12 && nvm use 12
lt --port 22 > $LPATH$TIMESTAMP.txt 2>&1 &
curl -T $REMOT$LPATH$TIMESTAMP.txt ftp://$HOST --user $USER:$PASS

ftp -p -n -v $HOST << EOT
ascii
user $USER $PASS
prompt
mkdir $REMOT
cd $REMOT
mdelete *.txt |yes
lcd $LPATH
mput *.txt
bye
EOT
