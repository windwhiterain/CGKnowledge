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
- let $y(x_i)_j=Y_j^s w_s$ be the interpolated value
#set heading(numbering: "1.")
= Bilinear 
naive form:
$ 
I(x_0,x_1)=(x_0 x_1,x_0 (1-x_1),(1-x_0)x_1,(1-x_0)(1-x_1))
$
tensor form:
$
I(x_i)_s= A_s^(i i) x_i x_i+B_s^i x_i+C_s
$
- $A_s^(i i)=mat(Q^(i i),-Q^(i i),-Q^(i i),Q^(i i))$
  - $Q^(i i)=mat(0,1/2;1/2,0)$
- $B_s^i=mat(0,0,;1,0;0,1;-1,-1)$
- $C_s=mat(0,0,0,1)$
or more compact:
$
I(x_i)_s=A_s^(i times i+i+1)(x^2_(i times i) plus.circle x_i plus.circle 1)=A_s^i' text("poly")(x,2)_i' 
$
- $A=mat(0,1/2,1/2,0,0,0,0;0,-1/2,-1/2,0,1,0,0;0,-1/2,-1/2,0,0,1,0;0,1/2,1/2,0,-1,-1,1)$
== Inverse Interpolation
write the equation as:
$
y_j=Y_j^s I(x_i)_s=Y_j^s A_s^(i i)x_i x_i+Y_j^s B_s^i x_i+Y_j^s C_s
$
let:
$
y_j=A'_j^(i i)x_i x_i+B'_j^i x_i+C'_j
$
the derivative:
$
(partial y(x_i)_j)/(partial x_i)=2A'_j^(i i)x_i+B'_j^i \
(partial^2 y(x_i)_j)/(partial x_i)^2=2A'_j^(i i)
$
then we can solve $x_i$ by newton method.

