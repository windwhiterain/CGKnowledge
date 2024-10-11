#! https://zhuanlan.zhihu.com/p/917374280

# solve QP by solve LCP iteratively
在物理模拟中为了体现物体运动的连续性,我们需要选择在物体位置上迭代的优化算法。这在布料模拟中，碰撞约束十分高频的情况下具有意义。
$$
\min_{x}f(x)\ \text{s.t.}\ h(x)\ge 0\\
\implies\\
f'(x)+\lambda(x) h'(x)=0,\\
\lambda(x)_i\begin{cases}
    \ge 0,\text{if}\ h_i(x)=0\\
    =0,\text{if}\ h_i(x)>0
\end{cases}
$$
let $f'(x)=ax+b=-\lambda(x_k)h'(x_k),h(x)=h(x_k)+h'(x_k)(x-x_k)$
$$
\implies\\
x=-a^{-1}\lambda(x_k)h'(x_k)-a^{-1}b\\
\implies\\
h(x)=h(x_k)+h'(x_k)(x-x_k)\\
=h(x_k)+h'(x_k)(-a^{-1}\lambda(x_k)h'(x_k)-a^{-1}b-x_k)\\
=-h'(x_k)a^{-1}\lambda(x_k)h'(x_k)+h(x_k)-h'(x_k)(a^{-1}b+x_k)\\
=-h'(x_k)^Ta^{-1}h'(x_k)\lambda(x_k)+h(x_k)-h'(x_k)(a^{-1}b+x_k)\\
$$
we got LCP $x(Ax+b)=0,x\ge 0,Ax+b\ge 0$ that
- $x=\lambda(x)$
- $A=-h'(x_k)^Ta^{-1}h'(x_k)$
- $b=h(x_k)-h'(x_k)(a^{-1}b+x_k)$

reference:
- [Fast GPU-Based Two-Way Continuous Collision Handling](https://arxiv.org/abs/2211.04045)
