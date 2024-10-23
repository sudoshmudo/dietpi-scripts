#!/bin/bash

if test -d ~/git/paws; then
    exit
fi

# add Github credentials
cd ~/git/dietpi-scripts
apt-get install gettext-base
sudo doppler run -- envsubst < ./Github/.git-credentials > ~/.git-credentials

git config --global user.email "sudoshmudo"
git config --global user.name "sudoshmudo"
git config --global credential.helper 'store --file ~/.git-credentials'

cd ~/git
git clone https://github.com/sudoshmudo/paws.git

cd ~/git/dietpi-scripts
chmod +x AutoTimezone.sh
./AutoTimezone.sh

cd ~/git/paws
sudo doppler setup --no-interactive --config prd

pip3 install -r requirements.txt
