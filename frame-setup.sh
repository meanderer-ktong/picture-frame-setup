#!/bin/bash

#variables
locale=en_US.UTF-8
layout=us
country=US
url=fill-me-in

#prompt for remote access
read -p "Do you want to enable remote access (ssh and vnc)? "
if [ "$REPLY" != "${REPLY#[Yy]}" ] ;then
  passwd
else
  echo "Skipping this step"
fi

#install GUI desktop, chromium and python GPIO
apt -y update
apt -y upgrade
apt install -y lightdm
apt install -y xserver-xorg
apt install -y xinit
apt install -y raspberrypi-ui-mods lxsession pi-greeter rpd-icons gtk2-engines-clearlookspix
apt install -y unclutter
apt install -y chromium-browser 
apt install -y python3-gpiozero

#actually enabling remote access
if [ "$REPLY" != "${REPLY#[Yy]}" ] ;then
  apt install -y openssh-server
  systemctl enable ssh
  apt install -y realvnc-vnc-server
  systemctl enable vncserver-X11-serviced
fi

# TO DO
# set locale
raspi-config nonint do_change_locale $locale
raspi-config nonint do_configure_keyboard $layout
raspi-config nonint do_wifi_country $country
raspi-config nonint do_boot_behaviour B4
raspi-config nonint do_overscan 0

#disable screen blanking
sed -i -e '/mode:/ s/:.*/:           off/' /home/pi/.xscreensaver
xscreensaver-command -restart

# modify /etc/xdg/lxsession/LXDE-pi/autostart
#@xset s noblank
#@xset s off
#@xset s -dpms
#@chromium-browser --start-fullscreen [URL]

addr=$(ip a | grep "inet " | grep -v "host lo" | grep -oE "\b([0-9]{1,3}\.){3}[0-9]{1,3}\b" | head -n1)
if [ "$REPLY" != "${REPLY#[Yy]}" ] ;then
  echo "The IP address is $addr, use this address for remote access"
fi



