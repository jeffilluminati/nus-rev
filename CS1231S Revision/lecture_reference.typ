// Shared reference for the condensed notes and the revision addendum.
// Primary theorem numbers and slide locations come from Lectures 1–6.
// Appendix A is the complete Properties of the Real Numbers appendix in Epp.
#let lecture-reference(thm, kbox, lnot, PP, dv, simq, pleq,
  appendix-heading: [Appendix A · Properties of the Real Numbers],
  theorem-heading: [Lecture theorem reference],
  full-theorems: true,
) = [
  #let lemma(title, body) = kbox("Lemma", rgb("#1f6f43"), rgb("#edf6f0"), title, body)
  #let corollary(title, body) = kbox("Corollary", rgb("#1f6f43"), rgb("#edf6f0"), title, body)
  #let proposition(title, body) = kbox("Proposition", rgb("#1f6f43"), rgb("#edf6f0"), title, body)
  #let axiom(title, body) = kbox("Axiom", rgb("#1f6f43"), rgb("#edf6f0"), title, body)
  #heading(level: 2, appendix-heading)

  *Source:* Appendix A, cited in Lecture 1, slide 26; Lecture 3, slide 81; and Lecture 4, slide 4. The complete appendix is reproduced here as a statement reference, including its final least upper bound axiom. The symbols $a, b, c, d$ below denote arbitrary *real numbers*, subject to each stated condition.

  === Appendix A · Field axioms F1–F6

  Addition and multiplication are binary operations on $RR$: if $a, b in RR$, then $a + b in RR$ and $a b in RR$.

  #table(columns: (1.4fr, 3fr),
    [Appendix A label], [Statement],
    [*Axiom F1* · Commutative laws], [$a + b = b + a$; $a b = b a$.],
    [*Axiom F2* · Associative laws], [$(a + b) + c = a + (b + c)$; \
      $(a b)c = a(b c)$.],
    [*Axiom F3* · Distributive laws], [$a(b + c) = a b + a c$; \
      $(b + c)a = b a + c a$.],
    [*Axiom F4* · Identity elements], [There are distinct $0, 1 in RR$ such that \
      $0 + a = a + 0 = a$ and $1 dot a = a dot 1 = a$.],
    [*Axiom F5* · Additive inverses], [For each $a$, there is $-a in RR$ with \
      $a + (-a) = (-a) + a = 0$.],
    [*Axiom F6* · Reciprocals], [For each $a != 0$, there is $a^(-1) = 1 slash a in RR$ with \
      $a dot a^(-1) = a^(-1) dot a = 1$.],
  )

  === Appendix A · Theorems T1–T16 (algebra)

  #table(columns: (1.4fr, 3fr),
    [Appendix A label], [Statement],
    [*Theorem T1* · Addition cancellation], [If $a + b = a + c$, then $b = c$. The additive identity $0$ is unique.],
    [*Theorem T2* · Subtraction], [For each $a, b$, exactly one $x$ satisfies $a + x = b$. This $x$ is denoted $b - a$; $0 - a = -a$.],
    [*Theorem T3*], [$b - a = b + (-a)$.],
    [*Theorem T4*], [$-(-a) = a$.],
    [*Theorem T5*], [$a(b - c) = a b - a c$.],
    [*Theorem T6*], [$0 dot a = a dot 0 = 0$.],
    [*Theorem T7* · Multiplication cancellation], [If $a b = a c$ and $a != 0$, then $b = c$. The multiplicative identity $1$ is unique.],
    [*Theorem T8* · Division], [For $a != 0$, exactly one $x$ satisfies $a x = b$. This $x$ is denoted $b slash a$; $1 slash a$ is the reciprocal of $a$.],
    [*Theorem T9*], [If $a != 0$, then $b slash a = b dot a^(-1)$.],
    [*Theorem T10*], [If $a != 0$, then $(a^(-1))^(-1) = a$.],
    [*Theorem T11* · Zero product], [If $a b = 0$, then $a = 0$ or $b = 0$.],
    [*Theorem T12* · Negative signs], [$(-a)b = a(-b) = -(a b)$; $(-a)(-b) = a b$. \
      If $b != 0$, $-(a slash b) = (-a) slash b = a slash (-b)$.],
    [*Theorem T13* · Equivalent fractions], [If $b != 0$ and $c != 0$, then \
      $a slash b = (a c) slash (b c)$.],
    [*Theorem T14* · Addition of fractions], [If $b != 0$ and $d != 0$, then \
      $a slash b + c slash d = (a d + b c) slash (b d)$.],
    [*Theorem T15* · Multiplication of fractions], [If $b != 0$ and $d != 0$, then \
      $(a slash b)(c slash d) = (a c) slash (b d)$.],
    [*Theorem T16* · Division of fractions], [If $b != 0$, $c != 0$ and $d != 0$, then \
      $(a slash b) slash (c slash d) = (a d) slash (b c)$.],
  )

  === Appendix A · Order axioms Ord1–Ord3

  #block(breakable: false)[
    #table(columns: (1.4fr, 3fr),
      [Appendix A label], [Statement],
      [*Axiom Ord1*], [If $a$ and $b$ are positive, then $a + b$ and $a b$ are positive.],
      [*Axiom Ord2*], [If $a != 0$, exactly one of $a$ and $-a$ is positive.],
      [*Axiom Ord3*], [$0$ is not positive.],
    )
  ]

  *Appendix A · Order definitions:* $a < b$ means $b + (-a)$ is positive; $b > a$ means $a < b$. Also, $a <= b$ means $a < b$ or $a = b$, and $b >= a$ means $a <= b$. A number $a$ is *negative* if $a < 0$, and *nonnegative* if $a >= 0$.

  === Appendix A · Theorems T17–T27 (order)

  #table(columns: (1.4fr, 3fr),
    [Appendix A label], [Statement],
    [*Theorem T17* · Trichotomy], [Exactly one holds: $a < b$, $b < a$, or $a = b$.],
    [*Theorem T18* · Transitivity], [If $a < b$ and $b < c$, then $a < c$.],
    [*Theorem T19*], [If $a < b$, then $a + c < b + c$.],
    [*Theorem T20*], [If $a < b$ and $c > 0$, then $a c < b c$.],
    [*Theorem T21*], [If $a != 0$, then $a^2 > 0$.],
    [*Theorem T22*], [$1 > 0$.],
    [*Theorem T23*], [If $a < b$ and $c < 0$, then $a c > b c$.],
    [*Theorem T24*], [If $a < b$, then $-a > -b$. In particular, if $a < 0$, then $-a > 0$.],
    [*Theorem T25*], [If $a b > 0$, then $a$ and $b$ are both positive or both negative.],
    [*Theorem T26*], [If $a < c$ and $b < d$, then $a + b < c + d$.],
    [*Theorem T27*], [If $0 < a < c$ and $0 < b < d$, then $0 < a b < c d$.],
  )

  #axiom[Appendix A · Axiom LUB · Least upper bound][
  Every nonempty subset $S$ of $RR$ that is bounded above has a least upper bound in $RR$. Explicitly, let \
  $B = {u in RR : forall s in S, s <= u}$. \
  If $S != nothing$ and $B != nothing$, then there is $ell in B$ such that $forall u in B, ell <= u$. This $ell$ is the *least upper bound* (supremum) of $S$. This axiom holds for $RR$; the analogous statement for subsets and bounds in $QQ$ fails.]

  *Lecture 4, slide 4 · Additional assumptions:* equality is reflexive, symmetric and transitive for all objects; no integer lies strictly between $0$ and $1$; and $ZZ$ is closed under addition, subtraction and multiplication. Lecture 1 additionally permits the even/odd dichotomy (Assumption 1, slide 27) and reduction of every rational to lowest terms (Assumption 2, slide 37).

  #if full-theorems [
  #pagebreak(weak: true)
  #heading(level: 2, theorem-heading)

  *Numbering:* the primary labels below are the labels in the supplied lecture slides. Lemma and proposition labels are preserved. Results with no number in the slides are identified by lecture and slide.

  === Theorem 2.1.1 · Logical equivalences

  *Source:* Lecture 2, slides 25–26. Let $p, q, r$ be statement variables, $bold(t)$ a tautology, and $bold(c)$ a contradiction.

  #table(columns: (1.25fr, 3fr),
    [Law in Theorem 2.1.1], [Equivalences],
    [1 · Commutative], [$p and q equiv q and p$; $p or q equiv q or p$.],
    [2 · Associative], [$(p and q) and r equiv p and (q and r)$; \
      $(p or q) or r equiv p or (q or r)$.],
    [3 · Distributive], [$p and (q or r) equiv (p and q) or (p and r)$; \
      $p or (q and r) equiv (p or q) and (p or r)$.],
    [4 · Identity], [$p and bold(t) equiv p$; $p or bold(c) equiv p$.],
    [5 · Negation], [$p or lnot p equiv bold(t)$; $p and lnot p equiv bold(c)$.],
    [6 · Double negative], [$lnot(lnot p) equiv p$.],
    [7 · Idempotent], [$p and p equiv p$; $p or p equiv p$.],
    [8 · Universal bound], [$p or bold(t) equiv bold(t)$; $p and bold(c) equiv bold(c)$.],
    [9 · De Morgan], [$lnot(p and q) equiv lnot p or lnot q$; \
      $lnot(p or q) equiv lnot p and lnot q$.],
    [10 · Absorption], [$p or (p and q) equiv p$; $p and (p or q) equiv p$.],
    [11 · Negation of true/false], [$lnot bold(t) equiv bold(c)$; $lnot bold(c) equiv bold(t)$.],
  )

  === Theorems 3.2.1 and 3.2.2 · Quantifier negation

  #thm[Theorem 3.2.1 · Negation of a universal statement][
  $lnot(forall x in D, P(x)) equiv exists x in D, lnot P(x)$. \
  "Not all satisfy $P$" means "some do not satisfy $P$". *Source:* Lecture 3, slide 29.]

  #thm[Theorem 3.2.2 · Negation of an existential statement][
  $lnot(exists x in D, P(x)) equiv forall x in D, lnot P(x)$. \
  "None satisfy $P$" means "all fail $P$". *Source:* Lecture 3, slide 30.]

  === Number theory · Slide-numbered results

  #thm[Theorem 4.2.1 · Every integer is rational][
  For every $n in ZZ$, $n in QQ$. *Source:* Lecture 4, slide 19.]

  #thm[Theorem 4.2.2 · Sum of rational numbers][
  For every $r, s in QQ$, $r + s in QQ$. *Sources:* Lecture 1, slide 25; Lecture 4, slide 20.]

  #corollary[Corollary 4.2.3 · Double of a rational number][
  For every $r in QQ$, $2r in QQ$. *Sources:* Lecture 1, slide 25; Lecture 4, slide 21.]

  #thm[Theorem 4.3.1 · A positive divisor of a positive integer][
  For every $a, b in ZZ^+$, if $a dv b$, then $a <= b$. *Source:* Lecture 4, slide 24.]

  #thm[Theorem 4.3.2 · Divisors of 1][
  The only integer divisors of $1$ are $1$ and $-1$. *Source:* Lecture 4, slide 25.]

  #thm[Theorem 4.3.3 · Transitivity of divisibility][
  For every $a, b, c in ZZ$, if $a dv b$ and $b dv c$, then $a dv c$. *Sources:* Lecture 4, slide 26; Lecture 6, slides 69–70.]

  #thm[Theorem 4.4.1 · Quotient–Remainder Theorem][
  For every $n in ZZ$ and $d in ZZ^+$, there are unique $q, r in ZZ$ such that \
  $n = d q + r$ and $0 <= r < d$. \
  *Source:* Lecture 5, slide 32.]

  #lemma[Lemma 4.4.4 · Absolute value bounds][
  For every $r in RR$, $-|r| <= r <= |r|$. *Source:* Lecture 1, slide 24.]

  #thm[Theorem 4.4.6 · Triangle inequality][
  For every $x, y in RR$, $|x + y| <= |x| + |y|$. *Source:* Lecture 1, slide 24.]

  #thm[Theorem 4.6.1 · There is no greatest integer][
  For every $n in ZZ$, there is $m in ZZ$ with $m > n$. *Source:* Lecture 4, slide 29.]

  #proposition[Proposition 4.6.4 · Even square implies even integer][
  For every $n in ZZ$, if $n^2$ is even, then $n$ is even. *Sources:* Lecture 1, slide 38; Lecture 4, slides 31–32.]

  #thm[Theorem 4.7.1 · Irrationality of the square root of 2][
  $sqrt(2) in.not QQ$. *Sources:* Lecture 1, slides 36, 39; Lecture 4, slide 28.]

  === Set theory · Slide-numbered results

  #thm[Theorem 6.2.1 · Some subset relations][
  For all sets $A, B, C$:
  - *Inclusion of intersection:* $A inter B subset.eq A$ and $A inter B subset.eq B$.
  - *Inclusion in union:* $A subset.eq A union B$ and $B subset.eq A union B$.
  - *Transitivity:* if $A subset.eq B$ and $B subset.eq C$, then $A subset.eq C$.
  *Source:* Lecture 5, slide 40.]

  === Theorem 6.2.2 · Set identities

  *Source:* Lecture 5, slides 42–43. All sets below are subsets of the same universal set $U$.

  #table(columns: (1.25fr, 3fr),
    [Law in Theorem 6.2.2], [Identities],
    [1 · Commutative], [$A union B = B union A$; $A inter B = B inter A$.],
    [2 · Associative], [$(A union B) union C = A union (B union C)$; \
      $(A inter B) inter C = A inter (B inter C)$.],
    [3 · Distributive], [$A union (B inter C) = (A union B) inter (A union C)$; \
      $A inter (B union C) = (A inter B) union (A inter C)$.],
    [4 · Identity], [$A union nothing = A$; $A inter U = A$.],
    [5 · Complement], [$A union overline(A) = U$; $A inter overline(A) = nothing$.],
    [6 · Double complement], [$overline(overline(A)) = A$.],
    [7 · Idempotent], [$A union A = A$; $A inter A = A$.],
    [8 · Universal bound], [$A union U = U$; $A inter nothing = nothing$.],
    [9 · De Morgan], [$overline(A union B) = overline(A) inter overline(B)$; \
      $overline(A inter B) = overline(A) union overline(B)$.],
    [10 · Absorption], [$A union (A inter B) = A$; $A inter (A union B) = A$.],
    [11 · Complements of $U$, $nothing$], [$overline(U) = nothing$; $overline(nothing) = U$.],
    [12 · Set difference], [$A without B = A inter overline(B)$.],
  )

  #thm[Theorem 6.2.4 · The empty set][
  For every set $A$, $nothing subset.eq A$. *Source:* Lecture 5, slide 15.]

  #thm[Theorem 6.3.1 · Cardinality of a power set][
  If $A$ is a *finite* set with $|A| = n$, then $|PP(A)| = 2^n$. *Source:* Lecture 5, slides 34–36 (the named theorem on slide 34 receives this number on slide 36).]

  === Relations · Slide-numbered results

  #thm[Theorem 8.3.1 · Relation induced by a partition][
  If $cal(C)$ is a partition of $A$ and $x R y$ means that $x$ and $y$ lie in the same component of $cal(C)$, then $R$ is reflexive, symmetric and transitive, hence an equivalence relation on $A$. *Source:* Lecture 6, slide 39.]

  #lemma[Lemma Rel.1 · Equivalence classes][
  Let $tilde.op$ be an equivalence relation on $A$. For every $x, y in A$, the following are equivalent:
  + $x tilde.op y$.
  + $[x]_simq = [y]_simq$.
  + $[x]_simq inter [y]_simq != nothing$.
  *Source:* Lecture 6, slides 47–49.]

  #thm[Theorem 8.3.4 · Theorem Rel.2 · Equivalence classes form a partition][
  If $tilde.op$ is an equivalence relation on $A$, its distinct equivalence classes form a partition of $A$: \
  $A slash simq = {[x]_simq : x in A}$. \
  Each class is nonempty, their union is $A$, and distinct classes are disjoint. *Sources:* Lecture 6, slide 50 (Theorem 8.3.4), slides 57–59 (Theorem Rel.2). These are two slide labels for the same result.]

  === Propositions without theorem numbers in the slides

  #proposition[Proposition · Composition is associative (Lecture 6, slide 18)][
  Let $R subset.eq A times B$, $S subset.eq B times C$, and $T subset.eq C times D$. Then \
  $T compose (S compose R) = (T compose S) compose R$.]

  #proposition[Proposition · Inverse of composition (Lecture 6, slide 18)][
  Let $R subset.eq A times B$ and $S subset.eq B times C$. Then \
  $(S compose R)^(-1) = R^(-1) compose S^(-1)$.]

  #proposition[Proposition · Congruence (Lecture 6, slide 54)][
  For every $n in ZZ^+$, the relation $a equiv b space (mod n)$ defined by $n dv (a - b)$ is an equivalence relation on $ZZ$.]

  #proposition[Proposition · A smallest element is minimal (Lecture 6, slide 83)][
  In any poset $(A, pleq)$, every smallest element is minimal. Likewise, every largest element is maximal.]
  ] else [
    #heading(level: 2, theorem-heading)
    Theorems are stated with their proofs or definitions in the listed sections. Labels match the slides. *L* = lecture; *s* = slide.
    #table(columns: (1.35fr, 1.8fr, auto, auto),
      [Slide label], [Topic], [Source], [Section],
      [Theorem 2.1.1], [Logical equivalences], [L2 s25–26], [§2],
      [Theorem 3.2.1; Theorem 3.2.2], [Negating $forall$; negating $exists$], [L3 s29–30], [§6],
      [Theorem 4.2.1], [Integers are rational], [L4 s19], [§12],
      [Theorem 4.2.2; Corollary 4.2.3], [Sum; double of a rational], [L4 s20–21], [§12],
      [Theorem 4.3.1], [Positive divisor bound], [L4 s24], [§12],
      [Theorem 4.3.2], [Divisors of 1], [L4 s25], [§12],
      [Theorem 4.3.3], [Transitivity of divisibility], [L4 s26], [§12],
      [Theorem 4.4.1], [Quotient–remainder], [L5 s32], [§10],
      [Lemma 4.4.4; Theorem 4.4.6], [Absolute value bounds; triangle inequality], [L1 s24], [§12],
      [Theorem 4.6.1], [No greatest integer], [L4 s29], [§12],
      [Proposition 4.6.4], [Even square implies even integer], [L1 s38; L4 s31–32], [§9],
      [Theorem 4.7.1], [Irrationality of $sqrt(2)$], [L1 s36, 39; L4 s28], [§12],
      [Theorem 6.2.1], [Subset relations], [L5 s40], [§16],
      [Theorem 6.2.2], [Set identities], [L5 s42–43], [§2],
      [Theorem 6.2.4], [Empty set], [L5 s15], [§14],
      [Theorem 6.3.1], [Power-set cardinality], [L5 s34–36], [§18],
      [Theorem 8.3.1], [Relation induced by a partition], [L6 s39], [§23],
      [Lemma Rel.1], [Equal or disjoint classes], [L6 s47–49], [§23],
      [Theorem 8.3.4; Theorem Rel.2], [Classes partition the underlying set], [L6 s50, 57–59], [§23],
      [Propositions (unnumbered)], [Composition: associativity; inverse], [L6 s18], [§20],
      [Proposition (unnumbered)], [Congruence is an equivalence relation], [L6 s54], [§23],
      [Proposition (unnumbered)], [Smallest implies minimal], [L6 s83], [§24],
    )
  ]
]
