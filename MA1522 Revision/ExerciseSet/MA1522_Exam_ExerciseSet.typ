// MA1522 Linear Algebra for Computing — Final Exam Exercise Set
// Coverage: lecture slides Chapters 1–7. All problems are original, modelled on the
// question types of the past final papers and the Semester 1 2026/27 exam format
// (16 multiple-choice questions and 5 written questions, closed book, one A4 helpsheet).

#import "exset.typ": *
#show: exset.with(module: "MA1522", running: "Final Exam Exercise Set")

// ─────────────────────────────────────────────────────────────── title block ──
#line(length: 100%, stroke: 3.2pt + blue)
#v(-8pt)
#line(length: 100%, stroke: 0.5pt + rulegray)
#v(6pt)
#grid(columns: (1fr, auto), align: (left + top, right + top),
  [#text(font: sans, weight: "bold", size: 12pt, fill: deep)[MA1522#h(0.6em)LINEAR ALGEBRA FOR COMPUTING]\
   #text(font: sans, size: 9.5pt, fill: soft)[National University of Singapore]],
  text(font: sans, size: 9.5pt, fill: soft)[Exercise Set F#h(0.5em);(Final Exam Revision)\
    Name: #box(width: 3.2cm, stroke: (bottom: 0.4pt + soft))\
    Date: #box(width: 3.2cm, stroke: (bottom: 0.4pt + soft))])
#v(12pt)
#text(font: sans, weight: "bold", size: 28pt, fill: blue)[Linear Systems, Subspaces,\ Orthogonality, and Eigenvalues]
#v(-2pt)
#text(style: "italic", size: 11.5pt, fill: deep)[Lecture slides Chapters 1–7 #h(0.4em)•#h(0.4em) Lessons 1–23 #h(0.4em)•#h(0.4em) Tutorials 1–11]
#v(-4pt)
#line(length: 100%, stroke: 1.4pt + blue)
#v(4pt)

#panel[HOW TO USE THIS SET][
  The final examination on 24 November 2026 is a two-hour, closed-book paper with one A4
  helpsheet and an approved calculator. Section A has 16 multiple-choice questions of 2 marks
  each; Section B has 5 written questions worth 68 marks, for which full working must be shown.
  Parts A to F of this set revise the seven chapters in order, with most of the weight on
  written questions. Part G is a complete mock paper in the examination format, to be sat in
  one sitting of two hours.

  Every problem here is new: none is copied from the slides, the tutorials, the quizzes, or the
  past papers, although each is modelled on a question type that appears there. Every written
  problem is followed by a ruled panel sized to the work it should take; multiple-choice
  questions have none. Answers to all problems begin on the last pages; consult them only
  after a complete attempt.
]

#topichead[Distribution of Problems]
#table(columns: (auto, 1fr, auto, auto), stroke: none, inset: (x: 6pt, y: 3.5pt),
  table.header([*Part*], [*Topic*], [*Chapters*], [*Problems*]),
  table.hline(stroke: 0.5pt + rulegray),
  [A], [Linear Systems, Matrices, and Determinants], [1–2], [1–10],
  [B], [Euclidean Vector Spaces], [3], [11–18],
  [C], [Subspaces Associated to a Matrix and Rank], [4], [19–24],
  [D], [Orthogonality and Least Squares], [5], [25–33],
  [E], [Eigenvalues, Diagonalization, and the SVD], [6], [34–46],
  [F], [Linear Transformations], [7], [47–54],
  [G], [Mock Final Examination], [1–7], [55–75],
  table.hline(stroke: 0.5pt + rulegray),
)

#topichead[Notation]
Vectors are column vectors and are written in bold, as are matrices. $bA^tp$ is the transpose,
$Col(bA)$, $Row(bA)$ and $Null(bA)$ are the column space, row space and nullspace of $bA$, and
$[bw]_S$ is the coordinate vector of $bw$ relative to a basis $S$. The transition matrix from
$T$ to $S$ is the matrix $bP$ with $[bw]_S = bP [bw]_T$. Stochastic matrices have columns that
sum to 1, so a Markov chain runs as $bx_(n+1) = bP bx_n$.

#part-title.update("Results to Know Cold")
#pagebreak()
#topichead[Results You Are Expected to Know Cold]

#panel[INVERTIBILITY: EQUIVALENT STATEMENTS FOR A SQUARE MATRIX OF ORDER $n$][
  $bA$ is invertible $<=>$ the RREF of $bA$ is $bI$ $<=>$ $bA$ is a product of elementary matrices
  $<=>$ $bA bx = bz$ has only the trivial solution $<=>$ $bA bx = bb$ has a unique solution for
  every $bb$ $<=>$ $det(bA) != 0$ $<=>$ the columns (rows) of $bA$ form a basis for $RR^n$ $<=>$
  $rank(bA) = n$ $<=>$ $nullity(bA) = 0$ $<=>$ $0$ is not an eigenvalue of $bA$.
]
#panel[DETERMINANTS][
  $det(bA bB) = det(bA) det(bB)$, #h(0.6em) $det(bA^tp) = det(bA)$, #h(0.6em) $det(bA^(-1)) = 1 slash det(bA)$,
  #h(0.6em) $det(c bA) = c^n det(bA)$. \
  Row operations: $R_i <-> R_j$ changes the sign; $c R_i$ multiplies the determinant by $c$;
  $R_i + c R_j$ leaves it unchanged. A triangular matrix has determinant equal to the product of
  its diagonal entries. $bA^(-1) = 1/det(bA) adj(bA)$.
]
#panel[RANK][
  For an $m times n$ matrix, $rank(bA) = dim Col(bA) = dim Row(bA)$ is the number of pivot
  columns, and $rank(bA) + nullity(bA) = n$. Row operations preserve the row space and the
  nullspace, but not the column space. $bA bx = bb$ is consistent $<=>$ $bb in Col(bA)$ $<=>$
  $rank(bA) = rank(bA | bb)$. $rank(bA) = n$ $<=>$ $bA^tp bA$ is invertible $<=>$ $bA$ has a left
  inverse; $rank(bA) = m$ $<=>$ $bA bA^tp$ is invertible $<=>$ $bA$ has a right inverse.
]
#panel[ORTHOGONALITY AND LEAST SQUARES][
  If ${bu_1, ..., bu_k}$ is an orthogonal basis for $V$, the projection of $bw$ onto $V$ is
  $ bw_p = (bw dot bu_1)/(bu_1 dot bu_1) bu_1 + dots.c + (bw dot bu_k)/(bu_k dot bu_k) bu_k . $
  Gram–Schmidt: $bv_1 = bu_1$, #h(0.3em) $bv_(i+1) = bu_(i+1) - sum_(j <= i) (bu_(i+1) dot bv_j)/(bv_j dot bv_j) bv_j$.
  #h(0.5em) QR: $bA = bQ bR$ with $bQ^tp bQ = bI$ and $bR = bQ^tp bA$ upper triangular. \
  $hat(bx)$ is a least squares solution of $bA bx = bb$ $<=>$ $bA^tp bA hat(bx) = bA^tp bb$ $<=>$
  $bA hat(bx)$ is the projection of $bb$ onto $Col(bA)$. With $bA = bQ bR$: $bR hat(bx) = bQ^tp bb$.
]
#panel[DIAGONALIZATION][
  $bA$ of order $n$ is diagonalizable $<=>$ it has $n$ linearly independent eigenvectors $<=>$
  the characteristic polynomial splits into linear factors and, for every eigenvalue, the
  geometric multiplicity $dim Null(lambda bI - bA)$ equals the algebraic multiplicity.
  Then $bA = bP bD bP^(-1)$ and $bA^k = bP bD^k bP^(-1)$. \
  $bA$ is orthogonally diagonalizable ($bA = bP bD bP^tp$ with $bP$ orthogonal) $<=>$ $bA$ is symmetric.
]
#panel[SINGULAR VALUE DECOMPOSITION OF AN $m times n$ MATRIX][
  $bA = bU bSig bV^tp$ with $bU$ ($m times m$) and $bV$ ($n times n$) orthogonal. The singular values
  $sigma_1 >= dots.c >= sigma_r > 0$ are the square roots of the nonzero eigenvalues of $bA^tp bA$;
  the columns $bv_i$ of $bV$ are orthonormal eigenvectors of $bA^tp bA$ in the same order;
  $bu_i = 1/sigma_i bA bv_i$ for $i <= r$, and $bu_(r+1), ..., bu_m$ extend these to an orthonormal
  basis of $RR^m$. Then $r = rank(bA)$, ${bu_1, ..., bu_r}$ is a basis for $Col(bA)$ and
  ${bv_(r+1), ..., bv_n}$ is a basis for $Null(bA)$.
]

