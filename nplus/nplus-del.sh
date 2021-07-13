#!/bin/bash

kubectl delete -f deployment/nginx-plus-ingress.yaml

kubectl delete -f common/ns-and-sa.yaml

kubectl delete -f rbac/rbac.yaml

kubectl delete -f rbac/ap-rbac.yaml


kubectl delete -f common/default-server-secret.yaml

kubectl delete -f common/nginx-config.yaml

# kubectl delete -f common/ingress-class.yaml

kubectl delete -f common/crds/k8s.nginx.org_virtualservers.yaml

kubectl delete -f common/crds/k8s.nginx.org_virtualserverroutes.yaml

kubectl delete -f common/crds/k8s.nginx.org_transportservers.yaml

kubectl delete -f common/crds/k8s.nginx.org_policies.yaml



