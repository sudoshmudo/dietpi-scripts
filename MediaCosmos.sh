#!/bin/bash

if test -d ~/git/media-cosmos; then
    exit
fi

cd cd ~/git/dietpi-scripts
chmod +x Github.sh
./Github.sh

chmod +x Docker.sh
./Docker.sh

cd ~/git
git clone https://github.com/sudoshmudo/media-cosmos.git

cd media-cosmos
doppler setup --no-interactive --config prd
doppler run -- docker compose up -d