// ═══════════════════════════════════════════════════════════════════ PART A ══
#parthead[A][Linear Systems, Matrices, and Determinants][Chapters 1 and 2: row reduction, inverses, elementary matrices, LU factorization, determinants][Problems 1–10]

#topichead[Solving Linear Systems]

#prob(space: 5.5cm)[
  Use Gauss–Jordan elimination to find the general solution of
  $ x_1 + 2x_2 - x_3 + x_4 &= 3 \
    2x_1 + 4x_2 - x_3 + 4x_4 &= 8 \
    -x_1 - 2x_2 + 3x_3 + 3x_4 &= 1 . $
  State which variables are assigned parameters and why.
]

#prob(space: 6.5cm)[
  Let $a$ be a real constant. Determine the values of $a$ for which the system
  $ x + y + a z = 1, quad x + a y + z = 1, quad a x + y + z = -2 $
  has (i) no solution, (ii) exactly one solution, (iii) infinitely many solutions. In case (iii),
  write down the general solution.
]

#prob(space: 5cm)[
  Let $c$ and $d$ be real constants. Find the rank and the nullity of
  $ mat(1, 2, -1, 3; 2, c, -2, c + 2; -1, -2, d, d - 4) $
  for all possible values of $c$ and $d$.
]

#topichead[Inverses, Elementary Matrices, and LU Factorization]

#prob(space: 7cm)[
  Let $bA = mat(1, 2, 1; 0, 1, 2; 1, 3, 4)$ and $bB = mat(1, 0; 2, 1; 0, 3)$.
  + Find $bA^(-1)$ by row reducing $(bA | bI)$.
  + Hence solve the matrix equation $bA bX = bB$.
]

#prob(space: 4.5cm)[
  Let $bA$ be a square matrix of order 3 with $det(bA) = 4$. The matrix $bB$ is obtained from $bA$
  by performing, in order, the row operations $R_1 <-> R_3$, #h(0.3em) $3R_2$, #h(0.3em) $R_3 + 2R_1$.
  + Write $bB = bE_3 bE_2 bE_1 bA$ and write down the elementary matrices $bE_1, bE_2, bE_3$.
  + Find $det(bB)$ and $det(2 bA^(-1) bB^tp)$.
]

#prob(space: 7cm)[
  Let $bA = mat(2, 1, -1; 4, 5, -3; -2, 5, 3)$.
  + Find an LU factorization $bA = bL bU$, with $bL$ unit lower triangular.
  + Use it to solve $bA bx = (1, 7, 13)^tp$ by solving $bL by = bb$ and then $bU bx = by$.
]

#topichead[Determinants]

#prob(space: 6.5cm)[
  For $n >= 1$ let $bD_n$ be the square matrix of order $n$ with every diagonal entry equal to 2,
  every entry immediately above or below the diagonal equal to 1, and all other entries 0, and let
  $d_n = det(bD_n)$.
  + Compute $d_1$, $d_2$ and $d_3$.
  + By cofactor expansion along the first row, show that $d_n = 2 d_(n-1) - d_(n-2)$ for $n >= 3$.
  + Deduce a formula for $d_n$. For which $n$ is $bD_n$ invertible?
]

#prob(space: 4cm)[
  Let $t$ be a real constant and $bM = mat(1, t, 0; t, 1, t; 0, t, 1)$. Find $det(bM)$, and all values
  of $t$ for which the homogeneous system $bM bx = bz$ has a nontrivial solution.
]

#prob(space: 4cm)[
  Let $bA$ be a square matrix of order 3 with $det(bA) = 2$. Find
  $det(bA^3)$, #h(0.3em) $det(3 bA^(-1))$, #h(0.3em) $det(adj(bA))$ #h(0.3em) and #h(0.3em) $det(bA^tp bA - 2 bA^tp)$ given
  further that $det(bA - 2 bI) = 5$.
]

#topichead[True or False]

#prob(space: 7.5cm)[
  For each statement about square matrices $bA$, $bB$, $bC$ of order $n$, decide whether it is always
  true. Justify a true statement in one line and give a $2 times 2$ counterexample for a false one.
  + If $bA bB = bold(0)$, then $bA = bold(0)$ or $bB = bold(0)$.
  + $(bA + bB)^2 = bA^2 + 2 bA bB + bB^2$.
  + If $bA^2 = bI$, then $bA = bI$ or $bA = -bI$.
  + If $bA$ and $bB$ are symmetric, then $bA bB$ is symmetric.
  + If $bA$ is invertible and $bA bB = bA bC$, then $bB = bC$.
]
#endpart()

// ═══════════════════════════════════════════════════════════════════ PART B ══
#parthead[B][Euclidean Vector Spaces][Chapter 3: spans, subspaces, linear independence, bases, coordinates, transition matrices][Problems 11–18]

#topichead[Spans and Subspaces]

#prob(space: 6cm)[
  Let $S = {(1, 0, 1, 2)^tp, (0, 1, 1, -1)^tp, (1, 1, 0, 1)^tp}$, #h(0.2em) $bv = (3, 1, 2, 5)^tp$ and
  $bw = (1, 1, 1, 0)^tp$.
  + Decide whether each of $bv$ and $bw$ belongs to $span(S)$.
  + For each vector that does, write down its coordinates relative to $S$.
]

#prob(space: 7cm)[
  Decide whether each set is a subspace. Express a subspace as a span, and for a set that is
  not a subspace name a condition that fails, with specific vectors.
  + ${(x, y, z)^tp in RR^3 : x - 2y + z = 0}$
  + ${(x, y, z)^tp in RR^3 : x + y + z = 1}$
  + ${(a + b, a - b, 2a)^tp : a, b in RR}$
  + ${(x, y)^tp in RR^2 : x y >= 0}$
  + ${(x, y, z)^tp in RR^3 : x^2 + y^2 = 0}$
]

#topichead[Linear Independence and Bases]

#prob(space: 4cm)[
  Find all real $k$ for which ${(1, k, 0)^tp, (0, 1, k)^tp, (k, 0, 1)^tp}$ is linearly dependent, and
  for each such $k$ write one of the vectors as a linear combination of the other two.
]

#prob(space: 6cm)[
  Let $V = {bx in RR^4 : x_1 - x_2 + 2x_3 = 0 "and" x_2 + x_3 - x_4 = 0}$.
  + Find a basis for $V$ and state $dim V$.
  + Extend your basis to a basis for $RR^4$, and justify that it is one.
]

#prob(space: 6.5cm)[
  Let $bu_1 = (1, 2, 0, 1)^tp$, $bu_2 = (2, 4, 0, 2)^tp$, $bu_3 = (0, 1, 1, 1)^tp$, $bu_4 = (1, 3, 1, 2)^tp$,
  $bu_5 = (1, 0, 1, 0)^tp$, and $W = span{bu_1, ..., bu_5}$.
  + Find a subset of ${bu_1, ..., bu_5}$ that is a basis for $W$.
  + Write each of the remaining vectors as a linear combination of your basis.
]

#topichead[Coordinates and Transition Matrices]

#prob(space: 7.5cm)[
  Let $S = {(1, 0, 1)^tp, (1, 1, 0)^tp, (0, 1, 1)^tp}$ and $T = {(1, 1, 1)^tp, (1, 1, 0)^tp, (1, 0, 0)^tp}$,
  two bases for $RR^3$.
  + Find the transition matrix $bP$ from $T$ to $S$.
  + A vector $bw$ has $[bw]_T = (1, 2, -1)^tp$. Find $[bw]_S$ and $bw$.
  + Write down the transition matrix from $S$ to $T$.
]

#topichead[Theory]

#prob(space: 4cm)[
  Let $U$ and $V$ be subspaces of $RR^5$ with $dim U = 3$ and $dim V = 4$. Using
  $dim(U + V) = dim U + dim V - dim(U inter V)$, find all possible values of $dim(U inter V)$, and
  give the value when $U subset.eq.not V$.
]

#prob(space: 6cm)[
  Let ${bu, bv, bw}$ be a linearly independent set in $RR^n$.
  + Prove that ${bu + bv, bv + bw, bw + bu}$ is linearly independent.
  + Show that ${bu - bv, bv - bw, bw - bu}$ is linearly dependent.
]
#endpart()

// ═══════════════════════════════════════════════════════════════════ PART C ══
#parthead[C][Subspaces Associated to a Matrix and Rank][Chapter 4: column space, row space, nullspace, rank–nullity, full rank][Problems 19–24]

#topichead[Bases for the Fundamental Subspaces]

