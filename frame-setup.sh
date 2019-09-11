#!/bin/bash
apt -y update
apt -y upgrade

apt install -y lightdm
apt install -y xserver-xorg
apt install -y xinit
apt install -y raspberrypi-ui-mods lxsession pi-greeter rpd-icons gtk2-engines-clearlookspix
apt install -y unclutter
apt install -y chromium-browser 
apt install -y openssh-server
systemctl enable ssh
apt install -y realvnc-vnc-server
systemctl enable vnc

# TO DO
# ask user if ssh to be enabled, and if enabled ask for password
# enable vnc 
# set locale
# set timezone
# set keyboard layout
# set wifi country
# unset overscan


