#! https://zhuanlan.zhihu.com/p/1268753348
# Dual Problem
[wiki](https://en.wikipedia.org/wiki/Dual_linear_program)

wiki上的例子不太好，这里另举一例：

假设几种粒子按一定比例会自发的反应生成一种新粒子，如果这个过程是熵增的。

现在反应容器内到了一个稳态，其中所有的粒子的熵未知，已知能通过消耗一些能量让这些粒子按照反应方程的逆过程完全反应成另外一系列熵已知的粒子。

此时的情形构成的这对 Dual Problem 的已知量：
- $c_i$是转化后单位粒子$i$的熵
- $A_{ij}$是产生单位转化后粒子$j$，需要转化前粒子$i$的量（反应方程）
- $b_i$是转化前粒子$i$的量

两个 Problem 分别求解两个未知量：
1. 求转化后的最高可能的熵$E_h$（此时消耗的能量最少）
$$\max_x{cx}\text{ s.t. }x>0,Ax\le b$$
- $x_i$是转化后粒子$i$的量
1. 求转化前的最低可能的熵$E_l$
$$\min_x{by}\text{ s.t. }y>0,yA\ge c$$
- $y_i$是转化前单位粒子$i$的熵
$$E_h\ge E_l$$
$E_h$和$E_l$的接近程度描述了这两个问题 Duality 的强弱 





