#import "exam_style.typ": *

// ============================================================================
= Part VI · Functions
// ============================================================================

== 26 · Functions, images and preimages

#defn[Function (L7 s7)][
A *function* $f$ from a set $X$ to a set $Y$, written $f: X -> Y$, is a relation $f subset.eq X times Y$ satisfying \
*(F1)* $forall x in X thin exists y in Y thin ((x, y) in f)$; $quad$ every input has an output. \
*(F2)* $forall x in X thin forall y_1, y_2 in Y thin (((x, y_1) in f and (x, y_2) in f) -> y_1 = y_2)$; $quad$ the output is unique. \
Equivalently, $forall x in X thin exists! y in Y thin ((x, y) in f)$. On an arrow diagram: every element of $X$ has exactly one arrow leaving it.]

#defn[Image, preimage (L7 s11) · Setwise image and preimage (L7 s12) · Domain, co-domain, range (L7 s16)][
Write $f(x) = y$ iff $(x, y) in f$; $f$ *maps* $x$ to $y$ ($f: x |-> y$); $x$ is the *argument*, $f(x)$ the *image* of $x$, and $x$ is *a preimage* of $y$. \
For $A subset.eq X$ and $B subset.eq Y$:
$ f(A) = {f(x) : x in A} quad "(setwise image)", wide f^(-1)(B) = {x in X : f(x) in B} quad "(setwise preimage)". $
$X$ is the *domain*, $Y$ the *co-domain*, and the *range* is $f(X) = {y in Y : y = f(x) "for some" x in X}$. Always range $subset.eq$ co-domain.]

#trap[Two meanings of $f^(-1)$ (L7 s12, s15)][
- $f^(-1)(B)$ with $B$ a *subset* of the co-domain is the setwise preimage. It exists for every function and is a set.
- $f^(-1)(y)$ with $y$ an *element* of the co-domain is the inverse function (§28). It exists only when $f$ is a bijection.
- For the preimage of a single element write $f^(-1)({b})$, never $f^(-1)(b)$, unless $f$ is known to be bijective.]

#example[L7 Ex. 1, 4, 6 · T6 D1, Q1, Q2][
- *Not a function.* "$f(x)$ is the real $y$ with $x^2 + y^2 = 1$" on $RR$: $x = 2$ has no $y$ (F1 fails); $x = 0$ has $y = plus.minus 1$ (F2 fails).
- *T6 D1.* $f(z) = 1$ if $2 dv z$, $2$ if $3 dv z$: not a function ($f(6)$ has two values, $f(1)$ has none). $f: RR -> ZZ$, $f(x) = 2x$: not a function ($f(0.3) = 0.6 in.not ZZ$). $f: ZZ -> RR$, $f(x) = 2x$: a function.
- *T6 Q1* on $NN$. $x R_1 y <-> x^2 = y^2$: a function (F1: take $y = x$; F2: $y_1^2 = y_2^2$ with $y_1, y_2 >= 0$ gives $y_1 = y_2$). $x R_2 y <-> y dv x$: not a function ($6 R_2 2$ and $6 R_2 3$). $x R_3 y <-> y = x + 1$: a function.
- *Ex. 4.* $g: ZZ -> ZZ$, $g(x) = x^2$: $g({-1, 0, 1}) = {0, 1}$ and $g^(-1)({0, 1, 2}) = {-1, 0, 1}$.
- *Ex. 6.* $f: ZZ -> ZZ$, $f(x) = 2x + 1$: domain $ZZ$, co-domain $ZZ$, range = the odd integers.
- *T6 Q2.* $op("len"): {s, u}^* -> ZZ_(>= 0)$: $op("len")({epsilon, s s, u u, s s s s}) = {0, 2, 4}$; $op("len")^(-1)({3})$ is the set of all 8 strings of length 3; the inverse function $op("len")^(-1)$ does not exist, since $op("len")(s) = op("len")(u)$.]

