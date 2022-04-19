#!/bin/bash

chmod +x Doppler.sh
./Doppler.sh

chmod +x Docker.sh
./Docker.sh

# login to Github Container Repository
sudo doppler run --command='echo $GITHUB_TOKEN | docker login ghcr.io -u sudoshmudo --password-stdin'

# add Github credentials
sudo doppler run -- envsubst < ./Github/.git-credentials > ~/.git-credentials

git config user.email "sudoshmudo"
git config user.name "sudoshmudo"
git config credential.helper 'store --file ~/.git-credentials'