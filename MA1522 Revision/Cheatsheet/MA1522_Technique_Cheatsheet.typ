#import "cheatsheet.typ": *

#show: cheatsheet.with(
  title: "MA1522 Linear Algebra for Computing: technique sheet",
  legend: [#text(weight: "bold")[Notation] #h(0.5em) $bold(A)$ is $m times n$ with columns $bold(a)_j$ #h(0.5em)·#h(0.5em) $r = "rank" bold(A)$ #h(0.5em)·#h(0.5em) $bold(R)$ is a row-echelon form of $bold(A)$ #h(0.5em)·#h(0.5em) vectors are columns #h(0.5em)·#h(0.5em) chips give the lecture chapter],
  size: 9.1pt,
)

// ───────────────────────────────────────────────────────────────── notation ──
#let tp = math.upright("T")
#let bA = $bold(A)$
#let bB = $bold(B)$
#let bC = $bold(C)$
#let bD = $bold(D)$
#let bE = $bold(E)$
#let bI = $bold(I)$
#let bL = $bold(L)$
#let bM = $bold(M)$
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
#let tr = math.op("tr")
#let diag = math.op("diag")
#let cols(v, n) = $(#v _1 dots.c #v _#n)$

// ══════════════════════════════════════════════════════════ SIDE 1: Ch 1–4 ══

#section(tag: "1", accent: hue.blue)[Linear systems][
  *REF* zero rows at the bottom; leading entries move strictly right. *RREF* also: each leading entry is 1 and alone in its column. RREF is unique, REF is not.

  *Row ops* $R_i <-> R_j$, #h(0.2em) $c R_i$ ($c != 0$), #h(0.2em) $R_i + c R_j$. #warn[$2R_2 + R_1$ is two ops], not one.

  *Solve $bA bx = bb$* #s1 $(bA | bb) ->$ REF. #s2 Pivot in the last column ⇒ #warn[inconsistent]. #s3 Otherwise every non-pivot column of $bA$ gets a parameter $s, t, ...$; back-substitute. Unique ⇔ no non-pivot column (forces $m >= n$). Number of parameters $= n - r$.

  *Solution structure* general solution $=$ one particular solution $+$ general solution of $bA bx = bz$. In $bx = bp + s bv_1 + t bv_2$: $bA bp = bb$, $bA bv_i = bz$, nullity 2. Homogeneous: always consistent; $n > m$ ⇒ nontrivial solutions.

  *Unknown constants* never divide or scale by an expression that may be 0. Reduce, then split into cases where a would-be pivot vanishes. Square $bA$: $det != 0$ ⇔ unique; then substitute each root of $det = 0$ and reduce again.

  *System from its solution set* $bp + s bv_1 + t bv_2$: coefficient rows $ba$ solve $ba dot bv_i = 0$ for all $i$; right-hand sides are $ba dot bp$.
]

