#!/usr/bin/env bash

echo "What is your windows username?"
read username

sourcePath="/mnt/c/Users/$username"
echo "Copying files from $sourcePath/.ssh"
cp -r $sourcePath/.ssh ~/.ssh

echo "Copying git config from $sourcePath/.gitconfig"
cp $sourcePath/.gitconfig ~/.gitconfig

echo "Copying x11 setup from $sourcePath/Configuration/wsl/x11config.sh"
cp $sourcePath/Configuration/wsl/x11config.sh ~/x11config.sh

echo "Copying wsl config from $sourcePath/Configuration/wsl/wsl.conf"
sudo cp $sourcePath/Configuration/wsl/wsl.conf /etc/wsl.conf

echo "Fixing ssh permissions"
chmod 700 ~/.ssh
chmod -R 600 ~/.ssh/id_rsa*
chmod -R 600 ~/.ssh/config