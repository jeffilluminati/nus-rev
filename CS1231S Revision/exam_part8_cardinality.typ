#import "exam_style.typ": *

// ============================================================================
= Part VIII · Cardinality
// ============================================================================

== 35 · Pigeonhole principle and finite sets

#thm[Pigeonhole Principle · Dual Pigeonhole Principle (L9 s6)][
Let $A$ and $B$ be *finite* sets.
- *PHP.* If there is an injection $f: A -> B$, then $|A| <= |B|$. Contrapositive: if $m > n$ pigeons are put into $n$ pigeonholes, some pigeonhole holds at least two pigeons.
- *Dual PHP.* If there is a surjection $f: A -> B$, then $|A| >= |B|$. Contrapositive: if $m < n$ pigeons are put into $n$ pigeonholes, some pigeonhole is empty.]

#proofb[PHP and Dual PHP (L9 s7–8)][
*PHP.*
+ Let $A = {a_1, a_2, dots, a_m}$ with $m = |A|$.
+ If $a_i != a_j$ then $f(a_i) != f(a_j)$ #j[$f$ is injective], so $f(a_1), dots, f(a_m)$ are $m$ different elements of $B$.
+ Hence $|B| >= m = |A|$. #qed
*Dual PHP.*
+ Let $B = {b_1, b_2, dots, b_n}$ with $n = |B|$. For each $b_i$ pick $a_i in A$ with $f(a_i) = b_i$ #j[$f$ is surjective].
+ If $b_i != b_j$ then $f(a_i) != f(a_j)$, so $a_i != a_j$ #j[$f$ is a function].
+ So $a_1, dots, a_n$ are $n$ different elements of $A$, and $|A| >= n = |B|$. #qed]

#defn[Finite, infinite (L9 s9) · Cardinality of a finite set (L9 s10)][
Let $ZZ_n = {1, 2, dots, n}$ (in this lecture only). A set $S$ is *finite* iff $S = nothing$ or there is a bijection from $S$ to $ZZ_n$ for some $n in ZZ^+$; otherwise $S$ is *infinite*. \
The *cardinality* of a finite set $S$ is $|S| = 0$ if $S = nothing$, and $|S| = n$ if there is a bijection $f: S -> ZZ_n$.]

#thm[Finite sets (L9 s10–11)][
- *Equality of cardinality.* For finite $A$, $B$: $|A| = |B|$ iff there is a bijection $f: A -> B$. ($arrow.l.double$: PHP and Dual PHP. $=>$: map $a_i |-> b_i$.)
- *Theorem Cardinality.1.* Any subset of a finite set is finite. Contrapositive: if $A subset.eq B$ and $A$ is infinite, then $B$ is infinite.]

#exam[T8 Q8 (AY22/23 S1 exam) · $|A| <= |R|$ for a relation $R$ on a finite set $A$?][
*(i) Reflexive: true.* Define $f: A -> R$ by $f(x) = (x, x)$; this is a function into $R$ because $R$ is reflexive. If $f(x_1) = f(x_2)$ then $(x_1, x_1) = (x_2, x_2)$, so $x_1 = x_2$ #j[equality of ordered pairs]. $f$ is an injection, so $|A| <= |R|$ #j[PHP]. \
*(ii) Symmetric, (iii) transitive: false.* The empty relation on a non-empty $A$ is symmetric and transitive, with $|A| > 0 = |nothing|$.]

== 36 · Same cardinality

#defn[Same cardinality (Cantor, L9 s12)][
For *any* sets $A$ and $B$: $A$ has the *same cardinality* as $B$, written $|A| = |B|$, iff there is a bijection $f: A -> B$. \
This defines "$|A| = |B|$" without defining $|A|$ for infinite sets.]

#proofb[Theorem 7.4.1 · Same-cardinality is an equivalence relation (L9 s14–16)][
+ (Reflexive) $idf_A: A -> A$ is injective ($idf_A (x_1) = idf_A (x_2)$ gives $x_1 = x_2$) and surjective ($idf_A (x) = x$). So $|A| = |A|$.
+ (Symmetric) Let $|A| = |B|$, with a bijection $f: A -> B$ #j[Cantor's definition]. Then $f^(-1): B -> A$ is a bijection #j[Theorem 7.2.3]. So $|B| = |A|$.
+ (Transitive) Let $|A| = |B|$ and $|B| = |C|$, with bijections $f: A -> B$ and $g: B -> C$. Then $g compose f$ has the inverse $f^(-1) compose g^(-1)$ #j[T6 Q3, §29], so $g compose f: A -> C$ is a bijection #j[Theorem 7.2.3]. So $|A| = |C|$. #qed]

