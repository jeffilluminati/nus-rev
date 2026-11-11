#import "exam_style.typ": *

// ============================================================================
= Part VII · Induction and Recursion
// ============================================================================

== 31 · Sequences, sums and products

#defn[Sequence, term, explicit formula (L8 s5–6) · Summation (L8 s7) · Product (L8 s11)][
A *sequence* is an ordered list $a_m, a_(m+1), dots, a_n$ (or infinite) of *terms*; $k$ in $a_k$ is the *index*. An *explicit formula* gives $a_k$ in terms of $k$. For integers $m <= n$:
$ sum_(k=m)^n a_k = a_m + a_(m+1) + dots.c + a_n, wide product_(k=m)^n a_k = a_m dot a_(m+1) dot dots.c dot a_n. $
$k$ is the *index*, $m$ the *lower limit*, $n$ the *upper limit*. *Recursive form:* $sum_(k=m)^m a_k = a_m$ and $sum_(k=m)^n a_k = (sum_(k=m)^(n-1) a_k) + a_n$ for $n > m$; likewise for $product$. An *empty sum* is $0$; an *empty product* is $1$.]

#thm[Theorem 5.1.1 (L8 s14) · Standard sequences (L8 s18–20)][
For real sequences $a_k, b_k$, real $c$ and $n >= m$:
$ sum_(k=m)^n a_k + sum_(k=m)^n b_k = sum_(k=m)^n (a_k + b_k), quad c dot sum_(k=m)^n a_k = sum_(k=m)^n c dot a_k, quad (product_(k=m)^n a_k) dot (product_(k=m)^n b_k) = product_(k=m)^n (a_k dot b_k). $
#grid(columns: (1fr, 1fr), gutter: 12pt,
[*Arithmetic:* $a_k = a_(k-1) + d$, so $a_n = a_0 + d n$ and \ $sum_(k=0)^(n-1) a_k = n/2 (2 a_0 + (n - 1) d)$.],
[*Geometric:* $a_k = r a_(k-1)$, so $a_n = a_0 r^n$ and \ $sum_(k=0)^(n-1) a_k = a_0 (1 - r^n) / (1 - r)$ for $r != 1$.])
Squares $1, 4, 9, 16, dots$; triangle numbers $1, 3, 6, 10, dots$ ($n(n+1) slash 2$); lazy caterer $1, 2, 4, 7, 11, 16, dots$ ($n(n+1) slash 2 + 1$).]

#example[L8 Ex. 4, 5, 7 · Telescoping, a product, change of variable][
- *Telescoping.* $1/(k(k+1)) = 1/k - 1/(k+1)$, so $sum_(k=1)^n 1/(k(k+1)) = (1 - 1/2) + (1/2 - 1/3) + dots.c + (1/n - 1/(n+1)) = 1 - 1/(n+1)$.
- $product_(k=1)^5 (k + 2) = 3 dot 4 dot 5 dot 6 dot 7 = 2520$.
- *Change of variable.* The index is a dummy: $sum_(k=1)^3 k^2 = sum_(i=1)^3 i^2 = sum_(k=3)^5 (k - 2)^2$. Put $j = k - 1$: $sum_(k=1)^(n+1) k/(n+k) = sum_(j=0)^n (j+1)/(n+j+1)$. Change the limits and every occurrence of the index together.]

== 32 · Mathematical induction

#defn[Principle of Mathematical Induction, PMI (L8 s24) · Closed form (L8 s27)][
Let $P(n)$ be a property defined for integers $n$ and let $a$ be a fixed integer. Suppose
+ $P(a)$ is true #h(1fr) (*basis step*)
+ for all integers $k >= a$, if $P(k)$ is true then $P(k + 1)$ is true. #h(1fr) (*inductive step*; $P(k)$ is the *inductive hypothesis*)
Then $P(n)$ is true for all integers $n >= a$. PMI is taken as an axiom. \
A sum is in *closed form* when it is written without an ellipsis or a summation symbol.]

