#!/bin/bash

if test -d ~/git/beige; then
    exit
fi

cd cd ~/git/dietpi-scripts
chmod +x Github.sh
./Github.sh

chmod +x Docker.sh
./Docker.sh

cd ~/git
git clone https://github.com/sudoshmudo/beige.git

cd beige
sudo doppler setup --no-interactive --config prd
sudo doppler run -- docker compose up -d
