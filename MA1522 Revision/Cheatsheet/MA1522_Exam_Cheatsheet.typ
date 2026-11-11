#let blue = rgb("#00558C")
#let deep = rgb("#003A62")
#let tint = rgb("#EAF2F8")
#let exfill = rgb("#FBF4E8")
#let exink = rgb("#8A4B00")
#let sans = "Helvetica Neue"

#set page(
  paper: "a4",
  margin: (x: 0.55cm, top: 0.55cm, bottom: 0.6cm),
  columns: 3,
  footer: context align(center, text(font: sans, size: 5.5pt, fill: luma(130))[
    MA1522 Final Exam Helpsheet · side #counter(page).display() of 2
  ]),
  footer-descent: 0.25cm,
)
#set columns(gutter: 0.28cm)
#set text(font: "Libertinus Serif", size: 9.7pt, hyphenate: true)
#show math.equation: set text(font: "Libertinus Math")
#set par(leading: 0.55em, spacing: 0.62em, justify: false)
#set list(indent: 0pt, body-indent: 3.5pt, spacing: 0.62em,
  marker: text(fill: blue, size: 5.5pt, baseline: -0.5pt)[▸])

#set math.mat(delim: "(", column-gap: 0.45em, row-gap: 0.22em)
#set math.vec(delim: "(", gap: 0.22em)

#let tp = math.upright("T")
#let bA = $bold(A)$
#let bB = $bold(B)$
#let bC = $bold(C)$
#let bD = $bold(D)$
#let bE = $bold(E)$
#let bI = $bold(I)$
#let bL = $bold(L)$
#let bP = $bold(P)$
#let bQ = $bold(Q)$
#let bR = $bold(R)$
#let bU = $bold(U)$
#let bV = $bold(V)$
#let bS = $bold(Sigma)$
#let ba = $bold(a)$
#let bb = $bold(b)$
#let be = $bold(e)$
#let bn = $bold(n)$
#let bq = $bold(q)$
#let bu = $bold(u)$
#let bv = $bold(v)$
#let bw = $bold(w)$
#let bx = $bold(x)$
#let by = $bold(y)$
#let bz = $bold(0)$
#let rank = math.op("rank")
#let nullity = math.op("nullity")
#let Col = math.op("Col")
#let Row = math.op("Row")
#let Null = math.op("Null")
#let span = math.op("span")
#let adj = math.op("adj")

#let sec(num, title, body) = block(width: 100%, breakable: true, above: 0.95em, below: 0.4em)[
  #block(width: 100%, fill: blue, inset: (x: 3pt, y: 2.1pt), radius: 1.2pt, below: 3.2pt, sticky: true,
    text(font: sans, weight: "bold", fill: white, size: 8.4pt)[#num#h(4pt)#title])
  #body
]
#let sub(t) = text(font: sans, weight: "bold", fill: blue, size: 7.8pt)[#t]
#let ex(label, body) = block(width: 100%, fill: exfill, inset: (x: 3.2pt, y: 2.8pt),
  radius: 1pt, above: 0.55em, below: 0.55em, breakable: false,
  text(size: 8.2pt)[#text(font: sans, weight: "bold", fill: exink, size: 6.8pt)[#label]#h(3pt)#body])
#let key(body) = block(width: 100%, fill: tint, stroke: (left: 1.3pt + blue),
  inset: (x: 3.5pt, y: 3pt), above: 0.55em, below: 0.55em, breakable: false, body)
#let warn(body) = text(fill: rgb("#B0271F"), weight: "bold")[#body]

