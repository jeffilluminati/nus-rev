// MA1522 Linear Algebra for Computing — Mock Final 2
// Original paper in the examination format: 16 multiple-choice questions (32 marks) and
// 5 written questions (68 marks), 2 hours, closed book. Every answer in the key is
// recomputed by verify_mock2.py (sympy).
#import "exset.typ": *
#show: exset.with(module: "MA1522", running: "Mock Final 2")
// The template header reads the part title at the top of the page, before the title block sets it.
#set page(header: context {
  set text(font: sans, size: 8pt, fill: soft)
  let t = part-title.get()
  grid(columns: (1fr, auto), [MA1522 | Mock Final 2], if t == "Front Matter" [Mock Final 2] else { t })
})

// ─────────────────────────────────────────────────────────────── title block ──
#part-title.update("Mock Final 2")
#line(length: 100%, stroke: 3.2pt + blue)
#v(-8pt)
#line(length: 100%, stroke: 0.5pt + rulegray)
#v(6pt)
#grid(columns: (1fr, auto), align: (left + top, right + top),
  [#text(font: sans, weight: "bold", size: 12pt, fill: deep)[MA1522#h(0.6em)LINEAR ALGEBRA FOR COMPUTING]\
   #text(font: sans, size: 9.5pt, fill: soft)[National University of Singapore]],
  text(font: sans, size: 9.5pt, fill: soft)[Problems 1–21 #h(0.3em)•#h(0.3em) 100 marks\
    Name: #box(width: 3.2cm, stroke: (bottom: 0.4pt + soft))\
    Date: #box(width: 3.2cm, stroke: (bottom: 0.4pt + soft))])
#v(10pt)
#text(font: sans, weight: "bold", size: 26pt, fill: blue)[Mock Final Examination 2]
#v(-4pt)
#text(style: "italic", size: 11pt, fill: deep)[16 multiple-choice questions of 2 marks each and 5 written questions worth 68 marks #h(0.3em)•#h(0.3em) 2 hours, closed book]
#v(-4pt)
#line(length: 100%, stroke: 1.4pt + blue)
#v(2pt)

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
  Let $bA$ be an $m times n$ matrix and $bb in RR^m$. Which of the following statements is/are always
  true?
  #stmts[If $bA bx = bb$ has two distinct solutions, then it has infinitely many solutions.][If $bA bx = bz$ has only the trivial solution, then $bA bx = bb$ has exactly one solution.]
][Both (I) and (II) are true.][Only (I) is true.][Only (II) is true.][Both (I) and (II) are false.]

#mcq[
  Let $a$ and $b$ be real constants. For which values of $a$ and $b$ does the linear system
  $ x + y + z = 2, quad x + 2y + 3z = 5, quad 2x + 3y + a z = b $
  have no solution?
][$a = 4$ and $b = 7$.][$a != 4$.][$a = 4$ and $b != 7$.][None of the above.]

#mcq[
  Let $bA = mat(1, 0, 2; 0, 1, 3; 1, 1, 4)$. What is the $(2, 3)$-entry of $bA^(-1)$?
][$3$][$-3$][$2$][$-2$]

#mcq[
  Which of the following statements about square matrices of order $n >= 2$ is/are always true?
  #stmts[Every invertible matrix $bA$ can be written as $bA = bL bU$ with $bL$ unit lower triangular and $bU$ upper triangular.][The product of two elementary matrices is an elementary matrix.]
][Both (I) and (II) are true.][Only (I) is true.][Only (II) is true.][Both (I) and (II) are false.]

#mcq[
  For which value of $t$ does $(1, t, 5)^tp$ belong to $span{(1, 1, 1)^tp, (1, 2, 3)^tp}$?
][$t = 3$][$t = 2$][$t = 4$][None of the above.]

#mcq[
  Let $V$ be a subspace of $RR^n$ with $dim V = k >= 1$. Which of the following statements is/are
  always true?
  #stmts[Every set of exactly $k$ vectors that spans $V$ is a basis for $V$.][Every linearly independent subset of $V$ has at most $k$ vectors.][Every basis for $RR^n$ contains a basis for $V$.]
][Only (I) is true.][Only (I) and (II) are true.][(I), (II) and (III) are all true.][None of the above.]

