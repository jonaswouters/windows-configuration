#!/usr/bin/env bash

echo "What is your windows username?"
read username

sourcePath="/mnt/c/Users/$username/.ssh"
echo "Copying files from $sourcePath"
cp -r $sourcePath ~/.ssh

echo "Fixing ssh permissions"
chmod 700 ~/.ssh
chmod -R 600 ~/.ssh/id_rsa*
chmod -R 600 ~/.ssh/config