#proofb[$|2 ZZ| = |ZZ|$ (L9 s17–18) · L9 Ex. 1, 2][
Define $H: ZZ -> 2 ZZ$ by $H(n) = 2n$.
+ (Injective) If $H(n_1) = H(n_2)$ then $2 n_1 = 2 n_2$, so $n_1 = n_2$.
+ (Surjective) Let $m in 2 ZZ$. Then $m = 2k$ for some $k in ZZ$ #j[definition of even], and $H(k) = 2k = m$.
+ So $H$ is a bijection and $|ZZ| = |2 ZZ|$ #j[Cantor's definition]. #qed
Likewise $|NN| = |NN without {0}|$ via $x |-> x + 1$, and $|NN| = |NN without {1, 3, 5, dots}|$ via $x |-> 2x$. \
*An infinite set can have the same cardinality as a proper subset of itself.* For a finite $A$ and a proper subset $B$, always $|B| < |A|$. \
*Alternative definition of infinite (Week 8 deck).* Some mathematicians use this as the definition: $A$ is infinite iff there is a set $B$ with $B subset.eq A and B != A and |B| = |A|$. \
Week 8 deck checks: $|ZZ^-| = |ZZ^+|$, $|ZZ union {a, b, c}| = |ZZ|$, $|ZZ| = |ZZ^+|$, $|ZZ| = |2 ZZ|$, $|QQ| = |ZZ|$ are all true; $|{a, b, c}| = |{a, b}|$ is false.]

== 37 · Countable sets

#defn[$aleph_0$ · Countably infinite · Countable, uncountable (L9 s23)][
$aleph_0 = |ZZ^+|$ (some authors use $NN$; either may be used). A set $S$ is *countably infinite* iff $|S| = aleph_0$, i.e. there is a bijection between $ZZ^+$ (or $NN$) and $S$. \
A set is *countable* iff it is finite or countably infinite; otherwise it is *uncountable*.]

#thm[Proposition 9.1 · Lemma 9.2 · Countability via sequences (L9 s33–34)][
For an *infinite* set $B$:
- *Proposition 9.1.* $B$ is countable iff there is a sequence $b_0, b_1, b_2, dots in B$ in which every element of $B$ appears *exactly once*.
- *Lemma 9.2.* $B$ is countable iff there is a sequence $b_0, b_1, b_2, dots$ in which every element of $B$ *appears*.
A bijection $f: ZZ_(>= 0) -> B$ is the sequence $f(0), f(1), dots$: surjective = every element appears at least once; injective = at most once. For Lemma 9.2 ("if"): delete the terms not in $B$ and all but the first appearance of each element; what remains lists $B$ exactly once.]

#example[Standard countable sets (L9 s24–30, s35) · T8 Q1, D1][
- *$ZZ$:* list $0, 1, -1, 2, -2, dots$ Formula on $ZZ^+$: $f(n) = n slash 2$ if $n$ is even, $-(n - 1) slash 2$ if $n$ is odd. On $NN$ (T8 Q1): $g(n) = (-1)^n floor((n + 1) / 2)$, giving $0, -1, 1, -2, 2, dots$
- *$ZZ^+ times ZZ^+$:* count along the diagonals $(1,1), (1,2), (2,1), (1,3), (2,2), (3,1), dots$ The bijection is $f(x, y) = ((x + y - 2)(x + y - 1))/2 + x$.
- *$QQ^+$:* put $p slash q$ in a grid, walk the diagonals, and skip values already counted: $1/1, 1/2, 2/1, 3/1, 1/3, dots$ Skipping gives injectivity; every grid point is reached, giving surjectivity.
- *$QQ$:* $x |-> -x$ is a bijection $QQ^+ -> QQ^-$, so $QQ^-$ is countably infinite. List $QQ^+$ as $q_1, q_2, q_3, dots$; then $0, q_1, -q_1, q_2, -q_2, dots$ contains every element of $QQ = QQ^- union {0} union QQ^+$ exactly once, so $QQ$ is countable (Proposition 9.1) and $|QQ| = |ZZ|$. Equivalently: Lemma 9.4 for $QQ^- union QQ^+$, then T8 Q2 for ${0}$.
- *Perfect squares* ${0, 1, 4, 9, dots}$ (T8 D1): $n |-> n^2$ is a bijection from $NN$; also a subset of $NN$ (Theorem 7.4.3).]