#prob(space: 9cm)[
  Let $bA = mat(1, 2, 0, 1, -1; 2, 4, 1, 4, -1; -1, -2, 1, 1, 2; 3, 6, 1, 5, -2)$.
  + Find the reduced row-echelon form of $bA$.
  + Find a basis for each of $Row(bA)$, $Col(bA)$ and $Null(bA)$.
  + State $rank(bA)$, $nullity(bA)$ and $nullity(bA^tp)$.
]

#prob(space: 5cm)[
  Let $bA$ be a $3 times 5$ matrix. The system $bA bx = bb$ has general solution
  $ bx = (1 + s - 2t, #h(0.3em) s, #h(0.3em) 2 + t, #h(0.3em) t, #h(0.3em) 4)^tp, quad s, t in RR . $
  + Find $nullity(bA)$, $rank(bA)$ and a basis for $Null(bA)$.
  + Is $bA bx = bc$ consistent for every $bc in RR^3$? Does $bA$ have a left inverse? A right inverse?
]

#prob(space: 6cm)[
  Let $bA = mat(1, 0, 2; 0, 1, -1)$.
  + Explain why $bA$ has a right inverse but no left inverse.
  + Find all right inverses of $bA$.
]

#prob(space: 5cm)[
  Let $bA = mat(1, -1, 2; 2, 1, 1; 4, -1, 5)$. Find a condition on $bb = (b_1, b_2, b_3)^tp$ that is
  necessary and sufficient for $bA bx = bb$ to be consistent, and hence describe $Col(bA)$ as the
  solution set of a homogeneous linear equation.
]

#topichead[Theory]

#prob(space: 7cm)[
  Decide whether each statement is always true, with a brief justification or a counterexample.
  + $rank(bA) = rank(bA^tp)$.
  + If $bA$ and $bB$ are row equivalent, then $Col(bA) = Col(bB)$.
  + $rank(bA bB) <= rank(bA)$ whenever the product is defined.
  + There is a $5 times 7$ matrix with nullity 1.
  + If $bA bx = bb$ is consistent for every $bb$, then $rank(bA)$ equals the number of rows of $bA$.
]

#prob(space: 5.5cm)[
  Let $bA$ be an $m times n$ matrix.
  + Prove that $Null(bA^tp bA) = Null(bA)$. #h(0.4em) (Hint: consider $bx^tp bA^tp bA bx$.)
  + Deduce that $rank(bA^tp bA) = rank(bA)$, and that $bA^tp bA$ is invertible exactly when the
    columns of $bA$ are linearly independent.
]
#endpart()

// ═══════════════════════════════════════════════════════════════════ PART D ══
#parthead[D][Orthogonality and Least Squares][Chapter 5: orthogonal bases, projections, Gram–Schmidt, QR factorization, least squares][Problems 25–33]

#topichead[Orthogonal Sets and Projections]

#prob(space: 7cm)[
  Let $bu_1 = (1, 1, 1, 1)^tp$, $bu_2 = (1, -1, 1, -1)^tp$, $bu_3 = (1, 1, -1, -1)^tp$ and
  $V = span{bu_1, bu_2, bu_3}$.
  + Verify that ${bu_1, bu_2, bu_3}$ is an orthogonal set, and explain why it is a basis for $V$.
  + Show that $bw = (4, 2, 0, -2)^tp$ lies in $V$ by finding its coordinates relative to this basis
    using dot products only.
  + Find the projection of $bv = (1, 0, 0, 0)^tp$ onto $V$ and the distance from $bv$ to $V$.
]

#prob(space: 5cm)[
  Let $V = span{(1, 1, 0, -1)^tp, (0, 1, 2, 1)^tp}$. Find a basis for the orthogonal complement
  $V^perp$, and verify that $dim V + dim V^perp = 4$.
]

#prob(space: 5.5cm)[
  Let $V = span{(1, 2, 2)^tp}$ in $RR^3$.
  + Find the matrix $bP$ such that $bP bx$ is the projection of $bx$ onto $V$ for every $bx in RR^3$.
  + Find the matrix of the projection onto $V^perp$.
  + Without computing, state the eigenvalues of $bP$ and their eigenspaces.
]

#topichead[Gram–Schmidt Process and QR Factorization]

#prob(space: 8cm)[
  Apply the Gram–Schmidt process to
  $ bu_1 = (1, 1, 0, 0)^tp, quad bu_2 = (1, 0, 1, 0)^tp, quad bu_3 = (0, 1, 1, 1)^tp $
  to obtain an orthonormal basis for $span{bu_1, bu_2, bu_3}$.
]

#prob(space: 8cm)[
  Let $bA = mat(1, -1; 2, 4; 2, 1)$ and $bb = (3, 0, 3)^tp$.
  + Find a QR factorization $bA = bQ bR$, where $bQ$ has orthonormal columns and $bR$ is upper
    triangular with positive diagonal entries.
  + Use it to find the least squares solution of $bA bx = bb$.
]

#prob(space: 5cm)[
  Let $bQ = 1/3 mat(2, -2, 1; 1, 2, 2; 2, 1, -2)$.
  + Show that $bQ$ is an orthogonal matrix, and find $det(bQ)$.
  + Solve $bQ bx = (3, 6, 9)^tp$ without row reduction.
]

#topichead[Least Squares]

#prob(space: 6.5cm)[
  Find the line $y = a + b x$ that best fits the data points $(-1, 0)$, $(0, 1)$, $(1, 3)$, $(2, 4)$ in
  the least squares sense. Set up $bA bx = bb$ and solve the normal equations.
]

#prob(space: 8cm)[
  Let $bA = mat(1, 1, 2; 1, 0, 1; 0, 1, 1)$ and $bb = (1, 2, 3)^tp$.
  + Show that $bA bx = bb$ is inconsistent.
  + Find all least squares solutions of $bA bx = bb$.
  + Find the projection of $bb$ onto $Col(bA)$, and explain why it does not depend on the least
    squares solution chosen.
]

#topichead[Theory]

#prob(space: 5.5cm)[
  Let $bQ$ be an $m times n$ matrix with orthonormal columns.
  + Prove that $norm(bQ bx) = norm(bx)$ and $(bQ bx) dot (bQ by) = bx dot by$ for all $bx, by in RR^n$.
  + Show that $bQ bQ^tp bb$ is the projection of $bb$ onto $Col(bQ)$ for every $bb in RR^m$.
]
#endpart()

// ═══════════════════════════════════════════════════════════════════ PART E ══
#parthead[E][Eigenvalues, Diagonalization, and the SVD][Chapter 6: eigenspaces, diagonalization, orthogonal diagonalization, Markov chains, singular value decomposition][Problems 34–46]

#topichead[Eigenvalues and Diagonalization]

#prob(space: 9cm)[
  Let $bA = mat(1, 1, 0; 0, 2, 0; -1, 1, 2)$.
  + Find the characteristic polynomial and the eigenvalues of $bA$.
  + Find a basis for each eigenspace, and state the algebraic and geometric multiplicity of
    each eigenvalue.
  + Find an invertible $bP$ and a diagonal $bD$ with $bA = bP bD bP^(-1)$.
]

#prob(space: 5.5cm)[
  Let $a$, $b$, $c$ be real constants and $bC = mat(1, a, b; 0, 2, c; 0, 0, 1)$. Find a condition on
  $a$, $b$, $c$ that is necessary and sufficient for $bC$ to be diagonalizable.
]

#prob(space: 7cm)[
  Let $bA = mat(4, -2; 1, 1)$.
  + Diagonalize $bA$.
  + Find a formula for $bA^n$, for every integer $n >= 1$, and check it at $n = 1$.
]

#prob(space: 4.5cm)[
  A square matrix $bA$ of order 3 has eigenvalues $1$, $-2$ and $3$. Find $det(bA)$, the trace of $bA$,
  the eigenvalues of $bA^(-1)$ and of $bA^2 + bI$, and $det(bA^2 - bA)$. Is $bA + 2 bI$ invertible?
]

#topichead[Orthogonal Diagonalization]

#prob(space: 9cm)[
  Let $bA = mat(3, 1, 1; 1, 3, 1; 1, 1, 3)$. Find an orthogonal matrix $bP$ and a diagonal matrix $bD$
  such that $bA = bP bD bP^tp$.
]

#prob(space: 5.5cm)[
  A symmetric matrix $bA$ of order 3 has eigenvalues 1 and 4. The eigenspace for the eigenvalue 1
  is $span{(1, 1, 1)^tp}$.
  + Describe the eigenspace for the eigenvalue 4, with justification.
  + Find $bA$.
]

#topichead[Markov Chains]

#prob(space: 8cm)[
  A bike-share scheme has three docking stations $X$, $Y$, $Z$. Of the bikes at $X$ in the morning,
  50% are back at $X$ the next morning, 30% are at $Y$ and 20% at $Z$. Of those at $Y$, 20% move to $X$,
  60% stay and 20% move to $Z$. Of those at $Z$, 30% move to $X$, 30% to $Y$ and 40% stay.
  + Write down the stochastic matrix $bP$ of this Markov chain.
  + A bike is at $X$ this morning. Find the probability that it is at $Y$ two mornings later.
  + Find the equilibrium vector, and interpret it.
]

