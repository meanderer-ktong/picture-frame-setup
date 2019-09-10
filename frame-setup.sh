#!/bin/bash
apt -y update
apt -y upgrade

apt install -y lightdm
apt install -y xserver-xorg
apt install -y xinit
apt install -y raspberrypi-ui-mods lxsession pi-greeter rpd-icons gtk2-engines-clearlookspix
apt install -y chromium
