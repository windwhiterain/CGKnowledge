#set page(
  paper: "a6",
  margin: (x: 1cm, y: 1cm),
)
#set text(
  font: "LXGW WenKai Mono Screen",
  size: 10pt
)
#align(center)[
= Interpolation
]
- let $w_s$ be the interpolation weight on sample $s$.
- let $I(x_i)_s=w_s$ be the interpolation method
#set heading(numbering: "1.")
= Bilinear 
naive form:
$ 
I(x_0,x_1)=(x_0 x_1,x_0 (1-x_1),(1-x_0)x_1,(1-x_0)(1-x_1))
$
tensor form:
$
I(x_i)_s= T_s^(i i) x_i x_i+A_s^i x_i+b_s
$
- $T_s^(i i)=mat(Q^(i i),-Q^(i i),-Q^(i i),Q^(i i))$
  - $Q^(i i)=mat(0,1/2;1/2,0)$
- $A_s^i=mat(0,0,;1,0;0,1;-1,-1)$
- $b_s=mat(0,0,0,1)$
or more compact:
$
I(x_i)_s=A_s^(i times i+i+1)(x^2_(i times i) plus.circle x_i plus.circle 1)=A_s^j text("poly")(x,2)_j 
$
- $A=mat(0,1/2,1/2,0,0,0,0;0,-1/2,-1/2,0,1,0,0;0,-1/2,-1/2,0,0,1,0;0,1/2,1/2,0,-1,-1,1)$