#mcq[
  Let $S = {bu_1, bu_2}$ and $T = {bv_1, bv_2}$ be bases for $RR^2$ with $bv_1 = bu_1 + 2 bu_2$ and
  $bv_2 = 3 bu_1 + 5 bu_2$. If $[bw]_T = (1, 1)^tp$, what is $[bw]_S$?
][$(-2, 1)^tp$][$(3, 8)^tp$][$(4, 3)^tp$][$(4, 7)^tp$]

#mcq[
  Let $bA$ be a $5 times 3$ matrix of rank 3. Which of the following statements is/are always true?
  #stmts[$bA bx = bb$ has at most one solution for every $bb in RR^5$.][$bA^tp by = bc$ is consistent for every $bc in RR^3$.]
][Both (I) and (II) are true.][Only (I) is true.][Only (II) is true.][Both (I) and (II) are false.]

#mcq[
  Let $bA = mat(1, 1, 2; 1, 2, 3; 2, 3, 5)$. Which of the following vectors belongs to $Col(bA)$?
][$(1, 1, 1)^tp$][$(1, 0, 2)^tp$][$(2, -1, 1)^tp$][None of the above.]

#mcq[
  Let $V$ be a subspace of $RR^n$, let $bw in RR^n$, and let $bp$ be the projection of $bw$ onto $V$.
  Which of the following statements is/are always true?
  #stmts[$bw - bp$ is orthogonal to every vector in $V$.][$norm(bp) <= norm(bw)$.][$norm(bw - bp) <= norm(bw - bv)$ for every $bv in V$.]
][Only (I) is true.][Only (I) and (III) are true.][(I), (II) and (III) are all true.][None of the above.]

#mcq[
  What is the distance from $(1, 2, 3)^tp$ to the subspace $V = {(x, y, z)^tp : x + y + z = 0}$ of $RR^3$?
][$sqrt(3)$][$6$][$sqrt(14)$][$2 sqrt(3)$]

#mcq[
  Which of the following vectors is an eigenvector of $mat(4, 1; 2, 3)$?
][$(1, 2)^tp$][$(1, -2)^tp$][$(1, -1)^tp$][$(2, 1)^tp$]

#mcq[
  Let $bA$ be a square matrix of order 3. Which of the following statements is/are always true?
  #stmts[If $bA$ is invertible and diagonalizable, then $bA^(-1)$ is diagonalizable.][If $bA$ is diagonalizable, then every eigenvalue of $bA$ has algebraic multiplicity 1.][If $bA$ is diagonalizable, then $bA^2$ is diagonalizable.][If $bA^2$ is diagonalizable, then $bA$ is diagonalizable.]
][Only (I) and (II) are true.][Only (III) and (IV) are true.][Only (I), (III) and (IV) are true.][None of the above.]

#mcq[
  Let $bA$ be a square matrix of order $n$. Which of the following statements is/are always true?
  #stmts[$bA$ and $bA^tp$ have the same singular values.][If $bA$ is symmetric, then the singular values of $bA$ are the eigenvalues of $bA$.]
][Both (I) and (II) are true.][Only (I) is true.][Only (II) is true.][Both (I) and (II) are false.]

#mcq[
  A linear transformation $T : RR^2 -> RR^2$ satisfies $T vec(1, 1) = vec(2, 0)$ and
  $T vec(1, -1) = vec(0, 4)$. What is $T vec(3, 1)$?
][$(4, 4)^tp$][$(2, 4)^tp$][$(6, 4)^tp$][$(2, 2)^tp$]

#mcq[
  Let $n >= 2$ and let $T : RR^n -> RR^n$ be a linear transformation such that $T compose T = T$, and write $Rg(T)$
  for the range of $T$. Which of the following statements is/are always true?
  #stmts[$T$ is the zero transformation or the identity transformation.][$ker(T) inter Rg(T) = {bz}$.]
][Both (I) and (II) are true.][Only (I) is true.][Only (II) is true.][Both (I) and (II) are false.]

#pagebreak()
#topichead[Section B #h(0.5em) Written Questions #h(0.5em) (68 marks)]

