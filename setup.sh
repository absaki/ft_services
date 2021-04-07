#!/bin/bash

# Start minikube
cd `dirname $0`
read -p "Enter memory size for minikube. (like 2048m or 8g) > " memsize
let processors=`grep processor /proc/cpuinfo | wc -l`
minikube start --driver=docker --cpus=$((processors-1)) --memory=$memsize
minikube dashboard &> /dev/null &

# Create keys for SSL
openssl req -newkey rsa:4096 -x509 -sha256 -days 1000 -nodes -out ./keys/server.pem\
		-keyout ./keys/server.key\
		-subj "/C=JP/ST=Tokyo/L=Minato/O=42Tokyo/OU=kikeda/CN=localhost"
kubectl create secret generic ssl-keys --from-file=./keys/server.key --from-file=./keys/server.pem

# Container image preparation
eval `minikube -p minikube docker-env`
docker build -t nginx ./srcs/nginx/
docker build -t wordpress ./srcs/wordpress/

# k8s cluster setup
## MetalLB init
kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.6/manifests/namespace.yaml
kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.6/manifests/metallb.yaml
kubectl create secret generic -n metallb-system memberlist --from-literal=secretkey="$(openssl rand -base64 128)"

## Start cluster
kubectl apply -f ./srcs/appcluster.yaml