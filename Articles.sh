#!/bin/bash

if test -d ~/git/articles; then
    exit
fi

cd ~/git/dietpi-scripts
chmod +x Github.sh
./Github.sh

chmod +x Docker.sh
./Docker.sh

cd ~/git
git clone https://github.com/sudoshmudo/articles.git

cd articles
sudo doppler setup --no-interactive --config prd
sudo doppler run -- docker compose up -d
