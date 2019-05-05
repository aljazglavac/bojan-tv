#!/bin/bash

sudo apt-get install ftp feh omxplayer -y
sudo curl -sL https://raw.githubusercontent.com/AndrewFromMelbourne/raspi2png/master/installer.sh | bash -
sudo echo '\nnetwork={\n\tssid="KRAS"\n\tpsk="inetkras"\n}\n' >> sudo /etc/wpa_supplicant/wpa_supplicant.conf
sudo crontab /home/pi/bojan-tv/mycron
sudo mkdir -p /home/pi/tv/MEDIA/