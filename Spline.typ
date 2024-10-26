#set page(
  paper: "a6",
  margin: (x: 1cm, y: 1cm),
)
#set text(
  font: "LXGW WenKai Mono Screen",
  size: 10pt
)

#align(center)[
= Spline
]
#set heading(numbering: "1.")
= Type Hierarchy
- Bezier
- Spline
    - B-Spline
        - uniform
            - Cardinal B-Spline
        - Rational B-Spline
        - P-Spline
        - variable dimension
            - Polyhedral Spline
                - Simplex Spline
                - Box Spline
== Rational B-Spline
reference:
- #link("https://www.cl.cam.ac.uk/teaching/2000/AGraphHCI/SMEG/node5.html")[
Advanced Graphics and HCI \ Neil Dodgson \ 2000-09-25
]
== Box Spline
reference:
- #link("https://en.wikipedia.org/wiki/Box_spline")[wiki]
== P-Spline
reference:
- #link("https://psplines.bitbucket.io/Support/WhyPsplines.pdf")[
WhyP-splines? \ Paul Eilers & Brian Marx \ June 7, 2021
]