#tip[The format used in class (L8 s26) · Mistakes to avoid (T7 Q1, D2, D3)][
+ Let $P(n) equiv (dots)$ for $n >= a$. #h(1fr) (set up the predicate)
+ Basis step: verify $P(a)$.
+ Assume $P(k)$ is true for an arbitrary $k >= a$. #h(1fr) (inductive hypothesis)
+ Inductive step: derive $P(k + 1)$, marking where $P(k)$ is used.
+ Therefore $P(n)$ is true for all $n >= a$ by MI.
- $P(k)$ is a *statement*, not a number: never write "$(k + 1) + P(k)$".
- Do not start from $P(k + 1)$ and reduce it to a true identity; start from one side of $P(k + 1)$ and reach the other.
- Do not assume "$P(k)$ for all $k$"; that is the conclusion.
- Check the *basis value matches the claim* (T7 D2: the claim is for $n in NN$, so the basis must be $n = 0$, and the step must be shown, not asserted).
- The inductive step must cover an *arbitrary* object of size $k + 1$ (T7 D3: start from any group of $k + 1$ people and remove one, rather than building up from a group of $k$).]

#proofb[Theorem 5.2.2 (5th ed. 5.2.1) · $1 + 2 + dots.c + n = n(n+1) / 2$ for all $n >= 1$ (L8 s26)][
+ Let $P(n) equiv (1 + 2 + dots.c + n = n(n+1) slash 2)$ for $n in ZZ^+$.
+ Basis step: $1 = 1(1 + 1) slash 2$, so $P(1)$ is true.
+ Assume $P(k)$ is true for an arbitrary $k >= 1$: $1 + 2 + dots.c + k = k(k+1) slash 2$.
+ Inductive step: $1 + 2 + dots.c + k + (k + 1) = k(k+1)/2 + (k + 1)$ #j[inductive hypothesis] $= ((k+1)(k+2))/2 = ((k+1)((k+1)+1))/2$. So $P(k + 1)$ is true.
+ Therefore $P(n)$ is true for all $n in ZZ^+$. #qed]

#proofb[Theorem 5.2.3 (5th ed. 5.2.2) · $sum_(i=0)^n r^i = (r^(n+1) - 1)/(r - 1)$ for real $r != 1$ and $n >= 0$ (L8 s28)][
+ Let $P(n) equiv (sum_(i=0)^n r^i = (r^(n+1) - 1) slash (r - 1))$ for $n >= 0$.
+ Basis step: $r^0 = 1 = (r^1 - 1) slash (r - 1)$, so $P(0)$ is true.
+ Assume $P(k)$ for an arbitrary $k >= 0$.
+ Inductive step: $sum_(i=0)^(k+1) r^i = sum_(i=0)^k r^i + r^(k+1) = (r^(k+1) - 1)/(r - 1) + r^(k+1)$ #j[inductive hypothesis] $= (r^(k+1) - 1 + r^(k+1)(r - 1))/(r - 1) = (r^((k+1)+1) - 1)/(r - 1)$.
+ Therefore $P(n)$ is true for all $n >= 0$. #qed]

#proofb[Proposition 5.3.1 (5th ed. 5.3.2) · $3 dv (2^(2n) - 1)$ for all $n >= 0$ (L8 s29)][
+ Let $P(n) equiv (3 dv (2^(2n) - 1))$ for $n >= 0$.
+ Basis step: $2^0 - 1 = 0 = 3 dot 0$, so $P(0)$ is true.
+ Assume $P(k)$ for an arbitrary $k >= 0$: $2^(2k) - 1 = 3r$ for some $r in ZZ$ #j[definition of divisibility].
+ Inductive step: $2^(2(k+1)) - 1 = 2^(2k) dot 4 - 1 = 2^(2k) dot 3 + (2^(2k) - 1) = 2^(2k) dot 3 + 3r = 3(2^(2k) + r)$, and $2^(2k) + r in ZZ$ #j[closure]. So $P(k + 1)$ is true.
+ Therefore $P(n)$ is true for all $n >= 0$. #qed]

#proofb[Proposition 5.3.2 (5th ed. 5.3.3) · $2n + 1 < 2^n$ for all $n >= 3$ (L8 s30)][
+ Let $P(n) equiv (2n + 1 < 2^n)$ for $n >= 3$.
+ Basis step: $2 dot 3 + 1 = 7 < 8 = 2^3$, so $P(3)$ is true.
+ Assume $P(k)$ for an arbitrary $k >= 3$.
+ Inductive step: $2(k + 1) + 1 = (2k + 1) + 2 < 2^k + 2$ #j[inductive hypothesis] $< 2^k + 2^k$ #j[$2 < 2^k$ for $k >= 2$] $= 2^(k+1)$.
+ Therefore $P(n)$ is true for all $n >= 3$. #qed
The basis cannot be lowered: $n = 1$ gives $3 < 2$ and $n = 2$ gives $5 < 4$, both false.]

