#!/bin/bash

ns=$1

kubectl -n $ns delete -f trafficsplit-dark.yaml

kubectl delete -f  target-v2.0-failing.yaml -n $ns

kubectl delete -f target-svc.yaml -f target-v1.0.yaml -f gateway.yaml -f gateway_ingress.yaml -n $ns

kubectl delete ns $ns
