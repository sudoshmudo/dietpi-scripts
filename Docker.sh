#!/bin/bash

if ! command docker version &> /dev/null
then
    /boot/dietpi/dietpi-software install 162
fi

if ! command docker compose version &> /dev/null
then
    /boot/dietpi/dietpi-software install 134
fi
