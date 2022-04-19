#!/bin/bash

cd ~/git/dietpi-scripts

chmod +x Doppler.sh
./Doppler.sh

chmod +x Docker.sh
./Docker.sh

# login to Github Container Repository
sudo doppler run --command='echo $GITHUB_TOKEN | docker login ghcr.io -u sudoshmudo --password-stdin'

# add Github credentials
cd ~/git/dietpi-scripts
sudo doppler run -- envsubst < ./Github/.git-credentials > ~/.git-credentials

git config --global user.email "sudoshmudo"
git config --global user.name "sudoshmudo"
git config --global credential.helper 'store --file ~/.git-credentials'
