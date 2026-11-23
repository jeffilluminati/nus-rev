// MA1522 Linear Algebra for Computing — final exam helpsheet (A4, double-sided)
// Same template and colours as the technique sheet (cheatsheet.typ): one accent per section,
// run-in labels, no title bar, no header and no footer.
// Content: the earlier helpsheet (worked EX patterns kept), extended with pure content drawn from
// the AY2024/25 and AY2025/26 final papers and the AY2026/27 graded quizzes.
// One knob: `size`. The sheet must stay at exactly two pages; a red flag appears if it overflows.

#import "cheatsheet.typ": *

#show: cheatsheet.with(
  title: "MA1522 Linear Algebra for Computing: final exam helpsheet",
  size: 6.5pt,
  margin: 5mm,
  gutter: 2.6mm,
)

// ───────────────────────────────────────────────────────────────── notation ──
#let tp = math.upright("T")
#let bA = $bold(A)$
#let bB = $bold(B)$
#let bC = $bold(C)$
#let bD = $bold(D)$
#let bE = $bold(E)$
#let bI = $bold(I)$
#let bJ = $bold(J)$
#let bL = $bold(L)$
#let bM = $bold(M)$
#let bN = $bold(N)$
#let bP = $bold(P)$
#let bQ = $bold(Q)$
#let bR = $bold(R)$
#let bU = $bold(U)$
#let bV = $bold(V)$
#let bX = $bold(X)$
#let bS = $bold(Sigma)$
#let ba = $bold(a)$
#let bb = $bold(b)$
#let bc = $bold(c)$
#let be = $bold(e)$
#let bn = $bold(n)$
#let bp = $bold(p)$
#let bq = $bold(q)$
#let bu = $bold(u)$
#let bv = $bold(v)$
#let bw = $bold(w)$
#let bx = $bold(x)$
#let by = $bold(y)$
#let bz = $bold(0)$
#let xh = $hat(bold(x))$
#let rank = math.op("rank")
#let nullity = math.op("nullity")
#let Col = math.op("Col")
#let Row = math.op("Row")
#let Null = math.op("Null")
#let span = math.op("span")
#let adj = math.op("adj")
#let diag = math.op("diag")

// The template's `key` box, but allowed to break across columns: the boxes here are long.
#let key(body) = context {
  let c = cs-accent.get()
  block(width: 100%, breakable: true, above: 0.42em, below: 0.42em, fill: c.lighten(91%),
    stroke: (left: 0.16em + c), radius: (right: 0.18em),
    inset: (left: 0.5em, right: 0.35em, top: 0.12em, bottom: 0.08em), body)
}

// Worked pattern, flagged "EX": a chip in the section's accent, then the working.
#let ex(body) = context {
  let cfg = cs-config.get()
  let c = cs-accent.get()
  box(fill: c.lighten(78%), radius: 0.15em, inset: (x: 0.25em), height: 0.66em, outset: (y: 0.14em),
    align(horizon, text(font: cfg.head, weight: "bold", size: 0.7em, fill: c.darken(25%),
      top-edge: "cap-height", bottom-edge: "baseline")[EX]))
  h(0.3em)
  body
}

// ══════════════════════════════════════════════════════════ SIDE 1: Ch 1–4 ══

#section(tag: "1", accent: hue.blue)[Linear systems][
  *REF* zero rows at the bottom, leading entries move strictly right. *RREF* also every leading entry is 1 and is the only nonzero entry in its column. RREF is unique; REF is not. A zero matrix is in RREF.

  *Row operations* $R_i <-> R_j$, #h(0.2em) $c R_i$ ($c != 0$; #warn[never $0 R_i$]), #h(0.2em) $R_i + c R_j$. #warn[$2R_2 + R_1$ is not one operation] (it is two, so the result is still row equivalent). Row equivalent ⇔ same RREF ⇔ $bB = bP bA$ with $bP$ invertible ⇒ same solutions.

  *Solve $bA bx = bb$* reduce $(bA | bb)$. Last column a pivot column ⇒ #warn[inconsistent]. Otherwise: every column of $bA$ a pivot column ⇒ unique; else one parameter per non-pivot column ⇒ infinitely many, with $n - r$ parameters.

  *Gaussian elimination* forward to a REF, then back-substitution. *Gauss–Jordan* continue to the RREF and read off. If the question names a method, use it and show every operation.

  *By ranks* $rank bA < rank(bA | bb)$ ⇒ none; #h(0.2em) $rank bA = rank(bA | bb) = n$ ⇒ unique; #h(0.2em) $= r < n$ ⇒ infinitely many.

  *Sizes* ($m$ equations, $n$ unknowns): consistency needs no relation between $m$ and $n$. A unique solution forces $m >= n$ (#warn[not conversely]). $rank bA = m$ ⇒ consistent for every $bb$, with $n - m$ parameters.

  *Homogeneous $bA bx = bz$* always consistent; more variables than equations ⇒ nontrivial solutions; infinitely many solutions ⇔ one nontrivial solution.

  *Solution structure* general solution of $bA bx = bb$ = one particular solution + general solution of $bA bx = bz$. In $bx = bp + s bv_1 + t bv_2$: $bA bp = bb$, $bA bv_i = bz$, nullity 2. $by$ solves $bA bx = bb$ ⇔ $by - bp in span{bv_1, bv_2}$; two solutions of $bA bx = bb$ differ by a solution of $bA bx = bz$.

  *System from its solution set* $bp + s bv_1 + t bv_2$: each coefficient row $ba$ solves $ba dot bv_i = 0$ for all $i$; its right-hand side is $ba dot bp$.

  *Linear equation* $a_1 x_1 + dots.c + a_n x_n = b$; the constants may be anything ($sin(pi\/12)$, $e^2$), but $x y$, $x^2$, $e^(2z)$, $sin y$ make it non-linear. In $RR^3$ each equation is a plane: the solution set is empty, a point, a line (1 parameter) or a plane (2 parameters).

  #key[*Unknown constants* never divide by an expression that may be 0. Reduce as far as possible, then split into cases at each pivot candidate ($a = 1$, $a = -2$, otherwise). For a square coefficient matrix, $det != 0$ ⇔ unique; then test each root of $det = 0$ separately.]

  #ex[$x + y + a z = 1$, $x + a y + z = 1$, $a x + y + z = -2$: $det = -(a-1)^2 (a+2)$. $a = 1$: rows clash ⇒ none. $a = -2$: rows sum to $0 = 0$ ⇒ $(1 + s, s, s)$.]
]

