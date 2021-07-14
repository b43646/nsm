#!/bin/bash

kubectl delete -f nsm_grafana.yaml -n nginx-mesh
kubectl delete -f nsm_jaeger.yaml -n nginx-mesh
kubectl delete -f nsm_prometheus.yaml -n nginx-mesh
