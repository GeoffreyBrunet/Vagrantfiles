#!/bin/sh
#Written by Brunet Geoffrey and helped by Docker documentation.

#Verifie operating system is up to date
sudo apt update && sudo apt -y upgrade

#Install packages to allow apt to use a repository over HTTPS:
sudo apt-get install -y apt-transport-https ca-certificates curl gnupg-agent software-properties-common

#Add Docker’s official GPG key:
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

#Add Docker repository
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"

#Update repositories
sudo apt update

#Install Docker CE
sudo apt install -y docker-ce docker-ce-cli containerd.io

#Add kubernetes repository
curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add -

#Print if repository was add in sources.list
sudo cat <<EOF >/etc/apt/sources.list.d/kubernetes.list
deb https://apt.kubernetes.io/ kubernetes-xenial main
EOF

#Install Kubernetes and Kubernetes CLI
sudo apt update
sudo apt install -y kubelet kubeadm kubectl
sudo apt-mark hold kubelet kubeadm kubectl