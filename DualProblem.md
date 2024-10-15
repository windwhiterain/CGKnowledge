#! https://zhuanlan.zhihu.com/p/1268753348
# Dual Problem
[wiki](https://en.wikipedia.org/wiki/Dual_linear_program)

wiki上的例子不太好，这里另举一例：

几种粒子按一定比例会自发的反应生成一种新粒子，如果这个过程是熵增的。

现在反应容器内到了一个稳态，其中所有的粒子的熵未知，研究人员希望消耗能量使剩下的例子全部转化为已知熵的粒子，要求仅使用最少能量(造成最小熵减)，求转化后的熵。

让这个 linear program 为$LP_a$。
$$\max_x{cx}\text{ s.t. }x>0,Ax\le b$$
- $x_i$是转化后粒子$i$的量
- $c_i$是转化后粒子$i$的熵
- $A_{ij}$是产生单位转化后粒子$j$，需要转化前粒子$i$的量
- $b_i$是转化前粒子$i$的量

研究人员为了验证实验过程的正确性(熵减少了)，更具转化后粒子的熵和反应公式对算出了转化前粒子熵总和的最小值，只要实验结果比这个小那么一定熵减了。

让这个 linear program 为$LP_b$。
$$\min_x{by}\text{ s.t. }y>0,yA\ge c$$
- $y_i$是转化前粒子$i$的熵

$LP_a$ 与 $LP_b$ 互为 Dual Problem。 





