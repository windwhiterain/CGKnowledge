#set page(
  paper: "a6",
  margin: (x: 1cm, y: 1cm),
)
#set text(
  //font: "LXGW WenKai Mono Screen",
  size: 10pt
)
#set math.equation(numbering: "<1>")
#show ref: it=>{
  let eq = math.equation
  let el = it.element
  if el != none and el.func() == eq {
    // Override equation references.
    link(el.location(),numbering(
      el.numbering,
      ..counter(eq).at(el.location())
    ))
  } else {
    // Other references as usual.
    it
  }
}
//#show math.equation: set text(font: "Fira Math")

#align(center)[
= Numeric and Optimize Method
]
#set heading(numbering: "1.")
= Matrix Decomposition/Factorization
reference:
- #link("https://en.wikipedia.org/wiki/Matrix_decomposition")[wiki]
== LU
reference:
- #link("https://en.wikipedia.org/wiki/LU_decomposition")[wiki]
fomulation:
$ A=L U $
- L: lower triangular
- U: upper triangular
=== Partial Piviting
+fomulation:
$ P A=L U $
- P: permutation that reorder rows
feature:
- numerically stable
=== Full Piviting
+fomulation:
$ P A Q=L U $
- Q: permutation that reorder columns
=== LDU
+fomulation:
$ A=L D U $
- D: diagonal
- L,U: +unitraingular
== Cholesky
formulation:
$ A=U U^T $
- $A$: symmetric, positive (semi-)defined
- $U$: upper traingular, (semi-)positive diagonal entries
=== LDL/LDLT
+formulation:
$ A=L D L^T $
- $L$: lower unitraingular
- $D$: diagonal
feature:
- +square-root-free
== QR
formulation:
$ A=Q R $
- Q: orthogonal
- R: upper traingular
compute:
=== Gram-Schmidt Process
feature:
- low numeric stability
- easy implementation
=== Householder Reflections 
feature
- better numeric stability than Gram-Schmidt Process
- bandwidth heavy
- not parallelizable
=== Givens Rotations
feature:
- sparse
- parallelizable
= Equaltion
== Linear
formulation:
$ A bold(x) + bold(b) = 0 $<eq.l>
transform:\
if $"rank"(A) < bold(b)$
$ A^top A bold(x) + A^top bold(b) = 0 $
$ A' bold(x) + bold(b') = 0 \ ->#ref(<eq.l>) $
=== Conjugate Gradient
reference:
- #link("https://en.wikipedia.org/wiki/Conjugate_gradient_method")[wiki]
- #link("https://optimization.cbe.cornell.edu/index.php?title=Conjugate_gradient_methods")[cornell.edu]
== Continuous
formulation:
$ bold(f)(bold(x)) + bold(b) = 0 $<eq.c>
=== Newton
transform:
$ gradient_bold(x)_k bold(f)(bold(x)_k)(bold(x)_(k+1)-bold(x)_k) + bold(f)(bold(x)_k) + b = 0\ -> #ref(<eq.l>) $
= Optimization
formulation:
$ min_x f(x) $<opt>
== Quadral
formulation:
$ min_bold(x) bold(x)^top A bold(x) + bold(b) bold(x) $<opt.q>
or
$ min_bold(x) || A bold(x) + bold(b) ||_2 $<opt.q.v1>
transform:
$ A bold(x) + bold(b) = 0 \ ->#ref(<eq.l>) $
or
$ 2 A^top (A bold(x) + bold(b)) = 0 $
$ A^top A bold(x) + A^top bold(b) = 0 $
$ A' bold(x) + bold(b') = 0 \ ->#ref(<eq.l>)  $
== Continuous
formulation:
$ min_bold(x) f(bold(x)),\ gradient_bold(x) f(bold(x)_k) = bold(g), gradient^2_bold(x) f(bold(x)_k) = H $
=== Newton
transform:
$ f(bold(x))_k = bold(x)^top H bold(x)_k + bold(g) bold(x)_k, \ min_bold(x)_(k+1) f(bold(x))_k \ ->#ref(<opt.q.v1>) $
=== Quasi-Newton
reference:
- #link("https://en.wikipedia.org/wiki/Quasi-Newton_method")[wiki]
==== BFGS
reference:
- #link("https://en.wikipedia.org/wiki/Broyden%E2%80%93Fletcher%E2%80%93Goldfarb%E2%80%93Shanno_algorithm")[wiki]
===== L-BFGS
reference:
- #link("https://en.wikipedia.org/wiki/Limited-memory_BFGS")[wiki]
==== Compact Representation
reference:
- #link("https://en.wikipedia.org/wiki/Compact_quasi-Newton_representation")[wiki]
= Constraint
== Equality
formulation:
$ bold(n)bold(x) = 0 $
kkt:
$ gradient_bold(x)f(bold(x)) + gradient_bold(x)bold(n)(bold(x))bold(lambda) = 0,\ bold(n)(bold(x)) = 0  $<cst.e.kkt>
=== Linear Equality
formulation:
$ N bold(x) + bold(m) = 0,\ "rank"(N^top) < dim(bold(x)) $<cst.e.l>
or
$ bold(x) = N bold(lambda),\ "rank"(N) < dim(bold(x))  $ <cst.e.l.v1>
==== Qualdral Optimization (Linear Least Squares)
reference:
- #link("https://en.wikipedia.org/wiki/Linear_least_squares")[wiki]
transform:
$ #ref(<opt.q>),#ref(<cst.e.l>),#ref(<cst.e.kkt>) =>\ N bold(lambda) + 2 A bold(x) + bold(b) = 0 $<cst.e.l.m1>
$ #ref(<cst.e.l>),#ref(<cst.e.l.m1>) <=>\ mat(2 A, N; N, 0)vec(bold(x), bold(lambda)) + vec(bold(b), bold(m)) = 0 $
$ A' bold(x') + bold(b') = 0 \ ->#ref(<eq.l>) $
or
$ #ref(<opt.q.v1>),#ref(<cst.e.l.v1>) =>\ min_bold(lambda) || A N bold(lambda) - bold(b) ||_2 $
$ min_bold(bold(x')) || A' bold(x') - bold(b) ||_2 \ ->#ref(<opt.q>) $
== InEquality
formulation:
$ bold(n)(bold(x)) >= 0 $<cst.ie>
kkt:
$ gradient_bold(x)f(bold(x)) + gradient_bold(x)bold(n)(bold(x))bold(lambda) = 0,\ bold(lambda) bold(n)(bold(x)) = 0,\ bold(lambda) >= 0 $<cst.ie.kkt>
=== Interior Point (Barrier)
reference:
- #link("https://en.wikipedia.org/wiki/Interior-point_method")[wiki]
==== Path Following 
transform:
$ min_(bold(x)_t_k=bold(x)) f(bold(x)) + t_k bold(n')(bold(x)), t_(k+1) = theta t_k\ -> #ref(<opt>) $<cst.ie.itp.pf>
==== Primal Dual
reference:
- #link("https://www.cs.cmu.edu/~pradeepr/convexopt/Lecture_Slides/primal-dual.pdf")[cmu.edu]
compare:
- little slower than Path Following but more accurate.
transform:
$ #ref(<cst.ie.itp.pf>),\ n'(bold(x)) := || -bold(log)(bold(n)(bold(x))) ||_1 $
$ min_(bold(x)_t_k=bold(x)) f(bold(x)) + t_k || -bold(log)(bold(n)(bold(x))) ||_1,\ bold(lambda) dot.circle bold(n)(x) = t_k bold(1) $<cst.ie.itp.pd.m1>
$ #ref(<cst.ie.itp.pd.m1>) =>\ gradient_bold(x) f(bold(x)) + t_k gradient_bold(x) bold(n)(bold(x))(-bold(n)(bold(x))^(circle -bold(1))) = 0 $
$ gradient_bold(x) f(bold(x)) + t_k gradient_bold(x) bold(n)(bold(x))(-t_k^(-1) bold(lambda)) = 0 $
$ gradient_bold(x) f(bold(x)) - gradient_bold(x) bold(n)(bold(x))bold(lambda) = 0 $<cst.ie.itp.pd.m2>
$ #ref(<cst.ie.itp.pd.m2>),#ref(<cst.ie.itp.pd.m1>) =>\ gradient_bold(x) f(bold(x)) - gradient_bold(x) bold(n)(bold(x))bold(lambda) = 0,\ bold(lambda) dot.circle bold(n)(x) = t_k bold(1)\ -> #ref(<eq.c>) $
or
$ #ref(<cst.ie.kkt>)->\ bold(x)_k := bold(x),\ gradient_bold(x)f(bold(x)) + gradient_bold(x)bold(n)(bold(x))bold(lambda) = 0,\ bold(lambda) bold(n)(bold(x)) = t_k,\ t_(k+1) = theta t_k\ -> #ref(<eq.c>) $
=== Linear InEquality
formulation:
$ N bold(x) + bold(m) >= 0 $