#prob(space: none)[
  #pts[14 marks] #h(0.3em) Let $a$ and $b$ be real constants. For $n >= 2$ let $bA_n$ be the square
  matrix of order $n$ with every diagonal entry equal to $a$ and every other entry equal to $b$:
  $ bA_3 = mat(a, b, b; b, a, b; b, b, a), quad bA_4 = mat(a, b, b, b; b, a, b, b; b, b, a, b; b, b, b, a), quad
    bA_n = mat(a, b, dots.c, b; b, a, dots.down, dots.v; dots.v, dots.down, dots.down, b; b, dots.c, b, a) . $
]
#subpart("a", space: 4.5cm)[Compute $det(bA_3)$, and write it as a product of linear factors in $a$ and $b$. #h(1fr) #pts[3]]
#subpart("b", space: 5cm)[By first adding rows 2, 3 and 4 of $bA_4$ to row 1, compute $det(bA_4)$ in factorized
  form. State every row operation you use. #h(1fr) #pts[3]]
#subpart("c", space: 4.5cm)[Find, with justification, a formula for $det(bA_n)$ for every $n >= 2$. #h(1fr) #pts[3]]
#subpart("d", space: 2cm)[For which values of $a$ and $b$ is $bA_n$ invertible? #h(1fr) #pts[2]]
#subpart("e", space: 5cm)[Take $a = 0$ and $b = 1$. Find $bA_3^(-1)$. #h(1fr) #pts[3]]

#prob(space: none)[
  #pts[14 marks] #h(0.3em) Let $a$ be a real constant and
  $bA = mat(1, 1, 0, 2; 1, 2, 1, 3; 2, 3, a, a + 4)$.
]
#subpart("a", space: 5cm)[Find $rank(bA)$ for all possible values of $a$. #h(1fr) #pts[4]]
#subpart("b", space: 3.5cm)[For which values of $a$ does $bA$ have full rank? For which values of $a$ does $bA$
  have a left inverse, and for which a right inverse? Justify your answers. #h(1fr) #pts[3]]
#subpart("c", space: 7cm)[For $a = 2$, find all matrices $bX$ such that $bA bX = bI_3$. #h(1fr) #pts[4]]
#subpart("d", space: 4.5cm)[For $a = 1$, find a basis for $Col(bA)$ and a basis for $Null(bA)$. #h(1fr) #pts[3]]

#prob(space: none)[
  #pts[13 marks] #h(0.3em) Consider the following data.
  #align(center, table(columns: 6, stroke: none, inset: (x: 9pt, y: 4pt), align: center,
    table.vline(x: 1, stroke: 0.5pt + rulegray),
    [$x$], [$-2$], [$-1$], [$0$], [$1$], [$2$],
    table.hline(stroke: 0.5pt + rulegray),
    [$y$], [$2$], [$3$], [$1$], [$1$], [$8$]))
]
#subpart("a", space: 3.5cm)[Is it possible to find a polynomial of degree at most 4 that passes through all five
  data points? Is it possible to find a line $y = c_0 + c_1 x$ that passes through all five? Justify
  your answers briefly. #h(1fr) #pts[2]]
#subpart("b", space: 5.5cm)[Write down the normal equations for the least squares line $y = c_0 + c_1 x$, and
  find the line. #h(1fr) #pts[4]]
#subpart("c", space: 6.5cm)[Write down the normal equations for the least squares quadratic
  $y = c_0 + c_1 x + c_2 x^2$, and find the quadratic. #h(1fr) #pts[4]]
#subpart("d", space: 4.5cm)[For each of the two fits, find the norm $norm(bb - bA hat(bx))$ of the residual vector. Does
  the quadratic in (c) pass through all five data points? #h(1fr) #pts[3]]

