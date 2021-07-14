pos=`pwd`  

# 2.1 remove case2
#  ./case2-del.sh

  # 2.2 remove nsm ingress
  cd $pos
  ./nsm_observation_del.sh

  # 2.3 remove nsm
  nginx-meshctl remove -y

  # 2.4 remove nginx ingress controller
  cd $pos/nplus
  ./nplus-del.sh

