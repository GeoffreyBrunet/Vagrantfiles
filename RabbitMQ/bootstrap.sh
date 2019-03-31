#!/bin/sh
#Written by Brunet Geoffrey and helped by RabbitMQ documentation.

#Verifie operating system is up to date
sudo apt update && sudo apt -y upgrade

#Import PackageCloud signing key
wget -O - "https://packagecloud.io/rabbitmq/rabbitmq-server/gpgkey" | sudo apt-key add -

#Enable HTTPS transport
sudo apt-get install apt-transport-https

#Add a Source List File
echo "deb https://dl.bintray.com/rabbitmq/debian bionic main" | sudo tee /etc/apt/sources.list.d/bintray.rabbitmq.list

#Install RabbitMQ Package
sudo apt update
sudo apt install -y rabbitmq-server

#Install web-app plugin (default port is 15672)
sudo rabbitmq-plugins enable rabbitmq_management