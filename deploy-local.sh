#!/bin/bash
# deploy-local.sh

minikube status || minikube start
eval $(minikube docker-env)
helm upgrade --install nginx ./charts/nginx \
  --namespace default --create-namespace