#proofb[T8 Q1 · $g: NN -> ZZ$, $g(n) = (-1)^n floor((n + 1) / 2)$ is a bijection (so $ZZ$ is countable with $aleph_0 = |NN|$)][
For even $n$: $g(n) = floor((n + 1) slash 2) = n slash 2 >= 0$. For odd $n$: $g(n) = -(n + 1) slash 2 < 0$.
+ (Injective) Let $a, b in NN$ with $g(a) = g(b)$. Then $g(a), g(b)$ are both non-negative or both negative.
  + Case 1 (both non-negative): $a$ and $b$ are even, so $a slash 2 = b slash 2$ and $a = b$.
  + Case 2 (both negative): $a$ and $b$ are odd, so $-(a + 1) slash 2 = -(b + 1) slash 2$ and $a = b$.
+ (Surjective) Let $m in ZZ$.
  + Case 1 ($m >= 0$): let $n = 2m$. Then $n in NN$ and $g(n) = (-1)^(2m) floor((2m + 1) slash 2) = m$.
  + Case 2 ($m < 0$): let $n = -2m - 1$. Then $n in NN$ is odd and $g(n) = (-1)^(-2m-1) floor((-2m) slash 2) = -(-m) = m$.
+ Therefore $g$ is a bijection from $NN$ to $ZZ$. #qed]

#thm[Closure theorems (L9 s31, s41–45)][
- *Cartesian product.* If $A$ and $B$ are countably infinite, so is $A times B$; likewise $A_1 times dots.c times A_n$ for $n >= 2$.
- *Unions.* The union of countably many countable sets is countable: if $A_1, A_2, dots$ are countable, so is $union.big_(i=1)^oo A_i$.
- *Theorem 7.4.3.* Any subset of a countable set is countable. $quad$ *Corollary 7.4.4.* Any set with an uncountable subset is uncountable.
- *Proposition 9.3.* Every infinite set has a countably infinite subset.
- *Lemma 9.4.* If $A$ and $B$ are countably infinite, then $A union B$ is countable.]

#proofb[Lemma 9.4 (L9 s45) · Proposition 9.3 (L9 s44) · Theorem 7.4.3 (L9 s41–42)][
*Lemma 9.4.* Take sequences $a_0, a_1, dots$ and $b_0, b_1, dots$ in which every element of $A$, respectively $B$, appears #j[Lemma 9.2]. Then $a_0, b_0, a_1, b_1, dots$ is a sequence in which every element of $A union B$ appears, so $A union B$ is countable #j[Lemma 9.2]. \
*Proposition 9.3.* Let $B$ be infinite. Choose $b_0, b_1, b_2, dots$ from $B$ one at a time, each different from all earlier choices; this is always possible, since otherwise $B = {b_0, dots, b_(n-1)}$ would be finite. Then ${b_0, b_1, dots} subset.eq B$ is countably infinite. \
*Theorem 7.4.3.* Let $A$ be countable and $B subset.eq A$. If $B$ is finite it is countable. Otherwise $A$ is countably infinite; take a bijection $f: ZZ^+ -> A$ and let $M = f^(-1)(B)$. Define $g(1) = f(i_1)$ with $i_1 = min M$ and $g(k) = f(i_k)$ with $i_k = min{m in M : m > i_(k-1)}$. Then $g: ZZ^+ -> B$ lists the elements of $B$ in order of their indices, each exactly once, so it is a bijection. #qed]

#proofb[T8 Q2 · $B$ countably infinite, $C$ finite $=>$ $B union C$ countable $quad$ T8 Q5 · A countable union of countably infinite sets is countable][
*Q2.* Take a sequence $b_0, b_1, dots$ in which every element of $B$ appears #j[Lemma 9.2] and write $C = {c_0, dots, c_(n-1)}$. Then $c_0, dots, c_(n-1), b_0, b_1, dots$ contains every element of $B union C$, so $B union C$ is countable #j[Lemma 9.2]. (As a bijection: with $C without B = {c_0, dots, c_(k-1)}$ and a bijection $f: NN -> B$, set $g(x) = c_x$ if $x < k$ and $f(x - k)$ otherwise.) \
*Q5.*
+ $ZZ^+ times ZZ^+$ is countable, so there is a bijection $f: ZZ^+ -> ZZ^+ times ZZ^+$.
+ For each $i in ZZ^+$ take a sequence $b_(i,1), b_(i,2), dots$ in which every element of $S_i$ appears #j[Lemma 9.2].
+ Define $c_k = b_(i,j)$ where $(i, j) = f(k)$.
+ Let $x in union.big_(i in ZZ^+) S_i$. Then $x in S_i$ for some $i$, so $x = b_(i,j)$ for some $j$; and $f(k) = (i, j)$ for some $k$ #j[$f$ is surjective]. So $x = c_k$.
+ Every element of the union appears in $c_1, c_2, dots$, so the union is countable #j[Lemma 9.2]. #qed]

