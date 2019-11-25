#!/bin/bash

swapoff -a

sudo apt-get update && sudo apt-get install -y apt-transport-https curl
curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add -
cat <<EOF | sudo tee /etc/apt/sources.list.d/kubernetes.list
deb https://apt.kubernetes.io/ kubernetes-xenial main
EOF
sudo apt-get update
sudo apt-get install -y kubelet kubeadm kubectl

if [ $1 = 'master'  ] && [ -n $2 ];
then
	sysctl net.bridge.bridge-nf-call-iptables=1
	kubeadm init --apiserver-advertise-address $2 --ignore-preflight-errors=SystemVerification
	mkdir -p $HOME/.kube
	cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
	chown $(id -u):$(id -g) $HOME/.kube/config
	export kubever=$(kubectl version | base64 | tr -d '\n')
	kubectl apply -f "https://cloud.weave.works/k8s/net?k8s-version=$kubever"
fi
