#import "exset.typ": *
#show: exset.with(module: "MA1522", running: "Mock Final 3")
// The first page's header is laid out before any state update, so name it here.
#set page(header: context {
  set text(font: sans, size: 8pt, fill: soft)
  let t = part-title.get()
  grid(columns: (1fr, auto), [MA1522 | Mock Final 3], if t == "Front Matter" [Question Paper] else { t })
})

// ══════════════════════════════════════════════════════════════════ TITLE ══
#part-title.update("Question Paper")
#line(length: 100%, stroke: 2.6pt + blue)
#v(-8pt)
#line(length: 100%, stroke: 0.5pt + rulegray)
#v(-2pt)
#grid(columns: (1fr, auto), align: (left + bottom, right + bottom),
  text(font: sans, weight: "bold", size: 15pt, fill: deep)[MA1522 Linear Algebra for Computing],
  text(font: sans, size: 9pt, fill: soft)[Problems 1–21 #h(0.3em)•#h(0.3em) 100 marks])
#v(-5pt)
#text(font: sans, weight: "bold", size: 21pt, fill: blue)[Mock Final Examination 3]
#v(-6pt)
#text(style: "italic", size: 10pt, fill: soft)[16 multiple-choice questions of 2 marks each and 5 written questions worth 68 marks #h(0.3em)•#h(0.3em) 2 hours, closed book #h(0.3em)•#h(0.3em) the hardest of the three mock papers]
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
  Let $a$ be a real constant. A linear system in the variables $x$, $y$, $z$ has augmented matrix
  $ mat(1, 1, 2, 1; 0, a, 1, 1; 0, 0, a(a - 1), a - 1; augment: #3) . $
  Which of the following statements is/are true?
  #stmts[The system is inconsistent for exactly two values of $a$.][The system has infinitely many solutions for exactly one value of $a$.]
][Both (I) and (II) are true.][Only (I) is true.][Only (II) is true.][Both (I) and (II) are false.]

#mcq[
  Let $bA$ be an $m times n$ matrix and let $bb in RR^m$ be a nonzero vector. Suppose that $bu$ and
  $bv$ are solutions of $bA bx = bb$. Which of the following statements is/are always true?
  #stmts[$bu - bv$ is a solution of $bA bx = bz$.][$bu + bv$ is a solution of $bA bx = bb$.]
][Both (I) and (II) are true.][Only (I) is true.][Only (II) is true.][Both (I) and (II) are false.]

#mcq[
  Let $bA = mat(1, 1, 0; 0, 1, 1; 1, 0, 1)$. What is the $(1, 3)$-entry of $bA^(-1)$?
][$-1/2$][$1$][$-1$][$1/2$]

#mcq[
  Let $bA$ and $bB$ be square matrices of order $n$. Which of the following statements is/are always
  true?
  #stmts[If $bA bB = bI$, then $bB bA = bI$.][If $bA^3 = bold(0)$, then $bI - bA$ is invertible.]
][Both (I) and (II) are true.][Only (I) is true.][Only (II) is true.][Both (I) and (II) are false.]

#mcq[
  Let $bA$ and $bB$ be square matrices of order $n >= 2$ and let $c$ be a real number. Which of the
  following statements is/are always true?
  #stmts[$det(bA + bB) = det(bA) + det(bB)$.][$det(c bA) = c det(bA)$.][$det(bA bB) = det(bB bA)$.]
][Only (I) and (III) are true.][Only (II) and (III) are true.][(I), (II) and (III) are all true.][None of the above.]

#mcq[
  Let ${bu_1, bu_2, bu_3}$ be a basis for a subspace $V$ of $RR^n$. Which of the following statements
  is/are true?
  #stmts[${bu_1 + 2 bu_2, #h(0.3em) bu_2 + 2 bu_3, #h(0.3em) bu_3 + 2 bu_1}$ is a basis for $V$.][${bu_1 + bu_2, #h(0.3em) bu_2 + bu_3, #h(0.3em) bu_1 - bu_3}$ is a basis for $V$.]
][Both (I) and (II) are true.][Only (I) is true.][Only (II) is true.][Both (I) and (II) are false.]

#mcq[
  What is the dimension of
  $span{(1, 1, 0, 1)^tp, #h(0.3em) (1, 2, 1, 0)^tp, #h(0.3em) (0, 1, 1, -1)^tp, #h(0.3em) (2, 3, 1, 1)^tp}$?
][$2$][$3$][$4$][$1$]