#proofb[T8 Q4(a) · If $A_1, A_2, A_3, dots$ are countable, then $union.big_(i=1)^n A_i$ is countable for every $n in ZZ^+$][
+ Let $P(n) equiv (union.big_(i=1)^n A_i "is countable")$ for $n in ZZ^+$.
+ Basis step: $union.big_(i=1)^1 A_i = A_1$ is countable, so $P(1)$ is true.
+ Inductive step: suppose $P(k)$ is true for an arbitrary $k >= 1$. Write $union.big_(i=1)^(k+1) A_i = (union.big_(i=1)^k A_i) union A_(k+1) = U union A_(k+1)$.
  + Case 1 ($U$ and $A_(k+1)$ both finite): $U union A_(k+1)$ is finite, hence countable.
  + Case 2 (exactly one is finite): the other is countably infinite, so $U union A_(k+1)$ is countable #j[T8 Q2].
  + Case 3 (neither is finite): both are countably infinite, so $U union A_(k+1)$ is countable #j[Lemma 9.4].
+ Therefore $union.big_(i=1)^n A_i$ is countable for every $n in ZZ^+$ by MI. #qed
(b) This does not prove that $union.big_(i=1)^oo A_i$ is countable; see the trap below and T8 Q5.]

#trap[T8 Q3, Q4 · Induction reaches every finite $n$, never infinity][
- "$union.big_(i=1)^n A_i$ is finite (or countable) for every $n$" is proved by induction on $n$. It does *not* follow that $union.big_(i=1)^oo A_i$ is finite: $A_i = {i}$ gives $ZZ^+$. The infinite union of countable sets *is* countable, but that needs the argument of T8 Q5.
- In an inductive step the new set $A_(k+1)$ must be *arbitrary*; choosing $A_(k+1) = nothing$ proves nothing.
- T8 D2: "uncountable and infinite" is redundant, since every uncountable set is infinite.]

== 38 · Uncountable sets

#proofb[Theorem 7.4.2 (Cantor) · The interval $(0, 1) = {x in RR : 0 < x < 1}$ is uncountable (L9 s38–40)][
+ Suppose $(0, 1)$ is countable. It is not finite, so it is countably infinite.
+ List its elements as a sequence $x_1, x_2, x_3, dots$ with decimal expansions $x_n = 0.a_(n 1) a_(n 2) a_(n 3) dots$, each $a_(i j) in {0, 1, dots, 9}$ (use $0.5000 dots$ and not $0.4999 dots$).
+ Construct $d = 0.d_1 d_2 d_3 dots$ with $d_n = 1$ if $a_(n n) != 1$, and $d_n = 2$ if $a_(n n) = 1$.
+ For every $n in ZZ^+$, $d_n != a_(n n)$, so $d != x_n$.
+ But $d in (0, 1)$, so $d$ should be in the list: contradiction. Therefore $(0, 1)$ is uncountable. #qed
This is *Cantor's diagonalization argument*: build an object that differs from the $n$-th listed object at position $n$.]

#trap[Week 8 deck FAQ · Why diagonalization does not make $ZZ^+$ uncountable][
List the positive integers in decimal, padded with leading zeros ($dots 000001$, $dots 000002$, $dots$), and change one digit of each along a diagonal. The resulting object typically has *infinitely many non-zero digits* extending to the left, like $dots 3141592653$. An integer has a finite decimal representation $d_n d_(n-1) dots.c d_2 d_1$, so this object is *not a positive integer*: it is missing from the list, but it was never required to be on it. A real in $(0, 1)$ may have infinitely many digits $0.d_1 d_2 d_3 dots$, so there the diagonal object *is* in the set. \
Same contrast: the set of all *finite* binary strings ${epsilon, 0, 1, 00, 01, dots}$ is countable; the set of all *infinite* binary strings $b_1 b_2 b_3 dots$ is uncountable.]

