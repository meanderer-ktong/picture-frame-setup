#!/bin/bash

read -p "Do you want to enable remote access (ssh and vnc)? "
if [ "$REPLY" != "${REPLY#[Yy]}" ] ;then
  passwd
else
  echo "Skipping this step"
fi

apt -y update
apt -y upgrade

apt install -y lightdm
apt install -y xserver-xorg
apt install -y xinit
apt install -y raspberrypi-ui-mods lxsession pi-greeter rpd-icons gtk2-engines-clearlookspix
apt install -y unclutter
apt install -y chromium-browser 
apt install -y python3-gpiozero
 
if [ "$REPLY" != "${REPLY#[Yy]}" ] ;then
  apt install -y openssh-server
  systemctl enable ssh
  apt install -y realvnc-vnc-server
  systemctl enable vncserver-X11-serviced
fi

# TO DO
# set locale
# set timezone
# set keyboard layout
# set wifi country
# unset overscan

#disable screen blanking
# sed -i ~/.xscreensaver "s/mode: */mode: off/"

# modify /etc/xdg/lxsession/LXDE-pi/autostart
#@xset s noblank
#@xset s off
#@xset s -dpms
#@chromium-browser --start-fullscreen [URL]