#prob(space: none)[
  #pts[14 marks] #h(0.3em) This question has two independent halves.

  Let $bA = mat(2, 2, 2; 2, 5, 4; 2, 4, 5)$.
]
#subpart("a", space: 6.5cm)[Show that the eigenvalues of $bA$ are 1 and 10, and find a basis for each eigenspace. #h(1fr) #pts[4]]
#subpart("b", space: 5.5cm)[Find an orthogonal matrix $bP$ and a diagonal matrix $bD$ such that $bA = bP bD bP^tp$. #h(1fr) #pts[4]]
#block(width: 100%, above: 10pt, below: 4pt)[
  #pad(left: indent)[
    Every evening a student studies in exactly one of three places: the library ($L$), a café ($C$) or
    at home ($H$). After an evening in the library, the next evening is spent in the library or in the
    café, each with probability $1/2$. After an evening in the café, the next evening is spent in the
    library or at home, each with probability $1/2$. After an evening at home, the next evening is
    spent at home with probability $1/2$, and in the library or in the café with probability $1/4$ each.
  ]
]
#subpart("c", space: 2.8cm)[Write down the stochastic matrix $bP$ of this Markov chain, with the states in the order
  $L$, $C$, $H$. #h(1fr) #pts[2]]
#subpart("d", space: 3cm)[The student is in the library this evening. Find the probability that the student
  is at home two evenings later. #h(1fr) #pts[2]]
#subpart("e", space: 4cm)[In the long run, what proportion of evenings does the student spend in each place? #h(1fr) #pts[2]]

#prob(space: none)[
  #pts[13 marks] #h(0.3em) Let $S = {bu_1, bu_2, bu_3}$ be the basis for $RR^3$ with
  $ bu_1 = vec(1, 0, 0), quad bu_2 = vec(0, 1, 1), quad bu_3 = vec(1, 1, 2), $
  and let $T : RR^3 -> RR^3$ be the linear transformation such that
  $ T(bu_1) = vec(2, 1, 2), quad T(bu_2) = vec(-3, -2, -3), quad T(bu_3) = vec(-2, -2, -2) . $
]
#subpart("a", space: 2.2cm)[Write down the representation $[T]_S$ of $T$ with respect to $S$. #h(1fr) #pts[2]]
#subpart("b", space: 6.5cm)[Find the standard matrix of $T$. #h(1fr) #pts[4]]
#subpart("c", space: 5cm)[Find a basis for the kernel of $T$ and a basis for the range of $T$. #h(1fr) #pts[3]]
#subpart("d", space: 1.6cm)[Is $T$ injective? Is $T$ surjective? #h(1fr) #pts[1]]
#subpart("e", space: 4.5cm)[Find all vectors $bu in RR^3$ such that $T(bu) = bu$. #h(1fr) #pts[3]]
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
#ans(1)[*B.* (I): if $bx_1 != bx_2$ are solutions, so is $bx_1 + t(bx_2 - bx_1)$ for every $t$. (II) fails
  for $bA = (1, 1)^tp$, $bb = (1, 0)^tp$, which is inconsistent.]
#ans(2)[*C.* $R_2 - R_1$, $R_3 - 2R_1$, $R_3 - R_2$ leave the last row $(0, 0, a - 4 | b - 7)$.]
#ans(3)[*A.* $det(bA) = -1$ and the cofactor $C_(32) = -det mat(1, 2; 0, 3) = -3$, so the entry is $C_(32) slash det(bA) = 3$.]
#ans(4)[*D.* $mat(0, 1; 1, 0)$ is invertible but has no LU factorization (it would need $u_(11) = 0$ and
  $l_(21) u_(11) = 1$); $mat(2, 0; 0, 1) mat(1, 0; 0, 2) = 2 bI$ is not elementary.]
#ans(5)[*A.* $c_1 + c_2 = 1$ and $c_1 + 3c_2 = 5$ give $c_1 = -1$, $c_2 = 2$, so $t = c_1 + 2c_2 = 3$.]
#ans(6)[*B.* (I) and (II) are the standard facts about dimension. (III) fails for $V = span{(1, 1)^tp}$ and
  the standard basis of $RR^2$.]
#ans(7)[*D.* $bw = bv_1 + bv_2 = 4 bu_1 + 7 bu_2$.]
#ans(8)[*A.* $nullity(bA) = 3 - 3 = 0$; $bA^tp$ is $3 times 5$ of rank 3, the number of its rows.]
#ans(9)[*C.* Column 3 is the sum of columns 1 and 2, and $Col(bA) = {bb : b_3 = b_1 + b_2}$; only
  $(2, -1, 1)^tp$ satisfies this.]
