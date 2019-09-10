#!/usr/bin/env python3

# requires: driver board with LED power indicators RED and GREEN

# check status of the power LED             
# if it's already on, quit         
# otherwise press the power button, wait and confirm the switch, 
#   if LED is now on, quit, otherwise try again, then quit with error code if it still fails
# GPIO Pin 5 (Green LED), 6 (Red LED), 13 (Power)

from gpiozero import LED, Button
from time import sleep

on_signal = Button(5)
off_signal = Button(6)