#grid(columns: (1.1fr, 1fr), gutter: 10pt,
trap[L8 Ex. 12 · "All cows have the same colour"][
The step "cows 1 to $k$ share a colour, cows 2 to $k + 1$ share a colour, and cows 2 to $k$ are common to both" fails for $k = 1$: the overlap ${2, dots, k}$ is *empty*, so nothing links cow 1 to cow 2. $P(1) => P(2)$ is false, and the chain breaks at its first link. The inductive step must work for *every* $k >= a$.],
example[L8 Ex. 13 · Tiling by L-trominoes][
$P(n)$: every $2^n times 2^n$ board with one square removed can be tiled by L-trominoes. $P(1)$: the board is one L-tromino. Step: split a $2^(k+1) times 2^(k+1)$ board into four $2^k times 2^k$ quadrants; place one tromino at the centre covering one square of each quadrant not containing the removed square. Each quadrant now has one square missing and is tiled by $P(k)$.])

#proofb[T7 Q2 · $1^2 + 2^2 + dots.c + n^2 = n(n+1)(2n+1) / 6$ $quad$ T7 Q3 · Bernoulli: $1 + n x <= (1 + x)^n$ for real $x >= -1$][
*Q2.* $P(1)$: $1 = (1 dot 2 dot 3) slash 6$. Step: $1^2 + dots.c + k^2 + (k+1)^2 = (k(k+1)(2k+1))/6 + (k+1)^2$ #j[IH] $= ((k+1)(2k^2 + 7k + 6))/6 = ((k+1)(k+2)(2k+3))/6$, which is $P(k + 1)$. \
*Q3.* $P(1)$: $1 + x = (1 + x)^1$. Step: $(1 + x)^(k+1) = (1 + x)^k (1 + x) >= (1 + k x)(1 + x)$ #j[IH, and $1 + x >= 0$] $= 1 + (k+1) x + k x^2 >= 1 + (k + 1) x$ #j[$k x^2 >= 0$]. #qed]

#proofb[T7 Q4 · For odd $a$: $2^(n+2) dv (a^(2^n) - 1)$ for all $n in ZZ^+$][
+ Let $P(n) equiv (2^(n+2) dv (a^(2^n) - 1))$.
+ Basis step: $a = 2p + 1$ for some $p in ZZ$, so $a^2 - 1 = (a - 1)(a + 1) = 4 p (p + 1) = 8m$ for some $m in ZZ$ #j[a product of two consecutive integers is even]. So $P(1)$ is true.
+ Assume $P(k)$: $a^(2^k) - 1 = 2^(k+2) m$ for some $m in ZZ$.
+ Inductive step: $a^(2^(k+1)) - 1 = (a^(2^k))^2 - 1 = (a^(2^k) - 1)(a^(2^k) + 1) = 2^(k+2) m (2^(k+2) m + 2) = 2^(k+3) m (2^(k+1) m + 1)$. So $P(k + 1)$ is true.
+ Therefore $P(n)$ is true for all $n in ZZ^+$ by MI. #qed]

== 33 · Strong induction and well-ordering

#defn[1PI and 2PI (L8 s37)][
Let $P(n)$ be a property of integers $n >= a$.
- *Weak (regular) induction, 1PI:* if $P(a)$ holds, and $P(k) => P(k + 1)$ for every $k >= a$, then $P(n)$ holds for all $n >= a$.
- *Strong induction, 2PI:* if $P(a)$ holds, and $(P(a) and P(a + 1) and dots.c and P(k)) => P(k + 1)$ for every $k >= a$, then $P(n)$ holds for all $n >= a$.
- *2PI, variant with several basis cases:* if $P(a), P(a + 1), dots, P(b)$ hold, and $P(k) => P(k + b - a + 1)$ for every $k >= a$, then $P(n)$ holds for all $n >= a$.
1PI, 2PI and the well-ordering principle are equivalent in power.]

