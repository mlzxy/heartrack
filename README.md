# Introduction


I just Finish 2015 IEEE Signal Processing Cup, and here is an Heart Rate Tracking algorithm using Wrist-Typed PPG Signal.


**Notice**
> This is **Not** the exact algorithm we used in the paper: [http://bit.ly/1TjFB67](http://bit.ly/1TjFB67), which gave  better result than this one, but the idea is the same.

<br>
<br>

## How to Run

1. Download the code
2. Add Path in Matlab
3. change variable in init.m (where to save pictures)

Then

```matlab
runall_train %% run algorithm on all training data
runall_test  %% run algorithm on all testing data
```

You will see the result.   

<br>
<br>

## About the algorithm   

- 7-order haar wavelet transform for signal preprocess
- Four Heuristic Unit for tracking Frequency Peak
    - **Memory Rule**: for heart rate could not change too sharply
    - **Magnitude Rule**: select the larger peak
    - **Wavelet Rule**(only used in the first frame): 
            When the heart rate peak submerges in motion peaks, the wavelet preprocess may make it emerges.
          
    - **Acceleration Rule**: When the subject speeds up, the heart rate tends to grow


And each rule corresponds to a M-file.
<br>
<br>


### More

- A Post in My Blog: [Link](http://xyzhang.me/algorithm/dsp/2015/01/14/heart-rate-tracking.html) (in Chinese)
- More Intro: TODO  


<br>
<br>

## Data

The Data used here comes from [HERE](http://www.zhilinzhang.com/spcup2015/data.html) with copyrights. So if you want to use them, follow the instructions there.

<br>
<br>

## LICENSE

The MIT License

Copyright (c) 2014-2015 

Xinyu Zhang <beviszhang1993@gmail.com>

Ke Tan <tk1116@mail.ustc.edu.cn>

Shilin Zhu <zsl712@mail.ustc.edu.cn>

Zhiqiang Liu <lzhq28@mail.ustc.edu.cn>

Bin Liu <flowice@ustc.edu.cn>


