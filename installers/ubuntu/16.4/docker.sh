#!/usr/bin/env bash

# Works on Ubuntu 16.4

source "`dirname $0`/config.sh"

set -e

# https://www.digitalocean.com/community/tutorials/how-to-install-and-use-docker-on-ubuntu-16-04

COMPOSE_VERSION=1.7.1

# docker compose first
curl -L https://github.com/docker/compose/releases/download/$COMPOSE_VERSION/docker-compose-`uname -s`-`uname -m` > /tmp/docker-compose
sudo mv /tmp/docker-compose /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose

# docker

sudo apt-get install apt-transport-https ca-certificates

sudo apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D

echo "deb https://apt.dockerproject.org/repo ubuntu-xenial main" | sudo tee /etc/apt/sources.list.d/docker.list

sudo apt-get -y update
sudo apt-get -y purge lxc-docker

apt-cache policy docker-engine
# sudo apt-get install linux-image-extra-$(uname -r)

sudo apt-get install -y docker-engine
sudo systemctl status docker

# sudo groupadd docker
sudo usermod -aG docker $(whoami)

