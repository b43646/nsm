#!/bin/bash

kubectl apply -f common/ns-and-sa.yaml

kubectl apply -f rbac/rbac.yaml

kubectl apply -f rbac/ap-rbac.yaml

kubectl apply -f common/default-server-secret.yaml

kubectl apply -f common/nginx-config.yaml

kubectl apply -f common/ingress-class.yaml

kubectl apply -f common/crds/k8s.nginx.org_virtualservers.yaml

kubectl apply -f common/crds/k8s.nginx.org_virtualserverroutes.yaml

kubectl apply -f common/crds/k8s.nginx.org_transportservers.yaml

kubectl apply -f common/crds/k8s.nginx.org_policies.yaml

kubectl apply -f deployment/nginx-plus-ingress.yaml