#prob(space: 7cm)[
  Let $bP = mat(0.9, 0.4; 0.1, 0.6)$ and $bx_0 = (1, 0)^tp$, and let $bx_n = bP^n bx_0$.
  + Diagonalize $bP$.
  + Find $bx_n$ explicitly, and $lim_(n -> oo) bx_n$.
]

#topichead[Singular Value Decomposition]

#prob(space: 10cm)[
  Find a singular value decomposition $bA = bU bSig bV^tp$ of $bA = mat(1, 1; 0, 1; -1, 1)$.
]

#prob(space: 10cm)[
  Find a singular value decomposition of $bA = mat(1, 0, 1; -1, 1, 0)$. #h(0.4em)
  (It is quicker to start from $bA bA^tp$, or equivalently to decompose $bA^tp$ first.)
]

#prob(space: 9cm)[
  A $4 times 3$ matrix has the singular value decomposition $bA = bU bSig bV^tp$ with
  $ bU = 1/2 mat(1, 1, 1, 1; 1, -1, 1, -1; 1, 1, -1, -1; 1, -1, -1, 1), quad
    bSig = mat(12, 0, 0; 0, 6, 0; 0, 0, 0; 0, 0, 0), quad
    bV = 1/3 mat(1, 2, 2; 2, 1, -2; 2, -2, 1) . $
  + Find $rank(bA)$ and the eigenvalues of $bA^tp bA$.
  + Find the general solution of $bA bx = bz$.
  + Find the projection of $bw = (1, 2, 3, 4)^tp$ onto $Col(bA)$.
  + Find the matrix $bA$.
]

#topichead[Theory]

#prob(space: 7cm)[
  Decide whether each statement about a square matrix is always true, with a brief justification
  or a counterexample.
  + Every invertible matrix is diagonalizable.
  + Every diagonalizable matrix is invertible.
  + A matrix of order $n$ with $n$ distinct eigenvalues is diagonalizable.
  + If $bA$ is diagonalizable, then so is $bA^tp$.
  + Two matrices with the same characteristic polynomial are either both diagonalizable or both
    not diagonalizable.
]

#prob(space: 6cm)[
  Let $bA$ and $bB$ be square matrices of order $n$.
  + Prove that if $bA^2 = bA$, then every eigenvalue of $bA$ is 0 or 1.
  + Prove that if $lambda != 0$ is an eigenvalue of $bA bB$, then $lambda$ is an eigenvalue of $bB bA$.
]
#endpart()

// ═══════════════════════════════════════════════════════════════════ PART F ══
#parthead[F][Linear Transformations][Chapter 7: standard matrix, representation with respect to a basis, range and kernel][Problems 47–54]

#topichead[Linearity and the Standard Matrix]

#prob(space: 6.5cm)[
  Decide whether each mapping is a linear transformation. Give the standard matrix if it is, and
  a specific failure of linearity if it is not. Here $ba$ is a fixed vector in $RR^3$.
  + $T(x, y) = (x + 2y, #h(0.2em) 3y, #h(0.2em) x)$
  + $T(x, y) = (x + 1, #h(0.2em) y)$
  + $T(x, y) = (x y, #h(0.2em) x)$
  + $T(bx) = (bx dot ba) ba$ for $bx in RR^3$, with $ba = (1, 0, 2)^tp$
]

#prob(space: 7cm)[
  A linear transformation $T : RR^3 -> RR^2$ satisfies
  $ T vec(1, 1, 0) = vec(1, 2), quad T vec(0, 1, 1) = vec(0, 1), quad T vec(1, 0, 1) = vec(3, -1) . $
  + Write down the representation $[T]_S$ of $T$ with respect to the basis
    $S = {(1, 1, 0)^tp, (0, 1, 1)^tp, (1, 0, 1)^tp}$.
  + Find the standard matrix of $T$, and hence $T(x, y, z)$.
]

#prob(space: 6.5cm)[
  Let $T : RR^2 -> RR^2$ be the reflection about the line $y = 2x$.
  + By considering $T(bu)$ for $bu$ on the line and for $bu$ perpendicular to it, write down $[T]_S$
    for $S = {(1, 2)^tp, (2, -1)^tp}$.
  + Find the standard matrix $bA$ of $T$. What are $bA^2$ and $det(bA)$?
]

#prob(space: 5.5cm)[
  Let $R : RR^2 -> RR^2$ be the anticlockwise rotation about the origin by $90 degree$ and
  $Q : RR^2 -> RR^2$ the projection onto the $x$-axis. Find the standard matrices of $Q compose R$ and
  of $R compose Q$, and the kernel and range of $Q compose R$.
]

#topichead[Range and Kernel]

#prob(space: 7.5cm)[
  Let $T : RR^4 -> RR^3$ be given by
  $ T(bx) = (x_1 + 2x_2 - x_4, #h(0.4em) x_2 + x_3 + x_4, #h(0.4em) x_1 + 3x_2 + x_3)^tp . $
  + Find a basis for the kernel of $T$ and a basis for the range of $T$.
  + State $rank(T)$ and $nullity(T)$. Is $T$ injective? Is $T$ surjective?
]

#prob(space: 5.5cm)[
  Let $a$ be a real constant and $T(x, y, z) = (a x + y, #h(0.3em) x + a y + z, #h(0.3em) y + a z)$.
  + Find all values of $a$ for which the kernel of $T$ is nontrivial.
  + For the rational such value of $a$, find a basis for $ker(T)$.
]

#prob(space: 7.5cm)[
  Let $T : RR^3 -> RR^3$ have standard matrix $bA = mat(1, 1, 0; 0, 1/2, 1; 0, 0, 1/3)$, and write
  $T^n$ for $T$ composed with itself $n$ times.
  + Find the eigenvalues of $bA$ and an eigenvector for each.
  + For $bx = (x_1, x_2, x_3)^tp$, find $lim_(n -> oo) T^n (bx)$ in terms of $x_1, x_2, x_3$.
]

#topichead[Theory]

#prob(space: 6cm)[
  Let $T : RR^n -> RR^m$ be a linear transformation.
  + Prove that $T$ is injective if and only if $ker(T) = {bz}$.
  + Prove that if $n > m$ then $T$ is not injective, and that if $n < m$ then $T$ is not surjective.
]
#endpart()

// ═══════════════════════════════════════════════════════════════════ PART G ══
#parthead[G][Mock Final Examination][16 multiple-choice questions of 2 marks each and 5 written questions worth 68 marks #h(0.3em)•#h(0.3em) 2 hours, closed book, one A4 helpsheet][Problems 55–75 #h(0.3em)•#h(0.3em) 100 marks]

#panel[INSTRUCTIONS][
  Sit this paper in one sitting of two hours, with one double-sided A4 helpsheet and an approved
  calculator, and nothing else.

  *Section A* (Problems 55–70) has 16 multiple-choice questions of 2 marks each. Exactly one
  option is correct. In the examination the answers are shaded on an OMR sheet with a dark
  pencil; here, circle the letter.

  *Section B* (Problems 71–75) has 5 written questions worth 68 marks in total. The marks for
  each part are shown in brackets. Write each answer in the space provided and show full
  working for all computations: an answer without working does not earn full credit.
]

#topichead[Section A #h(0.5em) Multiple Choice #h(0.5em) (32 marks)]

#mcq[
  Which of the following matrices are in reduced row-echelon form?
  $ "(I)" mat(1, 2, 0; 0, 0, 1) quad "(II)" mat(1, 0, 3; 0, 2, 1) quad "(III)" mat(0, 1, 0; 0, 0, 0; 0, 0, 1) quad
    "(IV)" mat(1, 0, 0; 0, 1, 5) $
][Only (I) and (IV).][Only (I), (II) and (IV).][Only (I), (III) and (IV).][None of the above.]

#mcq[
  Consider a homogeneous linear system with 4 equations and 6 variables. Which of the following
  statements is/are always true?
  #stmts[The system has a nontrivial solution.][The general solution has exactly 2 arbitrary parameters.]
][Both (I) and (II) are true.][Only (I) is true.][Only (II) is true.][Both (I) and (II) are false.]

#mcq[
  Let $bA$ be a square matrix of order 3 with $det(bA) = 5$. The matrix $bB$ is obtained from $bA$ by
  swapping two rows and then multiplying one row by 2. What is $det(bA^(-1) bB^tp)$?
][$2$][$-1/2$][$-2$][$-50$]

