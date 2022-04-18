#!/bin/bash

if command -v curlftpfs &> /dev/null
then
    echo "CurlFtpFS already installed"
    exit
fi

# Doppler
chmod +x Doppler.sh
./Doppler.sh

# install CurlFtpFS
sudo apt-get install curlftpfs -y

# set environment of repo
sudo doppler setup --no-interactive --config prd

# create a ftp_music folder for mounting remote FTP folder
sudo mkdir /mnt/music

# create mounting service
sudo doppler run -- envsubst < ./CurlFtpFS/mnt-music.mount > /etc/systemd/system/mnt-music.mount

# start mounting service
sudo systemctl enable mnt-music.mount

# create auto-mounting service
sudo cp ./CurlFtpFS/mnt-music.automount /etc/systemd/system/mnt-music.automount

# start auto-mounting service
sudo systemctl enable mnt-music.automount