#proofb[T6 Q9 · $X subset.eq f^(-1)(f(X))$ and $f(f^(-1)(Y)) subset.eq Y$; the reverse inclusions can fail][
Let $f: A -> B$, $X subset.eq A$, $Y subset.eq B$.
+ ($X subset.eq f^(-1)(f(X))$) Let $x in X$. Then $f(x) in f(X)$ #j[definition of $f(X)$], so $x in f^(-1)(f(X))$ #j[definition of setwise preimage].
+ ($f(f^(-1)(Y)) subset.eq Y$) Let $y in f(f^(-1)(Y))$. Then $y = f(x)$ for some $x in f^(-1)(Y)$ #j[definition of setwise image], and $f(x) in Y$ #j[definition of setwise preimage]. So $y in Y$. #qed
*Counterexamples for the reverse.* $f: {-1, 1} -> {0}$, $X = {1}$: $f^(-1)(f(X)) = {-1, 1} subset.eq.not X$. $quad$ $f: {0} -> {-1, 1}$ with $f(0) = 1$, $Y = {-1}$: $f(f^(-1)(Y)) = nothing$, so $Y subset.eq.not f(f^(-1)(Y))$. \
Equality holds in the first when $f$ is injective and in the second when $f$ is surjective.]

== 27 · Sequences, strings and function equality

#defn[Sequence (L7 s18) · Fibonacci sequence (L7 s19) · String (L7 s20)][
A *sequence* $a_0, a_1, a_2, dots$ is represented by a function $a$ with domain $ZZ_(>= 0)$ and $a(n) = a_n$; any function with domain $ZZ_(>= m)$ represents a sequence. \
*Fibonacci:* $F_0 = 0$, $F_1 = 1$, $F_(n+2) = F_(n+1) + F_n$: $quad 0, 1, 1, 2, 3, 5, 8, 13, 21, 34, 55, dots$ \
A *string* (word) over a set $A$ is an expression $a_0 a_1 dots.c a_(l-1)$ with $l in ZZ_(>= 0)$ and each $a_i in A$; $l$ is its *length*; the *empty string* $epsilon$ has length 0; $A^*$ is the set of all strings over $A$. Two sequences (strings of the same length) are equal iff they agree at every index.]

#defn[Floor, ceiling (T6 D3 · AY23/24 final)][
For a real number $x$: the *floor* $floor(x)$ is the unique integer $n$ with $n <= x < n + 1$, i.e. $floor(x) = max{m in ZZ : m <= x}$; the *ceiling* $ceil(x)$ is the unique integer $n$ with $n - 1 < x <= n$, i.e. $ceil(x) = min{m in ZZ : m >= x}$. \
$floor(2.7) = 2$, $ceil(2.7) = 3$, $floor(-2.7) = -3$, $ceil(-2.7) = -2$, $floor(5) = ceil(5) = 5$. Read off the definitions:
- $floor(x) <= x <= ceil(x)$; $quad x in ZZ <=> floor(x) = x <=> ceil(x) = x$; $quad x in.not ZZ => ceil(x) = floor(x) + 1$.
- For $n in ZZ$: $floor(n slash 2) = n slash 2$ if $n$ is even and $(n - 1) slash 2$ if $n$ is odd; $ceil(n slash 2) = n slash 2$ if $n$ is even and $(n + 1) slash 2$ if $n$ is odd.]

#thm[Theorem 7.1.1 · Function equality (L7 s22)][
$f: A -> B$ and $g: C -> D$ are equal iff (i) $A = C$ and $B = D$, and (ii) $f(x) = g(x)$ for all $x in A$.]

#example[L7 Ex. 11–13 · T6 D3][
- On $X = {0, 1, 2}$, $f(x) = (x^2 + x + 1) mod 3$ and $g(x) = (x + 2)^2 mod 3$ both give $1, 0, 1$, so $f = g$.
- $f, g: {0, 2} -> ZZ$ with $f(x) = 2x$, $g(x) = x^2$: equal (same domain, co-domain, values $0, 4$).
- $f: ZZ -> ZZ$ and $g: ZZ -> QQ$ with $f(x) = x^3 = g(x)$: *not* equal, since the co-domains differ.
- *T6 D3.* $f, g: QQ -> QQ$, $f(x) = floor(x) + 1$, $g(x) = ceil(x)$: both have range $ZZ$, but $f(0) = 1 != 0 = g(0)$, so $f != g$ (they agree exactly off the integers).]

== 28 · Injections, surjections, bijections, inverses

