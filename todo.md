# todo for improving algorithm performance

## 第一帧方法
- __keep still__

## 其余帧方法
- 对于r的三个参数, 不要一起考虑, 而是分开, 分别给出`{距离,大小}` 两个因素加权的峰, 之后对着三个分别考虑, 因为可能有一个参数选出了峰
- 写一个对于其余帧的小波unit, 考虑两个方向 
- 控制心率不能太过keep still, 可以根据现有的结果 (high+prev)/2 或者 (low+prev)/2 `if 连续三次keep still, 则第三次use this method`




- 对分析不好的信号的特定帧找漏洞.

`找不变量`
- 对ACC频谱分析