#mcq[
  Let $bA$ be a $3 times 5$ matrix of rank 3. Which of the following statements is/are always true?
  #stmts[$bA^tp bA$ is invertible.][$bA bx = bb$ is consistent for every $bb in RR^3$.]
][Both (I) and (II) are true.][Only (I) is true.][Only (II) is true.][Both (I) and (II) are false.]

#mcq[
  Let $bA$ be a square matrix of order $n$. Which of the following statements is/are always true?
  #stmts[$Col(bA) = Row(bA)$.][$Null(bA) = Null(bA^tp)$.]
][Both (I) and (II) are true.][Only (I) is true.][Only (II) is true.][Both (I) and (II) are false.]

#mcq[
  Let $V = span{(1, 1, 0)^tp, (0, 1, 1)^tp}$. What is the distance from $bb = (3, 0, 0)^tp$ to $V$?
][$sqrt(3)$][$3$][$1$][$sqrt(6)$]

#mcq[
  Let $bQ$ be an $m times n$ matrix with orthonormal columns, where $m > n$. Which of the following
  statements is/are always true?
  #stmts[$bQ bQ^tp bb = bb$ for every $bb in RR^m$.][For every $bb in RR^m$, the least squares solution of $bQ bx = bb$ is $bQ^tp bb$.]
][Both (I) and (II) are true.][Only (I) is true.][Only (II) is true.][Both (I) and (II) are false.]

#mcq[
  Let $bA$ be a square matrix of order 3 whose eigenvalues are $0$, $1$ and $2$. Which of the following
  statements is/are always true?
  #stmts[$rank(bA) = 2$.][$bA$ is symmetric.]
][Both (I) and (II) are true.][Only (I) is true.][Only (II) is true.][Both (I) and (II) are false.]

#mcq[
  What is the equilibrium vector of the stochastic matrix
  $bP = mat(1/2, 1/4, 0; 1/2, 1/2, 1/2; 0, 1/4, 1/2)$?
][$(1/3, 1/3, 1/3)^tp$][$(1/4, 1/4, 1/2)^tp$][$(1/5, 3/5, 1/5)^tp$][$(1/4, 1/2, 1/4)^tp$]

#mcq[
  Let $bA = bU bSig bV^tp$ be a singular value decomposition of an $m times n$ matrix $bA$ of rank
  $r < n$, with the singular values in decreasing order on the diagonal of $bSig$. Which of the
  following statements is/are always true?
  #stmts[The first $r$ columns of $bU$ form an orthonormal basis for $Col(bA)$.][The last $n - r$ columns of $bV$ form an orthonormal basis for $Null(bA)$.]
][Both (I) and (II) are true.][Only (I) is true.][Only (II) is true.][Both (I) and (II) are false.]

#mcq[
  Let $T : RR^2 -> RR^2$ be a linear transformation with $T((1, 1)^tp) = (2, 0)^tp$ and
  $T((1, -1)^tp) = (0, 4)^tp$. What is $T((3, 1)^tp)$?
][$(6, 4)^tp$][$(2, 4)^tp$][$(4, 4)^tp$][$(4, 2)^tp$]

#mcq[
  Let $T : RR^n -> RR^n$ be a linear transformation with range $Rg(T)$. Which of the following
  statements is/are always true?
  #stmts[$T$ is injective if and only if $T$ is surjective.][$ker(T) inter Rg(T) = {bz}$.]
][Both (I) and (II) are true.][Only (I) is true.][Only (II) is true.][Both (I) and (II) are false.]

#pagebreak()
#topichead[Section B #h(0.5em) Written Questions #h(0.5em) (68 marks)]

#prob(space: none)[
  #pts[14 marks] #h(0.3em) Let $bA = bL bU$ be an LU factorization of a $3 times 4$ matrix $bA$, where $bL$ is
  a lower triangular matrix of order 3 with every diagonal entry equal to 1, and
  $ bU = mat(1, 2, 0, 1; 0, 0, 2, -2; 0, 0, 0, 0) . $
  The entries of $bL$ below the diagonal are not given.
]
#subpart("a", space: 5cm)[Find $rank(bA)$, $nullity(bA)$ and a basis for $Null(bA)$, explaining why they can be
  read off from $bU$. #h(1fr) #pts[4]]
#subpart("b", space: 2.5cm)[Write $bA = (ba_1 #h(0.4em) ba_2 #h(0.4em) ba_3 #h(0.4em) ba_4)$. Which of the columns of $bA$ form a
  basis for $Col(bA)$? Justify your answer. #h(1fr) #pts[2]]