#section(tag: "2", accent: hue.teal)[Matrices, inverses, LU][
  *Algebra* $(bA bB)^tp = bB^tp bA^tp$, $(bA bB)^(-1) = bB^(-1) bA^(-1)$, $(bA^tp)^(-1) = (bA^(-1))^tp$, $(c bA)^(-1) = c^(-1) bA^(-1)$, $(bA^k)^(-1) = (bA^(-1))^k$. #warn[$bA bB != bB bA$]\; $bA bB = bz$ does not give $bA = bz$ or $bB = bz$. $(bA + bB)^2 = bA^2 + bA bB + bB bA + bB^2$.

  *Cancellation* needs an invertible factor on the #warn[same side]: $bA bB = bA bC$ ⇒ $bB = bC$, and $bB bA = bC bA$ ⇒ $bB = bC$, when $bA$ is invertible; #warn[$bA bB = bC bA$ ⇏ $bB = bC$].

  *Columns of $bA bB$* are $bA bb_j$, rows are $ba_i bB$; $bA bx$ is a linear combination of the columns of $bA$. So a zero column of $bB$ (zero row of $bA$) gives a zero column (row) of $bA bB$; a zero column of $bA$ #warn[does not].

  *Shapes* the zero square matrix is diagonal, scalar, triangular and symmetric. Diagonal ⇔ upper and lower triangular ⇔ symmetric and triangular. Upper $times$ upper is upper (also lower, unit lower); upper $times$ lower need not be triangular. $bA^tp bA$, $bA bA^tp$, $bA + bA^tp$ are symmetric; sums and inverses of symmetric matrices are symmetric, products only if $bA bB = bB bA$.

  *Inverse* $(bA | bI) -> (bI | bA^(-1))$; a zero row on the left ⇒ singular. #h(0.2em) $mat(a, b; c, d)^(-1) = display(dfrac(1, a d - b c)) mat(d, -b; -c, a)$. #h(0.2em) $bA^(-1) = adj(bA) \/ det bA$, $adj(bA) = (A_(j i))$ (transpose of the cofactor matrix). Solve $bA bX = bB$ by $(bA | bB) -> (bI | bX)$. Diagonal: invert each entry. Triangular: invertible ⇔ no zero on the diagonal, and the inverse is triangular of the same kind.

  *Products* for square $bA$, $bB$: $bA bB$ invertible ⇔ $bA$ and $bB$ invertible. $bA_1 bA_2 dots.c bA_k = bI$ (square) ⇒ every $bA_i$ is invertible and cyclic shifts hold, $bA_2 dots.c bA_k bA_1 = bI$, #warn[not the reversed product]. $bA$ singular ⇒ $bA bB = bz$ and $bC bA = bz$ for some nonzero $bB$, $bC$.

  *Inverse from an equation* square $bA bX = bI$ ⇒ $bX = bA^(-1)$. If $c_k bA^k + dots.c + c_1 bA + c_0 bI = bz$ with $c_0 != 0$, then $bA (c_k bA^(k-1) + dots.c + c_1 bI) = -c_0 bI$, so $bA^(-1) = -(c_k bA^(k-1) + dots.c + c_1 bI) \/ c_0$.

  *Non-square $bA bB = bI_m$* ($bA$ is $m times n$): $rank bA = rank bB = m <= n$ and #warn[$bB bA != bI_n$] unless $m = n$.

  *Elementary matrix* $bE$ = #warn[one] row operation applied to $bI$ (so $mat(2, 1; 0, 1)$ is not elementary); $bE bA$ performs it on $bA$. Inverses: swap ↔ itself; $c R_i$ ↔ $(1\/c) R_i$; $R_i + c R_j$ ↔ $R_i - c R_j$. If $bE_k dots.c bE_1 bA = bI$ then $bA^(-1) = bE_k dots.c bE_1$ and $bA = bE_1^(-1) dots.c bE_k^(-1)$.

  *LU* (no row swaps, only $R_i + c R_j$ with $i > j$): $bU$ = the REF reached ($m times n$); $bL$ is $m times m$ unit lower triangular with #warn[$-c$] in entry $(i, j)$. Solve $bA bx = bb$: $bL by = bb$ (forward), then $bU bx = by$ (back). A forced row swap ⇒ no LU (then $bA = bP bL bU$, $bP$ a permutation matrix).

  #ex[$mat(2, 1, -1; 4, 5, -3; -2, 5, 3)$: $R_2 - 2R_1$, $R_3 + R_1$, $R_3 - 2R_2$ ⇒ $bL = mat(1, 0, 0; 2, 1, 0; -1, 2, 1)$, $bU = mat(2, 1, -1; 0, 3, -1; 0, 0, 4)$.]

  #key[*Given $bA = bL bU$* #h(0.2em) $bL$ is invertible, so $bA$ is row equivalent to $bU$ — same rank, pivot positions, $Null$, $Row$ and the same relations between columns ($bu_2 = 2 bu_1$ ⇔ $ba_2 = 2 ba_1$). Basis of $Col(bA)$: the columns $ba_j = bL bu_j$ at the pivot positions, #warn[not the columns of $bU$]. Square: $det bA = det bU = product u_(i i)$. Known $bA bv = bw$: use $bL (bU bv) = bw$ to find the entries of $bL$.]

  #key[*Square $bA$ of order $n$ is invertible* ⇔ RREF is $bI$ ⇔ product of elementary matrices ⇔ $bA bx = bz$ only trivially ⇔ $bA bx = bb$ unique for all $bb$ ⇔ $det != 0$ ⇔ columns (rows) independent / span $RR^n$ / a basis ⇔ rank $n$ ⇔ nullity 0 ⇔ 0 not an eigenvalue ⇔ has a left (or right) inverse ⇔ $bA^tp$ invertible ⇔ $bx |-> bA bx$ injective ⇔ surjective.]

  *Blocks* $det mat(bA, bB; bz, bD) = det bA det bD$ for square $bA$, $bD$; a block diagonal matrix is inverted, powered and diagonalized block by block.
]