#tip[Choosing the form][
Use 2PI when $P(k + 1)$ depends on an earlier case that is not $P(k)$: a factor of $k + 1$, the case $k - 3$, or two or three previous terms of a recurrence. *Prove as many basis cases as the step reaches back*: a step using $P(k - 3)$ needs four consecutive basis cases; a recurrence $a_(n+3) = a_(n+2) + a_(n+1) + a_n$ needs three.]

#proofb[L8 Ex. 14 · Every integer greater than 1 is divisible by a prime (2PI, L8 s39)][
+ Let $P(n) equiv (n "is divisible by a prime")$ for $n > 1$.
+ Basis step: $2 dv 2$ and 2 is prime, so $P(2)$ is true.
+ Inductive step: let $k >= 2$ and assume $P(i)$ for all integers $i$ with $2 <= i <= k$.
  + Case 1 ($k + 1$ is prime): $k + 1$ is divisible by the prime $k + 1$.
  + Case 2 ($k + 1$ is not prime): $k + 1 = a b$ with $1 < a < k + 1$ and $1 < b < k + 1$. Then $2 <= a <= k$, so a prime $p$ divides $a$ #j[inductive hypothesis]; and $a dv (k + 1)$. So $p dv (k + 1)$ #j[Theorem 4.3.3].
+ Therefore every integer greater than 1 is divisible by a prime. #qed
The well-ordering proof of the same result is in §12.]

#proofb[L8 Ex. 15, 16 · Every amount $n >= 12$ is $4a + 5b$ with $a, b in NN$ (1PI and 2PI, L8 s40–41) $quad$ T7 Q5 · $n >= 8$ is $3x + 5y$][
*By 1PI.* $P(12)$: $12 = 4 dot 3$. Step: suppose $k = 4a + 5b$. Case 1 ($a >= 1$): replace one 4 by a 5: $k + 1 = 4(a - 1) + 5(b + 1)$. Case 2 ($a = 0$): then $k = 5b >= 12$ forces $b >= 3$; replace three 5s by four 4s: $k + 1 = 4 dot 4 + 5(b - 3)$. \
*By 2PI.*
+ Let $P(n) equiv (n = 4a + 5b "for some" a, b in NN)$ for $n >= 12$.
+ Basis step: $12 = 4 dot 3 + 5 dot 0$; $13 = 4 dot 2 + 5 dot 1$; $14 = 4 dot 1 + 5 dot 2$; $15 = 4 dot 0 + 5 dot 3$.
+ Assume $P(i)$ for $12 <= i <= k$, for an arbitrary $k >= 15$.
+ Inductive step: $12 <= k - 3 <= k$, so $k - 3 = 4a + 5b$ for some $a, b in NN$ #j[inductive hypothesis]; then $k + 1 = 4(a + 1) + 5b$.
+ Therefore $P(n)$ is true for all $n >= 12$. #qed
*T7 Q5.* Same pattern: basis $8 = 3 + 5$, $9 = 3 dot 3$, $10 = 5 dot 2$; step $k + 3 = 3(x + 1) + 5y$. By 1PI instead: if $y > 0$, $k + 1 = 3(x + 2) + 5(y - 1)$; if $y = 0$, then $x >= 3$ and $k + 1 = 3(x - 3) + 5 dot 2$. (11 is not $4a + 5b$ and 7 is not $3x + 5y$, so the bounds are sharp.)]

#proofb[T7 Q6 · Every positive integer is a sum of distinct powers of 2 (2PI) $quad$ T7 Q7 · $a_n < 3^n$][
*Q6.* $P(1)$: $1 = 2^0$. Let $k >= 1$ and assume $P(1), dots, P(k)$. Write $k + 1 = 2m$ or $2m + 1$ with $m in ZZ$; then $1 <= m <= k$, so $m = 2^(i_1) + dots.c + 2^(i_l)$ with $i_1 < dots.c < i_l$ #j[inductive hypothesis]. If $k + 1 = 2m$, then $k + 1 = 2^(i_1 + 1) + dots.c + 2^(i_l + 1)$. If $k + 1 = 2m + 1$, then $k + 1 = 2^0 + 2^(i_1 + 1) + dots.c + 2^(i_l + 1)$, and $0 < i_1 + 1$. Exponents stay distinct. \
*Q7.* $a_0 = 0, a_1 = 2, a_2 = 7$, $a_(n+3) = a_(n+2) + a_(n+1) + a_n$. Basis: $0 < 1$, $2 < 3$, $7 < 9$. Step: if $P(k), P(k+1), P(k+2)$ hold, then $a_(k+3) < 3^(k+2) + 3^(k+1) + 3^k < 3 dot 3^(k+2) = 3^(k+3)$. #qed]

