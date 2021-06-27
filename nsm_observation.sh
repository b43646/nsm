#!/bin/bash

kubectl create -f nsm_grafana.yaml -n nginx-mesh
kubectl create -f nsm_jaeger.yaml -n nginx-mesh
kubectl create -f nsm_prometheus.yaml -n nginx-mesh
