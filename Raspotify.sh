#!/bin/bash

# install Raspotify
dietpi-software install 167

# copy config file
cp ./Raspotify/raspotify /etc/default/raspotify
