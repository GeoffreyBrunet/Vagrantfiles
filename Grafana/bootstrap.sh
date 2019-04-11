#!/bin/sh
#Written by Brunet Geoffrey and helped by Docker documentation.

#Verifie operating system is up to date
sudo apt update && sudo apt -y upgrade

#Add Grafana repository
sudo add-apt-repository "deb https://packages.grafana.com/oss/deb stable main"
curl https://packages.grafana.com/gpg.key | sudo apt-key add -

#Install Grafana
sudo apt update
sudo apt install -y grafana apt-transport-https

#Start and enable at boot Grafana
systemctl daemon-reload
systemctl start grafana-server
sudo systemctl enable grafana-server.service

#Install Grafana plugins
sudo grafana-cli plugins install alexanderzobnin-zabbix-app
sudo systemctl restart grafana-server