#section(tag: "2", accent: hue.teal)[Matrices, inverses, LU][
  *Algebra* $(bA bB)^tp = bB^tp bA^tp$, #h(0.2em) $(bA bB)^(-1) = bB^(-1) bA^(-1)$, #h(0.2em) $(bA^tp)^(-1) = (bA^(-1))^tp$. #h(0.2em) $bA bx = sum x_j ba_j$; column $j$ of $bA bB$ is $bA bb_j$. Upper $times$ upper is upper; symmetric and triangular ⇒ diagonal.

  #warn[False in general:] $bA bB = bB bA$; #h(0.2em) $bA bB = bz => bA = bz$ or $bB = bz$; #h(0.2em) $bA bB = bA bC => bB = bC$ (needs $bA$ invertible); #h(0.2em) $(bA + bB)^2 = bA^2 + 2 bA bB + bB^2$; #h(0.2em) $bA, bB$ invertible ⇒ $bA + bB$ invertible; #h(0.2em) symmetric $times$ symmetric is symmetric; #h(0.2em) non-square $bA bB = bI => bB bA = bI$.

  *Inverse* $(bA | bI) -> (bI | bA^(-1))$; a zero row on the left ⇒ singular. Solve $bA bX = bB$ by $(bA | bB) -> (bI | bX)$. #h(0.2em) $bA^(-1) = adj(bA) \/ det bA$, where $adj(bA)_(i j) = A_(j i)$.
  $ mat(a, b; c, d)^(-1) = 1/(a d - b c) mat(d, -b; -c, a) $

  *Elementary matrix* $bE$ is $bI$ after #b[one] row op; $bE bA$ does that op to $bA$.
  #tbl(columns: (auto, auto, 1fr),
    [Row op], [Undo], [$det bE$ $=$ factor on $det bA$],
    [$R_i <-> R_j$], [$R_i <-> R_j$], [$-1$],
    [$c R_i$], [$(1\/c) R_i$], [$c$],
    [$R_i + c R_j$], [$R_i - c R_j$], [$1$],
  )
  $bE_k dots.c bE_1 bA = bI$ ⇒ $bA^(-1) = bE_k dots.c bE_1$ and $bA = bE_1^(-1) dots.c bE_k^(-1)$.

  *LU* #s1 $bA -> bU$ (REF) using only $R_i + c R_j$ with $i > j$: no swaps, no scaling. #s2 $bL$: 1s on the diagonal and #warn[$-c$] in entry $(i, j)$, so $R_3 - 2R_2$ puts $+2$ at $(3, 2)$. #s3 $bA bx = bb$: solve $bL by = bb$ downwards, then $bU bx = by$ upwards. A forced swap ⇒ no LU (but $bP bA = bL bU$ for a permutation $bP$).

  #key[*Given $bA = bL bU$* #h(0.2em) $bA$ is row equivalent to $bU$: same rank, pivot positions, $Null$, $Row$, and the same relations between columns ($bu_2 = 2 bu_1 <=> ba_2 = 2 ba_1$). Basis of $Col(bA)$: $bL times$ (pivot columns of $bU$), #warn[not] the columns of $bU$. Square: $det bA = product u_(i i)$.]
]

#section(tag: "2", accent: hue.green)[Determinants][
  *Cofactor expansion* along any row or column: $det bA = sum_j a_(i j) A_(i j)$, #h(0.2em) $A_(i j) = (-1)^(i + j) det bM_(i j)$. #h(0.2em) $2 times 2$: $a d - b c$. #h(0.2em) $3 times 3$: $a e i + b f g + c d h - c e g - a f h - b d i$. Triangular: product of the diagonal.

  *By reduction* to a triangular $bR$, using the table above: $det bA = plus.minus (product r_(i i)) \/ (product "of the scalings" c)$, with $-$ for an odd number of swaps. Column ops act the same way.

  *Properties* $det(bA bB) = det bA det bB$ #sep $det bA^tp = det bA$ #sep $det bA^(-1) = 1\/det bA$ #sep #warn[$det(c bA) = c^n det bA$] #sep $det(adj bA) = (det bA)^(n - 1)$ #sep $bA adj(bA) = (det bA) bI$ #sep proportional rows or a zero row ⇒ 0 #sep #warn[$det(bA + bB) != det bA + det bB$].

  *Cramer* $x_i = det(bA_i) \/ det bA$; $bA_i$ is $bA$ with column $i$ replaced by $bb$. #h(0.3em) *Area* of the parallelogram on $bu, bv in RR^2$: $|det(bu #h(0.25em) bv)|$; triangle: half.

  *Pattern determinants* ($n times n$) one row op to reach a triangular matrix, or expand along row 1 for a recurrence in $d_n$. #eg[$a$ on the diagonal, $b$ in the two far corners: $R_n - (b\/a) R_1$ gives $det = a^(n - 2)(a^2 - b^2)$.]
]

