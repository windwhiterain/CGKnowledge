#set page(
  paper: "a6",
  margin: (x: 1cm, y: 1cm),
)
#set text(
  font: "LXGW WenKai Mono Screen",
  size: 10pt
)
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
$ A x+b=0 $
=== Conjugate Gradient
reference:
- #link("https://en.wikipedia.org/wiki/Conjugate_gradient_method")[wiki]
- #link("https://optimization.cbe.cornell.edu/index.php?title=Conjugate_gradient_methods")[cornell.edu]
= UnConstrained Optimization
== Quadral
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

