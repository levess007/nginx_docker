#!/bin/bash

echo "Docker install for Ubuntu"

sudo apt-get remove docker docker-engine docker-ce docker-ce-cli docker.io
apt-get install apt-transport-https ca-certificates curl gnupg-agent software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
apt-key fingerprint 0EBFCD88
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
apt-get install docker-ce docker-ce-cli containerd.io
docker run hello-world

echo "If hello world run, the install was successful"