#section(tag: "2.8", accent: hue.green)[Determinants][
  *Cofactor expansion* along any row or column: $det = sum_j a_(i j) A_(i j)$, $A_(i j) = (-1)^(i+j) det(bM_(i j))$. Pick the row/column with most zeros. $3 times 3$: $a e i + b f g + c d h - c e g - a f h - b d i$ (this diagonal rule holds #warn[only for orders 2 and 3]).

  *Triangular* ⇒ product of the diagonal. Two equal or proportional rows / a zero row ⇒ 0.

  *By reduction* swap ⇒ $times (-1)$; $c R_i$ ⇒ $times c$; $R_i + c R_j$ ⇒ unchanged (these are $det bE$). So $det(bA) = (plus.minus "product of pivots") \/ ("scalings used")$. Column operations act the same way.

  *Properties* $det(bA bB) = det bA det bB$, $det(bA^tp) = det bA$, $det(bA^(-1)) = 1\/det bA$, $det(bA^k) = (det bA)^k$, #warn[$det(c bA) = c^n det bA$], $det(-bA) = (-1)^n det bA$, $det(bP^(-1) bA bP) = det bA$, $det(adj bA) = (det bA)^(n-1)$, $bA adj(bA) = (det bA) bI$ (also for singular $bA$). #warn[$det(bA + bB) != det bA + det bB$.]

  *$det bA = 0$* ⇔ singular ⇔ rows (columns) dependent ⇔ $bA bx = bz$ has a nontrivial solution ⇔ 0 is an eigenvalue.

  *Cramer* $x_i = det(bA_i)\/det(bA)$, $bA_i$ = $bA$ with column $i$ replaced by $bb$. *Area* of the parallelogram on $bu, bv in RR^2$: $|det(bu #h(0.25em) bv)|$ (triangle: half); volume of the box on three vectors of $RR^3$: $|det|$.

  #ex[$n times n$ pattern matrix: expand along row 1 to get a recurrence, e.g. tridiagonal $2, 1$: $d_n = 2d_(n-1) - d_(n-2)$ ⇒ $d_n = n + 1$.]

  *Pattern formulas* (order $n$): $a$ on the diagonal and $b$ in the two far corners: $a^(n-2)(a^2 - b^2)$, by the single operation $R_n - (b\/a) R_1$. #h(0.2em) $a bI + b bJ$ ($bJ$ all ones): $a^(n-1)(a + n b)$. #h(0.2em) Tridiagonal, $a$ on the diagonal, $b$ above, $c$ below: $d_n = a d_(n-1) - b c d_(n-2)$. #h(0.2em) Vandermonde (rows $1, x_i, x_i^2, ...$): $product_(i < j) (x_j - x_i)$.
]

#section(tag: "3", accent: hue.amber)[Vector spaces: span, independence, basis][
  *In the span?* $bv in span{bu_1, ..., bu_k}$ ⇔ $(bu_1 dots.c bu_k | bv)$ consistent (several vectors at once: $(bu_1 dots.c bu_k | bv_1 bv_2 dots.c)$). $span(S) = RR^n$ ⇔ REF of $(bu_1 dots.c bu_k)$ has no zero row; impossible if $k < n$. $span(S_1) subset.eq span(S_2)$ ⇔ every vector of $S_1$ is in $span(S_2)$; equal ⇔ $subset.eq$ and equal dimensions.

  *Span facts* $S subset.eq span(S)$; #h(0.2em) $S subset.eq T$ ⇒ $span(S) subset.eq span(T)$; #h(0.2em) $span(nothing) = span{bz} = {bz}$; #h(0.2em) $span(S) = span(T)$ forces neither $S = T$ nor $|S| = |T|$.

  *Subspace* = a span = contains $bz$, closed under $+$ and scalar multiples. Solution set of $bA bx = bz$: yes. Of $bA bx = bb != bz$: #warn[no] (no $bz$; it is a translate $bp + Null(bA)$). Products, squares, $>=$, “or” conditions: usually no — find two vectors whose sum leaves the set.

  *Subspace facts* ${bz}$ is a subspace, $nothing$ is not; nonempty and closed under $+$ and scalar multiples ⇒ subspace. $U inter V$ and $U + V$ are subspaces, #warn[$U union V$ is not] unless one contains the other. $ba, bb in.not V$ does not give $ba + bb in.not V$. Subspaces of $RR^3$: ${bz}$, lines and planes through the origin, $RR^3$. Red flags: a nonzero constant, products or squares ($x y + y z = 0$, $x^2 = y^2$), “or”, inequalities, $|dot|$; homogeneous linear equations joined by “and” are fine.

  *Independent* ⇔ $c_1 bu_1 + dots.c + c_k bu_k = bz$ only trivially ⇔ every column of $(bu_1 dots.c bu_k)$ is a pivot column. More than $n$ vectors in $RR^n$ ⇒ dependent. Contains $bz$ ⇒ dependent. Two vectors: dependent ⇔ multiples. Dependent ⇔ some vector is a combination of the others.

  *Independence facts* $nothing$ is independent, ${bz}$ is dependent. Subsets of independent sets are independent; supersets of dependent sets are dependent. $S$ independent and $bu in.not span(S)$ ⇒ $S union {bu}$ independent.

  *Basis* of $V$: independent and spans $V$. If $dim V = k$: any $k$ independent vectors in $V$ form a basis; any $k$ vectors spanning $V$ form a basis. $U subset.eq V$ ⇒ $dim U <= dim V$, equal ⇔ $U = V$. ${bz}$ has basis $nothing$, dimension 0.

  *Dimensions* $Null(bA)$: $n - r$; #h(0.2em) $span(S)$: rank of $(S)$; #h(0.2em) $span(S union T)$: rank of $(S | T)$. A vector of $V$ must satisfy the equations of $V$: check that before counting.

  *New basis from old* ${bu_i}$ a basis and $bv_j = sum_i c_(i j) bu_i$ ⇒ ${bv_j}$ is a basis ⇔ $bC = (c_(i j))$ is invertible.

  *Basis of a solution space* solve, write $bx = s bv_1 + t bv_2 + dots.c$; the $bv_i$ are a basis. Hyperplane $ba dot bx = 0$ in $RR^n$ has dimension $n - 1$.

  *Coordinates* $[bv]_S = (c_1, ..., c_k)^tp$ with $bv = sum c_i bu_i$: solve $(bu_1 dots.c bu_k | bv)$. Linear: $[a bu + b bv]_S = a [bu]_S + b [bv]_S$; $bu = bv$ ⇔ $[bu]_S = [bv]_S$. They keep independence and spanning: with $bA = ([bv_1]_S dots.c [bv_k]_S)$, the $bv_i$ span $V$ ⇔ REF of $bA$ has no zero row; independent ⇔ every column is a pivot column.

  #key[*Transition matrix from $T$ to $S$* #h(0.2em) $bP = ([bv_1]_S dots.c [bv_k]_S)$, found from $(S | T) -> (bI | bP)$. Then $[bw]_S = bP [bw]_T$; from $S$ to $T$ it is $bP^(-1)$. In $RR^n$: $bP = bold(S)^(-1) bold(T)$ (matrices of basis columns). $bP$ is always invertible, and every invertible matrix is a transition matrix. $bP_(U <- S) bP_(S <- T) = bP_(U <- T)$. Subspace of dimension $k < n$: $(S | T) -> mat(bI_k, bP; bz, bz)$; a nonzero entry beside a zero row means $T subset.eq.not span(S)$.]

  #ex[${bu, bv, bw}$ independent ⇒ ${bu + bv, bv + bw, bw + bu}$ independent (coefficient matrix has $det = 2$); ${bu - bv, bv - bw, bw - bu}$ dependent (sum is $bz$).]

  *$dim(U + V)$* $= dim U + dim V - dim(U inter V)$. For $U subset.eq V$: a basis of $V$ need not contain a basis of $U$, but every basis of $U$ extends to a basis of $V$.
]

