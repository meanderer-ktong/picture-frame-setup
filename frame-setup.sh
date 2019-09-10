#!/bin/bash
apt -y update
apt -y upgrade

apt install -y lightdm
apt install -y xserver-xorg
apt install -y xinit
apt install -y raspberrypi-ui-mods lxsession pi-greeter rpd-icons gtk2-engines-clearlookspix
apt install -y chromium-browser

# TO DO
# ask user if ssh to be enabled, and if enabled ask for password
# enable vnc 
# set locale
# set timezone
# set keyboard layout
# set wifi country
# unset overscan


