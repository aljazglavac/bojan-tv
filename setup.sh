#!/bin/bash

if [ "$EUID" -ne 0 ]
  then echo "Please run as root"
  exit
fi

apt-get install ftp feh omxplayer -y
curl -sL https://raw.githubusercontent.com/AndrewFromMelbourne/raspi2png/master/installer.sh | bash -
echo '\nnetwork={\n\tssid="KRAS"\n\tpsk="inetkras"\n}\n' >> /etc/wpa_supplicant/wpa_supplicant.conf
crontab /home/pi/bojan-tv/mycron
mkdir -p /home/pi/tv/MEDIA/