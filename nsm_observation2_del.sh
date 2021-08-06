#!/bin/bash

kubectl delete -f nsm_grafana2.yaml -n nginx-mesh
kubectl delete -f nsm_jaeger2.yaml -n nginx-mesh
kubectl delete -f nsm_prometheus2.yaml -n nginx-mesh