#place(top + center, scope: "parent", float: true, clearance: 0.3em,
  block(width: 100%, below: 0pt)[
    #block(width: 100%, fill: deep, inset: (x: 5pt, y: 3.6pt), radius: 1.5pt)[
      #text(font: sans, weight: "bold", fill: white, size: 9.5pt)[MA1522 Final Exam Helpsheet]
      #h(1fr)
      #text(font: sans, fill: rgb("#CFE2F0"), size: 6.4pt)[
        Chapters 1–7 #h(4pt)|#h(4pt) side 1: Ch. 1–4 #h(3pt)·#h(3pt) side 2: Ch. 5–7 #h(4pt)|#h(4pt)
        16 MCQ × 2 + 5 written (68) #h(4pt)|#h(4pt)
        #box(fill: exfill, inset: (x: 2pt, y: 0.5pt), radius: 1pt)[#text(fill: exink, weight: "bold")[EX]] = worked pattern]
    ]
  ])

// ═══════════════════════════════════════════════════════════════ SIDE 1 ══

#sec("1", "Linear systems")[
  - #sub[REF:] zero rows at the bottom, leading entries move strictly right. #sub[RREF:] also every leading entry is 1 and is the only nonzero entry in its column. RREF is unique; REF is not.
  - #sub[Row operations:] $R_i <-> R_j$, #h(2pt) $c R_i$ ($c != 0$), #h(2pt) $R_i + c R_j$. #warn[$2R_2 + R_1$ is not one operation.]
  - Reduce $(bA | bb)$. Last column a pivot column ⇒ #warn[inconsistent]. Otherwise: every column of $bA$ a pivot column ⇒ unique; else one parameter per non-pivot column ⇒ infinitely many.
  - Homogeneous $bA bx = bz$: always consistent; more variables than equations ⇒ nontrivial solutions.
  - General solution of $bA bx = bb$ = one particular solution + general solution of $bA bx = bz$.
  #key[*Unknown constants:* never divide by an expression that may be 0. Reduce as far as possible, then split into cases at each pivot candidate ($a = 1$, $a = -2$, otherwise). For a square coefficient matrix, $det != 0$ ⇔ unique; then test each root of $det = 0$ separately.]
  #ex("EX")[$x + y + a z = 1$, $x + a y + z = 1$, $a x + y + z = -2$: $det = -(a-1)^2 (a+2)$. $a = 1$: rows clash ⇒ none. $a = -2$: rows sum to $0 = 0$ ⇒ $(1 + s, s, s)$.]
]

#sec("2", "Matrices, inverses, LU")[
  - $(bA bB)^tp = bB^tp bA^tp$, $(bA bB)^(-1) = bB^(-1) bA^(-1)$, $(bA^tp)^(-1) = (bA^(-1))^tp$. #warn[$bA bB != bB bA$]; $bA bB = bz$ does not give $bA = bz$ or $bB = bz$; no cancellation unless invertible. $(bA + bB)^2 = bA^2 + bA bB + bB bA + bB^2$.
  - Columns of $bA bB$ are $bA bb_j$; $bA bx$ is a linear combination of the columns of $bA$.
  - #sub[Inverse:] $(bA | bI) -> (bI | bA^(-1))$. #h(2pt) $mat(a, b; c, d)^(-1) = 1/(a d - b c) mat(d, -b; -c, a)$. #h(2pt) $bA^(-1) = 1/det(bA) adj(bA)$, $adj(bA) = (A_(j i))$ (transpose of the cofactor matrix).
  - #sub[Elementary matrix] $bE$ = one row operation applied to $bI$; $bE bA$ performs it on $bA$. Inverses: swap ↔ itself; $c R_i$ ↔ $1/c R_i$; $R_i + c R_j$ ↔ $R_i - c R_j$. If $bE_k dots.c bE_1 bA = bI$ then $bA = bE_1^(-1) dots.c bE_k^(-1)$.
  - #sub[LU] (no row swaps, only $R_i + c R_j$ with $i > j$): $bU$ = the REF reached; $bL$ unit lower triangular with #warn[$-c$] in entry $(i, j)$. Solve $bA bx = bb$: $bL by = bb$ (forward), then $bU bx = by$ (back).
  #ex("EX")[$mat(2, 1, -1; 4, 5, -3; -2, 5, 3)$: $R_2 - 2R_1$, $R_3 + R_1$, $R_3 - 2R_2$ ⇒ $bL = mat(1, 0, 0; 2, 1, 0; -1, 2, 1)$, $bU = mat(2, 1, -1; 0, 3, -1; 0, 0, 4)$.]
  #key[*Square $bA$ of order $n$ is invertible* ⇔ RREF is $bI$ ⇔ product of elementary matrices ⇔ $bA bx = bz$ only trivially ⇔ $bA bx = bb$ unique for all $bb$ ⇔ $det != 0$ ⇔ columns (rows) independent / span $RR^n$ / a basis ⇔ rank $n$ ⇔ nullity 0 ⇔ 0 not an eigenvalue ⇔ has a left (or right) inverse ⇔ $bA^tp$ invertible.]
]

