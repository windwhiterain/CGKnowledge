#! https://zhuanlan.zhihu.com/p/978332000
# Locally Intersection Free Belt Generation
## Problem
given a curve and some attributes defined on it, generate a belt based on it.
- $P(x)$ is the position along the curve
- $L(x)=\int_{x}{||P'(x)||_2}$ is the length along the curve
- $w(x)$ is the half width of the belt
- $D(x)$ is the direction along the curve implies the belt's width axis
- $ROC(D,x)$ is the radius of curvature of $D(x)$, which is $\frac{|D'(x)P'(x)|}{D'(x)^2}$
- $B(x,y)=yW(x)+P(x),y\in [-1,1]$ is the belt's space
  
find $W$ that $\frac{\partial{B(x,y)}}{\partial{x}}\times\frac{\partial{B(x,y)}}{\partial{y}}>0\text{ for all }x,y$ 
## Naive Method
$$W(x)=w(x)D(x)$$

this may cause intersection when $ROC(x)<w(x)$.
## Width Shrink Method
find $w^*$ that:
$$w^*(x)\le ROC(x)$$
then we have:
$$W(x)=w^*(x)D(x)$$
## Direction Smooth Method
find $D^*$ that:
$$
ROC(D^*,x)\le w(x),\\
\min_{D^*}{\int_{L(x)}{||D^*(x)-D(x)||}}\\
\int_{L(x)}{D^*(x)-D(x)}=0
$$
then we have:
$$W(x)=w(x)D^*(x)$$
this will cause the belt shrink in direction $D(x)$, when $D^*(x)\ne D(x)$, so another option is:
$$
w^*(x)=\frac{w(x)}{D^*(x)D(x)}\\
W(x)=w^*(x)D^*(x)
$$
### Iteratively Find $D^*,w^*$
for $x_1,x_2$ which are close to each other

$$
ROC(D^*_k,x_1,x_2)= |(P(x_1)-P(x_2))(D^*_k(x_1)-D^*_k(x_2))|\\
\bigtriangleup r=max(0,max(w^*_k(x_1),w^*_k(x_2))-ROC(...))\\
\bigtriangleup d=\bigtriangleup r\frac{P(x_1)-P(x_2)}{(P(x_1)-P(x_2))^2}sign((P(x_1)-P(x_2))(D^*_k(x_1)-D^*_k(x_2)))\\
D^*_{k+1}(x)=D^*_k(x)\bigoplus\frac{\bigtriangleup d}{2}(\delta(x_1,x)-\delta(x_2,x))\\
$$
- $\delta(x_i,x)=max(0,1- \lambda^{-1}|L(x)-L(x_i)|)$
  - $\lambda= \frac{|L(x_1)-L(x_{2})|}{2}$
- $D(x)\bigoplus d=D(x)+d+\theta a,da=0,||D(x)\bigoplus d||_2=1$

choose $\lambda$ from large to small to hierarchically accelerate the iteration 


