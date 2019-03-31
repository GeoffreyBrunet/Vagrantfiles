#!/bin/sh
#Written by Brunet Geoffrey and helped by Nagios documentation.

#INSTALL NAGIOS
#Verifie server is up to date
sudo apt update && sudo apt -y upgrade

#Prerequisites
sudo apt install -y autoconf gcc libc6 make wget unzip apache2 php libapache2-mod-php7.2 libgd-dev

#Downloading the Source
cd /tmp
wget -O nagioscore.tar.gz https://github.com/NagiosEnterprises/nagioscore/archive/nagios-4.4.3.tar.gz
tar xzf nagioscore.tar.gz

#Compile
cd /tmp/nagioscore-nagios-4.4.3/
sudo ./configure --with-httpd-conf=/etc/apache2/sites-enabled
sudo make all

#Create User And Group
sudo make install-groups-users
sudo usermod -a -G nagios www-data

#Install Binaries
sudo make install

#Install Service / Daemon
sudo make install-daemoninit

#Install Command Mode
sudo make install-commandmode

#Install Configuration Files
sudo make install-config

#Install Apache Config Files
sudo make install-webconf
sudo a2enmod rewrite
sudo a2enmod cgi

#Create nagiosadmin User Account, replace PASSWORD by password for nagiosadmin
sudo htpasswd -b -c /usr/local/nagios/etc/htpasswd.users nagiosadmin PASSWORD

#Start Apache Web Server
sudo systemctl restart apache2.service

#Start Service / Daemon
sudo systemctl start nagios.service

#INSTALL NAGIOS PLUGINS
#Prerequisites
sudo apt install -y autoconf libmcrypt-dev libssl-dev bc gawk dc build-essential snmp libnet-snmp-perl gettext

#Downloading The Source
cd /tmp
wget --no-check-certificate -O nagios-plugins.tar.gz https://github.com/nagios-plugins/nagios-plugins/archive/release-2.2.1.tar.gz
tar zxf nagios-plugins.tar.gz

#Compile + Install
cd /tmp/nagios-plugins-release-2.2.1/
sudo ./tools/setup
sudo ./configure
sudo make
sudo make install

#Start Service / Daemon
sudo systemctl start nagios.service