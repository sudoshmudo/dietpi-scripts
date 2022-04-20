#!/bin/bash

cd ~/git/dietpi-scripts

# disable built-in audio card
cp ./Alsa/alsa-blacklist.conf /etc/modprobe.d/alsa-blacklist.conf

# set USB audio card as a default one
cp ./Alsa/alsa-base.conf /etc/modprobe.d/alsa-base.conf

if ! command -v aplay &> /dev/null
then
    /boot/dietpi/dietpi-software install 5
fi
