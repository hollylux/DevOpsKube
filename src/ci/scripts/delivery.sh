#!/bin/bash

kubectl delete -f ./src/ci/kubefiles/gosayhello.yaml
kubectl apply -f ./src/ci/kubefiles/gosayhello.yaml

exit 0
