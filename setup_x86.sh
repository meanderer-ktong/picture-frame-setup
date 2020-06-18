#!/bin/bash
# made for raspbian for x86

sudo apt update && sudo apt -y upgrade
sudo apt install -y xscreensaver unclutter vim
#for broadcom wifi chipsets
#sudo apt install firmware-b43-installer
sudo apt autoremove

#set a shorter timer for grub
sudo sed -i "s/GRUB_TIMEOUT.*/GRUB_TIMEOUT=1/g" /etc/default/grub
sudo update-grub

#disable screensaver to prevent blanking
curl https://raw.githubusercontent.com/meanderer-tech/picture-frame-setup/master/dot_xscreensaver > /home/pi/.xscreensaver

#insert autostart script
echo '@chromium --incognito --autoplay-policy=no-user-gesture-required --check-for-update-interval=604800 --kiosk https://dakboard.com/' >> /etc/xdg/lxsession/LXDE-pi