#defn[Injection (L7 s25) · Surjection (L7 s27) · Bijection (L7 s29)][
Let $f: X -> Y$.
- $f$ is *injective* (one-to-one) iff $forall x_1, x_2 in X thin (f(x_1) = f(x_2) => x_1 = x_2)$. Contrapositive: $x_1 != x_2 => f(x_1) != f(x_2)$.
- $f$ is *surjective* (onto) iff $forall y in Y thin exists x in X thin (y = f(x))$: range = co-domain.
- $f$ is *bijective* (a one-to-one correspondence) iff it is injective and surjective: $forall y in Y thin exists! x in X thin (y = f(x))$.
Arrows *into* each element of the co-domain: at most one (injective), at least one (surjective), exactly one (bijective).]

#grid(columns: (1fr, 1fr), gutter: 10pt,
tip[Negations (to disprove)][
- *Not injective:* $exists x_1, x_2 in X thin (f(x_1) = f(x_2) and x_1 != x_2)$. Name two inputs.
- *Not surjective:* $exists y in Y thin forall x in X thin (y != f(x))$. Name one $y$ and show no $x$ reaches it.],
tip[Proof templates][
- *Injective:* "Let $x_1, x_2 in X$ with $f(x_1) = f(x_2)$" $dots$ "so $x_1 = x_2$."
- *Surjective:* "Take any $y in Y$. Let $x = dots$" (solve $y = f(x)$ on scratch paper). Check $x in X$ and $f(x) = y$.
- *Bijective:* both, or exhibit an inverse (Theorem 7.2.3).])

#proofb[L7 Ex. 14, 16 · $f: QQ -> QQ$, $f(x) = 3x + 1$ is a bijection $quad$ Ex. 15, 17 · $g: ZZ -> ZZ$, $g(x) = x^2$ is neither][
+ (Injective) Let $x_1, x_2 in QQ$ with $f(x_1) = f(x_2)$. Then $3 x_1 + 1 = 3 x_2 + 1$, so $x_1 = x_2$ #j[basic algebra].
+ (Surjective) Take any $y in QQ$. Let $x = (y - 1) slash 3$. Then $x in QQ$ #j[closure of $QQ$] and $f(x) = 3 dot (y - 1) / 3 + 1 = y$. #qed
$g$ is not injective: $g(1) = 1 = g(-1)$ but $1 != -1$. $g$ is not surjective: $g(x) = x^2 >= 0 > -1$ for all $x in ZZ$, so $-1$ has no preimage. \
*The domain matters:* $x |-> 3x + 1$ on $ZZ$ is injective but not surjective ($y = 0$ would need $x = -1 slash 3 in.not ZZ$).]

#example[T6 Q4 · Classify four functions][
*(a)* $f: QQ -> QQ$, $x |-> 12x + 31$: bijective, with $f^(-1)(y) = (y - 31) slash 12$, because $y = 12x + 31 <=> x = (y - 31) slash 12$ for all $x, y in QQ$. \
*(b)* $g: "Bool"^2 -> "Bool"$, $(p, q) |-> p and lnot q$: not injective ($g(F, T) = F = g(F, F)$); surjective ($g(T, F) = T$). \
*(c)* $h: "Bool"^2 -> "Bool"^2$, $(p, q) |-> (p and q, p or q)$: not injective ($h(T, F) = (F, T) = h(F, T)$); not surjective: if $p and q = T$ then $p or q = T$, so $(T, F)$ is not in the range. \
*(d)* $k: ZZ -> ZZ$, $k(x) = x$ if $x$ is even, $2x - 1$ if $x$ is odd.
+ $k$ preserves parity: $x$ even gives $k(x) = x$ even; $x$ odd gives $k(x) = 2(x - 1) + 1$ odd. So $x$ is even iff $k(x)$ is even.
+ (Injective) Let $k(x_1) = k(x_2)$. If this value is even, both $x_i$ are even and $x_1 = k(x_1) = k(x_2) = x_2$. If it is odd, both are odd and $2 x_1 - 1 = 2 x_2 - 1$, so $x_1 = x_2$.
+ (Not surjective) Suppose $k(x) = 3$. Then $x$ is odd #j[line 1], so $2x - 1 = 3$ and $x = 2$, which is even: contradiction. So 3 has no preimage. #qed]

#defn[Inverse function (L7 s31)][
Let $f: X -> Y$. A function $g: Y -> X$ is an *inverse* of $f$ iff
$ forall x in X thin forall y in Y thin (y = f(x) <=> x = g(y)). $
The inverse, when it exists, is unique and is written $f^(-1)$. Example: $f(x) = 3x + 1$ on $QQ$ has $f^(-1)(y) = (y - 1) slash 3$.]

