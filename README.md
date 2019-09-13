# picture-frame-setup

What is this for?
=================
This automates the setup for the client end of a raspberry pi powered, network/cloud enabled picture frame/dashboard. This will setup a raspberry pi from Buster Lite image, install all necessary software and perform most necessary configurations, and then download a few management scripts to be setup in cron. 

How to install this?
--------------------
to use the script (and ignore the whole pipe to root shell dangers):
```
curl -sSL https://git.io/JemY8 > frame-setup.sh && bash frame-setup.sh 
```
for those with US keyboards and having a hard time typing in the pipe initially, do this first
```
raspi-config nonint do_configure_keyboard us
```

alternatively, download the script, make sure the script is complete, then run it
```
wget https://raw.githubusercontent.com/meanderer-tech/picture-frame-setup/master/frame-setup.sh
sudo chmod +x frame-setup.sh
sudo ./frame-setup.sh
```
Credits
-------
This project won't be possible without pointers from the following resources:
DAKboard - https://blog.dakboard.com/diy-wall-display/
Ethan Seyl - https://gist.github.com/quelleck/1d8fc8395fd52d4aa38a99ef46d8598e


