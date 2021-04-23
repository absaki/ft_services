# ft_services
This project is a part of [42](42.fr) curriculum.

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

## Default Setting
- mysql
```
user:       wpadmin
password:   wpadmin
```
- ftps
```
host:       192.168.49.42
user:       wpadmin
password:   wpadmin
port:       21
```
## Local Link

- [nginx-http](http://192.168.49.42)
- [nginx-https](https://192.168.49.42)
- [grafana](https://192.168.49.42:3000/d/KoCYtk9Gz/ft_services_cluster?orgId=1&refresh=5s)
- [wordpress](https://192.168.49.42:5050)
- [phpmyadmin](https://192.168.49.42:5000)

### Have a nice day!