#proofb[Proposition · Uniqueness of inverses (L7 s34) $quad$ Theorem 7.2.3 · $f$ is bijective iff $f$ has an inverse; then $f^(-1)$ is a bijection (L7 s35–36)][
*Uniqueness.* If $g_1, g_2: Y -> X$ are inverses of $f$, then for all $x in X$, $y in Y$: $x = g_1(y) <=> y = f(x) <=> x = g_2(y)$. So $g_1 = g_2$ #j[Theorem 7.1.1]. \
*Theorem 7.2.3.*
+ ("if") Suppose $f$ has an inverse $g: Y -> X$.
  + (Injective) Let $f(x_1) = f(x_2) = y$. Then $x_1 = g(y)$ and $x_2 = g(y)$ #j[$g$ is an inverse], so $x_1 = x_2$.
  + (Surjective) Let $y in Y$ and $x = g(y)$. Then $y = f(x)$ #j[$g$ is an inverse].
+ ("only if") Suppose $f$ is bijective. Then $forall y in Y thin exists! x in X thin (y = f(x))$ #j[definition of bijection]. Define $g(y)$ to be that unique $x$. Then $g$ is well defined and $y = f(x) <=> x = g(y)$, so $g$ is an inverse of $f$.
+ ($f^(-1)$ is a bijection) $f$ is an inverse of $f^(-1)$, since the defining condition is symmetric in $f$ and $g$. So $f^(-1)$ is bijective by line 1. #qed]

#thm[T6 Q5 (AY22/23 S2 exam) · Left and right inverses][
$g: B -> A$ is a *left inverse* of $f: A -> B$ iff $g(f(a)) = a$ for all $a in A$; $h: B -> A$ is a *right inverse* iff $f(h(b)) = b$ for all $b in B$. \
*$f$ is injective iff it has a left inverse; $f$ is surjective iff it has a right inverse* (for $A != nothing$). Neither kind of inverse implies the other. In T6 Q4: left inverses for $f, k$; right inverses for $f, g$.]

== 29 · Composition of functions

#defn[Composition (L7 s39) · Identity function (L7 s41)][
For $f: X -> Y$ and $g: Y -> Z$, the *composition* $g compose f: X -> Z$ is defined by $(g compose f)(x) = g(f(x))$ for all $x in X$. *$f$ is applied first.* \
The *identity function* on $X$ is $idf_X: X -> X$ with $idf_X (x) = x$.]

#thm[Theorems on composition (L7 s44–52)][
- *7.3.1.* For $f: X -> Y$: $quad f compose idf_X = f$ and $idf_Y compose f = f$.
- *7.3.2.* If $f: X -> Y$ is a bijection: $quad f^(-1) compose f = idf_X$ and $f compose f^(-1) = idf_Y$.
- *Associativity.* For $f: A -> B$, $g: B -> C$, $h: C -> D$: $quad (h compose g) compose f = h compose (g compose f)$.
- *Not commutative.* $f(x) = 3x$, $g(x) = x + 1$ on $ZZ$: $(g compose f)(0) = 1 != 3 = (f compose g)(0)$.
- *7.3.3.* $f, g$ injective $=>$ $g compose f$ injective. $quad$ *7.3.4.* $f, g$ surjective $=>$ $g compose f$ surjective. Hence bijections compose to a bijection.]

#proofb[Associativity (L7 s47) · Theorem 7.3.3 (L7 s50) · Theorem 7.3.4 (L7 s52)][
*Associativity.* Both sides have domain $A$ and co-domain $D$, and for every $x in A$: $((h compose g) compose f)(x) = (h compose g)(f(x)) = h(g(f(x))) = h((g compose f)(x)) = (h compose (g compose f))(x)$. Equal by Theorem 7.1.1. \
*7.3.3.*
+ Let $f: X -> Y$ and $g: Y -> Z$ be injective, and let $x_1, x_2 in X$ with $(g compose f)(x_1) = (g compose f)(x_2)$.
+ Then $g(f(x_1)) = g(f(x_2))$ #j[definition of composition].
+ So $f(x_1) = f(x_2)$ #j[$g$ is injective], and then $x_1 = x_2$ #j[$f$ is injective]. #qed
*7.3.4.*
+ Let $f: X -> Y$ and $g: Y -> Z$ be surjective, and let $z in Z$.
+ There is $y in Y$ with $g(y) = z$ #j[$g$ is surjective], and $x in X$ with $f(x) = y$ #j[$f$ is surjective].
+ Then $(g compose f)(x) = g(f(x)) = g(y) = z$. #qed]