#exam[T7 Q8 (AY23/24 S1 exam) · T8 Q9 (AY22/23 S2 exam) · T7 Q9 · Fibonacci and Hanoi][
*T7 Q8.* $P(a, b) equiv F(a + b) = F(a + 1) F(b) + F(a) F(b - 1)$. Basis: $P(0, b)$: $F(b) = 1 dot F(b) + 0 dot F(b - 1)$; $P(1, b)$: $F(b + 1) = F(b) + F(b - 1) = F(2) F(b) + F(1) F(b - 1)$. Step: $F(k + 1 + b) = F(k + b) + F(k - 1 + b)$ #j[definition of $F$] $= (F(k+1) F(b) + F(k) F(b-1)) + (F(k) F(b) + F(k-1) F(b-1))$ #j[$P(k, b)$, $P(k - 1, b)$] $= (F(k+1) + F(k)) F(b) + (F(k) + F(k-1)) F(b - 1)$ #j[distributive law, twice] $= F(k + 2) F(b) + F(k + 1) F(b - 1)$. \
*T8 Q9.* $"Even"(F_n) <=> "Even"(F_(n+3))$. Basis $P(0)$: $F_0 = 0$, $F_3 = 2$; $P(1)$: $F_1 = 1$, $F_4 = 3$. Step ($k >= 1$): $"Even"(F_(k+1)) <=> ("Even"(F_k) <=> "Even"(F_(k-1)))$ #j[Fact 1] $<=> ("Even"(F_(k+3)) <=> "Even"(F_(k+2)))$ #j[$P(k)$, $P(k - 1)$] $<=> "Even"(F_(k+4))$ #j[Fact 1]. \
*T7 Q9, Tower of Hanoi.* $T(1) = 1$. To move $k + 1$ disks: move the top $k$ to the spare peg ($2^k - 1$ moves, IH), move the largest (1 move), move the $k$ back on top ($2^k - 1$ moves). $T(k + 1) = 2(2^k - 1) + 1 = 2^(k+1) - 1$.]

#defn[Well-Ordering Principle for the integers (L8 s43)][
*Every non-empty subset of $ZZ_(>= 0)$ has a smallest element.* (Epp's version allows any set of integers bounded below; the course uses the statement above.)]

#proofb[Well-Ordering Principle, proved by 2PI (L8 s44) · L8 Ex. 17][
+ Suppose not: let $S subset.eq ZZ_(>= 0)$ be non-empty with no smallest element.
+ For $n in ZZ_(>= 0)$ let $P(n) equiv (n in.not S)$.
+ Let $k in ZZ_(>= 0)$ with $P(0), dots, P(k - 1)$ true, i.e. $0, 1, dots, k - 1 in.not S$. If $k in S$, then $k$ is the smallest element of $S$, contradicting line 1. So $k in.not S$ and $P(k)$ is true. (For $k = 0$ the hypothesis is empty, so this also gives the basis.)
+ Hence $P(n)$ is true for all $n in ZZ_(>= 0)$ #j[2PI], so $S = nothing$, contradicting line 1. #qed
*Ex. 17.* (a) The positive reals have no least element ($x slash 2 < x$); no violation, as WOP concerns sets of integers. (b) ${n in ZZ_(>= 0) : n^2 < n} = nothing$; no violation, as WOP concerns non-empty sets. (c) Non-negative integers of the form $46 - 7k$: $dots, 18, 11, 4$; least element 4.]

== 34 · Recursion and structural induction

#defn[Recurrence relation, initial conditions (L8 s48)][
A *recurrence relation* for $a_0, a_1, a_2, dots$ is a formula relating each term $a_k$ to certain predecessors $a_(k-1), a_(k-2), dots, a_(k-i)$. The *initial conditions* give the first terms $a_0, dots, a_(i-1)$. \
Examples: $F_n = F_(n-1) + F_(n-2)$ with $F_0 = 0, F_1 = 1$; $quad 0! = 1$, $n! = n dot (n - 1)!$; $quad a^0 = 1$, $a^n = a^(n-1) dot a$.]

