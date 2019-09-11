#!/bin/bash

#variables
locale=en_US.UTF-8
layout=us
country=US
url=fill-me-in
timezone='America/New_York'

#should we start?
read -p "This will setup the raspberry pi for Dashboard/Picture Frame. Is this ok? " REPLY
if [ "$REPLY" != "${REPLY#[Yy]}" ] ;then
  break
else
  echo "Bye!"
  exit 1
fi

#prompt for remote access
read -p "Do you want to enable remote access (ssh and vnc)? " REPLY
if [ "$REPLY" != "${REPLY#[Yy]}" ] ;then
  echo "Please change your password now"
  passwd
else
  echo "Skipping this step"
fi

#install GUI desktop, chromium and python GPIO
sudo apt -y update
sudo apt -y upgrade
sudo apt install -y lightdm
sudo apt install -y xserver-xorg
sudo apt install -y xinit
sudo apt install -y raspberrypi-ui-mods lxsession pi-greeter rpd-icons gtk2-engines-clearlookspix
sudo apt install -y vim lxterminal unclutter
sudo apt install -y chromium-browser 
sudo apt install -y python3-gpiozero

#actually enabling remote access
if [ "$REPLY" != "${REPLY#[Yy]}" ] ;then
  sudo apt install -y openssh-server
  sudo systemctl enable ssh
  sudo apt install -y realvnc-vnc-server
  sudo systemctl enable vncserver-x11-serviced
fi

# set locale
export LANGUAGE=en_US.UTF-8
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
sudo locale-gen en_US.UTF-8
sudo raspi-config nonint do_change_locale $locale
sudo raspi-config nonint do_configure_keyboard $layout
sudo raspi-config nonint do_wifi_country $country
sudo raspi-config nonint do_boot_behaviour B4
sudo raspi-config nonint do_overscan 0
# set timezone 
sudo rm /etc/localtime
sudo ln -sf /usr/share/zoneinfo/$timezone /etc/localtime

#disable screen blanking
#sed -i -e '/mode:/ s/:.*/:           off/' /home/pi/.xscreensaver
#xscreensaver-command -restart
#needs to be done in GUI, when the script is run file and services aren't enabled

# modify /etc/xdg/lxsession/LXDE-pi/autostart
#@xset s noblank
#@xset s off
#@xset s -dpms
#@sed -i 's/"exited_cleanly":false/"exited_cleanly":true/' ~/.config/chromium/Local\ State
#@chromium-browser --start-fullscreen [URL]

#cleanup
sudo apt -y --purge autoremove && apt clean

#all done reboot
sudo reboot