#section(tag: "4", accent: hue.plum)[Column space, row space, nullspace, rank][
  *Set-up* reduce $bA -> bR$ (REF or RREF); $bA$ is $m times n$, $r$ = number of pivots.
  #tbl(columns: (auto, auto, 1fr, auto),
    [Space], [in], [Basis], [dim],
    [$Row(bA)$], [$RR^n$], [nonzero rows of $bR$], [$r$],
    [$Col(bA)$], [$RR^m$], [#warn[columns of $bA$] at the pivots of $bR$], [$r$],
    [$Null(bA)$], [$RR^n$], [solve $bA bx = bz$: a vector per parameter], [$n - r$],
    [$Null(bA^tp)$], [$RR^m$], [solve $bA^tp by = bz$; equals $Col(bA)^perp$], [$m - r$],
  )
  *Row operations preserve* $Row$ and $Null$, and the dependence relations between columns, #warn[not $Col$], and not the relations between rows. So $Row(bA) = Row(bR)$, $Null(bA) = Null(bR)$; the pivot rows of $bR$ are a basis of $Row(bA)$, but the pivot columns of $bR$ are #warn[not] a basis of $Col(bA)$.

  *Rows of $bA$ that form a basis of $Row(bA)$* reduce $bA^tp$ and keep the rows of $bA$ at its pivot columns.

  *Same row space* ⇔ same nonzero rows in the RREF (equal sizes: row equivalent). *Same column space* ⇔ $rank bA = rank bB = rank(bA | bB)$.

  *Rank facts* $rank bA = rank bA^tp <= min(m, n)$; #h(0.2em) #b[rank $+$ nullity $= n$] (columns); #h(0.2em) $rank bA = 0$ ⇔ $bA = bz$. $rank(bA bB) <= min(rank bA, rank bB)$; $rank(bA + bB) <= rank bA + rank bB$; $rank(bA^tp bA) = rank bA$, $Null(bA^tp bA) = Null(bA)$. Invertible $bC$: $rank(bA bC) = rank(bC bA) = rank bA$.

  *Inclusions* $Col(bA bB) subset.eq Col(bA)$, $Row(bA bB) subset.eq Row(bB)$, $Null(bB) subset.eq Null(bA bB)$ — #warn[not] $Col(bA bB) subset.eq Col(bB)$. $bA bB = bz$ ⇔ $Col(bB) subset.eq Null(bA)$ ⇒ $rank bA + rank bB <= n$. Rank 1 ⇔ $bA = bu bv^tp != bz$ (every column a multiple of $bu$). $k$ independent vectors in $Null(bA)$ ⇒ $rank bA <= n - k$.

  *Consistent* $bA bx = bb$ ⇔ $bb in Col(bA)$ ⇔ $rank(bA) = rank(bA | bb)$. Consistent for #b[every] $bb$ ⇔ $rank = m$.

  *Basis from a spanning set* put the vectors as columns, keep the pivot columns; the RREF entries of a non-pivot column are its coefficients in terms of them. *Extend to a basis of $RR^n$* add standard basis vectors for the non-pivot columns of the row-form REF.

  *Full rank* means $r = min(m, n)$. Wide ($m < n$): nullity $>= n - m > 0$, never a unique solution, no left inverse. Tall ($m > n$): some $bb$ is inconsistent, no right inverse. “Nullity 0 ⇔ full rank” holds only when $m >= n$.

  #key[*Full rank, $rank = n$* (columns independent) ⇔ $bA^tp bA$ invertible ⇔ left inverse $(bA^tp bA)^(-1) bA^tp$ ⇔ $bA bx = bb$ has at most one solution ⇔ least squares solution unique ⇔ $bx |-> bA bx$ injective.

    *Full rank, $rank = m$* (rows independent) ⇔ $bA bA^tp$ invertible ⇔ right inverse $bA^tp (bA bA^tp)^(-1)$ ⇔ $bA bx = bb$ consistent for all $bb$ ⇔ surjective.

    *All right inverses* solve $bA bX = bI$ column by column, $(bA | bI) ->$ RREF, each column = a particular solution + any vector of $Null(bA)$. *All left inverses* the right inverses of $bA^tp$, transposed. Rank below $min(m, n)$: neither exists.]

  #ex[Rank with constants $c, d$: clear column 1; if the remaining rows are $(0, c - 4, 0, c - 4)$, $(0, 0, d - 1, d - 1)$ then rank $= 1 + [c != 4] + [d != 1]$; nullity $= n - $ rank.]
]

#section(accent: hue.slate)[MCQ traps][
  *Rank $n$* “$m times n$, rank $n$ ⇒ invertible”: #warn[false] unless square.

  *Sums and differences* $bA, bB$ invertible says nothing about $bA plus.minus bB$ (take $bB = -bA$, or $bB = bA$). Distinct invertible $bA, bB$: $bA - bB$ may be singular ($bI$ and $diag(1, 2)$), and $bA bB^(-1)$ may be diagonal ($bB = 2 bA$).

  *Zero vector* $bz$ is in every subspace; $Row(bA) inter Null(bA) = {bz}$; $V inter V^perp = {bz}$; $(V^perp)^perp = V$. For $m != n$, $Col(bA) subset.eq RR^m$ and $Null(bA) subset.eq RR^n$ lie in different spaces, so $bz_n in.not Col(bA)$.

  *Row equivalent* ⇒ same $Row$, $Null$, rank; not same $Col$.

  *False friends* $bA^2 = bI$ does not force $bA = plus.minus bI$; symmetric $times$ symmetric need not be symmetric (needs $bA bB = bB bA$).

  *“Statement true for all $bb$ / all $a$”* test the extreme cases ($bb = bz$, zero matrix, $bI$, $mat(1, 1; 0, 1)$, $mat(0, 1; 0, 0)$).

  *Wording* “always true” needs a proof; “false” needs one counterexample. “Necessary” vs “sufficient”: check each direction separately.
]

