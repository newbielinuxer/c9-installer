#!/bin/bash
# Simple script to install Cloud9 on an Ubuntu Server

apt-get update && apt-get install build-essential -y
apt-get install git -y
apt-get install nodejs -y
apt-get install npm -y
apt-get install python2.7 python-pip -y

# cd ~/to/your/directory
git clone https://github.com/c9/core.git c9sdk
c9sdk/scripts/install-sdk.sh
#nodejs c9sdk/server.js -p 8080 -a -w ~~/your/directory/workspace
screen nodejs c9sdk/server.js -p 8080 -a :