#section(tag: "3", accent: hue.amber)[Span, independence, basis][
  #let S = cols(bu, $k$)
  *In the span?* $bv in span{bu_1, ..., bu_k}$ ⇔ $(bu_1 dots.c bu_k | bv)$ is consistent; the solution gives the coefficients. Several vectors at once: $(bu_1 dots.c bu_k | bv_1 bv_2 dots.c)$.

  *Spans $RR^n$* ⇔ REF of #S has no zero row (rank $n$); impossible when $k < n$. #h(0.3em) *Span inclusion* $span T subset.eq span S$ ⇔ $(S | T)$ is consistent in every column; equal ⇔ $subset.eq$ and same dimension.

  *Subspace?* #b[Yes:] write it as a span, or as $Null(bA)$ (homogeneous linear equations). #b[No:] $bz in.not V$, or show $bu, bv in V$ with $bu + bv in.not V$ (or $c bu in.not V$). Red flags: a nonzero constant, products or squares ($x y = 0$, $x^2 = y^2$), "or", inequalities. #h(0.2em) $U inter V$ and $U + V$ are subspaces, #warn[$U union V$ usually is not]. #h(0.2em) $dim(U + V) = dim U + dim V - dim(U inter V)$.

  *Independent?* ⇔ $#S bx = bz$ only trivially ⇔ every column is a pivot column (rank $k$). Dependent at sight: $k > n$; contains $bz$; two parallel vectors. Independence survives: taking subsets; adding a vector outside the span; passing to coordinates $[bu_i]_S$ or to $bP bu_i$ with $bP$ invertible.

  *Basis of $V$* $=$ independent and spans $V$. If $dim V = k$: any $k$ vectors of $V$ that are independent (or span $V$) are a basis. #h(0.2em) $dim$: $RR^n$ is $n$; ${ba dot bx = 0}$ is $n - 1$; $Null(bA)$ is $n - r$; $span S$ is the rank of #S. #h(0.2em) $U subset.eq V$ ⇒ $dim U <= dim V$, equal ⇔ $U = V$. #h(0.2em) ${bz}$ has basis $nothing$, dim 0; #h(0.2em) $nothing$ is independent, ${bz}$ is dependent.

  *New basis from old* ${bu_i}$ a basis, $bv_j = sum_i c_(i j) bu_i$: ${bv_j}$ is a basis ⇔ $bC = (c_(i j))$ is invertible.

  *Coordinates* $[bv]_S$: solve $(bu_1 dots.c bu_k | bv)$. Linear: $[a bu + b bv]_S = a [bu]_S + b [bv]_S$.

  #key[*Transition matrix from $T = {bv_j}$ to $S$* #h(0.2em) $(S | T) -> (bI | bP)$, so $bP = ([bv_1]_S dots.c [bv_k]_S)$. Then $[bw]_S = bP [bw]_T$, and from $S$ to $T$ it is $bP^(-1)$.]
]

