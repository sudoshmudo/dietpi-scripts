#!/bin/bash

if test -d ~/git/lit; then
    exit
fi

cd ~/git/dietpi-scripts

chmod +x Github.sh
./Github.sh

chmod +x Docker.sh
./Docker.sh

cd ~/git
git clone https://github.com/sudoshmudo/lit.git

cd lit
sudo doppler setup --no-interactive --config prd
sudo doppler run -- docker-compose up -d

sudo doppler run -- docker-compose run postgres-backup sh restore.sh
sudo chmod +x ./postgres/update-passwords.sh && sudo doppler run -- ./postgres/update-passwords.sh
