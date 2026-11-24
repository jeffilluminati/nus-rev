#import "exset.typ": *
#show: exset.with(module: "MA1522", running: "Mock Final 1")
// The template header reads the part title at the top of the page, before the title block sets it.
#set page(header: context {
  set text(font: sans, size: 8pt, fill: soft)
  let t = part-title.get()
  grid(columns: (1fr, auto), [MA1522 | Mock Final 1], if t == "Front Matter" [Mock Final Examination 1] else { t })
})

// ══════════════════════════════════════════════════════════ MOCK FINAL 1 ══
#part-title.update("Mock Final Examination 1")
#line(length: 100%, stroke: 2.6pt + blue)
#v(-8pt)
#line(length: 100%, stroke: 0.5pt + rulegray)
#v(-2pt)
#grid(columns: (1fr, auto), align: (left + bottom, right + bottom),
  text(font: sans, weight: "bold", size: 15pt, fill: deep)[MA1522 #h(0.3em) LINEAR ALGEBRA FOR COMPUTING],
  text(font: sans, size: 9pt, fill: soft)[Problems 1–21 #h(0.3em)•#h(0.3em) 100 marks])
#v(-5pt)
#text(font: sans, weight: "bold", size: 21pt, fill: blue)[Mock Final Examination 1]
#v(-6pt)
#text(style: "italic", size: 10pt, fill: soft)[16 multiple-choice questions of 2 marks each and 5 written questions worth 68 marks #h(0.3em)•#h(0.3em) 2 hours, closed book, one A4 helpsheet]
#v(-5pt)
#line(length: 100%, stroke: 1.1pt + blue)
#v(4pt)

#panel[INSTRUCTIONS][
  Sit this paper in one sitting of two hours, with one double-sided A4 helpsheet and an approved
  calculator, and nothing else.

  *Section A* (Problems 1–16) has 16 multiple-choice questions of 2 marks each. Exactly one
  option is correct. In the examination the answers are shaded on an OMR sheet with a dark
  pencil; here, circle the letter.

  *Section B* (Problems 17–21) has 5 written questions worth 68 marks in total. The marks for
  each part are shown in brackets. Write each answer in the space provided and show full
  working for all computations: an answer without working does not earn full credit.
]

#topichead[Section A #h(0.5em) Multiple Choice #h(0.5em) (32 marks)]

#mcq[
  Let $a$ be a real constant. The augmented matrix of a linear system in $x_1, x_2, x_3$ is row
  equivalent to
  $ mat(1, 0, 2, 1; 0, 1, -1, 3; 0, 0, a^2 - 4, a - 2; augment: #3) . $
  Which of the following statements is/are true?
  #stmts[If $a = 2$, the system has infinitely many solutions.][If $a = -2$, the system has no solution.][If $a != 2$ and $a != -2$, the system has a unique solution.]
][Only (I) and (II) are true.][Only (I) and (III) are true.][(I), (II) and (III) are all true.][None of the above.]

#mcq[
  Let $bA$ be an $m times n$ matrix and $bb in RR^m$. Which of the following statements is/are (always)
  true?
  #stmts[If $bA bx = bb$ has two distinct solutions, then $bA bx = bz$ has infinitely many solutions.][If $bA bx = bz$ has only the trivial solution, then $bA bx = bc$ is consistent for every $bc in RR^m$.]
][Both (I) and (II) are true.][Only (I) is true.][Only (II) is true.][Both (I) and (II) are false.]

#mcq[
  Let $bA$ be a square matrix of order 3 with $bA^tp bA = 4 bI$ and $det(bA) > 0$. What is $det(bA)$?
][$2$][$4$][$64$][$8$]

#mcq[
  Let $bA$ and $bB$ be square matrices of order $n$. Which of the following statements is/are (always)
  true?
  #stmts[If $bA^2 = bz$, then $bI - bA$ is invertible.][If $bA bB = bz$ and $bA != bz$, then $bB$ is singular.]
][Both (I) and (II) are true.][Only (I) is true.][Only (II) is true.][Both (I) and (II) are false.]

