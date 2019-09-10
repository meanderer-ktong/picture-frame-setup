#!/bin/bash
apt -y update
apt -y upgrade

apt install -y lightdm
apt install -y --no-install-recommends xserver-xorg
apt install -y --no-install-recommends xinit
apt install -y --no-install-recommends raspberrypi-ui-mods lxsession pi-greeter rpd-icons gtk2-engines-clearlookspix
apt install -y chromium
