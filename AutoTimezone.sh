#!/bin/bash

timezone=$(curl https://ipinfo.io/timezone)

rm /etc/localtime
ln -s "/usr/share/zoneinfo/$timezone" /etc/localtime
dpkg-reconfigure -f noninteractive tzdata
