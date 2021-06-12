#!/bin/bash

if [ "$EUID" -ne 0 ]
  then echo "Please run as root"
  exit
fi

apt-get update -y
apt-get upgrade -y
apt-get install ftp feh omxplayer supervisor -y
curl -sL https://raw.githubusercontent.com/AndrewFromMelbourne/raspi2png/master/installer.sh | bash -
echo '\nnetwork={\n\tssid="KRAS"\n\tpsk="inetkras"\n}\n' >> /etc/wpa_supplicant/wpa_supplicant.conf
echo 'xserver-command=X -s 0 -p 0 -dpms' >> /etc/lightdm/lightdm.conf
cp /home/pi/bojan-tv/setenv.sh /etc/profile.d/
crontab /home/pi/bojan-tv/mycron
mkdir -p /home/pi/tv/MEDIA/
pcmanfm --set-wallpaper /home/pi/bojan-tv/bg.png
