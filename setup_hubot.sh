#!/bin/bash

if [ $# == 0 ];
then
  echo "Usage: bash setup_hubot.sh <hubot_dir_name> " 
  exit 1
fi

set -x

DIR_NAME=$1

WORKING_DIR=$PWD
HUBOT_DIR=$HOME/$DIR_NAME

# Install Nodejs
curl -sL https://deb.nodesource.com/setup_6.x | sudo -E bash -
sudo apt install -y nodejs

# Install Hubot
sudo npm install -g yo generator-hubot

# Setup Hubot scripts
mkdir $HUBOT_DIR && cd $HUBOT_DIR && yo hubot --adapter matteruser
cp $WORKING_DIR/tools/run.sh $HUBOT_DIR && chmod +x $HUBOT_DIR/run.sh
cp $WORKING_DIR/tools/env.sh $HUBOT_DIR
cp $WORKING_DIR/scripts/* $HOME/$DIR_NAME/scripts/
