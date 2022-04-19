#!/bin/bash

cd ~/git/dietpi-scripts
chmod +x Alsa.sh
./Alsa.sh

if ! command -v raspotify &> /dev/null
then
    /boot/dietpi/dietpi-software install 167
fi

cd ~/git/dietpi-scripts
cp ./Raspotify/raspotify /etc/default/raspotify
