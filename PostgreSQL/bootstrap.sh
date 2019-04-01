#!/bin/sh
#Written by Brunet Geoffrey and helped by PostgreSQL documentation

#Verifie operating system is up to date
sudo apt update && sudo apt -y upgrade

#Install PostgreSQL by offical ubuntu repository
sudo apt install -y postgresql postgresql-contrib
