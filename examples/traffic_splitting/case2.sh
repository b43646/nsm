#!/bin/bash

ns=$1

kubectl create ns $ns

kubectl apply -f target-svc.yaml -f target-v1.0.yaml -f gateway.yaml -f gateway_ingress.yaml -n $ns

kubectl apply -f  target-v2.0-failing.yaml -n $ns

kubectl -n $ns apply -f trafficsplit-dark.yaml

int=1

while(( $int<=1 ))
do
  sleep 5;
  num=`kubectl -n $ns get pods | grep 2/2 | wc -l`;
  if [ $num == 3  ]
  then
     let "int++"
  fi
done

sleep 10

for i in {1..30}; do curl -k https://gateway.apps.loren.poc; sleep .1; done
