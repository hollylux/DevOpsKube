#!/bin/bash

kubectl apply -f cicd/kubefiles/deployments/gosayhello.yaml
kubectl apply -f cicd/kubefiles/services/gosayhello.yaml

exit 0
