#!/bin/bash

if test -d ~/git/proxy; then
    exit
fi

cd ~/git/dietpi-scripts

chmod +x Github.sh
./Github.sh

chmod +x Docker.sh
./Docker.sh

cd ~/git
git clone https://github.com/sudoshmudo/proxy.git

cd proxy
sudo doppler run -- envsubst < ./ddclient/ddclient.conf.template > ./ddclient/ddclient.conf
sudo doppler setup --no-interactive --config prd
sudo doppler run -- docker-compose up -d