#ans(10)[*C.* $bw - bp in V^perp$; $norm(bw)^2 = norm(bp)^2 + norm(bw - bp)^2$; and $bp$ is the best approximation
  of $bw$ in $V$.]
#ans(11)[*D.* With $bn = (1, 1, 1)^tp$: $abs(bw dot bn) slash norm(bn) = 6 slash sqrt(3) = 2 sqrt(3)$.]
#ans(12)[*B.* $mat(4, 1; 2, 3) vec(1, -2) = vec(2, -4) = 2 vec(1, -2)$. (The eigenvalues are 2 and 5; the other
  eigenspace is $span{(1, 1)^tp}$.)]
#ans(13)[*D.* Exactly (I) and (III) are true: $bA = bP bD bP^(-1)$ gives $bA^(-1) = bP bD^(-1) bP^(-1)$ and
  $bA^2 = bP bD^2 bP^(-1)$. (II) fails for $bI$; (IV) fails for $mat(0, 1, 0; 0, 0, 0; 0, 0, 0)$, whose
  square is $bold(0)$.]
#ans(14)[*B.* $bA^tp bA$ and $bA bA^tp$ have the same eigenvalues. (II) fails for $mat(1, 0; 0, -1)$:
  singular values 1, 1 but eigenvalues $1, -1$ (in general $sigma_i = abs(lambda_i)$).]
#ans(15)[*A.* $(3, 1)^tp = 2(1, 1)^tp + (1, -1)^tp$, so $T(3, 1)^tp = 2(2, 0)^tp + (0, 4)^tp = (4, 4)^tp$.]
#ans(16)[*C.* (I) fails for the projection onto the $x$-axis. (II): if $bv = T(bw)$ and $T(bv) = bz$, then
  $bv = T(bw) = T(T(bw)) = T(bv) = bz$.]

#ah[Section B]
#ans(17)[(a) $det(bA_3) = a^3 - 3a b^2 + 2b^3 = (a - b)^2 (a + 2b)$.
  (b) $R_1 + R_2 + R_3 + R_4$ makes row 1 equal to $(a + 3b)(1, 1, 1, 1)$; factor out $a + 3b$, then
  $R_i - b R_1$ for $i = 2, 3, 4$ gives an upper triangular matrix with diagonal $1, a - b, a - b, a - b$:
  $det(bA_4) = (a - b)^3 (a + 3b)$.
  (c) The same operations work for every $n$ (add all other rows to row 1, factor out
  $a + (n - 1) b$, then $R_i - b R_1$): $det(bA_n) = (a - b)^(n-1) (a + (n - 1) b)$.
  (d) $a != b$ and $a != -(n - 1) b$.
  (e) $det = 2$ and $bA_3^(-1) = 1/2 mat(-1, 1, 1; 1, -1, 1; 1, 1, -1)$.]
#ans(18)[(a) $R_2 - R_1$, $R_3 - 2R_1$, $R_3 - R_2$ give $mat(1, 1, 0, 2; 0, 1, 1, 1; 0, 0, a - 1, a - 1)$: rank 3 if
  $a != 1$, rank 2 if $a = 1$.
  (b) Full rank ($= 3$) exactly when $a != 1$. A left inverse needs rank 4, the number of columns,
  so there is none for any $a$; a right inverse exists exactly when the rank is 3, the number of
  rows, that is $a != 1$.
  (c) Row reducing $(bA | bI)$ gives $mat(1, 0, 0, 2, 1, -2, 1; 0, 1, 0, 0, 0, 2, -1; 0, 0, 1, 1, -1, -1, 1; augment: #4)$, so
  $ bX = mat(1 - 2s, -2 - 2t, 1 - 2u; 0, 2, -1; -1 - s, -1 - t, 1 - u; s, t, u), quad s, t, u in RR . $
  (d) RREF $mat(1, 0, -1, 1; 0, 1, 1, 1; 0, 0, 0, 0)$. $Col(bA)$: ${(1, 1, 2)^tp, (1, 2, 3)^tp}$ (the pivot
  columns of $bA$). $Null(bA)$: ${(1, -1, 1, 0)^tp, (-1, -1, 0, 1)^tp}$.]
