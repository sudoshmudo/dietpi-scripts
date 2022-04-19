#!/bin/bash

./Doppler.sh

./Docker.sh

# login to Github Container Repository
sudo doppler run --command='echo $GITHUB_TOKEN | docker login ghcr.io -u sudoshmudo --password-stdin'

# add Github credentials
sudo doppler run -- envsubst < ./Github/.git-credentials > ~/.git-credentials
