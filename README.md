# nsm

nsm压力测试介绍

基本思路：切换多种部署模式，验证流量控制策略是否可以精准地调度流量。

### 环境一

K8S 版本: v1.16.3

CNI插件：calico

压测脚本 stress_test.sh

压测日志 stress_test.log

默认流量控制策略v2.0权重10，v1.0权重90.

```
[root@km01 nsm]# cat stress_test.log |grep " v2.0" | wc -l
30
[root@km01 nsm]# cat stress_test.log |grep " v1.0" | wc -l
270
```

### 环境二

K8S 版本: v1.16.3

CNI插件：cilium v1.10.3

压测脚本 stress_test2.sh

压测日志 stress_test2.log

默认流量控制策略v2.0权重10，v1.0权重90.

```
[root@km01 nsm]# cat stress_test2.log |grep " v2.0" | wc -l
28
[root@km01 nsm]# cat stress_test2.log |grep " v1.0" | wc -l
272
```
