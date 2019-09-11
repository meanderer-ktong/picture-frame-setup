# picture-frame-setup

What is this for?
=================
This automates the setup for the client end of a raspberry pi powered, network/cloud enabled picture frame/dashboard. This will setup a raspberry pi from Buster Lite image, install all necessary software and perform most necessary configurations, and then download a few management scripts to be setup in cron. 

How to install this?
--------------------
to use the script (and ignore the whole pipe to shell dangers):
```
curl -L https://git.io/JemY8 | sh
```

alternatively, download the script, make sure the script is complete, then run it
```
wget https://raw.githubusercontent.com/meanderer-tech/picture-frame-setup/master/frame-setup.sh
sudo chmod +x frame-setup.sh
sudo ./frame-setup.sh
```
