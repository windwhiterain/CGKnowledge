# Numeric & Optimize Method

## equation
### linear
$$
Ax=b\\
$$
- conjugate gradient method
  - [wiki](https://en.wikipedia.org/wiki/Conjugate_gradient_method)
- fixed-point iteration
  - _
    1. gauss–seidel method
       - [wiki](https://en.wikipedia.org/wiki/Gauss%E2%80%93Seidel_method)
    2. successive over-relaxation
       - [wiki](https://en.wikipedia.org/wiki/Successive_over-relaxation)
  - jacobi method
    - [wiki](https://en.wikipedia.org/wiki/Jacobi_method)
## complementarity problem
[wiki](https://en.wikipedia.org/wiki/Complementarity_theory)
### linear
[wiki](https://en.wikipedia.org/wiki/Linear_complementarity_problem)
$$
x(Ax+b)=0,\\
x\geq 0,\\
Ax+b\geq 0\\
$$
mixed:
$$
(Ax+b)_i=0,x_i>{x_l}_i,x<{x_h}_i;\\
(Ax+b>0)_i,x_i={x_l}_i;\\
(Ax+b<0)_i,x_i={x_h}_i
$$
- projected gauss–seidel method
  - [知乎](https://zhuanlan.zhihu.com/p/381900297)