#sec("2.8", "Determinants")[
  - Cofactor expansion along any row or column: $det = sum_j a_(i j) A_(i j)$, $A_(i j) = (-1)^(i+j) det(bold(M)_(i j))$. Pick the row/column with most zeros. $3 times 3$: $a e i + b f g + c d h - c e g - a f h - b d i$.
  - Triangular ⇒ product of the diagonal. Two equal rows / a zero row ⇒ 0.
  - #sub[By reduction:] swap ⇒ $times (-1)$; $c R_i$ ⇒ $times c$; $R_i + c R_j$ ⇒ unchanged. So $det(bA) = (plus.minus "product of pivots") \/ ("scalings used")$.
  - $det(bA bB) = det bA det bB$, $det(bA^tp) = det bA$, $det(bA^(-1)) = 1\/det bA$, #warn[$det(c bA) = c^n det bA$], $det(adj bA) = (det bA)^(n-1)$. #warn[$det(bA + bB) != det bA + det bB$.]
  - #sub[Cramer:] $x_i = det(bA_i)\/det(bA)$, $bA_i$ = $bA$ with column $i$ replaced by $bb$.
  #ex("EX")[$n times n$ pattern matrix: expand along row 1 to get a recurrence, e.g. tridiagonal $2, 1$: $d_n = 2d_(n-1) - d_(n-2)$ ⇒ $d_n = n + 1$.]
]

#sec("3", "Vector spaces: span, independence, basis")[
  - $bv in span{bu_1, ..., bu_k}$ ⇔ $(bu_1 dots.c bu_k | bv)$ consistent. $span(S) = RR^n$ ⇔ REF of $(bu_1 dots.c bu_k)$ has no zero row. $span(S_1) subset.eq span(S_2)$ ⇔ every vector of $S_1$ is in $span(S_2)$.
  - #sub[Subspace] = a span = contains $bz$, closed under $+$ and scalar multiples. Solution set of $bA bx = bz$: yes. Of $bA bx = bb != bz$: #warn[no] (no $bz$). Products, squares, $>=$, "or" conditions: usually no — find two vectors whose sum leaves the set.
  - #sub[Independent] ⇔ $c_1 bu_1 + dots.c + c_k bu_k = bz$ only trivially ⇔ every column of $(bu_1 dots.c bu_k)$ is a pivot column. More than $n$ vectors in $RR^n$ ⇒ dependent. Contains $bz$ ⇒ dependent. Two vectors: dependent ⇔ multiples.
  - #sub[Basis] of $V$: independent and spans $V$. If $dim V = k$: any $k$ independent vectors in $V$ form a basis; any $k$ vectors spanning $V$ form a basis. $U subset.eq V$ ⇒ $dim U <= dim V$, equal ⇔ $U = V$.
  - #sub[Basis of a solution space:] solve, write $bx = s bv_1 + t bv_2 + dots.c$; the $bv_i$ are a basis. Hyperplane $ba dot bx = 0$ in $RR^n$ has dimension $n - 1$.
  - #sub[Coordinates:] $[bv]_S = (c_1, ..., c_k)^tp$ with $bv = sum c_i bu_i$: solve $(bu_1 dots.c bu_k | bv)$.
  #key[*Transition matrix from $T$ to $S$:* $bP = ([bv_1]_S dots.c [bv_k]_S)$, found from $(S | T) -> (bI | bP)$. Then $[bw]_S = bP [bw]_T$; from $S$ to $T$ it is $bP^(-1)$. In $RR^n$: $bP = bold(S)^(-1) bold(T)$ (matrices of basis columns).]
  #ex("EX")[${bu, bv, bw}$ independent ⇒ ${bu + bv, bv + bw, bw + bu}$ independent (coefficient matrix has $det = 2$); ${bu - bv, bv - bw, bw - bu}$ dependent (sum is $bz$).]
  - $dim(U + V) = dim U + dim V - dim(U inter V)$.
]

