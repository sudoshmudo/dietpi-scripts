#!/bin/bash

if command -v mopidy &> /dev/null
then
    exit
fi

cd ~/git/dietpi-scripts

chmod +x Alsa.sh
./Alsa.sh

chmod +x Doppler.sh
./Doppler.sh

chmod +x CurlFtpFS.sh
./CurlFtpFS.sh

# install Mopidy
/boot/dietpi/dietpi-software install 118

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

# stop mopidy
/boot/dietpi/dietpi-services stop mopidy

# create mopidy config
cd ~/git/dietpi-scripts
doppler run -- envsubst < ./Mopidy/mopidy.conf > /etc/mopidy/mopidy.conf

# start mopidy
/boot/dietpi/dietpi-services start mopidy
