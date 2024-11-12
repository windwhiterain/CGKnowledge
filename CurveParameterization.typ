#set page(
  paper: "a6",
  margin: (x: 1cm, y: 1cm),
)
#set text(
  font: "LXGW WenKai Mono Screen",
  size: 10pt
)
#align(center)[
= Curve Parameterization
]
#set heading(numbering: "1.")
= Tutte's Embedding
- to convex
- linear system
feature:
- foldover-free: theoretical gurarantee
- usually high distortion
== Euclidean-orbifold
== Hyperbolic-orbifold
== Spherical-orbifold
= ABF
- define in angle space
= As-rigid-as-possible(ARAP)
- measure approximatiin between linear mapping and the rigidity
- optimize
  - local: singular value
  - global: linear system
feature:
- possible foldover
= Simplex Assembly
- define in affine transform
- barraier function to prevent inversion
feature:
- possible foldover
= 消除反转
- Penealty function
- Bounding the conformal distoirtion
- Itertive projection
- Area-based methods