#trap[T6 D4 · A wrong surjectivity proof][
"$forall y exists x thin f(x) = y$, and $forall z exists y thin g(y) = z$, so $(g compose f)(x) = g(y) = z$." The $x$, $y$, $z$ in the last line were never fixed: the proof must *start* with an arbitrary $z in Z$, *then* obtain $y$ from $g$, *then* obtain $x$ from $f$ for that particular $y$.]

#proofb[T6 Q3 · For bijections $f: A -> B$, $g: B -> C$: $(g compose f)^(-1) = f^(-1) compose g^(-1)$][
+ $f^(-1), g^(-1)$ are bijections #j[Theorem 7.2.3]; $g compose f$ and $f^(-1) compose g^(-1)$ are bijections #j[Theorems 7.3.3, 7.3.4]; so $(g compose f)^(-1)$ exists.
+ Both $(g compose f)^(-1)$ and $f^(-1) compose g^(-1)$ have domain $C$ and co-domain $A$.
+ Let $z in C$. Let $y = g^(-1)(z)$, so $z = g(y)$; let $x = f^(-1)(y)$, so $y = f(x)$ #j[definition of inverse].
+ Then $(g compose f)(x) = g(f(x)) = g(y) = z$, so $(g compose f)^(-1)(z) = x$ #j[definition of inverse].
+ Also $(f^(-1) compose g^(-1))(z) = f^(-1)(g^(-1)(z)) = f^(-1)(y) = x$.
+ The two functions agree at every $z in C$, so they are equal #j[Theorem 7.1.1]. #qed]

#proofb[T6 Q6 · If $g compose f$ is injective, then $f$ is injective $quad$ · $quad$ If $g compose f$ is surjective, then $g$ is surjective][
+ Let $f: B -> C$ and let $g$ have domain $C$ with $g compose f$ injective. Let $x_1, x_2 in B$ with $f(x_1) = f(x_2)$.
+ Then $(g compose f)(x_1) = g(f(x_1)) = g(f(x_2)) = (g compose f)(x_2)$, so $x_1 = x_2$ #j[$g compose f$ is injective]. #qed
For the second: given $z$, surjectivity of $g compose f$ gives $x$ with $g(f(x)) = z$, and $y = f(x)$ is a preimage of $z$ under $g$. \
*The other halves fail:* $X = Z = {0}$, $Y = {0, 1}$, $f(0) = 0$, $g(0) = g(1) = 0$. Then $g compose f = idf_({0})$ is bijective, yet $g$ is not injective and $f$ is not surjective.]

#exam[Order of a bijection · T6 Q7, Q8 · T8 Q10(c) · AY25 final Q11, Q12, Q26(b)][
The *order* of a bijection $f: A -> A$ is the least $n in ZZ^+$ with $f compose f compose dots.c compose f = idf_A$ ($n$ copies). The *order of an input* $x$ is the least $m in ZZ^+$ with $f^((m))(x) = x$. \
*T6 Q7.* On ${1, 2, 3}$, $g$ swaps 1, 2 and $h$ swaps 2, 3: orders 2 and 2. $g compose h$ sends $1 |-> 2 |-> 3 |-> 1$: order 3; likewise $h compose g$. \
*T6 Q8.* $g(x) = 3x mod 5$: $g^((3))(21) = g^((2))(3) = g(4) = 2$. Order of 3: $3 |-> 4 |-> 2 |-> 1 |-> 3$, so 4. Orders of $0, 1, 2, 3, 4$ are $1, 4, 4, 4, 4$: classes ${0}$ and ${1, 2, 3, 4}$. \
*T8 Q10(c).* $f = {(1,2), (2,4), (3,1), (4,3)}$, $g = {(1,4), (2,1), (3,2), (4,3)}$: orders 4 and 4; $f^(-1) compose g$ sends $1 |-> 2 |-> 3 |-> 1$, $4 |-> 4$: order 3. \
*AY25 Q11, Q12.* $f(p, q) = (p, p xor q)$ and $g(p, q) = (p xor q, q)$ on "Bool"$""^2$. $f compose f = idf$, so $f = f^(-1)$; but $f^(-1) compose f = idf != f$. $(g compose f)(p, q) = (q, p xor q)$ has order 3. \
*AY25 Q26(b).* $z: ZZ_5 -> ZZ_5$, $z(x) = 2x + 1$: $z^(-1)([3]) = [1]$; $z^((2))(x) = 4x + 3$; $[3] |-> [2] |-> [0] |-> [1] |-> [3]$, so the order of $[3]$ is 4.]

