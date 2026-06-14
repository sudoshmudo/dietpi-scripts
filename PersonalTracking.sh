#!/bin/bash

if test -d ~/git/personal-tracking; then
    exit
fi

cd ~/git/dietpi-scripts
chmod +x Github.sh
./Github.sh

chmod +x Docker.sh
./Docker.sh

cd ~/git
git clone https://github.com/sudoshmudo/personal-tracking.git

cd personal-tracking
doppler setup --no-interactive --config prd
doppler run -- docker compose up -d