#mcq[
  Let $bA$ and $bB$ be square matrices of order $n$. Which of the following statements is/are always
  true?
  #stmts[If $bA + bB$ is invertible, then $bA$ is invertible or $bB$ is invertible.][If $bA bB$ is invertible, then $bA$ and $bB$ are both invertible.]
][Both (I) and (II) are true.][Only (I) is true.][Only (II) is true.][Both (I) and (II) are false.]

#mcq[
  Which of the following subsets of $RR^3$ is/are subspaces?
  #stmts[${(x, y, z)^tp : x + y + z = 1}$][${(x, y, z)^tp : x = 2y}$][${(x, y, z)^tp : x y = 0}$]
][Only (I).][Only (II) and (III).][Only (III).][None of the above.]

#mcq[
  Let ${bu, bv, bw}$ be a linearly independent subset of $RR^n$. Which of the following statements
  is/are always true?
  #stmts[${bu - bv, bv - bw, bw - bu}$ is linearly independent.][${bu + bv, bv + bw, bw + bu}$ is linearly independent.]
][Both (I) and (II) are true.][Only (I) is true.][Only (II) is true.][Both (I) and (II) are false.]

#mcq[
  Let $bA$ be a $4 times 7$ matrix of rank 3. Which of the following is true?
][$nullity(bA) = 3$ and $nullity(bA^tp) = 1$.][$nullity(bA) = 4$ and $nullity(bA^tp) = 0$.][$nullity(bA) = 3$ and $nullity(bA^tp) = 4$.][$nullity(bA) = 4$ and $nullity(bA^tp) = 1$.]

#mcq[
  Let $bA$ and $bB$ be row equivalent matrices. Which of the following statements is/are always
  true?
  #stmts[$Row(bA) = Row(bB)$.][$Col(bA) = Col(bB)$.][$Null(bA) = Null(bB)$.]
][Only (I) is true.][Only (I) and (II) are true.][Only (I) and (III) are true.][(I), (II) and (III) are all true.]

#mcq[
  Let $S$ be an orthogonal set of $k$ nonzero vectors in $RR^n$. Which of the following statements
  is/are always true?
  #stmts[$S$ is linearly independent.][$k <= n$.]
][Both (I) and (II) are true.][Only (I) is true.][Only (II) is true.][Both (I) and (II) are false.]

#mcq[
  Let $bA$ be an $m times n$ matrix and $bb in RR^m$. Which of the following statements is/are always
  true?
  #stmts[$bA bx = bb$ has a least squares solution.][The least squares solution of $bA bx = bb$ is unique.][$bA hat(bx)$ is the same vector for every least squares solution $hat(bx)$.]
][Only (I) and (III) are true.][Only (I) and (II) are true.][Only (I) is true.][(I), (II) and (III) are all true.]

#mcq[
  What is the projection of $(1, 2, 3)^tp$ onto $span{(1, 1, 1)^tp}$?
][$(1, 1, 1)^tp$][$(2, 2, 2)^tp$][$(3, 3, 3)^tp$][$(6, 6, 6)^tp$]

#mcq[
  Which of the following matrices is/are diagonalizable?
  $ "(I)" mat(1, 1; 0, 2) quad "(II)" mat(2, 1; 0, 2) quad "(III)" mat(1, 2; 2, 1) $
][Only (I).][Only (III).][Only (II) and (III).][Only (I) and (III).]

#mcq[
  Let $bA$ be a square matrix of order 3 whose characteristic polynomial is $x^2 (x - 3)$. Which of
  the following statements is/are always true?
  #stmts[$bA$ is singular.][$bA$ is diagonalizable.][$rank(bA) = 1$.]
][Only (I) is true.][Only (I) and (II) are true.][Only (I) and (III) are true.][(I), (II) and (III) are all true.]

#mcq[
  What is the equilibrium vector of the stochastic matrix $bP = mat(0.7, 0.2; 0.3, 0.8)$?
][$(0.5, 0.5)^tp$][$(0.6, 0.4)^tp$][$(0.3, 0.7)^tp$][$(0.4, 0.6)^tp$]

#mcq[
  Let $bA$ be a $3 times 2$ matrix with $bA^tp bA = mat(5, 4; 4, 5)$. What are the singular values of $bA$?
][$9$ and $1$][$3$ and $1$][$sqrt(5)$ and $2$][$5$ and $4$]

#mcq[
  Let $T : RR^5 -> RR^3$ be a linear transformation. Which of the following statements is/are
  always true?
  #stmts[$T$ is not injective.][$T$ is surjective.]
][Both (I) and (II) are true.][Only (I) is true.][Only (II) is true.][Both (I) and (II) are false.]

#pagebreak()
#topichead[Section B #h(0.5em) Written Questions #h(0.5em) (68 marks)]

#prob(space: none)[
  #pts[14 marks] #h(0.3em) Let $a$ be a real constant and $bA = mat(1, 1, 1; 1, 2, a; 1, a, 2)$.
]
#subpart("a", space: 4cm)[Compute $det(bA)$ in terms of $a$. #h(1fr) #pts[3]]
#subpart("b", space: 1.6cm)[For which values of $a$ is $bA$ invertible? #h(1fr) #pts[1]]
#subpart("c", space: 6cm)[For $a = 1$, find $bA^(-1)$. #h(1fr) #pts[4]]
#subpart("d", space: 8cm)[For $a = 2$, find all values of $c$ for which $bA bx = (1, 3, c)^tp$ is consistent, and find
  the general solution for those values. #h(1fr) #pts[6]]

#prob(space: none)[
  #pts[14 marks] #h(0.3em) Let $V = {bx in RR^4 : x_1 - x_2 + x_3 - x_4 = 0}$ and
  $ S = {bu_1 = (1, 1, 0, 0)^tp, #h(0.5em) bu_2 = (0, 1, 1, 0)^tp, #h(0.5em) bu_3 = (0, 0, 1, 1)^tp} . $
]
#subpart("a", space: 5.5cm)[Show that $S$ is a basis for $V$. #h(1fr) #pts[4]]
#subpart("b", space: 4cm)[Show that $bw = (2, 3, 4, 3)^tp$ lies in $V$, and find $[bw]_S$. #h(1fr) #pts[3]]
#subpart("c", space: 4cm)[Find the projection of $by = (3, -1, 1, 1)^tp$ onto $V$. #h(1fr) #pts[3]]
#subpart("d", space: 3.5cm)[Let $T : RR^4 -> RR^4$ map each vector to its projection onto $V$. Find the standard
  matrix of $T$. #h(1fr) #pts[2]]
#subpart("e", space: 3cm)[Write down $ker(T)$, the range of $T$, and the rank and nullity of $T$. #h(1fr) #pts[2]]

#prob(space: none)[
  #pts[12 marks] #h(0.3em) Let $bA = mat(1, 3; 1, 1; 1, 3; 1, 1)$ and $bb = (3, 1, 5, -1)^tp$.
]
#subpart("a", space: 8cm)[Find a matrix $bQ$ with orthonormal columns and an upper triangular matrix $bR$ with
  positive diagonal entries such that $bA = bQ bR$. #h(1fr) #pts[6]]
#subpart("b", space: 4.5cm)[Find the least squares solution of $bA bx = bb$. #h(1fr) #pts[3]]
#subpart("c", space: 4cm)[Find the projection of $bb$ onto $Col(bA)$ and the distance from $bb$ to $Col(bA)$. #h(1fr) #pts[3]]

#prob(space: none)[
  #pts[12 marks] #h(0.3em) Let $bA = mat(1, 2; 1, 0)$, and define $bx_0 = (1, 0)^tp$ and $bx_(n+1) = bA bx_n$ for
  $n >= 0$.
]
#subpart("a", space: 5.5cm)[Find the eigenvalues of $bA$ and a basis for each eigenspace. #h(1fr) #pts[4]]
#subpart("b", space: 2.5cm)[Write down an invertible $bP$ and a diagonal $bD$ with $bA = bP bD bP^(-1)$. #h(1fr) #pts[2]]
#subpart("c", space: 6cm)[Find $bA^n$ for every integer $n >= 1$. #h(1fr) #pts[4]]
#subpart("d", space: 3cm)[Find $bx_n$, and the limit of the ratio of its first coordinate to its second as
  $n -> oo$. #h(1fr) #pts[2]]

#prob(space: none)[
  #pts[16 marks] #h(0.3em) Let $bC = mat(2, 1; 1, 2; 1, -1)$.
]
#subpart("a", space: 5.5cm)[Compute $bC^tp bC$, and find its eigenvalues and a unit eigenvector for each. #h(1fr) #pts[4]]
#subpart("b", space: 3cm)[Write down the singular values of $bC$ and the matrices $bSig$ and $bV$. #h(1fr) #pts[3]]
#subpart("c", space: 7cm)[Find an orthogonal matrix $bU$ such that $bC = bU bSig bV^tp$. #h(1fr) #pts[5]]
#subpart("d", space: 4.5cm)[Use your decomposition to write down an orthonormal basis for $Col(bC)$ and one for
  $Null(bC^tp)$, and state $rank(bC)$. #h(1fr) #pts[4]]