#sec("4", "Column space, row space, nullspace, rank")[
  Reduce $bA -> bR$ (REF or RREF), $bA$ is $m times n$, $r$ = number of pivots.
  #table(columns: (auto, 1fr, auto), stroke: 0.4pt + luma(200), inset: (x: 2.5pt, y: 2pt),
    fill: (x, y) => if y == 0 { tint },
    [*Space*], [*Basis*], [*dim*],
    [$Row(bA)$], [nonzero rows of $bR$], [$r$],
    [$Col(bA)$], [#warn[columns of $bA$] at the pivot positions of $bR$], [$r$],
    [$Null(bA)$], [vectors of the general solution of $bA bx = bz$], [$n - r$],
    [$Null(bA^tp)$], [solve $bA^tp by = bz$; equals $Col(bA)^perp$], [$m - r$])
  - Row operations preserve $Row$ and $Null$, and the dependence relations between columns, #warn[not $Col$].
  - $rank bA = rank bA^tp <= min(m, n)$; #h(2pt) *$rank + nullity = n$* (columns). $rank(bA bB) <= min(rank bA, rank bB)$; $rank(bA^tp bA) = rank bA$, $Null(bA^tp bA) = Null(bA)$.
  - $bA bx = bb$ consistent ⇔ $bb in Col(bA)$ ⇔ $rank(bA) = rank(bA | bb)$. Consistent for *every* $bb$ ⇔ $rank = m$.
  - Basis from a spanning set: put the vectors as columns, keep the pivot columns; the RREF entries of a non-pivot column are its coefficients in terms of them. To *extend* to a basis of $RR^n$: add standard basis vectors for the non-pivot columns of the row-form REF.
  #key[*Full rank.* $rank = n$ (columns independent) ⇔ $bA^tp bA$ invertible ⇔ left inverse $(bA^tp bA)^(-1) bA^tp$ ⇔ $bA bx = bb$ has at most one solution ⇔ least squares solution unique. \ $rank = m$ (rows independent) ⇔ $bA bA^tp$ invertible ⇔ right inverse $bA^tp (bA bA^tp)^(-1)$ ⇔ $bA bx = bb$ consistent for all $bb$. All right inverses: solve $bA bold(X) = bI$ column by column.]
  #ex("EX")[Rank with constants $c, d$: clear column 1; if the remaining rows are $(0, c - 4, 0, c - 4)$, $(0, 0, d - 1, d - 1)$ then rank $= 1 + [c != 4] + [d != 1]$; nullity $= n - $ rank.]
]

#sec("✓", "MCQ traps")[
  - "$m times n$, rank $n$ ⇒ invertible": #warn[false] unless square.
  - $bA, bB$ invertible says nothing about $bA + bB$ (take $bB = -bA$, or $bB = bA$).
  - $bz$ is in every subspace; $Row(bA) inter Null(bA) = {bz}$; $V inter V^perp = {bz}$; $(V^perp)^perp = V$.
  - Row equivalent ⇒ same $Row$, $Null$, rank; not same $Col$.
  - $bA^2 = bI$ does not force $bA = plus.minus bI$; symmetric $times$ symmetric need not be symmetric (needs $bA bB = bB bA$).
  - "Statement true for all $bb$ / all $a$": test the extreme cases ($bb = bz$, zero matrix, $bI$, $mat(1, 1; 0, 1)$, $mat(0, 1; 0, 0)$).
]

