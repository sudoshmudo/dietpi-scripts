#!/bin/bash

# install python
dietpi-software install 130
apt install python3.11-venv -y && python3 -m venv env --system-site-packages

# install adafruit python lib
source env/bin/activate && sudo pip install --upgrade adafruit-python-shell click

# install git, clone adafruit repo and execute the script
dietpi-software install 17 && mkdir git && cd git && git clone https://github.com/adafruit/Raspberry-Pi-Installer-Scripts.git
cd Raspberry-Pi-Installer-Scripts
sudo python3 adafruit-pitft.py --display=st7789_240x135 --rotation=270 --install-type=console --reboot=no

# add missing screen mapping in the cmdline.txt
truncate -s -1 /boot/firmware/cmdline.txt && echo ' fbcon=map:1 fbcon=font:VGA8x8' >> /boot/firmware/cmdline.txt

echo "reboot is needed for MiniPiTFT to work"