// ══════════════════════════════════════════════════════════ SIDE 2: Ch 5–7 ══
#pagebreak()

#section(tag: "5.1", accent: hue.violet)[Orthogonality & projection][
  *Basics* $bu dot bv = bu^tp bv$; $norm(bu) = sqrt(bu dot bu)$; $norm(c bu) = |c| norm(bu)$; $d(bu, bv) = norm(bu - bv)$; $cos theta = (bu dot bv)/(norm(bu) norm(bv))$, $0 <= theta <= pi$; unit vector $bu\/norm(bu)$. $norm(bu + bv)^2 = norm(bu)^2 + 2 bu dot bv + norm(bv)^2$, so Pythagoras $norm(bu + bv)^2 = norm(bu)^2 + norm(bv)^2$ ⇔ $bu dot bv = 0$.

  *Inequalities* $|bu dot bv| <= norm(bu) norm(bv)$; #h(0.2em) $|norm(bu) - norm(bv)| <= norm(bu + bv) <= norm(bu) + norm(bv)$.

  *Orthogonal set* of #warn[nonzero] vectors ⇒ independent. An orthogonal set may contain $bz$ (${bz}$ is orthogonal and dependent). Orthonormal: also all norms 1, always independent. $bQ^tp bQ$ has entries $bq_i dot bq_j$: diagonal ⇔ columns orthogonal; $= bI$ ⇔ orthonormal.

  *Coordinates in an orthogonal basis* (no row reduction): $c_i = (bw dot bu_i)/(bu_i dot bu_i)$; orthonormal: $c_i = bw dot bu_i$. Orthonormal $S$: $[bx]_S dot [by]_S = bx dot by$ and $norm([bx]_S) = norm(bx)$ — #warn[false if $S$ is only orthogonal].

  *Orthogonal complement* $V^perp = {bw : bw dot bv = 0 "for all" bv in V}$ = $Null$ of the matrix whose #b[rows] span $V$ (checking a spanning set is enough). $dim V + dim V^perp = n$. $Row(bA)^perp = Null(bA)$, $Col(bA)^perp = Null(bA^tp)$.

  #key[*Projection of $bw$ onto $V$* with #warn[orthogonal] basis ${bu_1, ..., bu_k}$:
    $ bw_p = (bw dot bu_1)/(bu_1 dot bu_1) bu_1 + dots.c + (bw dot bu_k)/(bu_k dot bu_k) bu_k . $
    $bw - bw_p in V^perp$; $bw_p$ is the closest point of $V$; distance $= norm(bw - bw_p)$. Basis not orthogonal ⇒ Gram–Schmidt first, or solve $bA^tp bA bx = bA^tp bw$ and take $bA bx$.]

  *Projection facts* $bw_p$ exists and is #warn[unique] for every $bw$ (whatever basis or spanning set is used); $bw in V$ ⇔ $bw_p = bw$; $bw - bw_p$ is the projection onto $V^perp$. Matrix forms: $bw_p = bA (bA^tp bA)^(-1) bA^tp bw$ (columns of $bA$ a basis of $V$) $= bQ bQ^tp bw$ (orthonormal columns).

  *Hyperplane* $V = {bn dot bx = 0}$: $bw_p = bw - (bw dot bn)/(bn dot bn) bn$; matrix $bI - (bn bn^tp)/(bn^tp bn)$; distance $|bw dot bn| \/ norm(bn)$. *Line* $span{bu}$: matrix $(bu bu^tp)/(bu^tp bu)$. *Projection matrices* $bP^2 = bP = bP^tp$, eigenvalues 1 (on $V$) and 0 (on $V^perp$).

  *Orthogonal matrix* (square): $bQ^tp bQ = bI$ ⇔ $bQ^(-1) = bQ^tp$ ⇔ columns (and rows) orthonormal. $det = plus.minus 1$, $norm(bQ bx) = norm(bx)$, $bQ bx dot bQ by = bx dot by$; products, inverses and transposes of orthogonal matrices are orthogonal. Solve $bQ bx = bb$: $bx = bQ^tp bb$.

  *Orthogonal-matrix traps* rows forming an orthogonal but not orthonormal basis ⇒ #warn[not] an orthogonal matrix. $bA bB$ orthogonal does not make $bA$, $bB$ orthogonal. Real eigenvalues can only be $plus.minus 1$, and there may be none ($mat(0, -1; 1, 0)$). Order 2: rotation ($det = 1$) or reflection ($det = -1$). Non-square with $bQ^tp bQ = bI$: $bQ bQ^tp != bI$ (it is the projection onto $Col(bQ)$).
]

#section(tag: "5.4", accent: hue.green)[Gram–Schmidt & QR][
  *Gram–Schmidt* $bv_1 = bu_1$, #h(0.3em) $bv_2 = bu_2 - (bu_2 dot bv_1)/(bv_1 dot bv_1) bv_1$, #h(0.3em) $bv_3 = bu_3 - (bu_3 dot bv_1)/(bv_1 dot bv_1) bv_1 - (bu_3 dot bv_2)/(bv_2 dot bv_2) bv_2$, …; then $bq_i = bv_i\/norm(bv_i)$. Rescale any $bv_i$ to clear fractions before continuing (project onto the #b[new] $bv$'s, never the old $bu$'s). $bv_j = bz$ ⇔ $bu_j in span{bu_1, ..., bu_(j-1)}$: drop it.

  #key[*QR* ($bA$ with independent columns): $bQ = (bq_1 dots.c bq_n)$, $bR = bQ^tp bA$, upper triangular with $r_(i j) = bq_i dot ba_j$, so $r_(i i) = bq_i dot ba_i > 0$ ($= norm(bv_i)$ only if $bv_i$ was #warn[not rescaled]). Check: $bQ bR = bA$.]

  *Reading a QR* $bQ$ is $m times n$ with $bQ^tp bQ = bI_n$, $bR$ is $n times n$ and invertible. $Col(bA) = Col(bQ)$, so the $bq_i$ are an orthonormal basis of $Col(bA)$ and the projection onto it is $bQ bQ^tp bb$. $rank bA = n$: $Row(bA) = RR^n$, $bA^tp bA = bR^tp bR$ is invertible, but $bA bA^tp$ is singular when $m > n$.

  #ex[$bA = mat(1, -1; 2, 4; 2, 1)$: $bq_1 = (1, 2, 2)^tp \/ 3$, $ba_2 dot bq_1 = 3$, $ba_2 - 3 bq_1 = (-2, 2, -1)^tp$ ⇒ $bq_2 = (-2, 2, -1)^tp \/ 3$, $bR = mat(3, 3; 0, 3)$.]
]

