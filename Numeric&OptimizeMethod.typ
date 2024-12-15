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
$ A bold(x) + bold(b) = 0 $
transform:\
if $"rank"(A) < bold(b)$
$ A^top A bold(x) + A^top bold(b) = 0 $
=== Conjugate Gradient
reference:
- #link("https://en.wikipedia.org/wiki/Conjugate_gradient_method")[wiki]
- #link("https://optimization.cbe.cornell.edu/index.php?title=Conjugate_gradient_methods")[cornell.edu]
= Optimization
== Quadral
formulation:
$ min_x || A bold(x) - bold(b) ||_2 $<opt.q>
=== Newton
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
== Rank n-1 Single Linear
formulation:
$ bold(n)bold(x) + m = 0 $ <cst.r1sl>
or
$ bold(x) = N bold(lambda),\ "rank"(N) = "rank"(bold(x)) - 1 $ <cst.r1sl.v1>
=== Qualdral Optimization (Linear Least Squares)
reference:
- #link("https://en.wikipedia.org/wiki/Linear_least_squares")[wiki]
transform:
$ #ref(<opt.q>),#ref(<cst.r1sl>) =>\ lambda bold(n) + 2(A bold(x) - bold(b)) = 0 $
$ lambda bold(n) + A bold(x) - bold(b) = 0 $<cst.r1sl.m1>
$ #ref(<cst.r1sl>),#ref(<cst.r1sl.m1>) <=>\ (A plus.circle bold(n))(bold(x) plus.circle lambda) - bold(b) = 0 $
$ A' bold(x') + bold(b) = 0 $
or
$ #ref(<opt.q>),#ref(<cst.r1sl.v1>) =>\ min_bold(lambda) || A N bold(lambda) - bold(b) ||_2 $
$ min_bold(bold(x')) || A' bold(x') - bold(b) ||_2 $
$ A' bold(x') = bold(b) $