#mcq[
  Let $mat(2, 1; 6, 7) = bL bU$, where $bL$ is lower triangular with 1's on its diagonal and $bU$ is
  upper triangular. What is the $(2, 2)$-entry of $bU$?
][$7$][$4$][$3$][$1$]

#mcq[
  Let $V$ be a subspace of $RR^n$ with $dim(V) = k >= 1$, and let $S$ be a set of $m$ vectors in $V$.
  Which of the following statements is/are (always) true?
  #stmts[If $span(S) = V$, then $m >= k$.][If $m = k$, then $S$ is a basis for $V$.][If $S$ is linearly independent, then $m <= k$.]
][Only (I) is true.][Only (I) and (II) are true.][(I), (II) and (III) are all true.][None of the above.]

#mcq[
  Let $S = {bu_1, bu_2}$ be the basis for $RR^2$ with $bu_1 = (1, 2)^tp$ and $bu_2 = (3, 5)^tp$. The vector $bw$
  has coordinate vector $[bw]_S = (2, -1)^tp$ relative to $S$. What is $bw$?
][$(-1, -1)^tp$][$(2, -1)^tp$][$(5, 9)^tp$][$(-13, 5)^tp$]

#mcq[
  Let $bA$ be a $5 times 7$ matrix such that the general solution of $bA bx = bz$ has exactly 3
  arbitrary parameters. Which of the following statements is/are true?
  #stmts[$dim(Row(bA)) = 4$.][$bA^tp by = bz$ has only the trivial solution.][There is a vector $bb in RR^5$ for which $bA bx = bb$ is inconsistent.]
][Only (I) is true.][Only (I) and (II) are true.][Only (I) and (III) are true.][(I), (II) and (III) are all true.]

#mcq[
  Let $bA$ be a square matrix of order $n$. Which of the following statements is/are (always) true?
  #stmts[$rank(bA^tp bA) = rank(bA)$.][$Col(bA^tp bA) = Col(bA)$.]
][Both (I) and (II) are true.][Only (I) is true.][Only (II) is true.][Both (I) and (II) are false.]

#mcq[
  Let $V = span{(1, 1, 0, 0)^tp, (0, 1, 1, 0)^tp}$, a subspace of $RR^4$. Which of the following vectors
  belongs to $V^perp$?
][$(1, -1, 1, 5)^tp$][$(1, -1, 0, 0)^tp$][$(1, 1, -1, 0)^tp$][$(0, 1, -1, 1)^tp$]

#mcq[
  The line $y = c + d x$ is fitted to the three data points $(0, 1)$, $(1, 1)$ and $(2, 4)$ by the
  method of least squares. What is the slope $d$?
][$1$][$1/2$][$3$][$3/2$]

#mcq[
  A Markov chain has transition matrix $bP = mat(0.8, 0.3; 0.2, 0.7)$ and initial state vector
  $bx_0 = (0.5, 0.5)^tp$, with $bx_(k+1) = bP bx_k$. What is $bx_2$?
][$(0.55, 0.45)^tp$][$(0.6, 0.4)^tp$][$(0.575, 0.425)^tp$][$(0.59, 0.41)^tp$]

#mcq[
  Let $bA$ and $bB$ be square matrices of order $n$. Which of the following statements is/are (always)
  true?
  #stmts[If $bA^2$ is diagonalizable, then $bA$ is diagonalizable.][If $bA$ and $bB$ are diagonalizable, then $bA + bB$ is diagonalizable.]
][Both (I) and (II) are true.][Only (I) is true.][Only (II) is true.][Both (I) and (II) are false.]

#mcq[
  Let $bA$ be a square matrix of order 2 with $det(bA) = -6$ whose largest singular value is $3$.
  What is the other singular value of $bA$?
][$2$][$-2$][$6$][$1/2$]