#section(tag: "5.5", accent: hue.blue)[Least squares][
  #key[$xh$ least squares solution of $bA bx = bb$ ⇔ $bA^tp bA xh = bA^tp bb$ ⇔ $bA xh$ = projection of $bb$ onto $Col(bA)$.]

  *Normal equations* always consistent. Unique ⇔ columns of $bA$ independent; then $xh = (bA^tp bA)^(-1) bA^tp bb$, or with QR: #h(0.2em) $bR xh = bQ^tp bb$ (back-substitute).

  *Columns dependent* ⇒ infinitely many $xh$ = particular + $Null(bA)$ (if $bA bn = bz$, every $xh + t bn$ is one too), but $bA xh$ is the same for all. Error $= norm(bb - bA xh)$.

  *Consistent $bA bx = bb$* least squares solutions = solutions. *Residual* $bb - bA xh in Null(bA^tp)$; #h(0.2em) $norm(bb - bA xh)^2 = norm(bb)^2 - norm(bA xh)^2$.

  *Fitting* $y = a + b x$ to $(x_i, y_i)$: rows $(1, x_i)$, unknown $(a, b)^tp$, right side $(y_i)$. Normal equations: $mat(n, sum x_i; sum x_i, sum x_i^2) vec(a, b) = vec(sum y_i, sum x_i y_i)$. Quadratic: rows $(1, x_i, x_i^2)$. General model $y = c_1 f_1 (x) + dots.c + c_k f_k (x)$: row $i$ is $(f_1 (x_i), ..., f_k (x_i))$.

  *Exact fit?* $n$ points with distinct $x_i$, polynomial of degree $d$: $d >= n - 1$ ⇒ an exact fit exists (unique for $d = n - 1$); $d < n - 1$ ⇒ usually no exact fit, and the least squares fit is unique.

  #ex[$(-1, 0), (0, 1), (1, 3), (2, 4)$: $4a + 2b = 8$, $2a + 6b = 11$ ⇒ $y = 1.3 + 1.4x$.]
]

#section(tag: "6.1", accent: hue.teal)[Eigenvalues & diagonalization][
  *Definitions* $bA bv = lambda bv$, $bv != bz$. Characteristic polynomial $det(x bI - bA)$; eigenspace $E_lambda = Null(lambda bI - bA)$. Triangular ⇒ eigenvalues on the diagonal. $2 times 2$: $x^2 - (a + d) x + det$. $3 times 3$: $x^3 - tr(bA) x^2 + (M_(11) + M_(22) + M_(33)) x - det bA$, $M_(i i)$ the $2 times 2$ minor without row and column $i$.

  *Trace and det* if the char. polynomial splits: $sum lambda_i$ = trace, $product lambda_i = det$ (all $n$ roots, with multiplicity). *Eigen-data for free* an eigenvector of $bA$ for $lambda$ is also one of $bA^k$ ($lambda^k$), $bA^(-1)$ ($1\/lambda$), $bA + c bI$ ($lambda + c$), $p(bA)$ ($p(lambda)$); $bA^k$ and $p(bA)$ may have more. $bA^tp$: same eigenvalues. $bA^2 = bA$ ⇒ $lambda in {0, 1}$; $bA^k = bz$ ⇒ $lambda = 0$.

  *Shortcuts* every row (or every column) sums to $s$ ⇒ $lambda = s$ (rows: eigenvector $(1, ..., 1)^tp$). Block triangular ⇒ eigenvalues of the diagonal blocks. Rank 1, $bA = bu bv^tp$: $lambda = bv dot bu$ (eigenvector $bu$) and 0 ($E_0 = bv^perp$, dimension $n - 1$); diagonalizable ⇔ $bv dot bu != 0$. $mat(a, b; b, a)$: $a + b$ with $(1, 1)^tp$, $a - b$ with $(1, -1)^tp$. $a bI + b bJ$: $a + n b$ once, $a$ ($n - 1$ times). Integer matrix: every rational root is an integer dividing $det bA$.

  *$lambda = 0$* is an eigenvalue ⇔ $bA$ singular ⇔ $bA bv = bz$ for some $bv != bz$; then $E_0 = Null(bA)$.

  *Multiplicities* $1 <= $ geometric mult. $= dim E_lambda = n - rank(lambda bI - bA) <=$ algebraic mult.

  #key[*Diagonalizable* ⇔ $n$ independent eigenvectors ⇔ char. polynomial splits and geometric = algebraic for #b[every] eigenvalue. $n$ distinct eigenvalues ⇒ yes. Then $bP = (bv_1 dots.c bv_n)$, $bD = diag(lambda_1, ..., lambda_n)$ #warn[in the same order], $bA = bP bD bP^(-1)$, $bA^k = bP bD^k bP^(-1)$.]

  *Checking* only repeated eigenvalues need checking. Not diagonalizable: $mat(1, 1; 0, 1)$, $mat(0, 1; 0, 0)$. Diagonalizable does not mean invertible, nor conversely.

  *Real eigenvalues only* a factor such as $x^2 + 1$ ⇒ not diagonalizable. Diagonalizable ⇒ all roots real; #warn[all roots real ⇏ diagonalizable]. One eigenvalue $lambda$ only: diagonalizable ⇔ $bA = lambda bI$.

  *Reading $bA = bP bD bP^(-1)$* column $i$ of $bP$ is an eigenvector for $d_(i i)$; algebraic = geometric mult. = number of times $lambda$ appears in $bD$; $det bA = product d_(i i)$; char. polynomial $product (x - d_(i i))$; rank = number of nonzero $d_(i i)$. Nonzero combinations of columns with the #warn[same] $lambda$ are eigenvectors; mixing different $lambda$ is not. $bP$, $bD$ are not unique.

  *Similar* $bB = bP^(-1) bA bP$: same char. polynomial, eigenvalues, trace, det, rank; $bB bw = lambda bw$ ⇒ $bA (bP bw) = lambda (bP bw)$. So for $bA = bP bM bP^(-1)$ with $bM$ not diagonal: eigenvectors of $bA$ are $bP times$ those of $bM$, and $bA^k = bP bM^k bP^(-1)$.

  *With parameters* for each repeated $lambda$ require $rank(lambda bI - bA) = n - $ (algebraic mult.); treat separately the parameter values where two eigenvalues coincide.

  #ex[$bC = mat(1, a, b; 0, 2, c; 0, 0, 1)$: $lambda = 1$ twice; $bC - bI = mat(0, a, b; 0, 1, c; 0, 0, 0)$ needs rank 1 ⇔ $b = a c$.]

  #ex[$bA = mat(4, -2; 1, 1)$: $lambda = 2, 3$; $bP = mat(1, 2; 1, 1)$; $bA^n = bP mat(2^n, 0; 0, 3^n) bP^(-1)$. For $bx_n = bA^n bx_0$: write $bx_0 = c_1 bv_1 + c_2 bv_2$, then $bx_n = c_1 lambda_1^n bv_1 + c_2 lambda_2^n bv_2$.]

  *Limits and powers* $|lambda| < 1$ terms die as $n -> oo$; the $lambda = 1$ component survives. $lim bA^n$ exists (diagonalizable $bA$) ⇔ every eigenvalue is 1 or has $|lambda| < 1$; negative powers need $bA$ invertible; if all $lambda >= 0$, a square root is $bP bD^(1\/2) bP^(-1)$.
]