#endpart(w: 4)

// ═════════════════════════════════════════════════════════════════ ANSWERS ══
#part-title.update("Answers")
#pagebreak(weak: true)
#line(length: 100%, stroke: 2.6pt + blue)
#v(-6pt)
#text(font: sans, weight: "bold", size: 21pt, fill: blue)[Answers]
#v(-6pt)
#text(style: "italic", size: 10pt, fill: soft)[Final answers with the key step. A written answer in the examination needs the full working.]
#v(-5pt)
#line(length: 100%, stroke: 1.1pt + blue)
#v(2pt)

#set text(size: 9.3pt)
#show math.equation: set text(size: 8.6pt)
#set par(leading: 0.55em, spacing: 0.6em)
#set math.mat(column-gap: 0.55em, row-gap: 0.28em)
#show: columns.with(2, gutter: 0.8cm)
#let ah(t) = block(above: 12pt, below: 6pt, sticky: true, text(font: sans, weight: "bold", size: 9.5pt, fill: blue, t))

#ah[Part A]
#ans(1)[RREF $mat(1, 2, 0, 3, 5; 0, 0, 1, 2, 2; 0, 0, 0, 0, 0; augment: #4)$. Columns 2 and 4 are non-pivot, so
  $x_2 = s$, $x_4 = t$: #h(0.2em) $bx = (5 - 2s - 3t, s, 2 - 2t, t)^tp$.]
#ans(2)[$det = -(a - 1)^2 (a + 2)$. (i) $a = 1$ (the equations read $x + y + z = 1$ and $x + y + z = -2$).
  (ii) $a != 1, -2$. (iii) $a = -2$: $(x, y, z) = (1 + s, s, s)$.]
#ans(3)[$R_2 - 2R_1$ and $R_3 + R_1$ give rows $(0, c - 4, 0, c - 4)$ and $(0, 0, d - 1, d - 1)$. Rank 3 if
  $c != 4$ and $d != 1$; rank 2 if exactly one of $c = 4$, $d = 1$ holds; rank 1 if $c = 4$ and $d = 1$.
  Nullity $= 4 - "rank"$: 1, 2, 3 respectively.]
#ans(4)[(a) $bA^(-1) = mat(-2, -5, 3; 2, 3, -2; -1, -1, 1)$. #h(0.3em) (b) $bX = bA^(-1) bB = mat(-12, 4; 8, -3; -3, 2)$.]
#ans(5)[(a) $bE_1 = mat(0, 0, 1; 0, 1, 0; 1, 0, 0)$, $bE_2 = mat(1, 0, 0; 0, 3, 0; 0, 0, 1)$,
  $bE_3 = mat(1, 0, 0; 0, 1, 0; 2, 0, 1)$. \ (b) $det(bB) = (-1)(3)(1)(4) = -12$;
  #h(0.2em) $det(2 bA^(-1) bB^tp) = 2^3 dot 1/4 dot (-12) = -24$.]
#ans(6)[(a) $bL = mat(1, 0, 0; 2, 1, 0; -1, 2, 1)$, $bU = mat(2, 1, -1; 0, 3, -1; 0, 0, 4)$.
  (b) $by = (1, 5, 4)^tp$, $bx = (0, 2, 1)^tp$.]
#ans(7)[(a) $2, 3, 4$. (b) The $(1, 1)$-cofactor is $d_(n-1)$; the $(1, 2)$-minor has first column
  $(1, 0, ..., 0)^tp$, and expanding along it gives $d_(n-2)$. (c) $d_n - d_(n-1) = d_(n-1) - d_(n-2) = 1$, so
  $d_n = n + 1 != 0$: invertible for every $n$.]
#ans(8)[$det(bM) = 1 - 2t^2$; nontrivial solutions exactly when $t = plus.minus 1 slash sqrt(2)$.]
#ans(9)[$8$; #h(0.3em) $27 slash 2$; #h(0.3em) $det(bA)^(n-1) = 4$; #h(0.3em) $det(bA^tp) det(bA - 2 bI) = 10$.]
#ans(10)[(a) False: $bA = bB = mat(0, 1; 0, 0)$. (b) False: it equals $bA^2 + bA bB + bB bA + bB^2$; take
  $bA = mat(0, 1; 0, 0)$, $bB = mat(0, 0; 1, 0)$. (c) False: $bA = mat(1, 0; 0, -1)$. (d) False:
  $mat(1, 0; 0, 0) mat(0, 1; 1, 0) = mat(0, 1; 0, 0)$. (e) True: premultiply by $bA^(-1)$.]

#ah[Part B]
#ans(11)[$bv in span(S)$ with $[bv]_S = (2, 0, 1)^tp$. $bw in.not span(S)$: the last column of the augmented
  matrix is a pivot column.]
#ans(12)[(a) Subspace, $span{(2, 1, 0)^tp, (-1, 0, 1)^tp}$. (b) No: $bz$ is not in it. (c) Subspace,
  $span{(1, 1, 2)^tp, (1, -1, 0)^tp}$. (d) No: $(1, 0)^tp$ and $(0, -1)^tp$ are in it, their sum $(1, -1)^tp$
  is not. (e) Subspace: it is ${x = y = 0} = span{(0, 0, 1)^tp}$.]
#ans(13)[$det = 1 + k^3 = (k + 1)(k^2 - k + 1)$, so only $k = -1$. Then the three vectors sum to $bz$:
  $(-1, 0, 1)^tp = -(1, -1, 0)^tp - (0, 1, -1)^tp$.]
#ans(14)[(a) ${(-3, -1, 1, 0)^tp, (1, 1, 0, 1)^tp}$, $dim V = 2$. (b) Add $be_1, be_2$: in a vanishing
  combination, rows 3 and 4 force the first two coefficients to be 0, then $be_1, be_2$ are independent.
  (Other answers are possible.)]
#ans(15)[(a) ${bu_1, bu_3, bu_5}$ (pivot columns 1, 3, 5). (b) $bu_2 = 2 bu_1$, $bu_4 = bu_1 + bu_3$.]
#ans(16)[(a) $bP = 1/2 mat(1, 0, 1; 1, 2, 1; 1, 0, -1)$ (columns are $[bv_i]_S$). (b) $[bw]_S = (0, 2, 1)^tp$,
  $bw = (2, 3, 1)^tp$. (c) $bP^(-1) = mat(1, 0, 1; -1, 1, 0; 1, 0, -1)$.]
#ans(17)[$dim(U + V)$ is 4 or 5, so $dim(U inter V)$ is 3 or 2. If $U subset.eq.not V$ then $U + V != V$, so
  $dim(U + V) = 5$ and $dim(U inter V) = 2$.]
#ans(18)[(a) $a(bu + bv) + b(bv + bw) + c(bw + bu) = bz$ gives $a + c = a + b = b + c = 0$, so
  $a = b = c = 0$. (b) The three vectors sum to $bz$.]

#ah[Part C]
#ans(19)[(a) $mat(1, 2, 0, 1, -1; 0, 0, 1, 2, 1; 0, 0, 0, 0, 0; 0, 0, 0, 0, 0)$. (b) Row space: its two nonzero
  rows. Column space: columns 1 and 3 of $bA$, $(1, 2, -1, 3)^tp$, $(0, 1, 1, 1)^tp$. Nullspace:
  $(-2, 1, 0, 0, 0)^tp$, $(-1, 0, -2, 1, 0)^tp$, $(1, 0, -1, 0, 1)^tp$. (c) $2$, $3$, $4 - 2 = 2$.]
#ans(20)[(a) Nullity 2, rank 3; basis $(1, 1, 0, 0, 0)^tp$, $(-2, 0, 1, 1, 0)^tp$. (b) Yes, since the rank
  equals the number of rows; so there is a right inverse. No left inverse: the rank is less than 5.]
#ans(21)[(a) $rank(bA) = 2$ is the number of rows but not the number of columns. (b) Solving
  $bA bX = bI$ column by column: $bX = mat(1 - 2s, -2t; s, 1 + t; s, t)$, $s, t in RR$.]
#ans(22)[$R_3 - 2R_1 - R_2$ gives the zero row, so the system is consistent exactly when
  $b_3 = 2b_1 + b_2$: #h(0.2em) $Col(bA) = {bb : 2b_1 + b_2 - b_3 = 0}$.]
