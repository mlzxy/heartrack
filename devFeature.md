#  todo feature for this dev branch

__for next frames__

# utility

- 考虑距离 [x]
- 写一个对于其余帧的小波unit, 考虑两个方向   [x]
- 记录心率keep still次数 [x]



# rules
- 如果距离和大小结果不同, 而且距离结果和上次不同, 则距离结果
- 如果发现有一个方向的小波unit 满足出现两次条件, 而且差得不多, 则加权在一起.
- 控制心率不能太过keep still, 可以根据现有的结果 (high+prev)/2 或者 (low+prev)/2 `if 连续三次keep still, 则第三次use this method` 



# more
- 对分析不好的信号的特定帧找漏洞
- 对ACC频谱分析 **找不变量**