#section(tag: "6.3", accent: hue.violet)[Orthogonal diagonalization][
  #key[*$bA$ symmetric ⇔ $bA = bP bD bP^tp$ with $bP$ orthogonal* (spectral theorem). Symmetric ⇒ always diagonalizable, real eigenvalues, eigenspaces of different eigenvalues orthogonal.]

  *Method* find eigenspaces; #warn[Gram–Schmidt inside each repeated eigenspace]\; normalise every vector; columns of $bP$.

  *Traps* diagonalizable does not imply symmetric; orthogonally diagonalizable does. Distinct eigenvalues ⇒ diagonalizable, but orthogonally #warn[only if symmetric].

  *Symmetric $3 times 3$* with two eigenvectors known: the third is orthogonal to both (cross product).

  #ex[$mat(3, 1, 1; 1, 3, 1; 1, 1, 3)$: $lambda = 5$: $(1, 1, 1)\/sqrt(3)$; $lambda = 2$ (plane $x + y + z = 0$): $(1, -1, 0)\/sqrt(2)$, $(1, 1, -2)\/sqrt(6)$. Rebuild from eigen-data: $bA = sum lambda_i bq_i bq_i^tp$.]
]

#section(tag: "6.4", accent: hue.amber)[Markov chains][
  *Stochastic $bP$* entries $>= 0$, #warn[columns sum to 1]\; entry $(i, j)$ = probability of going #b[from $j$ to $i$]. $bx_n = bP^n bx_0$; two-step probabilities are entries of $bP^2$, $k$-step ones of $bP^k$.

  *Build $bP$* column $j$ = tomorrow's distribution given state $j$ today; fill the missing entry so the column sums to 1; “never the same twice” ⇒ zero diagonal. Probability vector: entries $>= 0$ with sum 1; $bP bx$ is again one.

  *Equilibrium* solve $(bP - bI) bx = bz$, then scale so the entries sum to 1. 1 is always an eigenvalue, all $|lambda| <= 1$. If the chain converges, the limit is an equilibrium vector. Long-run proportions (ranking of states) = the equilibrium vector.

  *Regular* (some $bP^k$ has all entries $> 0$) ⇒ the equilibrium is unique and every chain converges to it. *PageRank* column $j$ has $1\/$(number of links out of page $j$) at the pages it links to.

  #ex[$mat(0.7, 0.2; 0.3, 0.8)$: $0.3 x_1 = 0.2 x_2$ ⇒ $(0.4, 0.6)^tp$. $2 times 2$ in general $mat(1 - a, b; a, 1 - b)$: equilibrium $(b, a)^tp \/ (a + b)$, other eigenvalue $1 - a - b$.]
]

#section(tag: "6.5", accent: hue.plum)[Singular value decomposition][
  #key[*SVD* #h(0.2em) $bA = bU bS bV^tp$, $bA$ is $m times n$, $bU$ $m times m$ and $bV$ $n times n$ orthogonal, $bS$ $m times n$ with $sigma_1 >= dots.c >= sigma_r > 0$ on the diagonal.

    #s1 $bA^tp bA$ ($n times n$, entries $ba_i dot ba_j$): eigenvalues $mu_1 >= dots.c >= mu_n >= 0$; $sigma_i = sqrt(mu_i)$.

    #s2 $bV$: orthonormal eigenvectors $bv_i$ of $bA^tp bA$, #warn[same order] (Gram–Schmidt inside a repeated eigenspace).

    #s3 $bu_i = bA bv_i \/ sigma_i$ for $i <= r$.

    #s4 Extend to an orthonormal basis of $RR^m$: $bu_(r+1), ...$ from $Null(bA^tp)$ (solve $bA^tp by = bz$, Gram–Schmidt, normalise).]

  *Wide matrix* ($m < n$): do the SVD of $bA^tp$ and transpose: $bA^tp = bV bS^tp bU^tp$.

  *Reading an SVD* $r = rank bA$ = number of nonzero $sigma_i$. $Col(bA) = span{bu_1, ..., bu_r}$; $Null(bA^tp) = span{bu_(r+1), ..., bu_m}$; $Row(bA) = span{bv_1, ..., bv_r}$; $Null(bA) = span{bv_(r+1), ..., bv_n}$. $bA = sum_(i <= r) sigma_i bu_i bv_i^tp$.

  *Projection* of $bw$ onto $Col(bA)$: $sum_(i <= r) (bw dot bu_i) bu_i$. *Eigenvalues* of $bA^tp bA$: $sigma_i^2$ and $n - r$ zeros; of $bA bA^tp$: $sigma_i^2$ and $m - r$ zeros.

  *Checks* $bA bv_i = sigma_i bu_i$ and $bA^tp bu_i = sigma_i bv_i$ ($i <= r$); $bA bv_i = bz$ for $i > r$; $sum sigma_i^2 = sum a_(i j)^2$.

  *Facts* every matrix has an SVD (not unique). $bA$ and $bA^tp$ have the same nonzero $sigma_i$. Rank 1 ⇒ the only nonzero one is $sigma_1 = sqrt(sum a_(i j)^2)$. Symmetric $bA$: $sigma_i = |lambda_i|$. Orthogonal: all $sigma_i = 1$. Square: $|det bA| = sigma_1 dots.c sigma_n$ (zeros included).

  *From part of an SVD* $sigma_i = norm(bA bv_i)$ and $bu_i = bA bv_i \/ sigma_i$; a missing column of $bV$ (or $bU$) is a unit vector orthogonal to all the others (solve the homogeneous system; in $RR^3$ a cross product); its sign is free only if it has no $sigma_i > 0$, otherwise it must satisfy $bA bv_i = sigma_i bu_i$.

  #ex[$mat(2, 1; 1, 2; 1, -1)$: $bA^tp bA = mat(6, 3; 3, 6)$, $mu = 9, 3$; $bv = (1, plus.minus 1)\/sqrt(2)$; $bu_1 = (1, 1, 0)\/sqrt(2)$, $bu_2 = (1, -1, 2)\/sqrt(6)$, $bu_3 = (1, -1, -1)\/sqrt(3)$.]
]

