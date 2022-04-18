#!/bin/bash

# Doppler
chmod +x Doppler.sh
./Doppler.sh

# CurlFtpFS
chmod +x CurlFtpFS.sh
./CurlFtpFS.sh

if command -v mopidy &> /dev/null
then
    echo "Mopidy already installed"
    exit
fi

# install Mopidy
dietpi-software install 118

# install codecs for mopidy
apt-get install -y gstreamer1.0-plugins-bad

# install mopidy iris
sudo python3 -m pip install Mopidy-Iris

# give iris needed rights
sudo sh -c 'echo "mopidy ALL=NOPASSWD: /usr/local/lib/python3.9/dist-packages/mopidy_iris/system.sh" >> /etc/sudoers'

# install mopidy youtube
sudo python3 -m pip install Mopidy-YouTube
sudo python3 -m pip install --upgrade ytmusicapi
sudo python3 -m pip install youtube_dl

# install mopidy spotify
sudo apt install mopidy-spotify -y

# install mopidy bandcamp
sudo python3 -m pip install Mopidy-Bandcamp

# install mopidy tunein
sudo apt install mopidy-tunein -y
