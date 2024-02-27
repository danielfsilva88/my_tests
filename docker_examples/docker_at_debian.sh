#!/bin/bash
# https://www.linuxbabe.com/linux-server/install-docker-on-debian-8-jessie-server

echo "updating"
sudo apt-get update && sudo apt-get upgrade && sudo apt-get dist-upgrade

echo "Add Docker GPG key"
sudo apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D

echo "Create a new source file and add a repo"
sudo nano /etc/apt/sources.list.d/docker.list
deb https://apt.dockerproject.org/repo debian-jessie main

echo "creating https"
sudo apt-get install apt-transport-https ca-certificates

echo "update & install"
sudo apt-get update && sudo apt-get install docker-engine

echo "start docker service"
sudo systemctl start docker

echo "enable auto start"
sudo systemctl enable docker

echo "icing on the cake"
sudo systemctl status docker
