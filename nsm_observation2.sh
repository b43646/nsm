#!/bin/bash

kubectl apply -f nsm_grafana2.yaml -n nginx-mesh
kubectl apply -f nsm_jaeger2.yaml -n nginx-mesh
kubectl apply -f nsm_prometheus2.yaml -n nginx-mesh