#ans(23)[(a) True. (b) False: $mat(1, 0; 1, 0)$ and $mat(1, 0; 0, 0)$. (c) True: $Col(bA bB) subset.eq Col(bA)$.
  (d) False: nullity $>= 7 - 5 = 2$. (e) True: $Col(bA) = RR^m$.]
#ans(24)[(a) $bA bx = bz$ gives $bA^tp bA bx = bz$. Conversely $bA^tp bA bx = bz$ gives
  $norm(bA bx)^2 = bx^tp bA^tp bA bx = 0$, so $bA bx = bz$. (b) Both matrices have $n$ columns and the
  same nullity, hence the same rank; $bA^tp bA$ is $n times n$, so it is invertible iff $rank(bA) = n$.]

#ah[Part D]
#ans(25)[(a) All three dot products are 0; an orthogonal set of nonzero vectors is linearly independent.
  (b) $(bw dot bu_i) slash 4$ gives $[bw] = (1, 1, 2)^tp$, and $bu_1 + bu_2 + 2 bu_3 = bw$.
  (c) $1/4 (bu_1 + bu_2 + bu_3) = (3/4, 1/4, 1/4, -1/4)^tp$; distance $1/2$.]
#ans(26)[${(2, -2, 1, 0)^tp, (2, -1, 0, 1)^tp}$ (the nullspace of the matrix with the two given rows); $2 + 2 = 4$.]
#ans(27)[(a) $bP = 1/9 mat(1, 2, 2; 2, 4, 4; 2, 4, 4)$. (b) $bI - bP = 1/9 mat(8, -2, -2; -2, 5, -4; -2, -4, 5)$.
  (c) Eigenvalue 1 with eigenspace $V$; eigenvalue 0 with eigenspace $V^perp$, the plane $x + 2y + 2z = 0$.]
#ans(28)[$bv_1 = (1, 1, 0, 0)^tp$, $bv_2 = (1/2, -1/2, 1, 0)^tp$, $bv_3 = (-2/3, 2/3, 2/3, 1)^tp$. Normalized:
  $1/sqrt(2) (1, 1, 0, 0)^tp$, $1/sqrt(6) (1, -1, 2, 0)^tp$, $1/sqrt(21) (-2, 2, 2, 3)^tp$.]
#ans(29)[(a) $bQ = 1/3 mat(1, -2; 2, 2; 2, -1)$, $bR = mat(3, 3; 0, 3)$. (b) $bR hat(bx) = bQ^tp bb = (3, -3)^tp$,
  so $hat(bx) = (2, -1)^tp$.]
#ans(30)[(a) $bQ^tp bQ = bI$; $det(bQ) = -1$. (b) $bx = bQ^tp bb = (10, 5, -1)^tp$.]
#ans(31)[$bA^tp bA = mat(4, 2; 2, 6)$, $bA^tp bb = (8, 11)^tp$: #h(0.2em) $y = 1.3 + 1.4 x$.]
#ans(32)[(a) $R_1 - R_2 - R_3$ gives $0 = -4$. (b) $bA^tp bA = mat(2, 1, 3; 1, 2, 3; 3, 3, 6)$,
  $bA^tp bb = (3, 4, 7)^tp$: #h(0.2em) $hat(bx) = (2/3 - s, 5/3 - s, s)^tp$. (c) $(7/3, 2/3, 5/3)^tp$. Any two least
  squares solutions differ by a vector of $Null(bA^tp bA) = Null(bA)$, so $bA hat(bx)$ is the same.]
#ans(33)[(a) $(bQ bx) dot (bQ by) = bx^tp bQ^tp bQ by = bx^tp by$; take $by = bx$ for the norm.
  (b) $bQ bQ^tp bb in Col(bQ)$ and $bQ^tp (bb - bQ bQ^tp bb) = bz$, so the remainder is orthogonal to $Col(bQ)$.]

#ah[Part E]
#ans(34)[(a) $(x - 1)(x - 2)^2$; eigenvalues 1, 2. (b) $E_1 = span{(1, 0, 1)^tp}$ (multiplicities 1, 1);
  $E_2 = span{(1, 1, 0)^tp, (0, 0, 1)^tp}$ (multiplicities 2, 2). (c) $bP = mat(1, 1, 0; 0, 1, 0; 1, 0, 1)$,
  $bD = mat(1, 0, 0; 0, 2, 0; 0, 0, 2)$.]
#ans(35)[The eigenvalue 1 has algebraic multiplicity 2, and $bC - bI = mat(0, a, b; 0, 1, c; 0, 0, 0)$ has rank
  1 exactly when $b = a c$. So $bC$ is diagonalizable iff $b = a c$.]
#ans(36)[(a) $bP = mat(1, 2; 1, 1)$, $bD = mat(2, 0; 0, 3)$. (b)
  $bA^n = mat(2 dot 3^n - 2^n, 2^(n+1) - 2 dot 3^n; 3^n - 2^n, 2^(n+1) - 3^n)$.]
#ans(37)[$det = -6$; trace $2$; $bA^(-1)$: $1, -1/2, 1/3$; #h(0.2em) $bA^2 + bI$: $2, 5, 10$;
  #h(0.2em) $det(bA^2 - bA) = product lambda(lambda - 1) = 0$; #h(0.2em) $bA + 2 bI$ is singular because $-2$ is an eigenvalue.]
#ans(38)[Eigenvalues 5 and 2 (twice). $bP = mat(1/sqrt(3), 1/sqrt(2), 1/sqrt(6); 1/sqrt(3), -1/sqrt(2), 1/sqrt(6); 1/sqrt(3), 0, -2/sqrt(6))$,
  $bD = mat(5, 0, 0; 0, 2, 0; 0, 0, 2)$.]
#ans(39)[(a) $bA$ is diagonalizable, so $dim E_4 = 2$, and $E_4 perp E_1$: $E_4$ is the plane $x + y + z = 0$.
  (b) With $bJ$ the all-ones matrix, $bA = 1/3 bJ + 4(bI - 1/3 bJ) = 4 bI - bJ = mat(3, -1, -1; -1, 3, -1; -1, -1, 3)$.]
#ans(40)[(a) $bP = mat(0.5, 0.2, 0.3; 0.3, 0.6, 0.3; 0.2, 0.2, 0.4)$. (b) $bP^2 be_1 = (0.37, 0.39, 0.24)^tp$: #h(0.2em) $0.39$.
  (c) $(9/28, 12/28, 7/28)^tp$: in the long run about 32%, 43% and 25% of the bikes are at $X$, $Y$, $Z$.]
#ans(41)[(a) $bP = mat(4, 1; 1, -1) mat(1, 0; 0, 1/2) mat(4, 1; 1, -1)^(-1)$. (b)
  $bx_n = (0.8 + 0.2 dot 2^(-n), #h(0.2em) 0.2 - 0.2 dot 2^(-n))^tp -> (0.8, 0.2)^tp$.]
#ans(42)[$bA^tp bA = mat(2, 0; 0, 3)$, so $sigma_1 = sqrt(3)$, $sigma_2 = sqrt(2)$, $bv_1 = be_2$, $bv_2 = be_1$.
  $ bU = mat(1/sqrt(3), 1/sqrt(2), 1/sqrt(6); 1/sqrt(3), 0, -2/sqrt(6); 1/sqrt(3), -1/sqrt(2), 1/sqrt(6)), #h(0.3em)
    bSig = mat(sqrt(3), 0; 0, sqrt(2); 0, 0), #h(0.3em) bV = mat(0, 1; 1, 0) . $]
#ans(43)[$bA bA^tp = mat(2, -1; -1, 2)$: $sigma_1 = sqrt(3)$, $sigma_2 = 1$.
  $ bU = 1/sqrt(2) mat(1, 1; -1, 1), #h(0.3em) bSig = mat(sqrt(3), 0, 0; 0, 1, 0), #h(0.3em)
    bV = mat(2/sqrt(6), 0, 1/sqrt(3); -1/sqrt(6), 1/sqrt(2), 1/sqrt(3); 1/sqrt(6), 1/sqrt(2), -1/sqrt(3)) . $]
#ans(44)[(a) Rank 2; eigenvalues $144, 36, 0$. (b) $bx = s(2, -2, 1)^tp$. (c)
  $(bw dot bu_1) bu_1 + (bw dot bu_2) bu_2 = 5 bu_1 - bu_2 = (2, 3, 2, 3)^tp$. (d)
  $bA = 12 bu_1 bv_1^tp + 6 bu_2 bv_2^tp = mat(4, 5, 2; 0, 3, 6; 4, 5, 2; 0, 3, 6)$.]
#ans(45)[(a) False: $mat(1, 1; 0, 1)$. (b) False: the zero matrix. (c) True. (d) True:
  $bA^tp = (bP^tp)^(-1) bD bP^tp$. (e) False: $bI$ and $mat(1, 1; 0, 1)$.]
