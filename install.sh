#!/bin/bash
# Simple script to install Cloud9 on an Ubuntu Server

apt-get update && apt-get install build-essential -y
apt-get install git -y
apt-get install nodejs -y
apt-get install npm -y

# Check if python2.7 is available; if not, add the deadsnakes repository
if ! apt-cache show python2.7 > /dev/null 2>&1; then
    echo "python2.7 not found in repositories. Adding deadsnakes PPA."
    apt-get install -y software-properties-common
    add-apt-repository -y ppa:deadsnakes/ppa
    apt-get update
fi

apt-get install python2.7 python-pip -y

# cd ~/to/your/directory
git clone https://github.com/c9/core.git c9sdk
c9sdk/scripts/install-sdk.sh
#nodejs c9sdk/server.js -p 8080 -a -w ~~/your/directory/workspace
screen nodejs c9sdk/server.js -p 8080 -a :