#thm[Consequences (L9 s43, s46–47)][
- $RR$ is uncountable, since $(0, 1) subset.eq RR$ #j[Corollary 7.4.4].
- $|RR| = |(0, 1)|$: bend $(0, 1)$ into a circle resting on the number line at 0 and project each point from the top of the circle onto the line; this projection is a bijection. (One formula: $x |-> tan(pi(x - 1 slash 2))$.)
- The irrationals $RR without QQ$ are uncountable: otherwise $RR = QQ union (RR without QQ)$ would be countable.]

#proofb[T8 Q7 · If $A$ is countably infinite, then $PP(A)$ is uncountable][
+ Suppose $PP(A)$ is countable. It is infinite, since ${a} in PP(A)$ for every $a in A$.
+ There is a sequence $a_0, a_1, a_2, dots$ in which every element of $A$ appears exactly once, and a sequence $B_0, B_1, B_2, dots$ in which every element of $PP(A)$ appears exactly once #j[Proposition 9.1].
+ Define $B = {a_i : a_i in.not B_i}$. Then $B in PP(A)$.
+ Let $i in NN$. If $a_i in.not B_i$ then $a_i in B$; if $a_i in B_i$ then $a_i in.not B$ (each $a_i$ appears once only). Either way $B != B_i$.
+ So $B$ is not in the sequence, contradicting line 2. Therefore $PP(A)$ is uncountable. #qed]

#proofb[T8 Q6 · For $X$ infinite and $Y$ finite there is a bijection $X union Y -> X$][
+ Take a countably infinite $X_0 subset.eq X$ #j[Proposition 9.3] and let $Y_0 = Y without X$, a finite set.
+ $X_0 union Y_0$ is countably infinite #j[T8 Q2], so there is a bijection $f: X_0 union Y_0 -> X_0$.
+ Define $g: X union Y -> X$ by $g(z) = f(z)$ if $z in X_0 union Y_0$, and $g(z) = z$ otherwise. Then $g$ is a bijection. #qed]

#tip[Countable or uncountable? (T8 D3 · AY25 final Q13, Q17, Q18)][
*Show countable:* exhibit a sequence containing every element (Lemma 9.2), or build the set from countable sets by subset, finite product, or countable union. \
*Show uncountable:* diagonalize, or find an uncountable subset, or biject with $PP(NN)$ or $RR$.
#table(columns: (1.2fr, auto, 1.5fr),
  [Set], [], [Reason],
  [$ZZ$, $QQ$, $ZZ^+ times ZZ^+$, $QQ times QQ$ (points with rational coordinates)], [countable], [sequences above; product theorem],
  [all functions ${0, 1} -> NN$], [countable], [same as $NN times NN$],
  [all 2-element subsets of $NN$; all finite strings over a finite alphabet], [countable], [inject into $NN times NN$; countable union of finite sets],
  [any subset of $QQ$; any partition of $NN$ (as a set of components)], [countable], [Theorem 7.4.3; send each component to its least element],
  [$ZZ^*$: all finite strings over the countably infinite alphabet $ZZ$ (AY22/23 Q17)], [countable], [$ZZ^* = ZZ^0 union ZZ^1 union ZZ^2 union dots.c$; each $ZZ^n$ is countable (general product); countable union (T8 Q5)],
  [$QQ$; the rationals strictly between 0 and 1 (AY22/23 Q17)], [countable], [$QQ$ from $QQ^+$ (§37); subset of $QQ$],
  [$(0, 1)$, $RR$, $RR without QQ$], [uncountable], [Theorem 7.4.2 and Corollary 7.4.4],
  [$PP(NN)$; all functions $NN -> {0, 1}$; all infinite sequences of integers], [uncountable], [T8 Q7; diagonalization],
  [all relations on $ZZ$ (AY22/23 Q17)], [uncountable], [a relation on $ZZ$ is a subset of $ZZ times ZZ$, so the set is $PP(ZZ times ZZ)$ with $ZZ times ZZ$ countably infinite (T8 Q7)],
  [the set of all partitions of $NN$], [uncountable], [${A, NN without A}$ for each $A$ gives uncountably many],
)
*AY22/23 Q17.* Countable among (i) relations on $ZZ$, (ii) rationals in $(0, 1)$, (iii) $ZZ^*$: only (ii) and (iii), option D. \
*AY25 Q17.* $A$ countably infinite, $B$ uncountable: $A union B$ is uncountable (it contains $B$) and $A inter B$ is countable (a subset of $A$). Both true. \
*AY25 Q13.* $(ZZ times ZZ^+) slash simq$ with $(a, b) tilde.op (c, d) <-> a d = b c$ is in bijection with $QQ$, hence with $ZZ$ and with $ZZ times ZZ^+$: all countably infinite.]