#sec("✎", "Proof templates")[
  - #sub[Subspace:] write it as a span or as $Null(bA)$. #sub[Not a subspace:] exhibit vectors breaking closure, or note $bz$ is missing.
  - #sub[Independent:] suppose $sum c_i bv_i = bz$, deduce every $c_i = 0$ (apply $bA$, take dot products with each $bv_j$, or compare coordinates).
  - #sub[Basis of $V$:] (1) each vector lies in $V$; (2) independent; (3) the count equals $dim V$.
  - #sub[Equal subspaces:] $U subset.eq V$ and $dim U = dim V$. #sub[Rank:] count pivots, or use rank + nullity $= n$.
  - #sub[Invertible:] produce the inverse, or $det != 0$, or show $bA bx = bz$ ⇒ $bx = bz$.
  - #sub[Norm trick:] $bx^tp bA^tp bA bx = norm(bA bx)^2$, so $bA^tp bA bx = bz$ ⇒ $bA bx = bz$.
  - #sub[Eigenvalue claims:] start from $bA bv = lambda bv$, $bv != bz$, and apply the hypothesis to $bv$.
]

// ═══════════════════════════════════════════════════════════════ SIDE 2 ══
#pagebreak()

#sec("5.1", "Orthogonality & projection")[
  - $bu dot bv = bu^tp bv$; $norm(bu) = sqrt(bu dot bu)$; $d(bu, bv) = norm(bu - bv)$; $cos theta = (bu dot bv)/(norm(bu) norm(bv))$; unit vector $bu\/norm(bu)$. $norm(bu + bv)^2 = norm(bu)^2 + 2 bu dot bv + norm(bv)^2$.
  - Orthogonal set of nonzero vectors ⇒ independent. Orthonormal: also all norms 1.
  - #sub[Coordinates in an orthogonal basis] (no row reduction): $c_i = (bw dot bu_i)/(bu_i dot bu_i)$.
  - $V^perp = {bw : bw dot bv = 0 "for all" bv in V}$ = $Null$ of the matrix whose *rows* span $V$. $dim V + dim V^perp = n$. $Row(bA)^perp = Null(bA)$, $Col(bA)^perp = Null(bA^tp)$.
  #key[*Projection of $bw$ onto $V$* with #warn[orthogonal] basis ${bu_1, ..., bu_k}$:
  $ bw_p = (bw dot bu_1)/(bu_1 dot bu_1) bu_1 + dots.c + (bw dot bu_k)/(bu_k dot bu_k) bu_k . $
  $bw - bw_p in V^perp$; $bw_p$ is the closest point of $V$; distance $= norm(bw - bw_p)$. Basis not orthogonal ⇒ Gram–Schmidt first, or solve $bA^tp bA bx = bA^tp bw$ and take $bA bx$.]
  - Hyperplane $V = {bn dot bx = 0}$: $bw_p = bw - (bw dot bn)/(bn dot bn) bn$; matrix $bI - (bn bn^tp)/(bn^tp bn)$. Line $span{bu}$: matrix $(bu bu^tp)/(bu^tp bu)$. Projection matrices: $bP^2 = bP = bP^tp$, eigenvalues 1 (on $V$) and 0 (on $V^perp$).
  - #sub[Orthogonal matrix] (square): $bQ^tp bQ = bI$ ⇔ $bQ^(-1) = bQ^tp$ ⇔ columns (and rows) orthonormal. $det = plus.minus 1$, $norm(bQ bx) = norm(bx)$, products of orthogonal matrices are orthogonal. Solve $bQ bx = bb$: $bx = bQ^tp bb$.
]

