#!/bin/bash
# this should work for most Debian based Linux distributions on x86 or x64

sudo apt update && sudo apt -y upgrade
sudo apt install xscreensaver unclutter 
#for broadcom wifi chipsets
#sudo apt install firmware-b43-installer
sudo apt autoremove
