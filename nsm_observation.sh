#!/bin/bash

kubectl apply -f nsm_grafana.yaml -n nginx-mesh
kubectl apply -f nsm_jaeger.yaml -n nginx-mesh
kubectl apply -f nsm_prometheus.yaml -n nginx-mesh
