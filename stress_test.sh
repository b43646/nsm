#!/bin/bash

pos=`pwd`
modes=(
"nginx-meshctl deploy --registry-server reg.loren.poc:5000/nsm --image-tag 1.0.1"
"nginx-meshctl deploy --registry-server reg.loren.poc:5000/nsm --image-tag 1.0.1 --mtls-mode off"
"nginx-meshctl deploy --registry-server reg.loren.poc:5000/nsm --image-tag 1.0.1 --enabled-namespaces nsm-demo2,nsm-demo3,nsm-demo4"
"nginx-meshctl deploy --registry-server reg.loren.poc:5000/nsm --image-tag 1.0.1 --disabled-namespaces legacy"
"nginx-meshctl deploy --registry-server reg.loren.poc:5000/nsm --image-tag 1.0.1"
"nginx-meshctl deploy --registry-server reg.loren.poc:5000/nsm --image-tag 1.0.1 --enabled-namespaces nsm-demo4,nsm-demo5,nsm-demo6"
"nginx-meshctl deploy --registry-server reg.loren.poc:5000/nsm --image-tag 1.0.1"
"nginx-meshctl deploy --registry-server reg.loren.poc:5000/nsm --image-tag 1.0.1 --mtls-mode off"
"nginx-meshctl deploy --registry-server reg.loren.poc:5000/nsm --image-tag 1.0.1 --disabled-namespaces legacy"
"nginx-meshctl deploy --registry-server reg.loren.poc:5000/nsm --image-tag 1.0.1"
)


for i in {0..9}
do

  echo "-------- ${modes[$i]} -------------"

  bash -c "${modes[$i]}"

  cd $pos/nplus
  ./nplus-ingress.sh

  # waiting for nplus(2 instances) ready
  int=1

  while(( $int<=1 ))
  do
    sleep 5;
    num=`kubectl -n nginx-ingress get pods | grep 1/1 | wc -l`;
    if [ $num == 2  ]
    then
      let "int++"
    fi
  done

  cd $pos
  ./nsm_observation.sh

  cd $pos/examples/traffic_splitting
  ./case2.sh nsm-demo$i

  # 2. remove the service mesh
 
  # 2.1 remove case2
  cd $pos/examples/traffic_splitting
  ./case2-del.sh nsm-demo$i

  # 2.2 remove nsm ingress
  cd $pos
  ./nsm_observation_del.sh

  # 2.3 remove nsm
  nginx-meshctl remove -y

  # 2.4 remove nginx ingress controller
  cd $pos/nplus
  ./nplus-del.sh

done

