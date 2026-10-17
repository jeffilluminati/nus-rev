// MA1522 edition: selected sections of Tyrtyshnikov, "Matrix Analysis and Linear Algebra",
// arranged by the syllabus of NUS MA1522 Linear Algebra for Computing (AY2026/27) and
// written in the course's notation and terminology. Content lives in ma1522/.
// Build: typst compile MA1522_Textbook.typ

#import "ma1522/common.typ": *

#show: book-project
#show: ma-setup
#set document(title: "Matrix Analysis and Linear Algebra: MA1522 Edition")

#page(header: none, footer: none)[
  #set par(first-line-indent: 0pt, justify: false)
  #v(2.6cm)
  #align(center)[
    #text(size: 12pt, weight: "bold", tracking: 0.12em)[E. E. TYRTYSHNIKOV]
    #v(1.6cm)
    #text(size: 20pt, weight: "bold", tracking: 0.05em)[MATRIX ANALYSIS\ AND LINEAR ALGEBRA]
    #v(0.9cm)
    #text(size: 12pt, style: "italic")[Selected sections, adapted for]
    #v(0.25cm)
    #text(size: 13pt, weight: "bold")[MA1522 Linear Algebra for Computing]
    #v(0.2cm)
    #text(size: 10pt)[National University of Singapore · Semester 1, AY2026/2027]
  ]
  #v(1fr)
  #block(width: 100%, inset: (x: 1.2cm))[
    #set text(size: 9pt)
    #set par(justify: true)
    A reading companion to the course, not a replacement for its slides. The sections of
    Tyrtyshnikov's _Matrix Analysis and Linear Algebra_ that bear on the MA1522 syllabus are
    arranged under the course's chapters and sections and rewritten in the course's notation
    and terminology. Material that goes beyond the syllabus is kept and marked
    #beyond-tag. Each subsection notes in the source the section of the book it comes from.
  ]
  #v(1.2cm)
]

#contents()

#chapter("Notation")

The notation follows the MA1522 lecture slides.

#v(0.4em)
#{
  set par(first-line-indent: 0pt, justify: false)
  set text(size: 9pt)
  let accent = rgb("#62788f")
  table(
    columns: (auto, 1fr),
    stroke: (x, y) => if y == 0 { (bottom: 0.5pt + accent) } else { (bottom: 0.3pt + rgb("#d6dade")) },
    inset: (x: 5pt, y: 4.5pt),
    table.header(text(weight: "bold")[Notation], text(weight: "bold")[Meaning]),
    [$bf(u), bf(v), bf(w)$; $bf(0)$], [vectors in $bb(R)^n$ (columns); the zero vector],
    [$bf(A) = (a_(i j))_(m times n)$], [an $m times n$ matrix with $(i, j)$-entry $a_(i j)$],
    [$bf(I)_n$, $bf(0)_(m times n)$], [identity matrix of order $n$; zero matrix],
    [$bf(A)^T$, $bf(A)^(-1)$], [transpose; inverse],
    [$(bf(A) | bf(b))$], [augmented matrix of the system $bf(A) bf(x) = bf(b)$],
    [$R_i <-> R_j$, $R_i + c R_j$, $a R_i$], [elementary row operations ($a != 0$)],
    [$det(bf(A))$, $|bf(A)|$], [determinant],
    [$bf(M)_(i j)$, $A_(i j)$], [$(i, j)$ matrix minor (a submatrix); $(i, j)$-cofactor $A_(i j) = (-1)^(i + j) det(bf(M)_(i j))$],
    [$adj(bf(A))$], [adjoint of $bf(A)$ (transpose of the matrix of cofactors)],
    [$bf(u) dot bf(v)$, $norm(bf(u))$, $d(bf(u), bf(v))$], [dot product, norm, distance $norm(bf(u) - bf(v))$ in $bb(R)^n$],
    [$span{bf(u)_1, ..., bf(u)_k}$], [linear span],
    [$dim(V)$], [dimension of a subspace $V$],
    [$[bf(v)]_S$], [coordinate vector of $bf(v)$ relative to the basis $S$],
    [$bf(P)$ with $[bf(w)]_S = bf(P) [bf(w)]_T$], [transition matrix from $T$ to $S$],
    [$Col(bf(A))$, $Row(bf(A))$, $Null(bf(A))$], [column space, row space, nullspace],
    [$rank(bf(A))$, $nullity(bf(A))$], [rank; nullity $= dim(Null(bf(A)))$],
    [$V^perp$], [orthogonal complement of a subspace $V$],
    [$bf(w) = bf(w)_p + bf(w)_n$], [orthogonal projection $bf(w)_p$ of $bf(w)$ onto $V$, and $bf(w)_n perp V$],
    [$bf(A) = bf(Q) bf(R)$, $bf(A) = bf(L) bf(U)$], [QR and LU factorizations],
    [$char(bf(A)) = det(x bf(I) - bf(A))$], [characteristic polynomial],
    [$E_lambda = Null(lambda bf(I) - bf(A))$], [eigenspace of the eigenvalue $lambda$],
    [$bf(A) = bf(P) bf(D) bf(P)^(-1)$, $bf(A) = bf(P) bf(D) bf(P)^T$], [diagonalization; orthogonal diagonalization],
    [$bf(A) = bf(U) bf(Sigma) bf(V)^T$], [singular value decomposition],
    [$T: bb(R)^n -> bb(R)^m$], [linear transformation, $T(bf(u)) = bf(A) bf(u)$ with standard matrix $bf(A)$],
    [$[T]_S$, $Rng(T)$, $ker(T)$], [matrix of $T$ relative to a basis $S$ (its columns are $T(bf(u)_j)$); range; kernel],
  )
}

#v(0.6em)
Material marked #beyond-tag works over the complex numbers or in general vector spaces. There $bf(A)^*$ denotes the conjugate transpose ($bf(A)^* = bf(A)^T$ for real matrices), and $ip(bf(u), bf(v))$ a general inner product, which for real column vectors is $bf(u) dot bf(v) = bf(v)^T bf(u)$.

#include "ma1522/ch1.typ"
#include "ma1522/ch2.typ"
#include "ma1522/ch3.typ"
#include "ma1522/ch4.typ"
#include "ma1522/ch5.typ"
#include "ma1522/ch6.typ"
#include "ma1522/ch7.typ"
