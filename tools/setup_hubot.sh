#!/bin/bash

set -x

DIR_NAME $1

# Install Nodejs
curl -sL https://deb.nodesource.com/setup_6.x | sudo -E bash -
sudo apt install -y nodejs

# Install Hubot
npm install -g yo generator-hubot

# Setup Hubot scripts
mkdir $HOME/$DIR_NAME && cd $HOME/$DIR_NAME
yo hubot --adapter matteruser
