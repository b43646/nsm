# nsm

nsm压力测试介绍

基本思路：切换多种部署模式，验证流量控制策略是否可以精准地调度流量。

压测脚本 stress_test.sh
压测日志 stress_test.log

默认流量控制策略v2.0权重90，v1.0权重10.

```
[root@km01 nsm]# cat stress_test.log |grep " v2.0" | wc -l
30
[root@km01 nsm]# cat stress_test.log |grep " v1.0" | wc -l
270
```
