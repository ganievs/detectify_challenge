# Detectify Challenge
*A simple website to run on kubernetes (minikube)*

### Usage:
#### Build docker images
*make build exec* `eval $(minikube docker-env)` *and build the images on minikube's docker host*
```sh
$ make build
```
#### Deploy apps to kubernetes cluster
*The apps will be deployed in default namespace*
```sh
$ make deploy
```
