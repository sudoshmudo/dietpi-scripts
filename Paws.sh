#!/bin/bash

if test -d ~/git/paws; then
    exit
fi

chmod +x Doppler.sh
./Doppler.sh

# add Github credentials
cd ~/git/dietpi-scripts
apt-get install gettext-base
doppler run -- envsubst < ./Github/.git-credentials > ~/.git-credentials

git config --global user.email "sudoshmudo"
git config --global user.name "sudoshmudo"
git config --global credential.helper 'store --file ~/.git-credentials'

cd ~/git
git clone https://github.com/sudoshmudo/paws.git

cd ~/git/dietpi-scripts
chmod +x AutoTimezone.sh
./AutoTimezone.sh

cd ~/git/paws
doppler setup --no-interactive --config prd

pip3 install -r requirements.txt

apt install raspi-config -y
raspi-config nonint do_i2c 0
raspi-config nonint do_spi 0
echo "dtoverlay=spi0-0cs" | tee -a /boot/firmware/config.txt

echo "reboot needed because of hardware config update"

cp ./Paws/paws.service /etc/systemd/system/paws.service
systemctl daemon-reexec
systemctl daemon-reload
systemctl enable paws.service
systemctl start paws.service