#mcq[
  Let $T : RR^3 -> RR^3$ be a linear transformation, and let $T compose T$ be the composition of $T$
  with itself. Which of the following statements is/are (always) true?
  #stmts[If $T compose T$ is the zero transformation, then $rank(T) <= 1$.][If $rank(T) <= 1$, then $T compose T$ is the zero transformation.]
][Both (I) and (II) are true.][Only (I) is true.][Only (II) is true.][Both (I) and (II) are false.]

#mcq[
  Let $T : RR^2 -> RR^3$ be a linear transformation such that
  $ T vec(1, 1) = vec(1, 0, 2) quad "and" quad T vec(1, -1) = vec(3, 2, 0) . $
  What is $T vec(3, 1)$?
][$(4, 2, 2)^tp$][$(10, 6, 2)^tp$][$(5, 2, 4)^tp$][$(7, 4, 2)^tp$]

#pagebreak()
#topichead[Section B #h(0.5em) Written Questions #h(0.5em) (68 marks)]

#prob(space: none)[
  #pts[14 marks] #h(0.3em) Let $a$ be a real constant, and consider the linear system
  $ x + 2y + z &= 1 \
    2x + 5y + (a + 2) z &= 3 \
    -x - y + (a^2 + a - 5) z &= a - 2 . $
]
#subpart("a", space: 4.5cm)[Reduce the augmented matrix of the system to a row-echelon form. #h(1fr) #pts[3]]
#subpart("b", space: 2.2cm)[Find all values of $a$ for which the system has (i) no solution, (ii) a unique solution,
  (iii) infinitely many solutions. #h(1fr) #pts[2]]
#subpart("c", space: 5.5cm)[Find all the solutions of the system in cases (ii) and (iii). #h(1fr) #pts[4]]
#subpart("d", space: 4cm)[For $a = 1$, the coefficient matrix is $bA = mat(1, 2, 1; 2, 5, 3; -1, -1, -3)$. Find a lower
  triangular matrix $bL$ with 1's on its diagonal and an upper triangular matrix $bU$ such that
  $bA = bL bU$. #h(1fr) #pts[3]]
#subpart("e", space: 4cm)[Use your factorization in (d) to solve $bA bx = (1, 4, 4)^tp$ by a forward and a backward
  substitution. #h(1fr) #pts[2]]

#prob(space: none)[
  #pts[14 marks] #h(0.3em) Let
  $ V = {(x_1, x_2, x_3, x_4)^tp in RR^4 : #h(0.4em) x_1 + x_2 - x_3 = 0 #h(0.5em) "and" #h(0.5em) x_2 + x_3 - x_4 = 0} . $
]
#subpart("a", space: 5cm)[Solve the two equations with $x_3 = s$ and $x_4 = t$ as parameters, and hence write down
  a basis $S = {bu_1, bu_2}$ for $V$ and the dimension of $V$. #h(1fr) #pts[4]]
#subpart("b", space: 3.5cm)[Show that $bw = (1, 1, 2, 3)^tp$ belongs to $V$, and find the coordinate vector $[bw]_S$. #h(1fr) #pts[3]]
#subpart("c", space: 3.2cm)[Let $bv_1 = (1, 0, 1, 1)^tp$ and $bv_2 = (0, 1, 1, 2)^tp$. Show that $T = {bv_1, bv_2}$ is a basis for $V$. #h(1fr) #pts[2]]
#subpart("d", space: 4cm)[Find the transition matrix $bP$ from $T$ to $S$, that is, the matrix with
  $bP [bv]_T = [bv]_S$ for every $bv in V$. #h(1fr) #pts[3]]
#subpart("e", space: 3.2cm)[Find the transition matrix from $S$ to $T$, and use it to find $[bw]_T$. #h(1fr) #pts[2]]

#prob(space: none)[
  #pts[14 marks] #h(0.3em) Let $bA = mat(1, 2, 4; 1, 2, 2; 1, 0, 2; 1, 0, 0)$ and $bb = (5, -1, 1, -1)^tp$.
]
#subpart("a", space: 8cm)[Apply the Gram–Schmidt process to the columns of $bA$, in the order given, to find an
  orthonormal basis for $Col(bA)$. #h(1fr) #pts[6]]