#defn[Recursively defined set (L8 s56, s58) · Structural induction (L8 s58)][
A recursive definition of a set $S$ has three clauses:
- *(base clause)* certain elements, the *founders*, are in $S$;
- *(recursion clause)* $S$ is closed under certain functions, the *constructors*: if $f$ is a constructor and $x in S$, then $f(x) in S$;
- *(minimality clause)* membership of $S$ can always be demonstrated by finitely many successive applications of the clauses above.
*Structural induction over $S$.* To prove $forall x in S thin P(x)$, it suffices to show \
*(basis step)* $P(c)$ for every founder $c$; and *(induction step)* $forall x in S thin (P(x) => P(f(x)))$ for every constructor $f$.]

#example[L8 Ex. 21–24 · Recursively defined sets][
- $ZZ_(>= 0)$: founder 0; constructor $x |-> x + 1$. $quad 2 ZZ$: founder 0; constructors $x |-> x - 2$ and $x |-> x + 2$.
- *Legal parentheses $P$:* base $() in P$; if $E in P$ then $(E) in P$; if $E, F in P$ then $E F in P$. Derivation of $(())()$: $()$ by the base; $(())$ by rule (a) with $E = ()$; $(())()$ by rule (b) with $E = (())$, $F = ()$.
- *Ex. 24.* $1 in S$; $x in S => 2x in S and 3x in S$. Then $S = {2^a 3^b : a, b in NN}$: $9, 12 in S$ and $10, 11, 13 in.not S$ (each has a prime factor other than 2 and 3).]

#tip[Membership questions on a recursive set][
*To show $x in S$:* write a derivation, one clause per line. \
*To show $x in.not S$:* find an *invariant* $P$ true of every founder and preserved by every constructor, with $P(x)$ false; prove $forall y in S thin P(y)$ by structural induction.]

#proofb[T7 Q10 · $2 in S$; $x in S => 3x in S and x^2 in S$. Which of $0, 6, 15, 16, 36$ are in $S$?][
$6 = 3 dot 2 in S$; $36 = 6^2 in S$; $4 = 2^2 in S$, so $16 = 4^2 in S$. \
*$0 in.not S$:* every $n in S$ satisfies $n >= 2$.
+ Let $P(n) equiv (n >= 2)$ for $n in S$.
+ (Basis step) $2 >= 2$, so $P(2)$ is true.
+ (Induction step) Let $x in S$ with $x >= 2$. Then $3x >= 6 >= 2$ and $x^2 >= 4 >= 2$, so $P(3x)$ and $P(x^2)$ are true.
+ Hence $forall n in S thin P(n)$ by structural induction over $S$. #qed
*$15 in.not S$:* every element of $S$ is even (2 is even; if $x$ is even so are $3x$ and $x^2$), by the same argument.]

#exam[T7 Q11 · AY25 final Q14–Q16 · Recursive sets of sets and strings][
*T7 Q11.* $A = {1,2,3,4,5}$, $B = {1,3,5,7,9}$ are founders; constructors $inter$, $union$, $without$. $C = {2,4,7,9} = (A without B) union (B without A) in S$. $D = {2,3,4,5} in.not S$: the invariant "$1 in X <=> 3 in X$" holds for $A$ and $B$ and is preserved by $inter$, $union$, $without$ (check the four cases of $1, 3 in X$ or not, $1, 3 in Y$ or not), but fails for $D$. \
*AY25 Q14, Q15.* $a in S$; $x in S => x a in S$; $x in S => b x b in S$. Elements of length at most 4: $a$; $a a$; $a a a$, $b a b$; $a a a a$, $b a b a$, $b a a b$: *7*. A string of length $n$ arises from one of length $n - 1$ (append $a$) or $n - 2$ (wrap in $b$), in exactly one way, so $G_n = G_(n-1) + G_(n-2)$ with $G_1 = G_2 = 1$: $G_n = F_n$. \
*AY25 Q16.* $S_0 = {1, 2, 3}$, $S_(n+1) = (S_n union {x + 3 : x in S_n}) without {2, 3}$. $S_1 = {1, 4, 5, 6}$, $S_2 = {1, 4, 5, 6, 7, 8, 9}$, and so on: the union of all $S_n$ is $ZZ^+$ (2 and 3 come from $S_0$).]