#section(tag: "7", accent: hue.green)[Linear transformations][
  *Linear* ⇔ $T(a bu + b bv) = a T(bu) + b T(bv)$. *Quick fails* $T(bz) != bz$; constants added; products, powers or $|dot|$ of coordinates.

  *Standard matrix* $bA = (T(be_1) dots.c T(be_n))$, $T(bx) = bA bx$. Composition $S compose T$ ↔ $bB bA$ (right-most acts first).

  #key[*$[T]_S = (T(bu_1) dots.c T(bu_n))$* for a basis $S$; $T(bv) = [T]_S [bv]_S$; standard matrix $bA = [T]_S bP$, where $bP = (bu_1 dots.c bu_n)^(-1)$ is the transition matrix from $E$ to $S$. A linear map is determined by its values on a basis (or any spanning set).]

  *Using $[T]_S$* with $[bw]_S = (c_i)$: $T(bw) = sum c_i T(bu_i)$. By hand, with $bU = (bu_1 dots.c bu_n)$: $(bU^tp | [T]_S^tp) -> (bI | bA^tp)$. $T = T'$ on a spanning set ⇒ $T = T'$; agreeing on an independent set is #warn[not enough].

  *Range and kernel* $R(T) = Col(bA) = Col([T]_S)$, $rank(T) = rank bA$; $ker(T) = Null(bA)$ #warn[$!= Null([T]_S)$] (that holds the $S$-coordinates of the kernel), $nullity(T)$. $rank + nullity = n$.

  *Range by equations* $bb in R(T)$ ⇔ $(bA | bb)$ consistent ⇔ $bb perp Null(bA^tp)$.

  *Injective* ⇔ $ker = {bz}$ ⇔ rank $n$. *Surjective* ⇔ rank $m$. $n > m$ ⇒ not injective; $n < m$ ⇒ not surjective. $ker(T)$ nontrivial for square $bA$ ⇔ $det bA = 0$. $T(bx_1) = T(bx_2)$ ⇔ $bx_1 - bx_2 in ker T$, so it forces $bx_1 = bx_2$ only when $T$ is injective. $n = m$: injective ⇔ surjective ⇔ $bA$ invertible; then $T^(-1)$ has matrix $bA^(-1)$.

  *Rotation* by $theta$: $mat(cos theta, -sin theta; sin theta, cos theta)$. *Reflection* in the line at angle $theta\/2$: $mat(cos theta, sin theta; sin theta, -cos theta)$. Reflection about $span{bu}$: $2 (bu bu^tp)/(bu^tp bu) - bI$; in a subspace $V$: $2 bP - bI$ (symmetric, orthogonal, square $= bI$). *Projection* symmetric, $bP^2 = bP$, in general neither diagonal nor triangular.

  *Fixed vectors* $T(bu) = bu$: solve $(bA - bI) bu = bz$. $T(bu) = bb$: solve $bA bu = bb$. A basis with $T(sum c_i bu_i) = sum c_i lambda_i bu_i$ exists ⇔ $bA$ is diagonalizable with eigenpairs $(lambda_i, bu_i)$.

  *Limits* $lim T^n (bx)$: expand $bx$ in an eigenbasis; keep the $lambda = 1$ part.
]

#section(accent: hue.slate)[Proof templates][
  *Subspace* write it as a span or as $Null(bA)$. *Not a subspace* exhibit vectors breaking closure, or note $bz$ is missing.

  *Independent* suppose $sum c_i bv_i = bz$, deduce every $c_i = 0$ (apply $bA$, take dot products with each $bv_j$, or compare coordinates).

  *Basis of $V$* (1) each vector lies in $V$; (2) independent; (3) the count equals $dim V$.

  *Equal subspaces* $U subset.eq V$ and $dim U = dim V$. *Rank* count pivots, or use rank + nullity $= n$.

  *Inclusion* such as $Col(bA bB) subset.eq Col(bA)$: take a general element, $bA bB bx = bA (bB bx)$. *Uniqueness* take two, subtract, show the difference is $bz$.

  *Invertible* produce the inverse, or $det != 0$, or show $bA bx = bz$ ⇒ $bx = bz$.

  *Norm trick* $bx^tp bA^tp bA bx = norm(bA bx)^2$, so $bA^tp bA bx = bz$ ⇒ $bA bx = bz$.

  *Eigenvalue claims* start from $bA bv = lambda bv$, $bv != bz$, and apply the hypothesis to $bv$.

  *Linear map* verify $T(bu + bv) = T(bu) + T(bv)$ and $T(c bu) = c T(bu)$ for general $bu, bv, c$, or exhibit $bA$ with $T(bx) = bA bx$.
]

#section(accent: hue.blue)[Section B checklist][
  *Working* label every row operation; state the pivot / non-pivot columns you read off; define parameters $s, t in RR$.

  *Checks that cost seconds* $bA bA^(-1) = bI$; $bA bv = lambda bv$ for each eigenvector; trace $= sum lambda_i$ (with multiplicity); $bQ^tp bQ = bI$ and $bQ bR = bA$; $bA bv_i = sigma_i bu_i$; equilibrium entries sum to 1; least squares residual $bb - bA xh$ is $perp$ to every column of $bA$; projection lies in $V$.

  *Parameter questions* answer for #warn[all] values — list each special case and the generic case.

  *“Justify”* name the theorem (rank–nullity, spectral theorem, invertibility equivalences) or give a counterexample. *“Explain how you derive”* state the method and the key equation. *Answers* give exact values (fractions, surds), not decimals.
]
