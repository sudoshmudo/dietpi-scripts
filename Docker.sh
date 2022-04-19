#!/bin/bash

if ! command -v docker &> /dev/null
then
    /boot/dietpi/dietpi-software install 162
fi

if ! command -v docker-compose &> /dev/null
then
    /boot/dietpi/dietpi-software install 134
fi