#sec("5.4", "Gram–Schmidt & QR")[
  $bv_1 = bu_1$, #h(3pt) $bv_2 = bu_2 - (bu_2 dot bv_1)/(bv_1 dot bv_1) bv_1$, #h(3pt) $bv_3 = bu_3 - (bu_3 dot bv_1)/(bv_1 dot bv_1) bv_1 - (bu_3 dot bv_2)/(bv_2 dot bv_2) bv_2$, …; then $bq_i = bv_i\/norm(bv_i)$. Rescale any $bv_i$ to clear fractions before continuing (project onto the *new* $bv$'s, never the old $bu$'s).
  #key[*QR* ($bA$ with independent columns): $bQ = (bq_1 dots.c bq_n)$, $bR = bQ^tp bA$, upper triangular with $r_(i j) = bq_i dot ba_j$ and $r_(i i) = norm(bv_i) > 0$. Check: $bQ bR = bA$.]
  #ex("EX")[$bA = mat(1, -1; 2, 4; 2, 1)$: $bq_1 = 1/3 (1, 2, 2)^tp$, $ba_2 dot bq_1 = 3$, $ba_2 - 3 bq_1 = (-2, 2, -1)^tp$ ⇒ $bq_2 = 1/3 (-2, 2, -1)^tp$, $bR = mat(3, 3; 0, 3)$.]
]

#sec("5.5", "Least squares")[
  #key[$hat(bx)$ least squares solution of $bA bx = bb$ ⇔ #box(stroke: 0.6pt + blue, inset: (x: 2.5pt, y: 1.5pt), outset: (y: 1pt), radius: 1pt)[$bA^tp bA hat(bx) = bA^tp bb$] ⇔ $bA hat(bx)$ = projection of $bb$ onto $Col(bA)$.]
  - Always consistent. Unique ⇔ columns of $bA$ independent; then $hat(bx) = (bA^tp bA)^(-1) bA^tp bb$, or with QR: #h(2pt) $bR hat(bx) = bQ^tp bb$ (back-substitute).
  - Columns dependent ⇒ infinitely many $hat(bx)$ = particular + $Null(bA)$, but $bA hat(bx)$ is the same for all. Error $= norm(bb - bA hat(bx))$.
  - #sub[Fitting] $y = a + b x$ to $(x_i, y_i)$: rows $(1, x_i)$, unknown $(a, b)^tp$, right side $(y_i)$. Normal equations: $mat(n, sum x_i; sum x_i, sum x_i^2) vec(a, b) = vec(sum y_i, sum x_i y_i)$. Quadratic: rows $(1, x_i, x_i^2)$. A polynomial of degree $<= n - 1$ passes exactly through $n$ points with distinct $x_i$.
  #ex("EX")[$(-1, 0), (0, 1), (1, 3), (2, 4)$: $4a + 2b = 8$, $2a + 6b = 11$ ⇒ $y = 1.3 + 1.4x$.]
]

