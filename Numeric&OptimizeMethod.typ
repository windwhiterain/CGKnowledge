#set page(
  paper: "a6",
  margin: (x: 1cm, y: 1cm),
)
#set text(
  font: "LXGW WenKai Mono Screen",
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
#show math.equation: set text(font: "Fira Math")

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
== Linear Equality
formulation:
$ N bold(x) + bold(m) = 0,\ "rank"(N^top) < dim(bold(x)) $<cst.l>
or
$ bold(x) = N bold(lambda),\ "rank"(N) < dim(bold(x))  $ <cst.l.v1>
=== Qualdral Optimization (Linear Least Squares)
reference:
- #link("https://en.wikipedia.org/wiki/Linear_least_squares")[wiki]
transform:
$ #ref(<opt.q>),#ref(<cst.l>) =>\ N bold(lambda) + 2 A bold(x) + bold(b) = 0 $<cst.l.m1>
$ #ref(<cst.l>),#ref(<cst.l.m1>) <=>\ mat(2 A, N; N, 0)vec(bold(x), bold(lambda)) + vec(bold(b), bold(m)) = 0 $
$ A' bold(x') + bold(b') = 0 \ ->#ref(<eq.l>) $
or
$ #ref(<opt.q.v1>),#ref(<cst.l.v1>) =>\ min_bold(lambda) || A N bold(lambda) - bold(b) ||_2 $
$ min_bold(bold(x')) || A' bold(x') - bold(b) ||_2 \ ->#ref(<opt.q>) $
== Linear InEquality
formulation
$ N bold(x) + bold(m) >= 0 $
=== Interior Point (Barrier)
reference:
- #link("https://en.wikipedia.org/wiki/Interior-point_method")[wiki]
==== Path Following 
transform:
$ min_x_k t_(k) f(x_k) + b(x_k)\ -> #ref(<opt>) $
==== Potential Reduction



