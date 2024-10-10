#! https://zhuanlan.zhihu.com/p/917374280
# solve QP by solve LCP iteratively
$$
\text{minimize} f(x)\ \text{s.t.}\ h(x)\ge 0\\
\implies\\
f'(x)+\lambda(x) h'(x)=0,\\
\lambda(x)_i\begin{cases}
    \ge 0,\text{if}\ h_i(x)=0\\
    =0,\text{if}\ h_i(x)>0
\end{cases}
$$
let $f'(x)=ax+b=\lambda(x_k)h'(x_k),h(x)=h(x_k)+h'(x_k)(x-x_k)$
$$
\implies\\
x=a^{-1}\lambda(x_k)h'(x_k)-a^{-1}b\\
\implies\\
h(x)=h(x_k)+h'(x_k)(x-x_k)\\
=h(x_k)+h'(x_k)(a^{-1}\lambda(x_k)h'(x_k)-a^{-1}b-x_k)\\
=a^{-1}h'(x_k)\lambda(x_k)h'(x_k)+h(x_k)-h'(x_k)(a^{-1}b+x_k)\\
=a^{-1}h'(x_k)^Th'(x_k)\lambda(x_k)+h(x_k)-h'(x_k)(a^{-1}b+x_k)\\
$$
we got LCP $x(Ax+b)=0,x\ge 0,Ax+b\ge 0$ that
- $x=\lambda(x)$
- $A=a^{-1}h'(x_k)^Th'(x_k)$
- $b=h(x_k)-h'(x_k)(a^{-1}b+x_k)$
