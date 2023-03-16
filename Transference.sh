#!/bin/bash

if test -d ~/git/transference; then
    exit
fi

cd ~/git/dietpi-scripts

chmod +x Github.sh
./Github.sh

chmod +x Docker.sh
./Docker.sh

cd ~/git
git clone https://github.com/sudoshmudo/transference.git

cd transference
sudo doppler setup --no-interactive --config prd
sudo doppler run -- docker compose up -d

sleep 20
sudo chmod +x ./postgres/init.sh && sudo doppler run -- ./postgres/init.sh
sudo doppler run -- docker compose run postgres-backup sh restore.sh
sudo chmod +x ./postgres/update-passwords.sh && sudo doppler run -- ./postgres/update-passwords.sh
