#!/bin/bash

if test -d ~/git/paws; then
    exit
fi

cd ~/git/dietpi-scripts
chmod +x Github.sh
./Github.sh

cd ~/git
git clone https://github.com/sudoshmudo/paws.git

cd ~/git/dietpi-scripts
chmod +x AutoTimezone.sh
./AutoTimezone.sh

cd paws
sudo doppler setup --no-interactive --config prd