#subpart("c", space: 6cm)[It is given that
  $bA (1, 1, 0, 0)^tp = (3, 6, -3)^tp$ and $bA (1, 0, 1, 0)^tp = (1, 4, 5)^tp$. Find $bL$ and $bA$. #h(1fr) #pts[4]]
#subpart("d", space: 5cm)[Let $bb in RR^3$ be a vector for which $hat(bx) = (1, 0, 1, 0)^tp$ is a least squares
  solution of $bA bx = bb$. Find the projection of $bb$ onto $Col(bA)$ and all the least squares
  solutions of $bA bx = bb$. #h(1fr) #pts[4]]

#prob(space: none)[
  #pts[14 marks] #h(0.3em) Let $a$ be a real constant, let $V = {bx in RR^4 : x_1 + x_2 + x_3 - x_4 = 0}$ and
  $ T = {bold(t)_1 = (1, a, 0, a + 1)^tp, #h(0.5em) bold(t)_2 = (0, 1, 1, 2)^tp, #h(0.5em) bold(t)_3 = (a, 0, a, a^2 + a - 2)^tp} . $
]
#subpart("a", space: 7cm)[Find all values of $a$ for which $T$ is a basis for $V$. #h(1fr) #pts[5]]
#subpart("b", space: 4.5cm)[For the rest of this question, $a$ takes the value found in (a). Show that
  $bu = (3, 1, 1, 5)^tp$ lies in $V$, and find $[bu]_T$. #h(1fr) #pts[3]]
#subpart("c", space: 4cm)[The vector $bw = (3, 1, 2, 2)^tp$ does not lie in $V$. Find the projection of $bw$
  onto $V$. #h(1fr) #pts[3]]
#subpart("d", space: 5.5cm)[The set $S = {(1, 0, 0, 1)^tp, (1, 1, 0, 2)^tp, (1, 1, 1, 3)^tp}$ is another basis for $V$.
  Find the transition matrix from $T$ to $S$, and use it to find $[bu]_S$. #h(1fr) #pts[3]]

#prob(space: none)[
  #pts[14 marks] #h(0.3em) A $4 times 3$ matrix $bA$ has a singular value decomposition $bA = bU bSig bV^tp$,
  with the singular values in decreasing order on the diagonal of $bSig$, in which
  $ bV = (bv_1 #h(0.4em) bv_2 #h(0.4em) bv_3) = 1/3 mat(2, -1, 2; 2, 2, -1; -1, 2, 2) . $
  The characteristic polynomial of $bA^tp bA$ is $(x - 144)(x - 36)(x - 18)$, and
  $ bA vec(2, 2, -1) = vec(18, 18, 18, 18), quad bA vec(-1, 2, 2) = vec(9, 9, -9, -9), quad
    bA vec(2, -1, 2) = vec(9, -9, 0, 0) . $
]
#subpart("a", space: 2.5cm)[Write down the singular values of $bA$ and the matrix $bSig$. #h(1fr) #pts[2]]
#subpart("b", space: 7cm)[Find the orthogonal matrix $bU$. #h(1fr) #pts[5]]
#subpart("c", space: 5.5cm)[Find the matrix $bA$. #h(1fr) #pts[4]]
#subpart("d", space: 4.5cm)[Find the least squares solution of $bA bx = (12, 0, 7, 5)^tp$. #h(1fr) #pts[3]]

#prob(space: none)[
  #pts[13 marks] #h(0.3em) Let $a$ be a real constant and $bA = mat(1, 1, 1; 0, a, 0; 0, 0, a)$.
]
#subpart("a", space: 5cm)[Find the eigenvalues of $bA$ and, for $a != 1$, a basis for each eigenspace. #h(1fr) #pts[3]]
#subpart("b", space: 3cm)[Show that $bA$ is not diagonalizable when $a = 1$. #h(1fr) #pts[2]]
#subpart("c", space: 4.5cm)[For $a != 1$, find an invertible $bP$ and a diagonal $bD$ with $bA = bP bD bP^(-1)$, and
  find $bP^(-1)$. #h(1fr) #pts[3]]
#subpart("d", space: 4.5cm)[For $a != 1$, find $bA^m$ for every integer $m >= 1$. #h(1fr) #pts[3]]
#subpart("e", space: 4cm)[Let $bx_0 = (1, 1, 1)^tp$. Find all values of $a$ for which $lim_(m -> oo) bA^m bx_0$ exists,
  and find the limit for those values. #h(1fr) #pts[2]]

