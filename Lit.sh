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
doppler setup --no-interactive --config prd
doppler run -- docker compose up -d

sleep 20
sudo chmod +x ./postgres/init.sh && doppler run -- ./postgres/init.sh
doppler run -- docker compose run postgres-backup sh restore.sh
sudo chmod +x ./postgres/update-passwords.sh && doppler run -- ./postgres/update-passwords.sh
