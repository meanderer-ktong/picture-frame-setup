#!/bin/bash

sudo apt install -y xscreensaver unclutter vim

#download xscreensaver config with screensaver already disabled
curl -o ~/.xscreensaver https://raw.githubusercontent.com/meanderer-tech/picture-frame-setup/master/dot_xscreensaver
#download autostart file for chromium (don't forget to change [URL])
sudo curl -o /etc/xdg/lxsession/LXDE-pi/autostart https://raw.githubusercontent.com/meanderer-tech/picture-frame-setup/master/autostart
#download hdmi on and off script
curl -o ~/.rpi-hdmi.sh https://raw.githubusercontent.com/meanderer-tech/picture-frame-setup/master/rpi-hdmi.sh
sudo chmod +x ~/.rpi-hdmi.sh
#download cron config and install it
curl -o crontab https://raw.githubusercontent.com/meanderer-tech/picture-frame-setup/master/crontab
crontab ~/crontab
rm crontab

echo "done"