#prob(space: none)[
  #pts[13 marks] #h(0.3em) Let $n >= 2$ and let $T : RR^n -> RR^n$ be defined by $T(bx) = by$, where
  $ y_i = x_(i-1) + x_(i+1) quad "for" i = 1, 2, ..., n, quad "with the convention" x_0 = x_(n+1) = 0 . $
  That is, $T(bx) = (x_2, #h(0.3em) x_1 + x_3, #h(0.3em) x_2 + x_4, #h(0.3em) ..., #h(0.3em) x_(n-2) + x_n, #h(0.3em) x_(n-1))^tp$.
]
#subpart("a", space: 4.5cm)[Prove that $T$ is a linear transformation. #h(1fr) #pts[3]]
#subpart("b", space: 3.5cm)[Write down the standard matrix of $T$ when $n = 5$. #h(1fr) #pts[2]]
#subpart("c", space: 5cm)[Prove that $T$ is injective when $n$ is even. #h(1fr) #pts[3]]
#subpart("d", space: 3.5cm)[Prove that $bx dot T(by) = T(bx) dot by$ for all $bx, by in RR^n$. #h(1fr) #pts[2]]
#subpart("e", space: 5.5cm)[Let $n$ be odd. Find a basis for $ker(T)$, and describe the range of $T$ by a single
  linear equation, with justification. #h(1fr) #pts[3]]
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
#ans(1)[*C.* $a = 0$: rows $(0, 0, 1 | 1)$ and $(0, 0, 0 | -1)$, inconsistent. $a = 1$: last row zero, rank 2,
  infinitely many. Otherwise three pivots, unique. So inconsistent for one value only.]
#ans(2)[*B.* $bA(bu - bv) = bb - bb = bz$, but $bA(bu + bv) = 2 bb != bb$ as $bb != bz$.]
#ans(3)[*D.* $det(bA) = 2$ and $bA^(-1) = 1/2 mat(1, -1, 1; 1, 1, -1; -1, 1, 1)$.]
#ans(4)[*A.* (I) a one-sided inverse of a square matrix is two-sided; (II)
  $(bI - bA)(bI + bA + bA^2) = bI - bA^3 = bI$.]
#ans(5)[*D.* Only (III) is true ($det(bA) det(bB)$ both ways). $bA = bB = bI_2$ breaks (I): $4 != 2$; $c = 2$,
  $bA = bI_2$ breaks (II): $det(c bA) = c^n det(bA)$.]
#ans(6)[*B.* Coordinate matrices: $det mat(1, 0, 2; 2, 1, 0; 0, 2, 1) = 9 != 0$, but in (II)
  $(bu_1 + bu_2) - (bu_2 + bu_3) = bu_1 - bu_3$.]
#ans(7)[*A.* The third vector is the second minus the first and the fourth is their sum; the first two
  are independent.]
#ans(8)[*C.* $bA^tp bA$ is $5 times 5$ of rank 3, so singular; rank equals the number of rows, so
  $Col(bA) = RR^3$.]
#ans(9)[*D.* $bA = mat(0, 1; 0, 0)$: $Col(bA) = Null(bA) = span{be_1}$ but $Row(bA) = Null(bA^tp) = span{be_2}$.]
#ans(10)[*A.* $V$ is the plane with normal $bn = (1, -1, 1)^tp$; distance
  $abs(bb dot bn) \/ norm(bn) = 3 \/ sqrt(3) = sqrt(3)$.]
#ans(11)[*C.* $bQ bQ^tp bb$ is the projection onto $Col(bQ) != RR^m$, e.g. $bQ = mat(1, 0; 0, 1; 0, 0)$,
  $bb = be_3$. Normal equations: $bQ^tp bQ bx = bx = bQ^tp bb$.]
#ans(12)[*B.* Three distinct eigenvalues, so diagonalizable and $nullity(bA) = 1$; $mat(0, 1, 0; 0, 1, 0; 0, 0, 2)$ is
  not symmetric.]
#ans(13)[*D.* $bP bx = bx$ gives $x_2 = 2 x_1$ and $x_2 = 2 x_3$; entries sum to 1.]
#ans(14)[*A.* $bA bv_i = sigma_i bu_i$ for $i <= r$ and $bA bv_i = bz$ for $i > r$; the dimensions $r$ and
  $n - r$ match.]
