#!/bin/bash

# Define MySQL information
DB_USR='wpadmin'
DB_PWD='wppass'

# Start minikube
cd `dirname $0`
let processors=`grep processor /proc/cpuinfo | wc -l`
echo 'minikube start'
minikube start --driver=docker --cpus=$((processors-1)) --memory=12g > /dev/null &

# Create keys for SSL
echo 'create ssl keys'
openssl req -newkey rsa:4096 -x509 -sha256 -days 1000 -nodes -out ./keys/server.pem\
		-keyout ./keys/server.key\
		-subj "/C=JP/ST=Tokyo/L=Minato/O=42Tokyo/OU=kikeda/CN=localhost" &> /dev/null &
wait
kubectl create secret generic ssl-keys --from-file=./keys/server.key --from-file=./keys/server.pem

# Container image preparation
eval `minikube -p minikube docker-env`
echo 'building container images'
docker build -t nginx ./srcs/nginx/ > /dev/null &
docker build -t wordpress ./srcs/wordpress/ > /dev/null &
docker build -t phpmyadmin ./srcs/phpmyadmin/ > /dev/null &
docker build -t mysql ./srcs/mysql/ > /dev/null &
docker build -t ftps ./srcs/ftps/ > /dev/null &
docker build -t influxdb ./srcs/influxdb > /dev/null &
docker build -t grafana ./srcs/grafana > /dev/null &
wait

# k8s cluster setup
## MetalLB init
kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.6/manifests/namespace.yaml
kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.6/manifests/metallb.yaml
kubectl create secret generic -n metallb-system memberlist --from-literal=secretkey="$(openssl rand -base64 128)"

## Start cluster
kubectl apply -f ./srcs/manifests/

## Dashboard start
minikube dashboard &> /dev/null &
