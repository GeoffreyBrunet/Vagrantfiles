#!/bin/sh
#Written by Brunet Geoffrey

#Verifie operating system is up to date
sudo apt update && sudo apt -y upgrade

#Add java repository
sudo add-apt-repository ppa:webupd8team/java

#Install Java
sudo apt install -y oracle-java8-installer

#Add jenkins repository
wget -q -O - https://pkg.jenkins.io/debian-stable/jenkins.io.key | sudo apt-key add -
sudo apt-add-repository "deb https://pkg.jenkins.io/debian-stable binary/"

#Install jenkins
sudo apt install jenkins