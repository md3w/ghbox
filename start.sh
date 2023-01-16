#!/bin/bash

### Install utilities
sudo apt update && sudo apt install tmux htop;
mkdir -p $HOME/.config/rclone
curl https://rclone.org/install.sh | sudo bash

### Add SSH keys
mkdir ~/.ssh;
echo "$SSH_PUBLIC_KEY" >> ~/.ssh/authorized_keys;

### Install ngrok
curl -sO https://bin.equinox.io/c/bNyj1mQVY4c/ngrok-v3-stable-linux-amd64.tgz;
sudo tar xvzf ngrok-v3-stable-linux-amd64.tgz -C /usr/local/bin;

### Start tunnel
ngrok authtoken $NGROK_TOKEN &> \dev\null;
ngrok tcp 22 &> \dev\null &

### Cleanup
sh $HOME/clean.sh;

wait;