#section(tag: "4", accent: hue.plum)[Row, column, null space · rank][
  #tbl(columns: (auto, auto, 1fr, auto),
    [Space], [in], [Basis, after $bA -> bR$], [dim],
    [$Row(bA)$], [$RR^n$], [nonzero rows of $bR$], [$r$],
    [$Col(bA)$], [$RR^m$], [columns of #warn[$bA$] at the pivots], [$r$],
    [$Null(bA)$], [$RR^n$], [$bA bx = bz$: a vector per parameter], [$n - r$],
    [$Null(bA^tp)$], [$RR^m$], [solve $bA^tp by = bz$; it is $Col(bA)^perp$], [$m - r$],
  )
  *Row ops keep* $Row$, $Null$, rank and the relations between columns, #warn[not $Col$]. In the RREF a non-pivot column lists its coefficients on the pivot columns.

  *Basis chosen from a set* vectors as columns, keep those in pivot positions. Rows of $bA$ forming a basis of $Row(bA)$: do it to $bA^tp$. #h(0.2em) *Extend to a basis of $RR^n$* vectors as rows → REF → add $be_j$ for each non-pivot column $j$.

  *Same row space* (equal sizes) ⇔ same RREF. #h(0.2em) *Consistent* $bA bx = bb$ ⇔ $bb in Col(bA)$ ⇔ $rank bA = rank(bA | bb)$.

  *Rank facts* $rank bA = rank bA^tp <= min(m, n)$ #sep #b[rank $+$ nullity $= n$] #sep $rank(bA bB) <= min(rank bA, rank bB)$ #sep $rank(bA + bB) <= rank bA + rank bB$ #sep $rank(bA^tp bA) = rank bA$ and $Null(bA^tp bA) = Null(bA)$ #sep $Col(bA bB) subset.eq Col(bA)$, $Null(bB) subset.eq Null(bA bB)$ #sep $bA bB = bz <=> Col(bB) subset.eq Null(bA)$ #sep $bP$ invertible: $rank(bP bA) = rank(bA bP) = rank bA$.

  *Rank with parameters* reduce without dividing by parameter expressions; rank $=$ number of nonzero rows, so split into cases where a would-be pivot is 0. Nullity $= n -$ rank.

  #tbl(columns: (1fr, 1fr),
    [*Full rank $r = n$* (columns indep.)], [*Full rank $r = m$* (rows indep.)],
    [$bA bx = bb$: at most one solution], [$bA bx = bb$: consistent for every $bb$],
    [$Null(bA) = {bz}$; needs $n <= m$], [$Col(bA) = RR^m$; needs $m <= n$],
    [$bA^tp bA$ invertible], [$bA bA^tp$ invertible],
    [left inv. $(bA^tp bA)^(-1) bA^tp$], [right inv. $bA^tp (bA bA^tp)^(-1)$],
    [$bx |-> bA bx$ injective], [$bx |-> bA bx$ surjective],
  )
  *All right inverses* solve $bA bX = bI$: reduce $(bA | bI)$ and give the general solution column by column. *All left inverses* are the right inverses of $bA^tp$, transposed. Square: both are $bA^(-1)$.

  #key[*Square $bA$ of order $n$ is invertible ⇔* RREF is $bI$ ⇔ product of elementary matrices ⇔ $det bA != 0$ ⇔ $bA bx = bz$ only trivially ⇔ $bA bx = bb$ has a unique solution for every $bb$ ⇔ a left or a right inverse exists ⇔ $bA^tp$ invertible ⇔ columns (rows) independent ⇔ they span $RR^n$ ⇔ rank $n$ ⇔ nullity 0 ⇔ 0 is not an eigenvalue ⇔ $bx |-> bA bx$ injective ⇔ surjective.]
]

// ══════════════════════════════════════════════════════════ SIDE 2: Ch 5–7 ══
#pagebreak()

#section(tag: "5", accent: hue.violet)[Orthogonality and projection][
  *Basics* $bu dot bv = bu^tp bv$, #h(0.2em) $norm(bu) = sqrt(bu dot bu)$, #h(0.2em) $d(bu, bv) = norm(bu - bv)$, #h(0.2em) $cos theta = bu dot bv \/ (norm(bu) norm(bv))$. #h(0.2em) $norm(bu + bv)^2 = norm(bu)^2 + 2 bu dot bv + norm(bv)^2$, so Pythagoras ⇔ $bu dot bv = 0$; #h(0.2em) $norm(bu + bv) <= norm(bu) + norm(bv)$. Orthogonal #b[nonzero] vectors are independent.

  *Orthogonal complement* put vectors spanning $V$ as the columns of $bA$: $V^perp = Null(bA^tp)$. #h(0.2em) $dim V + dim V^perp = n$, #h(0.2em) $(V^perp)^perp = V$, #h(0.2em) $V inter V^perp = {bz}$. #h(0.2em) $Row(bA)^perp = Null(bA)$, #h(0.2em) $Col(bA)^perp = Null(bA^tp)$.

  *Orthogonal basis ${bu_i}$* coordinates with no row reduction: $c_i = (bv dot bu_i) \/ (bu_i dot bu_i)$. Orthonormal $S$: $[bx]_S dot [by]_S = bx dot by$ and $norm([bx]_S) = norm(bx)$ #warn[(false if merely orthogonal)].

  #key[*Projection $bw_p$ of $bw$ onto $V$*
    - #b[orthogonal] basis ${bu_1, ..., bu_k}$:
      $ bw_p = (bw dot bu_1)/(bu_1 dot bu_1) bu_1 + dots.c + (bw dot bu_k)/(bu_k dot bu_k) bu_k $
    - any basis as columns of $bA$: solve $bA^tp bA bx = bA^tp bw$, then $bw_p = bA bx$
    - orthonormal columns $bQ$: #h(0.2em) $bw_p = bQ bQ^tp bw$
    - hyperplane $bn dot bx = 0$: #h(0.2em) $bw_p = bw - dfrac(bw dot bn, bn dot bn) bn$

    $bw - bw_p$ is orthogonal to $V$ (it is the projection onto $V^perp$); #h(0.2em) $norm(bw - bw_p)$ is the distance from $bw$ to $V$; #h(0.2em) $bw in V <=> bw_p = bw$.]

  *Projection matrix* $bP = bA (bA^tp bA)^(-1) bA^tp$: symmetric, $bP^2 = bP$, eigenvalues 1 (on $V$) and 0 (on $V^perp$). Line $span{bu}$: $bP = bu bu^tp \/ bu^tp bu$.

  #key[*Gram–Schmidt* #h(0.2em) $bv_1 = bu_1$, then
    $ bv_j = bu_j - sum_(i < j) (bu_j dot bv_i)/(bv_i dot bv_i) bv_i, quad bq_j = bv_j / norm(bv_j). $
    Subtract along the new $bv_i$, never the old $bu_i$. Rescale any $bv_j$ freely to clear fractions. $bv_j = bz$ ⇔ $bu_j$ depends on the earlier vectors: drop it.]

  *QR* (independent columns) #s1 Gram–Schmidt on the columns of $bA$ gives $bQ = cols(bq, n)$. #s2 $bR = bQ^tp bA$: upper triangular, $r_(i j) = bq_i dot ba_j$, $r_(i i) > 0$. Check $bQ bR = bA$.

  *Orthogonal matrix* (square) $bQ^tp bQ = bI$ ⇔ $bQ^(-1) = bQ^tp$ ⇔ columns orthonormal ⇔ rows orthonormal. $det = plus.minus 1$; $norm(bQ bx) = norm(bx)$; $bQ bx dot bQ by = bx dot by$; products and inverses stay orthogonal. Non-square with $bQ^tp bQ = bI$: #warn[$bQ bQ^tp != bI$].
]

