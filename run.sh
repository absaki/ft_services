#!/bin/bash

# Start minikube
cd `dirname $0`
read -p "Enter memory size for minikube. (like 2048m or 8g) > " memsize
let processors=`grep processor /proc/cpuinfo | wc -l`
minikube start --driver=hdocker --cpus=$((processors-1)) --memory=$memsize
minikube dashboard &> /dev/null &

# Container image preparation
eval `minikube -p minikube docker-env`
docker build -t fts-nginx ./srcs/nginx/

# k8s cluster setup
## MetalLB init
kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.6/manifests/namespace.yaml
kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.6/manifests/metallb.yaml
kubectl create secret generic -n metallb-system memberlist --from-literal=secretkey="$(openssl rand -base64 128)"

## Start cluster
kubectl apply -f ./srcs/appcluster.yaml