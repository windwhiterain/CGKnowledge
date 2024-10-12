# Locally Intersection Free Belt Generation
## Problem
given a curve and some attributes defined on it, generate a belt based on it.
- $O(x)$ is the orientation along the curve
- $P(x)$ is the position along the curve
- $w(x)$ is the half width of the belt
- $D(x)$ is the constant direction in $O(x)$ space implies the belt's width axis.
- $ROC(D(x))$ is the radius of curvature of $D(x)$, which is $-D'(x)P'(x)$
- $B(x,y)=yW(x)+P(x),y\ni [-1,1]$ is the belt's space
  
find $W(x)$ that $\det\frac{\partial{B(x,y)}}{\partial{x}}\bigotimes\frac{\partial{B(x,y)}}{\partial{y}}>0,\text{for all }x,y$ 
## Naive Method
$W(x)=w(x)D(x)$

this may cause intersection when $ROC(x)<w(x)$.
## Width Shrink Method
$W(x)=min(w(x),ROC(x))D(x)$
## Direction Smooth Method
find a $D^*(x)$ that $ROC(D^*(x))\le w(x)$

W(x)=w(x)D^*(x)

this may cause $D(x)!=D^*(x)$ 
## 