#subpart("b", space: 4cm)[Write down a matrix $bQ$ with orthonormal columns and an upper triangular matrix $bR$
  with positive diagonal entries such that $bA = bQ bR$. #h(1fr) #pts[3]]
#subpart("c", space: 4cm)[Use the factorization in (b) to find the least squares solution of $bA bx = bb$. #h(1fr) #pts[3]]
#subpart("d", space: 3cm)[Find the projection of $bb$ onto $Col(bA)$ and the distance from $bb$ to $Col(bA)$. #h(1fr) #pts[2]]

#prob(space: none)[
  #pts[13 marks] #h(0.3em) Let $a$ be a real constant and $bA = mat(2, 1, a; 1, 2, 1; 0, 0, 1)$.
]
#subpart("a", space: 4cm)[Find the characteristic polynomial and the eigenvalues of $bA$. #h(1fr) #pts[3]]
#subpart("b", space: 5cm)[Find all values of $a$ for which $bA$ is diagonalizable. Justify your answer. #h(1fr) #pts[4]]
#subpart("c", space: 4.5cm)[For $a = 1$, find an invertible matrix $bP$ and a diagonal matrix $bD$ such that
  $bP^(-1) bA bP = bD$. #h(1fr) #pts[3]]
#subpart("d", space: 5cm)[For $a = 1$, find $bA^n$ for every integer $n >= 1$. #h(1fr) #pts[3]]

#prob(space: none)[
  #pts[13 marks] #h(0.3em) Let $bC = mat(2, 0, 1; 0, 2, 1)$.
]
#subpart("a", space: 7cm)[Compute $bC^tp bC$, find its eigenvalues, and find a unit eigenvector for each
  eigenvalue. #h(1fr) #pts[5]]
#subpart("b", space: 2.6cm)[Write down the singular values of $bC$, the $2 times 3$ matrix $bSig$ and the orthogonal
  matrix $bV$ of a singular value decomposition $bC = bU bSig bV^tp$. #h(1fr) #pts[2]]
#subpart("c", space: 4cm)[Find the orthogonal matrix $bU$ for which $bC = bU bSig bV^tp$. #h(1fr) #pts[3]]
#subpart("d", space: 4cm)[Use your decomposition to write down an orthonormal basis for each of $Row(bC)$,
  $Null(bC)$ and $Col(bC)$, and describe $Null(bC^tp)$. #h(1fr) #pts[3]]
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

#ah[Section A]
#ans(1)[*C.* $a = 2$: the last row is zero and $x_3$ is free. $a = -2$: the last row reads $0 = -4$.
  Otherwise there are three pivots.]
#ans(2)[*B.* (I) If $bu != bv$ are solutions, then $bA(bu - bv) = bz$ with $bu - bv != bz$, and so is every
  multiple. (II) fails for $bA = (1, 0)^tp$, $bc = (0, 1)^tp$.]
#ans(3)[*D.* $det(bA)^2 = det(bA^tp bA) = det(4 bI) = 4^3 = 64$, and $det(bA) > 0$.]
#ans(4)[*A.* (I) $(bI - bA)(bI + bA) = bI - bA^2 = bI$. (II) If $bB$ were invertible, then
  $bA = (bA bB) bB^(-1) = bz$.]
#ans(5)[*B.* $R_2 - 3R_1$ gives $bU = mat(2, 1; 0, 4)$, with $bL = mat(1, 0; 3, 1)$.]
#ans(6)[*D.* (I) and (III) are true and (II) is false ($S = {be_1, 2 be_1}$ in $V = RR^2$), which none of
  (A)–(C) says.]
#ans(7)[*A.* $bw = 2 bu_1 - bu_2 = (2 - 3, 4 - 5)^tp$.]
#ans(8)[*C.* $rank(bA) = 7 - 3 = 4$, so $nullity(bA^tp) = 5 - 4 = 1 != 0$ and $Col(bA) != RR^5$.]
#ans(9)[*B.* (I) holds since $Null(bA^tp bA) = Null(bA)$. (II) fails for $bA = mat(0, 1; 0, 0)$:
  $bA^tp bA = mat(0, 0; 0, 1)$, and the column spaces are $span{be_1}$ and $span{be_2}$.]