#sec("6.1", "Eigenvalues & diagonalization")[
  - $bA bv = lambda bv$, $bv != bz$. Characteristic polynomial $det(x bI - bA)$; eigenspace $E_lambda = Null(lambda bI - bA)$. Triangular ⇒ eigenvalues on the diagonal. $2 times 2$: $x^2 - (a + d) x + det$.
  - $sum lambda_i$ = trace, $product lambda_i = det$. $bA^k$: $lambda^k$; $bA^(-1)$: $1\/lambda$; $bA + c bI$: $lambda + c$; $p(bA)$: $p(lambda)$ — same eigenvectors. $bA^tp$: same eigenvalues. $bA^2 = bA$ ⇒ $lambda in {0, 1}$; $bA^k = bz$ ⇒ $lambda = 0$.
  - $1 <= $ geometric mult. $= dim E_lambda = n - rank(lambda bI - bA) <=$ algebraic mult.
  #key[*Diagonalizable* ⇔ $n$ independent eigenvectors ⇔ char. polynomial splits and geometric = algebraic for *every* eigenvalue. $n$ distinct eigenvalues ⇒ yes. Then $bP = (bv_1 dots.c bv_n)$, $bD = "diag"(lambda_1, ..., lambda_n)$ #warn[in the same order], $bA = bP bD bP^(-1)$, $bA^k = bP bD^k bP^(-1)$.]
  - Only repeated eigenvalues need checking. Not diagonalizable: $mat(1, 1; 0, 1)$, $mat(0, 1; 0, 0)$. Diagonalizable does not mean invertible, nor conversely.
  #ex("EX")[$mat(1, a, b; 0, 2, c; 0, 0, 1)$: $lambda = 1$ twice; $bC - bI = mat(0, a, b; 0, 1, c; 0, 0, 0)$ needs rank 1 ⇔ $b = a c$.]
  #ex("EX")[$bA = mat(4, -2; 1, 1)$: $lambda = 2, 3$; $bP = mat(1, 2; 1, 1)$; $bA^n = bP mat(2^n, 0; 0, 3^n) bP^(-1)$. For $bx_n = bA^n bx_0$: write $bx_0 = c_1 bv_1 + c_2 bv_2$, then $bx_n = c_1 lambda_1^n bv_1 + c_2 lambda_2^n bv_2$.]
  - $|lambda| < 1$ terms die as $n -> oo$; the $lambda = 1$ component survives.
]

#sec("6.3", "Orthogonal diagonalization")[
  #key[*$bA$ symmetric ⇔ $bA = bP bD bP^tp$ with $bP$ orthogonal* (spectral theorem). Symmetric ⇒ always diagonalizable, real eigenvalues, eigenspaces of different eigenvalues orthogonal.]
  - Method: find eigenspaces; #warn[Gram–Schmidt inside each repeated eigenspace]; normalise every vector; columns of $bP$.
  - Diagonalizable does not imply symmetric; orthogonally diagonalizable does.
  #ex("EX")[$mat(3, 1, 1; 1, 3, 1; 1, 1, 3)$: $lambda = 5$: $(1, 1, 1)\/sqrt(3)$; $lambda = 2$ (plane $x + y + z = 0$): $(1, -1, 0)\/sqrt(2)$, $(1, 1, -2)\/sqrt(6)$. Rebuild from eigen-data: $bA = sum lambda_i bq_i bq_i^tp$.]
]

#sec("6.4", "Markov chains")[
  - Stochastic $bP$: entries $>= 0$, #warn[columns sum to 1]; entry $(i, j)$ = probability of going *from $j$ to $i$*. $bx_n = bP^n bx_0$; two-step probabilities are entries of $bP^2$.
  - #sub[Equilibrium:] solve $(bP - bI) bx = bz$, then scale so the entries sum to 1. 1 is always an eigenvalue. If the chain converges, the limit is an equilibrium vector.
  #ex("EX")[$mat(0.7, 0.2; 0.3, 0.8)$: $0.3 x_1 = 0.2 x_2$ ⇒ $(0.4, 0.6)^tp$. $2 times 2$ in general $mat(1 - a, b; a, 1 - b)$: equilibrium $1/(a + b) (b, a)^tp$, other eigenvalue $1 - a - b$.]
]

