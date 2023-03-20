#!/bin/bash

if ! command gmediarender --version &> /dev/null
then
    /boot/dietpi/dietpi-software install 163
fi
