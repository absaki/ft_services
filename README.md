# ft_services
This project is a part of the 42 (42.fr) curriculum.

## Preparation
- Update minikube.
```
 curl -LO https://github.com/kubernetes/minikube/releases/download/v1.19.0/minikube-linux-amd64
 sudo install minikube-linux-amd64 /usr/local/bin/minikube
 ```
 - Update kubectl
 ```
 curl -LO https://storage.googleapis.com/kubernetes-release/release/v1.21.0/bin/linux/amd64/kubectl
 chmod +x ./kubectl
 sudo mv ./kubectl /usr/local/bin/kubectl
 kubectl version --client
```
- Make `docker` command executable without `sudo`.
```
# dockerグループがなければ作る
sudo groupadd docker
sudo gpasswd -a $USER docker
sudo service docker restart
exit
```
(Login again.)

## How to run
- Start kubernetes cluster.
```
./setup.sh
```
- Stop & remove kubernetes cluster.
```
minikube delete
```