#section(tag: "5", accent: hue.blue)[Least squares][
  #key[$xh$ is a least squares solution of $bA bx = bb$ ⇔ $bA^tp bA xh = bA^tp bb$ ⇔ $bA xh$ is the projection of $bb$ onto $Col(bA)$.]

  *Solving* the normal equations are always consistent. #b[Unique] ⇔ columns independent: $xh = (bA^tp bA)^(-1) bA^tp bb$, or with QR back-substitute $bR xh = bQ^tp bb$. #b[Not unique:] every solution is $xh_0 + Null(bA)$, and $bA xh$ is the same for all. Error $norm(bb - bA xh)$. If $bA bx = bb$ is consistent, least squares solutions $=$ solutions.

  *Curve fitting* $y = c_0 + c_1 x + dots.c + c_d x^d$ through $N$ points: row $i$ of $bA$ is $(1, x_i, ..., x_i^d)$, $bb = (y_i)$. For a line the normal equations are
  $ mat(N, sum x_i; sum x_i, sum x_i^2) vec(c_0, c_1) = vec(sum y_i, sum x_i y_i). $
  Distinct $x_i$: an exact fit is guaranteed once $d >= N - 1$; for $d < N - 1$ the least squares fit is unique.
]

#section(tag: "6", accent: hue.teal)[Eigenvalues and diagonalization][
  *Eigenvalues* roots of $det(x bI - bA)$. Triangular: the diagonal. #h(0.2em) $2 times 2$: $x^2 - tr(bA) x + det bA$. #h(0.2em) $3 times 3$: $x^3 - tr(bA) x^2 + (M_(11) + M_(22) + M_(33)) x - det bA$, where $M_(i i)$ is the $2 times 2$ minor without row and column $i$. Check: $sum lambda_i = tr bA$, $product lambda_i = det bA$.

  *Shortcuts* every row (or every column) sums to $s$ ⇒ $lambda = s$. #h(0.2em) Block triangular ⇒ eigenvalues of the diagonal blocks. #h(0.2em) Rank 1, $bA = bu bv^tp$: $lambda = bv dot bu$ and $0$ ($n - 1$ times). #h(0.2em) Before expanding $det(x bI - bA)$, add rows or columns to pull out a common factor; integer roots divide $det bA$.

  *Eigenspace* $E_lambda = Null(lambda bI - bA)$: reduce and read off a basis. Geometric mult. $= dim E_lambda = n - rank(lambda bI - bA)$; #h(0.2em) $1 <=$ geometric $<=$ algebraic.

  *Eigen-data for free* $bA^k$: $lambda^k$ #sep $bA^(-1)$: $1\/lambda$ #sep $bA + c bI$: $lambda + c$ #sep $p(bA)$: $p(lambda)$, all with the same eigenvectors. $bA^tp$: same eigenvalues. $bA^k = bz$ ⇒ only $lambda = 0$. $bA^2 = bA$ ⇒ $lambda in {0, 1}$. #h(0.2em) $bB = bP^(-1) bA bP$: same characteristic polynomial, and $bB bw = lambda bw$ ⇒ $bA (bP bw) = lambda (bP bw)$. #h(0.2em) Nonzero combinations inside one $E_lambda$ are eigenvectors; #warn[across different $lambda$ they are not].

  #key[*Diagonalize* #s1 Eigenvalues. #s2 A basis of every $E_lambda$. #s3 Diagonalizable ⇔ $sum dim E_lambda = n$ ⇔ the characteristic polynomial splits and geometric $=$ algebraic for every $lambda$. Only repeated $lambda$ need checking; $n$ distinct eigenvalues ⇒ yes. #s4 $bP = cols(bv, n)$, $bD = diag(lambda_1, ..., lambda_n)$ #warn[in the same order]: $bA = bP bD bP^(-1)$.]

  *With parameters* for each repeated $lambda$ demand $rank(lambda bI - bA) = n -$ (algebraic mult.); treat separately the parameter values that make two eigenvalues coincide. Never diagonalizable: $mat(1, 1; 0, 1)$, $mat(0, 1; 0, 0)$. Only one eigenvalue $lambda$: diagonalizable ⇔ $bA = lambda bI$.

  *Powers* $bA^m = bP bD^m bP^(-1)$; a square root is $bP bD^(1\/2) bP^(-1)$. For $bA^m bx_0$ write $bx_0 = sum c_i bv_i$ (solve $bP bc = bx_0$): $bA^m bx_0 = sum c_i lambda_i^m bv_i$. As $m -> oo$ the $|lambda| < 1$ terms vanish and $lambda = 1$ stays. #h(0.2em) Cayley–Hamilton: $p(bA) = bz$ for $p(x) = det(x bI - bA)$.

  *Orthogonal diagonalization* exists ⇔ $bA$ symmetric. #s1 Eigenspaces. #s2 Gram–Schmidt #warn[inside] each $E_lambda$ of dimension $>= 2$ (different eigenspaces are already orthogonal). #s3 Normalize: $bP$ orthogonal, $bA = bP bD bP^tp = sum lambda_i bq_i bq_i^tp$. Symmetric ⇒ diagonalizable; #warn[diagonalizable ⇏ symmetric].
]

