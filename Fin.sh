#!/bin/bash

if test -d ~/git/fin; then
    exit
fi

cd cd ~/git/dietpi-scripts
chmod +x Github.sh
./Github.sh

chmod +x Docker.sh
./Docker.sh

cd ~/git
git clone https://github.com/sudoshmudo/fin.git

cd fin
sudo doppler setup --no-interactive --config prd
sudo doppler run -- docker compose up -d

sleep 20
sudo doppler run -- docker compose run postgres-backup sh restore.sh
sudo chmod +x ./postgres/update-passwords.sh && sudo doppler run -- ./postgres/update-passwords.sh