#ans(46)[(a) If $bA bv = lambda bv$ with $bv != bz$, then $lambda bv = bA bv = bA^2 bv = lambda^2 bv$, so
  $lambda^2 = lambda$. (b) Let $bA bB bv = lambda bv$, $bv != bz$, and $bw = bB bv$. Then
  $bA bw = lambda bv != bz$ so $bw != bz$, and $bB bA bw = bB (lambda bv) = lambda bw$.]

#ah[Part F]
#ans(47)[(a) Linear, $mat(1, 2; 0, 3; 1, 0)$. (b) Not linear: $T(bz) != bz$. (c) Not linear:
  $T(2, 2) = (4, 2) != 2 T(1, 1)$. (d) Linear, $ba ba^tp = mat(1, 0, 2; 0, 0, 0; 2, 0, 4)$.]
#ans(48)[(a) $[T]_S = mat(1, 0, 3; 2, 1, -1)$. (b) $bA = [T]_S bP$ with $bP = mat(1, 0, 1; 1, 1, 0; 0, 1, 1)^(-1)$:
  $bA = mat(2, -1, 1; 0, 2, -1)$, so $T(x, y, z) = (2x - y + z, #h(0.2em) 2y - z)$.]
#ans(49)[(a) $[T]_S = mat(1, -2; 2, 1)$. (b) $bA = [T]_S mat(1, 2; 2, -1)^(-1) = 1/5 mat(-3, 4; 4, 3)$;
  $bA^2 = bI$, $det(bA) = -1$.]
#ans(50)[$Q compose R$: $mat(1, 0; 0, 0) mat(0, -1; 1, 0) = mat(0, -1; 0, 0)$; #h(0.2em) $R compose Q$: $mat(0, 0; 1, 0)$.
  Kernel and range of $Q compose R$ are both $span{be_1}$.]
#ans(51)[RREF of the standard matrix: $mat(1, 0, -2, -3; 0, 1, 1, 1; 0, 0, 0, 0)$. (a) Kernel:
  $(2, -1, 1, 0)^tp$, $(3, -1, 0, 1)^tp$; range: $(1, 0, 1)^tp$, $(2, 1, 3)^tp$. (b) Rank 2, nullity 2; neither
  injective nor surjective.]
#ans(52)[(a) $det = a(a^2 - 2)$: #h(0.2em) $a = 0, plus.minus sqrt(2)$. (b) $a = 0$: $ker(T) = span{(1, 0, -1)^tp}$.]
#ans(53)[(a) $1$: $(1, 0, 0)^tp$; #h(0.2em) $1/2$: $(-2, 1, 0)^tp$; #h(0.2em) $1/3$: $(9, -6, 1)^tp$. (b) Writing $bx$ in this
  eigenbasis, the coefficient of $(1, 0, 0)^tp$ is $x_1 + 2x_2 + 3x_3$ and the other two terms decay, so the
  limit is $(x_1 + 2x_2 + 3x_3, 0, 0)^tp$.]
#ans(54)[(a) If $T$ is injective and $T(bx) = bz = T(bz)$ then $bx = bz$. Conversely $T(bx_1) = T(bx_2)$ gives
  $bx_1 - bx_2 in ker(T) = {bz}$. (b) The standard matrix is $m times n$: nullity $>= n - m > 0$ if $n > m$;
  rank $<= n < m$ if $n < m$.]

#ah[Part G #h(0.3em) Section A]
#ans(55)[*A.* (II) has a leading entry 2; (III) has a zero row above a nonzero row.]
#ans(56)[*B.* More variables than equations; the number of parameters is $6 - "rank" >= 2$.]
#ans(57)[*C.* $det(bB) = -10$, so $1/5 dot (-10) = -2$.]
#ans(58)[*C.* (I) fails for $mat(1, 0; 0, 0) + mat(0, 0; 0, 1)$; (II) by $det(bA) det(bB) != 0$.]
#ans(59)[*D.* Only (II) is a subspace, which none of (A)–(C) says.]
#ans(60)[*C.* The vectors in (I) sum to $bz$.]
#ans(61)[*D.* $7 - 3 = 4$ and $4 - 3 = 1$.]
#ans(62)[*C.* Row operations preserve the row space and the nullspace only.]
#ans(63)[*A.* Orthogonal nonzero vectors are independent, and at most $n$ vectors in $RR^n$ are.]
#ans(64)[*A.* Unique only when the columns of $bA$ are independent; $bA hat(bx)$ is always the projection.]
#ans(65)[*B.* $6/3 (1, 1, 1)^tp$.]
#ans(66)[*D.* (I) has distinct eigenvalues, (III) is symmetric; (II) has a one-dimensional eigenspace.]
#ans(67)[*A.* 0 is an eigenvalue; $mat(0, 1, 0; 0, 0, 0; 0, 0, 3)$ is not diagonalizable and has rank 2.]
#ans(68)[*D.* $0.3 x_1 = 0.2 x_2$ with $x_1 + x_2 = 1$.]
#ans(69)[*B.* The eigenvalues of $bA^tp bA$ are 9 and 1.]
#ans(70)[*B.* Nullity $>= 2$; the zero map is not surjective.]

#ah[Part G #h(0.3em) Section B]
#ans(71)[(a) $det(bA) = a(2 - a)$. (b) $a != 0, 2$. (c) $bA^(-1) = mat(3, -1, -1; -1, 1, 0; -1, 0, 1)$.
  (d) Rows 2 and 3 of $bA$ coincide, so $c = 3$; then $bx = (-1, 2 - s, s)^tp$.]
#ans(72)[(a) Each $bu_i$ satisfies the equation, $S$ is linearly independent (solve from the first
  coordinate down), and $dim V = 4 - 1 = 3$. (b) $2 - 3 + 4 - 3 = 0$; $[bw]_S = (2, 1, 3)^tp$.
  (c) With $bn = (1, -1, 1, -1)^tp$: $by - (by dot bn)/(bn dot bn) bn = by - bn = (2, 0, 0, 2)^tp$.
  (d) $bI - 1/4 bn bn^tp = 1/4 mat(3, 1, -1, 1; 1, 3, 1, -1; -1, 1, 3, 1; 1, -1, 1, 3)$.
  (e) $ker(T) = span{bn}$, range $V$, rank 3, nullity 1.]
#ans(73)[(a) $bQ = 1/2 mat(1, 1; 1, -1; 1, 1; 1, -1)$, $bR = mat(2, 4; 0, 2)$. (b) $bQ^tp bb = (4, 4)^tp$,
  $hat(bx) = (-2, 2)^tp$. (c) $bA hat(bx) = (4, 0, 4, 0)^tp$; distance $norm((-1, 1, 1, -1)^tp) = 2$.]
#ans(74)[(a) $lambda = 2$: $span{(2, 1)^tp}$; $lambda = -1$: $span{(1, -1)^tp}$. (b) $bP = mat(2, 1; 1, -1)$,
  $bD = mat(2, 0; 0, -1)$. (c) $bA^n = 1/3 mat(2^(n+1) + (-1)^n, 2^(n+1) - 2(-1)^n; 2^n - (-1)^n, 2^n + 2(-1)^n)$.
  (d) $bx_n = 1/3 (2^(n+1) + (-1)^n, #h(0.2em) 2^n - (-1)^n)^tp$; the ratio tends to 2.]
#ans(75)[(a) $bC^tp bC = mat(6, 3; 3, 6)$: #h(0.2em) $9$ with $1/sqrt(2) (1, 1)^tp$, #h(0.2em) $3$ with $1/sqrt(2) (1, -1)^tp$.
  (b) $sigma_1 = 3$, $sigma_2 = sqrt(3)$; $bSig = mat(3, 0; 0, sqrt(3); 0, 0)$, $bV = 1/sqrt(2) mat(1, 1; 1, -1)$.
  (c) $bu_1 = 1/3 bC bv_1 = 1/sqrt(2) (1, 1, 0)^tp$, $bu_2 = 1/sqrt(3) bC bv_2 = 1/sqrt(6) (1, -1, 2)^tp$,
  $bu_3 = 1/sqrt(3) (1, -1, -1)^tp$; $bU = (bu_1 #h(0.4em) bu_2 #h(0.4em) bu_3)$. (d) $Col(bC)$: ${bu_1, bu_2}$; $Null(bC^tp)$: ${bu_3}$;
  rank 2.]

#v(6pt)
#text(font: sans, size: 8.5pt, fill: soft)[Scoring the mock paper: 2 marks for each correct letter in Section A (32), and the marks shown for each part of Section B (68). Signs of singular vectors and the choice of eigenvectors may differ from those above.]