#section(tag: "6", accent: hue.amber)[Markov chains][
  *Stochastic $bP$* entries $>= 0$, #warn[columns sum to 1]\; $p_(i j)$ is the probability of moving #b[from $j$ to $i$]. $bx_k = bP^k bx_0$; $k$-step probabilities are the entries of $bP^k$. Eigenvalues: 1 always, all $|lambda| <= 1$. Web surfer: column $j$ has $1\/$(number of links out of page $j$) in the rows of the pages it links to.

  *Equilibrium* solve $(bP - bI) bx = bz$ and scale so the entries sum to 1. Regular (some $bP^k$ has all entries $> 0$) ⇒ the equilibrium is unique and every chain converges to it. #eg[$mat(1 - a, b; a, 1 - b)$: equilibrium $1/(a + b) vec(b, a)$, other eigenvalue $1 - a - b$.]
]

#section(tag: "6", accent: hue.plum)[Singular value decomposition][
  #key[*SVD* #h(0.2em) $bA = bU bS bV^tp$ with $bU$ ($m times m$) and $bV$ ($n times n$) orthogonal, $bS$ $m times n$.

    #s1 $bA^tp bA$ (entries $ba_i dot ba_j$): eigenvalues $mu_1 >= dots.c >= mu_n >= 0$; $sigma_i = sqrt(mu_i)$; $r$ of them are nonzero.

    #s2 $bV = cols(bv, n)$: orthonormal eigenvectors of $bA^tp bA$ #warn[in that order] (Gram–Schmidt inside repeated eigenspaces).

    #s3 $bu_i = bA bv_i \/ sigma_i$ for $i <= r$.

    #s4 If $r < m$: complete $bU$ with an orthonormal basis of $Null(bA^tp)$.

    #s5 $bS$ has $sigma_1, ..., sigma_r$ down the diagonal, zeros elsewhere.]

  *Wide matrix* ($m < n$) factor $bA^tp = bU' bS' bV'^tp$, then $bA = bV' bS'^tp bU'^tp$. Check any SVD with $bA bv_i = sigma_i bu_i$.

  *Reading an SVD* rank $= r$; #h(0.2em) $bA = sum_(i <= r) sigma_i bu_i bv_i^tp$. Orthonormal bases: $bu_1, ..., bu_r$ of $Col(bA)$; #h(0.2em) $bu_(r + 1), ..., bu_m$ of $Null(bA^tp)$; #h(0.2em) $bv_1, ..., bv_r$ of $Row(bA)$; #h(0.2em) $bv_(r + 1), ..., bv_n$ of $Null(bA)$. Projection onto $Col(bA)$: $sum_(i <= r) (bw dot bu_i) bu_i$. Eigenvalues of $bA^tp bA$: the $sigma_i^2$ and $n - r$ zeros; of $bA bA^tp$: the $sigma_i^2$ and $m - r$ zeros.
]

