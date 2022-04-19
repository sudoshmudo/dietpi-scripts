#!/bin/bash

if ! command -v aplay &> /dev/null
then
    /boot/dietpi/dietpi-software install 5
fi