#ans(10)[*A.* Its dot products with both spanning vectors are $1 - 1 = 0$ and $-1 + 1 = 0$. The others
  give a nonzero dot product with $(1, 1, 0, 0)^tp$ or $(0, 1, 1, 0)^tp$.]
#ans(11)[*D.* Normal equations $3c + 3d = 6$, $3c + 5d = 9$: $d = 3/2$, $c = 1/2$.]
#ans(12)[*C.* $bx_1 = (0.55, 0.45)^tp$ and $bx_2 = bP bx_1 = (0.44 + 0.135, #h(0.2em) 0.11 + 0.315)^tp$.]
#ans(13)[*D.* (I) fails for $bA = mat(0, 1; 0, 0)$, where $bA^2 = bz$. (II) fails for
  $mat(1, 1; 0, 0) + mat(-1, 0; 0, 0) = mat(0, 1; 0, 0)$.]
#ans(14)[*A.* $sigma_1^2 sigma_2^2 = det(bA^tp bA) = det(bA)^2 = 36$, so $sigma_2 = 6 \/ 3 = 2$. Singular values
  are never negative.]
#ans(15)[*B.* (I) The range of $T$ lies in $ker(T)$, so $rank(T) <= nullity(T) = 3 - rank(T)$.
  (II) fails for the standard matrix $mat(1, 0, 0; 0, 0, 0; 0, 0, 0)$.]
#ans(16)[*C.* $(3, 1)^tp = 2 (1, 1)^tp + (1, -1)^tp$, so the image is $2 (1, 0, 2)^tp + (3, 2, 0)^tp$.]

#ah[Section B]
#ans(17)[(a) $R_2 - 2R_1$, $R_3 + R_1$, then $R_3 - R_2$:
  $mat(1, 2, 1, 1; 0, 1, a, 1; 0, 0, a^2 - 4, a - 2; augment: #3)$.
  (b) (i) $a = -2$ (last row $0 = -4$); (ii) $a != 2$ and $a != -2$; (iii) $a = 2$.
  (c) Case (ii): $z = 1/(a + 2)$, $y = 1 - a z = 2/(a + 2)$, $x = 1 - 2y - z = (a - 3)/(a + 2)$.
  Case (iii), $a = 2$: $(x, y, z) = (-1 + 3t, #h(0.2em) 1 - 2t, #h(0.2em) t)$, $t in RR$.
  (d) $bL = mat(1, 0, 0; 2, 1, 0; -1, 1, 1)$, $bU = mat(1, 2, 1; 0, 1, 1; 0, 0, -3)$.
  (e) $bL by = (1, 4, 4)^tp$ gives $by = (1, 2, 3)^tp$; $bU bx = by$ gives $bx = (-4, 3, -1)^tp$.]
#ans(18)[(a) $x_2 = t - s$, $x_1 = x_3 - x_2 = 2s - t$, so $bx = s (2, -1, 1, 0)^tp + t (-1, 1, 0, 1)^tp$:
  $bu_1 = (2, -1, 1, 0)^tp$, $bu_2 = (-1, 1, 0, 1)^tp$, $dim(V) = 2$.
  (b) $1 + 1 - 2 = 0$ and $1 + 2 - 3 = 0$; $s = 2$, $t = 3$, so $[bw]_S = (2, 3)^tp$.
  (c) Both vectors satisfy the two equations, neither is a multiple of the other, and $dim(V) = 2$.
  (d) $bv_1 = bu_1 + bu_2$ and $bv_2 = bu_1 + 2 bu_2$, so $bP = ([bv_1]_S #h(0.4em) [bv_2]_S) = mat(1, 1; 1, 2)$.
  (e) $bP^(-1) = mat(2, -1; -1, 1)$ and $[bw]_T = bP^(-1) (2, 3)^tp = (1, 1)^tp$. Check: $bv_1 + bv_2 = bw$.]
#ans(19)[(a) $bw_1 = ba_1 = (1, 1, 1, 1)^tp$; #h(0.2em) $bw_2 = ba_2 - 4/4 bw_1 = (1, 1, -1, -1)^tp$;
  #h(0.2em) $bw_3 = ba_3 - 8/4 bw_1 - 4/4 bw_2 = (1, -1, 1, -1)^tp$. Each has norm 2, so
  $bq_1 = 1/2 (1, 1, 1, 1)^tp$, $bq_2 = 1/2 (1, 1, -1, -1)^tp$, $bq_3 = 1/2 (1, -1, 1, -1)^tp$.
  (b) $bQ = 1/2 mat(1, 1, 1; 1, 1, -1; 1, -1, 1; 1, -1, -1)$, $bR = bQ^tp bA = mat(2, 2, 4; 0, 2, 2; 0, 0, 2)$.
  (c) $bR hat(bx) = bQ^tp bb = (2, 2, 4)^tp$, so $hat(bx) = (-2, -1, 2)^tp$.
  (d) $bA hat(bx) = (4, 0, 2, -2)^tp$; distance $norm((1, -1, -1, 1)^tp) = 2$.]
