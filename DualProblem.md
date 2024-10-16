#! https://zhuanlan.zhihu.com/p/1268753348
# Dual Problem
[wiki](https://en.wikipedia.org/wiki/Dual_linear_program)

wiki上的例子不太好，这里另举一例：

假设几种粒子按一定比例会自发的反应生成一种新粒子，如果这个过程是熵增的。

现在反应容器内到了一个稳态（无法自发进行熵增反应），其中所有的粒子的熵未知，已知能通过消耗一些能量让这些粒子反应成另外一系列熵已知的粒子（可能反应不完全，可能会熵减）。

此时的情形构成的这对 Dual Problem 的已知量：
- $c_i$是单位转化后粒子$i$的熵
- $A_{ij}$是产生单位转化后粒子$j$，需要至少转化前粒子$i$的量（反应方程）
- $b_i$是转化前粒子$i$的量

这个两个问题数学上是完全对称的，因此这些已知量还可以写成：
- $c_i$是转化后粒子$i$的熵密度
- $A_{ij}$是如果转化前粒子$i$增加单位熵密度，转化后粒子$i$最多增加的熵密度
- $b_i$是转化前粒子$i$的量

两个 Problem 分别求解两个未知量：

1.求转化后的粒子最高可能的熵$E_h$（此时消耗的能量最少）

$$\max_x{cx}\text{ s.t. }x>0,Ax\le b$$
- $x_i$是转化后粒子$i$的量

2.求转化前的粒子最低可能的熵$E_l$

$$\min_y{by}\text{ s.t. }y>0,yA\ge c$$
- $y_i$是转化前粒子$i$的熵密度
$$E_h\ge E_l$$
$E_h$和$E_l$的接近程度描述了这两个问题 Duality 的强弱。

如果 $E_h=E_l$，这对问题有 Strong Duality。可理解为反应完全，熵减为0，此时问题可以转化为 Linear Complementary Problem。 

令$s=b-Ax,u=yA-c$
- $s_i$是反应前粒子$i$反应后的剩余量
- $u_i$是反应后粒子$i$熵密度的减少量

$$E_h=E_l\implies s_i y_i=0,x_i u_i=0$$
- $s_i y_i=0$ 可理解为如果反应前粒子$i$有剩余，则其熵密度一定等于0，因此参与反应不会增加反应后的熵
- $x_i u_i=0$ 可理解为如果生成反应后粒子$i$是熵减的，那么它的生成量一定为0

得到：
$$
LCP:w=\begin{bmatrix}
    u&s
\end{bmatrix},
M=\begin{bmatrix}
    0&A^T\\
    -A&0
\end{bmatrix},
z=\begin{bmatrix}
    x&y
\end{bmatrix},
q=\begin{bmatrix}
    -c,b
\end{bmatrix}\\
w=Mz-q,w>0,z>0,wz=0
$$






