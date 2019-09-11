#!/bin/bash

set -e

# download, chmod, run then delete the file
curl -sSL https://raw.githubusercontent.com/meanderer-tech/picture-frame-setup/master/frame-setup.sh > /home/pi/frame-setup.sh
sudo chmod +x /home/pi/frame-setup.sh
/home/pi/frame-setup.sh
rm /home/pi/frame-setup.sh

sudo reboot