#sec("6.5", "Singular value decomposition")[
  #key[$bA = bU bS bV^tp$, $bA$ is $m times n$, $bU$ $m times m$ and $bV$ $n times n$ orthogonal, $bS$ $m times n$ with $sigma_1 >= dots.c >= sigma_r > 0$ on the diagonal.
  + $bA^tp bA$ ($n times n$): eigenvalues $mu_1 >= dots.c >= mu_n >= 0$; $sigma_i = sqrt(mu_i)$.
  + $bV$: orthonormal eigenvectors $bv_i$ of $bA^tp bA$, #warn[same order].
  + $bu_i = 1/sigma_i bA bv_i$ for $i <= r$.
  + Extend to an orthonormal basis of $RR^m$: $bu_(r+1), ...$ from $Null(bA^tp)$ (solve $bA^tp by = bz$, Gram–Schmidt, normalise).]
  - Wide matrix ($m < n$): do the SVD of $bA^tp$ and transpose: $bA^tp = bV bS^tp bU^tp$.
  - $r = rank bA$ = number of nonzero $sigma_i$. $Col(bA) = span{bu_1, ..., bu_r}$; $Null(bA^tp) = span{bu_(r+1), ..., bu_m}$; $Row(bA) = span{bv_1, ..., bv_r}$; $Null(bA) = span{bv_(r+1), ..., bv_n}$. $bA = sum_(i <= r) sigma_i bu_i bv_i^tp$.
  - Projection of $bw$ onto $Col(bA)$: $sum_(i <= r) (bw dot bu_i) bu_i$. Eigenvalues of $bA^tp bA$: $sigma_i^2$ and zeros.
  #ex("EX")[$mat(2, 1; 1, 2; 1, -1)$: $bA^tp bA = mat(6, 3; 3, 6)$, $mu = 9, 3$; $bv = (1, plus.minus 1)\/sqrt(2)$; $bu_1 = (1, 1, 0)\/sqrt(2)$, $bu_2 = (1, -1, 2)\/sqrt(6)$, $bu_3 = (1, -1, -1)\/sqrt(3)$.]
]

#sec("7", "Linear transformations")[
  - Linear ⇔ $T(a bu + b bv) = a T(bu) + b T(bv)$. Quick fails: $T(bz) != bz$; constants added; products or powers of coordinates.
  - #sub[Standard matrix] $bA = (T(be_1) dots.c T(be_n))$, $T(bx) = bA bx$. Composition $S compose T$ ↔ $bold(B) bA$ (right-most acts first).
  #key[*$[T]_S = (T(bu_1) dots.c T(bu_n))$* for a basis $S$; $T(bv) = [T]_S [bv]_S$; standard matrix $bA = [T]_S bP$, where $bP = (bu_1 dots.c bu_n)^(-1)$ is the transition matrix from $E$ to $S$. A linear map is determined by its values on a basis (or any spanning set).]
  - Range $R(T) = Col(bA)$, $rank(T) = rank bA$; $ker(T) = Null(bA)$, $nullity(T)$. $rank + nullity = n$.
  - Injective ⇔ $ker = {bz}$ ⇔ rank $n$. Surjective ⇔ rank $m$. $n > m$ ⇒ not injective; $n < m$ ⇒ not surjective. $ker(T)$ nontrivial for square $bA$ ⇔ $det bA = 0$.
  - Rotation by $theta$: $mat(cos theta, -sin theta; sin theta, cos theta)$. Reflection about $span{bu}$: $2 (bu bu^tp)/(bu^tp bu) - bI$. Projection: symmetric, $bP^2 = bP$.
  - $lim T^n (bx)$: expand $bx$ in an eigenbasis; keep the $lambda = 1$ part.
]

#sec("✓", "Section B checklist")[
  - Label every row operation; state the pivot / non-pivot columns you read off; define parameters $s, t in RR$.
  - #sub[Checks that cost seconds:] $bA bA^(-1) = bI$; $bA bv = lambda bv$ for each eigenvector; trace $= sum lambda_i$; $bQ^tp bQ = bI$ and $bQ bR = bA$; $bA bv_i = sigma_i bu_i$; equilibrium entries sum to 1; least squares residual $bb - bA hat(bx)$ is $perp$ to every column of $bA$; projection lies in $V$.
  - Parameter questions: answer for #warn[all] values — list each special case and the generic case.
  - "Justify": name the theorem (rank–nullity, spectral theorem, invertibility equivalences) or give a counterexample.
]