#ans(20)[(a) Expanding along row 3: $det(x bI - bA) = (x - 1)((x - 2)^2 - 1) = (x - 1)^2 (x - 3)$;
  eigenvalues $1$ (twice) and $3$, for every $a$.
  (b) $bA - bI = mat(1, 1, a; 1, 1, 1; 0, 0, 0)$ has rank 1 if $a = 1$ and rank 2 otherwise, so
  $dim(E_1) = 2$ exactly when $a = 1$. Diagonalizable if and only if $a = 1$.
  (c) $E_1$: $x + y + z = 0$; $E_3 = span{(1, 1, 0)^tp}$. $bP = mat(1, 1, 1; -1, 0, 1; 0, -1, 0)$,
  $bD = mat(1, 0, 0; 0, 1, 0; 0, 0, 3)$.
  (d) $bP^(-1) = 1/2 mat(1, -1, 1; 0, 0, -2; 1, 1, 1)$ and
  $bA^n = bP bD^n bP^(-1) = 1/2 mat(3^n + 1, 3^n - 1, 3^n - 1; 3^n - 1, 3^n + 1, 3^n - 1; 0, 0, 2)$.]
#ans(21)[(a) $bC^tp bC = mat(4, 0, 2; 0, 4, 2; 2, 2, 2)$, characteristic polynomial $x (x - 4)(x - 6)$.
  $6$: $bv_1 = 1/sqrt(3) (1, 1, 1)^tp$; #h(0.2em) $4$: $bv_2 = 1/sqrt(2) (1, -1, 0)^tp$; #h(0.2em) $0$: $bv_3 = 1/sqrt(6) (1, 1, -2)^tp$.
  (b) $sigma_1 = sqrt(6)$, $sigma_2 = 2$; $bSig = mat(sqrt(6), 0, 0; 0, 2, 0)$, $bV = (bv_1 #h(0.4em) bv_2 #h(0.4em) bv_3)$.
  (c) $bu_1 = 1/sqrt(6) bC bv_1 = 1/sqrt(2) (1, 1)^tp$, $bu_2 = 1/2 bC bv_2 = 1/sqrt(2) (1, -1)^tp$;
  $bU = 1/sqrt(2) mat(1, 1; 1, -1)$.
  (d) $Row(bC)$: ${bv_1, bv_2}$; $Null(bC)$: ${bv_3}$; $Col(bC)$: ${bu_1, bu_2}$, so $Col(bC) = RR^2$;
  $Null(bC^tp) = {bz}$, since $rank(bC) = 2$.]

#v(6pt)
#text(font: sans, size: 8.5pt, fill: soft)[Scoring: 2 marks for each correct letter in Section A (32), and the marks shown for each part of Section B (68). Bases, eigenvectors and the signs of singular vectors may differ from those above; in Problem 20 the columns of $bP$ may be any basis of eigenvectors in the order matching $bD$.]