== 30 · Addition and multiplication on $ZZ_n$

#defn[$ZZ_n$ (L7 s54–55) · Addition and multiplication on $ZZ_n$ (L7 s56)][
$ZZ_n$ denotes the quotient $ZZ slash tilde.op_n$, where $tilde.op_n$ is congruence mod $n$: $ZZ_n = {[0], [1], dots, [n - 1]}$ with $[r] = {n k + r : k in ZZ}$. \
For $[x], [y] in ZZ_n$: $quad [x] + [y] = [x + y]$ and $[x] dot [y] = [x dot y]$. In $ZZ_3$: $[0] + [1] = [1]$, $[2] dot [2] = [4] = [1]$.]

#trap[$ZZ_n$ has two meanings in the slides][
Lecture 7 uses $ZZ_n = ZZ slash tilde.op_n$ (a set of $n$ classes). Lecture 9, slide 9 writes $ZZ_n = {1, 2, dots, n}$ when defining finite sets. Read the definition in the question.]

#proofb[Propositions · $+$ and $dot$ on $ZZ_n$ are well defined (L7 s57–58)][
Claim: for all $[x_1], [y_1], [x_2], [y_2] in ZZ_n$, if $[x_1] = [x_2]$ and $[y_1] = [y_2]$ then $[x_1] + [y_1] = [x_2] + [y_2]$ and $[x_1] dot [y_1] = [x_2] dot [y_2]$.
+ Let $[x_1] = [x_2]$ and $[y_1] = [y_2]$. Then $x_1 equiv x_2$ and $y_1 equiv y_2 space (mod n)$ #j[Lemma Rel.1].
+ So $x_1 - x_2 = n k$ and $y_1 - y_2 = n l$ for some $k, l in ZZ$ #j[definition of congruence].
+ $(x_1 + y_1) - (x_2 + y_2) = n(k + l)$, so $x_1 + y_1 equiv x_2 + y_2 space (mod n)$, hence $[x_1 + y_1] = [x_2 + y_2]$ #j[Lemma Rel.1].
+ $x_1 y_1 - x_2 y_2 = (n k + x_2)(n l + y_2) - x_2 y_2 = n(n k l + k y_2 + l x_2)$ with $n k l + k y_2 + l x_2 in ZZ$ #j[closure], hence $[x_1 y_1] = [x_2 y_2]$. #qed
The representative-level version of this proof is in §23.]

#tip[Is a rule on classes well defined?][
A rule $F([x]) = dots$ defines a function on $A slash simq$ only if the output does not depend on the representative: *show $x tilde.op x' =>$ same output*. To disprove, name two representatives of one class with different outputs.
- $[x]_3 |-> [x]_2$ from $ZZ_3$ to $ZZ_2$: *not* well defined ($[0]_3 = [3]_3$ but $[0]_2 != [3]_2$). From $ZZ_4$ to $ZZ_2$ it is well defined, as $4 dv (x - x') => 2 dv (x - x')$.
- *T6 Q10.* On $QQ slash simq$ with $x tilde.op y <-> x - y in ZZ$: $+$ is well defined ($(x_1 + y_1) - (x_2 + y_2) = k + l in ZZ$); $dot$ is *not*: $[1 slash 2] = [-1 slash 2]$, but $[1 slash 2] dot [1 slash 2] = [1 slash 4] != [-1 slash 4] = [1 slash 2] dot [-1 slash 2]$, as $1 slash 4 - (-1 slash 4) = 1 slash 2 in.not ZZ$.
- *T8 Q10 (AY22/23 S2).* If $g: X -> Y$ satisfies $g(a) = g(b) <=> a tilde.op b$, then $f([x]) = g(x)$ is well defined ($[x] = [x'] => x tilde.op x' => g(x) = g(x')$) *and* injective ($f([x]) = f([x']) => g(x) = g(x') => x tilde.op x' => [x] = [x']$).]
