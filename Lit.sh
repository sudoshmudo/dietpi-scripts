#!/bin/bash

if test -d ~/git/lit; then
    exit
fi

chmod +x Github.sh
./Github.sh

chmod +x Github.sh
./Docker.sh

cd ~/git
git clone https://github.com/sudoshmudo/lit.git

cd lit
sudo doppler setup --no-interactive --config prd
sudo doppler run -- docker-compose up -d