#ans(15)[*C.* $(3, 1)^tp = 2 (1, 1)^tp + (1, -1)^tp$, so $T = 2 (2, 0)^tp + (0, 4)^tp$.]
#ans(16)[*B.* (I) by rank–nullity. (II) fails for $mat(0, 1; 0, 0)$: kernel and range are both
  $span{be_1}$.]

#ah[Section B]
#ans(17)[(a) $bL$ is invertible, so $bA bx = bz$ iff $bU bx = bz$: $Null(bA) = Null(bU)$ and
  $rank(bA) = rank(bU) = 2$, nullity $4 - 2 = 2$. With $x_2 = s$, $x_4 = t$: $x_3 = t$,
  $x_1 = -2s - t$; basis ${(-2, 1, 0, 0)^tp, (-1, 0, 1, 1)^tp}$. \
  (b) ${ba_1, ba_3}$: the pivot columns of $bU$ are 1 and 3, and $bA$, $bU$ have the same linear
  relations among columns (same nullspace). \
  (c) $bU (1, 1, 0, 0)^tp = (3, 0, 0)^tp$, so $3 bold(l)_1 = (3, 6, -3)^tp$;
  $bU (1, 0, 1, 0)^tp = (1, 2, 0)^tp$, so $bold(l)_1 + 2 bold(l)_2 = (1, 4, 5)^tp$ and
  $bold(l)_2 = (0, 1, 3)^tp$.
  $ bL = mat(1, 0, 0; 2, 1, 0; -1, 3, 1), quad bA = mat(1, 2, 0, 1; 2, 4, 2, 0; -1, -2, 6, -7) . $
  (d) The projection is $bA hat(bx) = (1, 4, 5)^tp$. The least squares solutions are the solutions
  of $bA bx = bA hat(bx)$, namely $hat(bx) + Null(bA)$:
  $bx = (1 - 2s - t, #h(0.2em) s, #h(0.2em) 1 + t, #h(0.2em) t)^tp$, $s, t in RR$.]
#ans(18)[(a) $bold(t)_1, bold(t)_2 in V$ for every $a$; $bold(t)_3 in V$ iff $2a = a^2 + a - 2$, i.e.
  $(a - 2)(a + 1) = 0$. For $a = -1$: $bold(t)_3 = -bold(t)_1 - bold(t)_2$, dependent. For $a = 2$:
  $T = {(1, 2, 0, 3)^tp, (0, 1, 1, 2)^tp, (2, 0, 2, 4)^tp}$ and
  $det mat(1, 0, 2; 2, 1, 0; 0, 1, 2) = 6 != 0$ (first three coordinates), so $T$ is independent;
  $dim V = 4 - 1 = 3$. Hence $a = 2$ only. \
  (b) $3 + 1 + 1 - 5 = 0$. Solving $c_1 + 2c_3 = 3$, $2c_1 + c_2 = 1$, $c_2 + 2c_3 = 1$:
  $[bu]_T = (1, -1, 1)^tp$. \
  (c) With $bn = (1, 1, 1, -1)^tp$: $bw - (bw dot bn)/(bn dot bn) bn = bw - 4/4 bn = (2, 0, 1, 3)^tp$. \
  (d) $[bx]_S = (x_1 - x_2, #h(0.2em) x_2 - x_3, #h(0.2em) x_3)^tp$ for $bx in V$; the columns are
  $[bold(t)_j]_S$: $ bP = mat(-1, -1, 2; 2, 0, -2; 0, 1, 2), quad [bu]_S = bP [bu]_T = (2, 0, 1)^tp . $]
#ans(19)[(a) $sigma_1 = 12$, $sigma_2 = 6$, $sigma_3 = sqrt(18) = 3 sqrt(2)$;
  $bSig = mat(12, 0, 0; 0, 6, 0; 0, 0, 3 sqrt(2); 0, 0, 0)$. \
  (b) $bA bv_1 = (6, 6, 6, 6)^tp$, $bA bv_2 = (3, 3, -3, -3)^tp$, $bA bv_3 = (3, -3, 0, 0)^tp$ and
  $bu_i = 1/sigma_i bA bv_i$: $bu_1 = 1/2 (1, 1, 1, 1)^tp$, $bu_2 = 1/2 (1, 1, -1, -1)^tp$,
  $bu_3 = 1/sqrt(2) (1, -1, 0, 0)^tp$. Solving $bu_i dot bx = 0$ for $i = 1, 2, 3$:
  $bu_4 = 1/sqrt(2) (0, 0, 1, -1)^tp$ (or its negative). $bU = (bu_1 #h(0.4em) bu_2 #h(0.4em) bu_3 #h(0.4em) bu_4)$. \
  (c) $bA = 12 bu_1 bv_1^tp + 6 bu_2 bv_2^tp + 3 sqrt(2) bu_3 bv_3^tp = mat(5, 5, 2; 1, 7, -2; 5, 2, -4; 5, 2, -4)$. \
  (d) Projection of $bb$ onto $Col(bA) = span{bu_4}^perp$: $bb - (bb dot bu_4) bu_4 = (12, 0, 6, 6)^tp
  = 12 bu_1 + 6 sqrt(2) bu_3$, so $hat(bx) = bv_1 + 2 bv_3 = (2, 0, 1)^tp$ (unique, as $rank(bA) = 3$).]
#ans(20)[(a) $bA$ is triangular: eigenvalues $1$ and $a$ ($a$ twice). For $a != 1$:
  $E_1 = span{(1, 0, 0)^tp}$, $E_a = span{(1, a - 1, 0)^tp, (1, 0, a - 1)^tp}$ (from
  $(1 - a) x_1 + x_2 + x_3 = 0$). \
  (b) The only eigenvalue is 1, of multiplicity 3, but $bA - bI = mat(0, 1, 1; 0, 0, 0; 0, 0, 0)$ has
  nullity $2 < 3$. \
  (c) $bP = mat(1, 1, 1; 0, a - 1, 0; 0, 0, a - 1)$, $bD = mat(1, 0, 0; 0, a, 0; 0, 0, a)$,
  $bP^(-1) = 1/(a - 1) mat(a - 1, -1, -1; 0, 1, 0; 0, 0, 1)$. \
  (d) $bA^m = bP bD^m bP^(-1) = mat(1, (a^m - 1)/(a - 1), (a^m - 1)/(a - 1); 0, a^m, 0; 0, 0, a^m)$. \
  (e) $bA^m bx_0 = (1 + 2 (a^m - 1)/(a - 1), #h(0.2em) a^m, #h(0.2em) a^m)^tp$ for $a != 1$, and
  $(1 + 2m, 1, 1)^tp$ for $a = 1$. The limit exists iff $-1 < a < 1$, and it is
  $((3 - a)/(1 - a), 0, 0)^tp$.]
#ans(21)[(a) With the convention, the $i$th coordinate of $T(alpha bx + beta bx')$ is
  $(alpha x_(i-1) + beta x'_(i-1)) + (alpha x_(i+1) + beta x'_(i+1)) = alpha (x_(i-1) + x_(i+1)) + beta (x'_(i-1) + x'_(i+1))$,
  so $T(alpha bx + beta bx') = alpha T(bx) + beta T(bx')$. \
  (b) $mat(0, 1, 0, 0, 0; 1, 0, 1, 0, 0; 0, 1, 0, 1, 0; 0, 0, 1, 0, 1; 0, 0, 0, 1, 0)$ (columns $T(be_j) = be_(j-1) + be_(j+1)$). \
  (c) Let $T(bx) = bz$. Then $x_2 = 0$ and $x_(i+1) = -x_(i-1)$, so $x_2 = x_4 = ... = x_n = 0$. Also
  $x_(n-1) = 0$ and $x_(i-1) = -x_(i+1)$, so $x_(n-1) = x_(n-3) = ... = x_1 = 0$ ($n - 1$ is odd).
  So $ker(T) = {bz}$. \
  (d) The standard matrix $bA$ is symmetric: $bx dot bA by = bx^tp bA by = (bA^tp bx)^tp by = (bA bx) dot by$. \
  (e) As in (c) the even coordinates vanish and $x_(2j+1) = (-1)^j x_1$; now $x_(n-1) = 0$ is
  already satisfied. Basis: ${bold(k)}$ with $bold(k) = (1, 0, -1, 0, 1, ..., plus.minus 1)^tp$,
  $k_(2j+1) = (-1)^j$. By (d), $bold(k) dot T(by) = T(bold(k)) dot by = 0$, so
  $Rg(T) subset.eq {by : bold(k) dot by = 0}$; both have dimension $n - 1$, so
  $Rg(T) = {by : y_1 - y_3 + y_5 - dots.c plus.minus y_n = 0}$.]

#v(6pt)
#text(font: sans, size: 8.5pt, fill: soft)[Scoring: 2 marks for each correct letter in Section A (32), and the marks shown for each part of Section B (68). Signs of singular vectors, the sign of the completing column of $bU$, and the choice and order of eigenvectors may differ from those above.]