#ans(19)[(a) Yes: five points with distinct $x$-values determine a unique interpolating polynomial of
  degree at most 4 (the $5 times 5$ Vandermonde matrix is invertible). No: the line through
  $(0, 1)$ and $(1, 1)$ is $y = 1$, which misses $(2, 8)$.
  (b) $bA = mat(1, -2; 1, -1; 1, 0; 1, 1; 1, 2)$, $bb = (2, 3, 1, 1, 8)^tp$:
  $mat(5, 0; 0, 10) vec(c_0, c_1) = vec(15, 10)$, so $y = 3 + x$.
  (c) $mat(5, 0, 10; 0, 10, 0; 10, 0, 34) vec(c_0, c_1, c_2) = vec(15, 10, 44)$, so $c_1 = 1$, $14 c_2 = 44 - 30$,
  $c_2 = 1$, $c_0 = 1$: #h(0.2em) $y = 1 + x + x^2$.
  (d) Line: residual $(1, 1, -2, -3, 3)^tp$, norm $sqrt(24) = 2 sqrt(6)$. Quadratic: fitted values
  $(3, 1, 1, 3, 7)$, residual $(-1, 2, 0, -2, 1)^tp$, norm $sqrt(10)$. The residual is not $bz$, so the
  quadratic does not pass through all the points (only through $(0, 1)$).]
#ans(20)[(a) $det(x bI - bA) = (x - 1)^2 (x - 10)$. $E_(10) = span{(1, 2, 2)^tp}$;
  $E_1 = {x + 2y + 2z = 0} = span{(-2, 1, 0)^tp, (-2, 0, 1)^tp}$.
  (b) An orthogonal basis of $E_1$ is needed, for instance $(2, -2, 1)^tp, (2, 1, -2)^tp$:
  $bP = 1/3 mat(2, 2, 1; -2, 1, 2; 1, -2, 2)$, $bD = mat(1, 0, 0; 0, 1, 0; 0, 0, 10)$. Gram–Schmidt on the basis in (a)
  gives instead the columns $1/sqrt(5) (-2, 1, 0)^tp$, $1/(3 sqrt(5)) (2, 4, -5)^tp$, $1/3 (1, 2, 2)^tp$.
  (c) $bP = mat(1/2, 1/2, 1/4; 1/2, 0, 1/4; 0, 1/2, 1/2)$.
  (d) $bP^2 (1, 0, 0)^tp = bP (1/2, 1/2, 0)^tp = (1/2, 1/4, 1/4)^tp$: probability $1/4$.
  (e) Solving $(bP - bI) bx = bz$ gives $x_H = x_C$ and $x_L = 3/2 x_C$; with sum 1 the equilibrium vector is
  $(3/7, 2/7, 2/7)^tp$: library $3/7$, café $2/7$, home $2/7$.]
#ans(21)[(a) $[T]_S = mat(2, -3, -2; 1, -2, -2; 2, -3, -2)$ (columns $T(bu_1), T(bu_2), T(bu_3)$).
  (b) $bA = [T]_S bQ^(-1)$ with $bQ = mat(1, 0, 1; 0, 1, 1; 0, 1, 2)$, $bQ^(-1) = mat(1, 1, -1; 0, 2, -1; 0, -1, 1)$:
  $bA = mat(2, -2, -1; 1, -1, -1; 2, -2, -1)$.
  (c) RREF of $bA$ is $mat(1, -1, 0; 0, 0, 1; 0, 0, 0)$. Kernel: ${(1, 1, 0)^tp}$. Range: ${(2, 1, 2)^tp, (1, 1, 1)^tp}$
  (columns 1 and 3 of $bA$, up to sign); the range is the plane $x = z$.
  (d) Neither: the kernel is nonzero and the rank is $2 < 3$.
  (e) $(bA - bI) bu = bz$ with $bA - bI = mat(1, -2, -1; 1, -2, -1; 2, -2, -2)$ gives $y = 0$, $x = z$:
  #h(0.2em) $bu = s (1, 0, 1)^tp$, $s in RR$.]

#v(6pt)
#text(font: sans, size: 8.5pt, fill: soft)[Scoring: 2 marks for each correct letter in Section A (32), and the marks shown for each part of Section B (68). Bases, the choice of eigenvectors and the order of the columns of an orthogonal matrix may differ from those above.]
