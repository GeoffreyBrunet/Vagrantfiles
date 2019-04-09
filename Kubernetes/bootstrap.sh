#!/bin/sh
#Written by Brunet Geoffrey and helped by Kubernetes documentation.

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

#Kubernetes init
sudo kubeadm config images pull
sudo kubeadm init

#Add kubernetes config files for current user
mkdir -p $HOME/.kube
sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
sudo chown $(id -u):$(id -g) $HOME/.kube/config

#Install Kubernetes dashboard
kubectl apply -f https://raw.githubusercontent.com/kubernetes/dashboard/v1.10.1/src/deploy/recommended/kubernetes-dashboard.yaml

#Enable kubectl proxy for dashboard connexion
#kubectl proxy