#section(tag: "7", accent: hue.green)[Linear transformations $T: RR^n -> RR^m$][
  *Linear?* show $T(bx) = bA bx$ by writing $bA$, or check $T(a bu + b bv) = a T(bu) + b T(bv)$. #b[Not linear:] $T(bz) != bz$, added constants, products, powers or $|dot|$ of coordinates.

  *Standard matrix* $bA = (T(be_1) dots.c T(be_n))$. $S compose T$ has matrix $bB bA$ ($bB$ that of $S$).

  #key[*From the images of a basis $S = {bu_i}$* #h(0.2em) $[T]_S = (T(bu_1) dots.c T(bu_n))$, #h(0.2em) $T(bw) = [T]_S [bw]_S$, #h(0.2em) $bA = [T]_S bU^(-1)$ with $bU = cols(bu, n)$. By hand: $(bU^tp | [T]_S^tp) -> (bI | bA^tp)$.]

  Images on a spanning set determine $T$; on a merely independent set #warn[they do not].

  *Range and kernel* $R(T) = Col(bA) = Col([T]_S)$; #h(0.2em) $ker T = Null(bA)$ #warn[$!= Null([T]_S)$]. #h(0.2em) $rank T + nullity T = n$.

  *Injective* ⇔ $ker T = {bz}$ ⇔ rank $n$. *Surjective* ⇔ $R(T) = RR^m$ ⇔ rank $m$. #h(0.2em) $n = m$: injective ⇔ surjective ⇔ $det bA != 0$.

  *Geometry* rotation by $theta$: $mat(cos theta, -sin theta; sin theta, cos theta)$; with the reflections $mat(cos theta, sin theta; sin theta, -cos theta)$ these are all $2 times 2$ orthogonal matrices. Projection onto $V$: $bP$ (symmetric, $bP^2 = bP$); reflection in $V$: $2 bP - bI$.

  *Fixed vectors and limits* $T(bu) = bu$: solve $(bA - bI) bu = bz$. #h(0.2em) $T(bu) = bb$: solve $bA bu = bb$. #h(0.2em) A basis with $T(sum c_i bu_i) = sum c_i lambda_i bu_i$ exists ⇔ $bA$ is diagonalizable with eigenpairs $(lambda_i, bu_i)$. #h(0.2em) $lim T^k (bx)$: expand $bx$ in eigenvectors, keep the $lambda = 1$ part.
]
