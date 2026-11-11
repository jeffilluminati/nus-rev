// ============================================================================
//  CS1231S Exam Exercise Sets
//  Seven topic sets of new questions modelled on the AY20/21 to AY25/26 finals
//  and Tutorials 6–11, with an answer key and worked solutions.
//  The sets assemble into two full mock papers in the AY25/26 format.
//  Compile:  typst compile CS1231S_Exam_Exercise_Sets.typ "CS1231S Exam Exercise Sets.pdf"
// ============================================================================
#import "exam_style.typ": *
#show: setup.with(
  doc-title: "CS1231S Exam Exercise Sets",
  running: [CS1231S · Exam Exercise Sets],
)

// ---- helpers ------------------------------------------------------------------
#let letters = ("A", "B", "C", "D", "E")
#let q(id, source, body, split: false) = block(width: 100%, above: 1.15em, below: 0.9em, breakable: split, {
  block(sticky: true, below: 0.5em, {
    text(weight: "bold", fill: accent)[#id]
    h(0.6em)
    text(size: 7.6pt, fill: muted)[#source]
  })
  body
})
#let opts(cols: 1, ..o) = pad(left: 1.2em, top: 0.15em, grid(
  columns: (1fr,) * cols, row-gutter: 0.55em, column-gutter: 1em,
  ..o.pos().enumerate().map(((i, x)) => grid(columns: (1.3em, 1fr), [#letters.at(i).], x)),
))
#let rom(..o) = pad(left: 1.2em, y: 0.15em, grid(
  columns: (2.2em, 1fr), row-gutter: 0.55em,
  ..o.pos().enumerate().map(((i, x)) => ([(#numbering("i", i + 1))], x)).flatten(),
))
// Structured-question parts. `work` lists the height of the ruled working panel under
// each part (none for no panel), sized to the marks the part carries.
#let workpanel(h) = block(width: 100%, height: h, above: 0.6em, below: 0.3em,
  stroke: 0.4pt + luma(200), radius: 1.5pt)[]
#let parts(work: (), ..o) = pad(left: 0.4em, y: 0.15em, grid(
  columns: (1.7em, 1fr), row-gutter: 0.7em,
  ..o.pos().enumerate().map(((i, x)) => ([(#numbering("a", i + 1))], {
    x
    let h = work.at(i, default: none)
    if h != none { workpanel(h) }
  })).flatten(),
))
#let mk(n) = { h(1fr); text(size: 8.4pt, fill: muted)[\[#n #if n == 1 [mark] else [marks]\]] }
#let nota = [None of options (A), (B), (C), (D) is correct.]
#let sol(id, answer, body) = block(width: 100%, above: 0.85em, below: 0.85em, breakable: true, {
  text(weight: "bold", fill: accent)[#id]
  h(0.5em)
  if answer != none { ans(answer); h(0.5em) }
  body
})
#let infobox(title, body) = kbox("Given", rgb("#44484f"), rgb("#f6f6f7"), title, body)

// ============================================================================
#text(size: 20pt, weight: "bold", fill: accent)[CS1231S · Exam Exercise Sets]
#v(2pt)
Seven sets of new questions written in the style of the CS1231S finals of AY20/21, AY22/23, AY23/24, AY24/25 and AY25/26 and of Tutorials 6–11. Each question names the past-paper or tutorial question it is modelled on, so the original can be attempted afterwards. Answers and worked solutions start after Set 7.

*Final exam format (AY24/25 and AY25/26):* 2 hours, open book, 100 marks: 23 MCQ worth 2 marks each (46), then Q24 Counting and Probability (20), Q25 Graphs and Trees (20) and Q26 on functions or induction (14). Pace: about 2 minutes per MCQ and 20 to 25 minutes per structured question.

*Conventions:* $NN = {0, 1, 2, ...}$; $lnot p$ is the negation of $p$; $PP(A)$ is the power set of $A$; $g compose f$ applies $f$ first. Section references (§) point to the Exam Condensed.

#table(columns: (auto, 1.5fr, auto, 1.1fr, auto),
  [Set], [Topic], [Lectures], [Questions], [Condensed],
  [1], [Logic and proof], [L1–L4], [8 MCQ], [§1–12],
  [2], [Sets, relations and partial orders], [L5–L6], [10 MCQ], [§13–25],
  [3], [Functions], [L7], [6 MCQ, 2 structured], [§26–30],
  [4], [Induction and recursion], [L8], [6 MCQ, 2 structured], [§31–34],
  [5], [Cardinality], [L9], [6 MCQ, 1 structured], [§35–38],
  [6], [Counting and probability], [L10–L11], [4 MCQ, 2 structured], [§39–45],
  [7], [Graphs and trees], [L12–L13], [6 MCQ, 2 structured], [§46–52],
)

== Two mock papers from the sets

The 46 MCQs and six of the structured questions form two papers in the AY25/26 format. Sit each one in 2 hours with the Exam Condensed as the open book.

#table(columns: (auto, 1.6fr, auto, auto, auto),
  [Paper], [Part A: 23 MCQ (46 marks)], [Q24 (20)], [Q25 (20)], [Q26 (14)],
  [Mock 1], [the odd-numbered MCQs of every set: 1.1, 1.3, 1.5, 1.7, 2.1, 2.3, ..., 7.5], [6.5], [7.7], [3.7],
  [Mock 2], [the even-numbered MCQs of every set: 1.2, 1.4, 1.6, 1.8, 2.2, 2.4, ..., 7.6], [6.6], [7.8], [4.8],
)
Questions 3.8, 4.7 and 5.7 are written-proof questions in the style of the AY22/23 and AY23/24 papers and are extra practice.

== Past-paper questions by topic

#table(columns: (auto, 1fr, 1fr, 1fr, 1fr),
  [Topic], [AY25/26], [AY24/25], [AY23/24], [AY22/23],
  [Logic], [Q2–5], [Q2–5, 7], [Q2–5], [Q2–4],
  [Sets and relations], [Q6–9], [Q8–12, 14, 15], [Q6–10, 14], [Q5, 7–12],
  [Functions], [Q10–12, 26], [Q6, 13], [Q11–13, 23], [Q16, 24],
  [Induction, recursion], [Q14–16], [Q16, 17, 26], [Q15, 26], [Q14, 15, 21],
  [Cardinality], [Q13, 17, 18], [Q18, 19], [Q16], [Q6, 17, 25],
  [Counting, probability], [Q23, 24], [Q23, 24], [Q21, 22, 25], [Q13, 22],
  [Graphs and trees], [Q19–22, 25], [Q20–22, 25], [Q17–20, 24], [Q18–20, 23],
)
AY20/21 has a different layout: Q1–6, 14, 22 and 23 are on number theory, Q7–9 and 15–19 on relations and partial orders, Q10, 11 and 20 on counting and probability, Q12 and 21 on graphs and trees, and Q13 on quantifiers.

// ============================================================================
= Set 1 · Logic and Proof
// ============================================================================

#q[1.1][after AY24/25 Q2 · AY25/26 Q2][
Given the following argument on statement variables $p$, $q$ and $r$:
#pad(left: 2em)[$p <-> q$ \ $p and lnot q$ \ $therefore lnot r$]
Which of the following statements is true?
#opts(
  [The argument is a contradiction.],
  [The argument is invalid.],
  [The argument is valid and sound.],
  [The argument is valid but unsound.],
  nota,
)]

#q[1.2][after AY24/25 Q3][
Given the following arguments:
#pad(left: 1.2em, grid(columns: (1fr, 1fr, 1fr),
  [(i) #h(0.4em) $p -> q$ \ #h(1.9em) $lnot p -> q$ \ #h(1.9em) $therefore q$],
  [(ii) #h(0.4em) $p -> q$ \ #h(2.1em) $p -> r$ \ #h(2.1em) $therefore q -> r$],
  [(iii) #h(0.4em) $p or q$ \ #h(2.3em) $p -> r$ \ #h(2.3em) $q -> r$ \ #h(2.3em) $therefore r$],
))
Which of the above arguments are valid?
#opts(cols: 2,
  [Only (i).],
  [Only (i) and (iii).],
  [Only (ii) and (iii).],
  [All of (i), (ii) and (iii).],
  nota,
)]

#q[1.3][after AY25/26 Q3][
Given the following four statements on variables $p$, $q$, $r$ and $s$:
#pad(left: 2em)[$(p and q) -> r$ #h(2.5em) $lnot r$ #h(2.5em) $p or s$ #h(2.5em) $q$]
Assuming that all four statements are true, which of the following is true?
#opts(cols: 2,
  [$p <-> r$],
  [$s -> p$],
  [$lnot p and lnot s$],
  [$q -> p$],
  nota,
)]

#q[1.4][after AY23/24 Q3][
Define the logical connective $arrow.t$ as follows: $p arrow.t q equiv lnot (p and q)$. Which of the following is logically equivalent to
$ ((p arrow.t p) arrow.t (q arrow.t q)) -> (p arrow.t q) space ? $
#opts(cols: 2,
  [*true*],
  [$p or q$],
  [$lnot p or lnot q$],
  [$lnot p and lnot q$],
  nota,
)]

#q[1.5][after AY25/26 Q5 · AY23/24 Q5][
Let the predicate $P(x, y, z)$ mean $x y = z$. Which of the following statements are true?
#rom(
  [$forall x in ZZ space forall z in ZZ space exists y in ZZ space P(x, y, z)$],
  [$exists x in ZZ space forall z in ZZ space exists y in ZZ space P(x, y, z)$],
  [$exists z in ZZ space forall x in ZZ space exists y in ZZ space P(x, y, z)$],
)
#opts(cols: 2,
  [Only (i).],
  [Only (ii).],
  [Only (i) and (iii).],
  [Only (ii) and (iii).],
  nota,
)]

#q[1.6][after AY22/23 Q3 · AY25/26 Q4][
Which of the following statements is the negation of
$forall x space exists y space (P(x) -> (Q(y) and R(x, y)))$?
#opts(
  [$exists x space forall y space (P(x) -> lnot (Q(y) and R(x, y)))$],
  [$exists x space forall y space (P(x) and (Q(y) -> lnot R(x, y)))$],
  [$exists x space forall y space (lnot P(x) or lnot Q(y) or lnot R(x, y))$],
  [$forall x space exists y space (P(x) and lnot (Q(y) and R(x, y)))$],
  nota,
)]

#q[1.7][after AY24/25 Q4][
The following two statements are assumed to be true.
#pad(left: 2em)[No tutors are robots. \ Some robots are students.]
Assuming that the sets of tutors, robots and students are non-empty, which of the following statements must be true?
#rom(
  [Some students are not tutors.],
  [Some tutors are not students.],
  [No students are tutors.],
)
#opts(cols: 2,
  [Only (i).],
  [Only (ii).],
  [Only (i) and (iii).],
  [None of (i), (ii) and (iii).],
  nota,
)]

#q[1.8][after AY20/21 Q1, Q3][
For $n in ZZ$ and $d in ZZ^+$, $n mod d$ is the unique $r$ with $n = d q + r$ and $0 <= r < d$ for some $q in ZZ$. Which of the following statements are true?
#rom(
  [For all $a, b in ZZ$, if $a dv b$ and $b dv a$, then $a = b$.],
  [For all $n in ZZ$, $n^2 mod 4 in {0, 1}$.],
  [$-17 mod 5 = 3$.],
)
#opts(cols: 2,
  [Only (i).],
  [Only (iii).],
  [Only (i) and (ii).],
  [Only (ii) and (iii).],
  nota,
)]

// ============================================================================
= Set 2 · Sets, Relations and Partial Orders
// ============================================================================

#q[2.1][after AY22/23 Q5][
Which of the following statements are true for all sets $A$ and $B$?
#rom(
  [$PP(A without B) subset.eq PP(A) without PP(B)$.],
  [$PP(A) union PP(B) subset.eq PP(A union B)$.],
  [If $PP(A) = PP(B)$, then $A = B$.],
)
#opts(cols: 2,
  [Only (ii).],
  [Only (i) and (ii).],
  [Only (ii) and (iii).],
  [All of (i), (ii) and (iii).],
  nota,
)]

#q[2.2][after AY23/24 Q6][
Let $B = {nothing, {1}, {1, {2}}, {{1}}}$. What is the set ${x : x in Y "for some" Y in B}$?
#opts(cols: 2,
  [${1, 2}$],
  [${1, {1}, {2}}$],
  [${nothing, 1, {1}, {2}}$],
  [${1, {2}}$],
  nota,
)]

#q[2.3][after AY25/26 Q6, Q7][
Let $A$ be a non-empty set and let $R = nothing$ be the empty relation on $A$. Which of the following statements are true?
#rom(
  [$R$ is symmetric.],
  [$R$ is antisymmetric.],
  [$R$ is transitive.],
  [$R$ is reflexive.],
)
#opts(cols: 2,
  [Only (i) and (iii).],
  [Only (ii) and (iii).],
  [Only (i), (ii) and (iii).],
  [All of (i), (ii), (iii) and (iv).],
  nota,
)]

#q[2.4][after AY22/23 Q9 · T10 Q6][
Let $A$ be a set with three elements. How many relations on $A$ are both reflexive and symmetric?
#opts(cols: 5, [8], [16], [64], [512], [None of these.])]

#q[2.5][after AY25/26 Q8 · AY24/25 Q14][
Let $R$ and $S$ be equivalence relations on a non-empty set $A$. Which of the following statements are true?
#rom(
  [$R inter S$ is an equivalence relation on $A$.],
  [$R union S$ is an equivalence relation on $A$.],
  [$S compose R$ is reflexive.],
)
#opts(cols: 2,
  [Only (i).],
  [Only (i) and (iii).],
  [Only (ii) and (iii).],
  [All of (i), (ii) and (iii).],
  nota,
)]

#q[2.6][after AY23/24 Q8][
Define the following relation on $A = {1, 2, 3, 4}$:
$ R = {(1, 2), (2, 3), (3, 1), (4, 4)}. $
Which of the following is the relation $R compose R compose R compose R compose R$?
#opts(
  [$R$],
  [${(1, 1), (2, 2), (3, 3), (4, 4)}$],
  [${(1, 3), (2, 1), (3, 2)}$],
  [${(1, 3), (2, 1), (3, 2), (4, 4)}$],
  nota,
)]

#q[2.7][after AY24/25 Q12 · T6 Q10][
Define an equivalence relation $simq$ on $ZZ$ by setting, for all $x, y in ZZ$,
$ x simq y <=> x^2 = y^2. $
Define addition and multiplication on $ZZ slash simq$ as follows: whenever $[x], [y] in ZZ slash simq$,
$ [x] + [y] = [x + y] quad "and" quad [x] dot [y] = [x dot y]. $
Which of the following statements is true?
#opts(
  [Both $+$ and $dot$ are well defined on $ZZ slash simq$.],
  [$+$ is well defined on $ZZ slash simq$ but $dot$ is not.],
  [$dot$ is well defined on $ZZ slash simq$ but $+$ is not.],
  [Neither $+$ nor $dot$ is well defined on $ZZ slash simq$.],
)]

#q[2.8][after AY24/25 Q10 · AY20/21 Q18][
Define an equivalence relation $simq$ on $A = {1, 2, ..., 12}$ by: $x simq y$ if and only if $x$ and $y$ have the same number of positive divisors. How many equivalence classes are there?
#opts(cols: 5, [4], [5], [6], [7], [None of these.])]

#q[2.9][after AY22/23 Q12 · AY20/21 Q16][
Consider the partial order "divides" on the set $A = {2, 3, 4, 6, 9, 12, 18, 27}$. Which of the following statements are true?
#rom(
  [There is no largest element.],
  [2 is a smallest element.],
  [The maximal elements are exactly 12, 18 and 27.],
)
#opts(cols: 2,
  [Only (i).],
  [Only (iii).],
  [Only (i) and (iii).],
  [All of (i), (ii) and (iii).],
  nota,
)]

#q[2.10][after AY22/23 Q11 · AY23/24 Q14][
#grid(columns: (1fr, auto), column-gutter: 1em,
[A partial order $pleq$ on ${a, b, c, d, e}$ has the Hasse diagram on the right. How many distinct linearizations of $pleq$ are there?
#opts(cols: 5, [9], [10], [12], [15], [None of these.])],
hasse((([$a$], 0.3, 0.25), ([$b$], 1.5, 0.25), ([$c$], 0.9, 1.15), ([$d$], 2.1, 1.15), ([$e$], 2.1, 2.05)),
  ((0, 2), (1, 2), (1, 3), (3, 4)), w: 2.5cm, h: 2.3cm))]

// ============================================================================
= Set 3 · Functions
// ============================================================================

#q[3.1][after AY23/24 Q11 · T6 Q1][
Let $A$ and $B$ be sets. Let $R$ be a relation from $A$ to $B$ such that
$ forall (x, y) in A times B space (x R y <=> y^2 = x). $
For which of the following pairs of $A$ and $B$ is $R$ a function from $A$ to $B$?
#rom(
  [$A = {0, 1, 4}$ and $B = {0, 1, 2}$.],
  [$A = {0, 1, 4}$ and $B = {-1, 0, 1, 2}$.],
  [$A = {0, 1, 2}$ and $B = {0, 1}$.],
  [$A = nothing$ and $B = ZZ$.],
)
#opts(cols: 2,
  [Only (i).],
  [Only (i) and (iv).],
  [Only (ii) and (iii).],
  [Only (i), (ii) and (iv).],
  nota,
)]

#q[3.2][after AY24/25 Q6 · AY25/26 Q11][
Let $"Bool" = {"true", "false"}$. Define $f : "Bool"^2 -> "Bool"^2$ as follows:
$ f((p, q)) = (lnot q, space p <-> q). $
Which of the following statements is true?
#opts(
  [$f$ is not injective.],
  [$f$ is a bijection and $f compose f = idf_("Bool"^2)$.],
  [$f$ is a bijection and $f compose f compose f = idf_("Bool"^2)$.],
  [$f$ is a bijection and $f = f^(-1)$.],
  nota,
)]

#q[3.3][after AY25/26 Q10][
A function $f : X -> Y$ on sets of integers is _strictly increasing_ if $forall a, b in X space (a < b => f(a) < f(b))$. Given the following sets:
#pad(left: 2em)[
$F = {f : {1, 2, 3} -> {1, 2, 3, 4, 5} | f "is strictly increasing"}$, \
$G = {g : {1, 2} -> {1, 2, 3, 4} | g "is injective"}$, \
$H = {h : {1, 2, 3} -> {1, 2} | h "is surjective"}$.]
Which of the following statements is true?
#opts(cols: 2,
  [$|G| = 2 |H|$.],
  [$|F| = |G|$.],
  [$|F| < |H|$.],
  [$|G| < |F|$.],
  nota,
)]

#q[3.4][after AY23/24 Q12 · T6 Q6][
Let $f : A -> B$ and $g : B -> C$ be functions. Which of the following statements are true?
#rom(
  [If $g compose f$ is injective, then $f$ is injective.],
  [If $g compose f$ is injective, then $g$ is injective.],
  [If $g compose f$ is surjective, then $g$ is surjective.],
  [If $g compose f$ is surjective, then $f$ is surjective.],
)
#opts(cols: 2,
  [Only (i) and (ii).],
  [Only (i) and (iii).],
  [Only (ii) and (iv).],
  [Only (iii) and (iv).],
  nota,
)]

#q[3.5][after AY22/23 Q16 · AY23/24 Q13 · T6 Q7][
The _order_ of a bijection $f : A -> A$ is the smallest $n in ZZ^+$ such that $underbrace(f compose f compose dots.c compose f, n "many" f"'s") = idf_A$. Let $A = {1, 2, 3, 4, 5}$ and let the bijections $g, k : A -> A$ be
#pad(left: 2em)[
$g = {(1, 2), (2, 3), (3, 1), (4, 5), (5, 4)}$; \
$k = {(1, 1), (2, 3), (3, 2), (4, 5), (5, 4)}$.]
What are the orders of $g$ and of $g compose k$ respectively?
#opts(cols: 5, [3 and 2], [6 and 6], [5 and 3], [6 and 2], [None of these.])]

#q[3.6][after T6 Q9 · T6 Q2][
Let $f : ZZ -> ZZ$ be defined by $f(x) = x^2$. For $X subset.eq ZZ$, $f(X)$ is the image of $X$ and $f^(-1)(X)$ is the preimage of $X$. Which of the following statements are true?
#rom(
  [$f^(-1)(f({1, 2})) = {1, 2}$.],
  [$f(f^(-1)({1, 2, 4})) = {1, 2, 4}$.],
  [$f^(-1)({2, 3}) = nothing$.],
)
#opts(cols: 2,
  [Only (i).],
  [Only (iii).],
  [Only (i) and (ii).],
  [All of (i), (ii) and (iii).],
  nota,
)]

#q(split: true)[3.7 · Functions #h(0.4em) \[14 marks\]][after AY25/26 Q26 · T6 Q4, Q8][
Working is not required for this question.
#parts(work: (3cm, 3cm,),
[\[4 × 2 marks\] For each of the following functions, answer \
#pad(left: 1em)[
*A* if the function is neither injective nor surjective; \
*B* if the function is injective but not surjective; \
*C* if the function is not injective but is surjective; \
*D* if the function is both injective and surjective.]
#rom(
  [$f : ZZ -> ZZ$, #h(0.6em) $f(n) = cases(n + 1 & "if" n "is even;", n - 1 & "if" n "is odd.")$],
  [$g : PP({1, 2, 3}) -> {0, 1, 2, 3}$, #h(0.6em) $g(X) = |X|$.],
  [$h : ZZ^+ times ZZ^+ -> ZZ^+$, #h(0.6em) $h((a, b)) = 2^a dot 3^b$.],
  [$k : RR -> RR$, #h(0.6em) $k(x) = x^2 - 2x$.],
)],
[\[3 × 2 marks\] Let $zn(7) = {[0], [1], ..., [6]}$ be the set of equivalence classes of integers under congruence modulo 7. Define $z : zn(7) -> zn(7)$ by $z(x) = 3x + 2 space (mod 7)$. \
For a function $f$ and $n in ZZ^+$, $f^((n))(x)$ is the result of $n$ applications of $f$ to $x$; for example $f^((3))(x) = f(f(f(x)))$. The _order of an input_ $x$ with respect to $f$ is the smallest positive integer $m$ such that $f^((m))(x) = x$.
#rom(
  [What is $z^(-1)([4])$?],
  [What is $z^((2))(x)$?],
  [What is the order of $[1]$ with respect to $z$? Which element of $zn(7)$ has order 1?],
)],
)]

#q(split: true)[3.8 · Permutations and proofs #h(0.4em) \[14 marks\]][after AY23/24 Q23 · AY22/23 Q24 · T6 Q5][
Let $S_n = {1, 2, ..., n}$. A bijection $sigma : S_n -> S_n$ is a _permutation_. In _cycle notation_, write $(x space sigma(x) space sigma(sigma(x)) space dots.c)$, closing the bracket just before the value returns to $x$, then start a new cycle with an element not yet written, until every element of $S_n$ appears. For example, if $(sigma(1), ..., sigma(6)) = (2, 6, 5, 4, 3, 1)$, then $sigma = (1 space 2 space 6)(3 space 5)(4)$.
#parts(work: (2.5cm, 3.75cm, 2.5cm, 2.5cm, 6.25cm,),
[Write $sigma : S_6 -> S_6$ with $(sigma(1), sigma(2), sigma(3), sigma(4), sigma(5), sigma(6)) = (4, 6, 3, 5, 1, 2)$ in cycle notation. #mk(2)],
[Given $sigma_1 = (1 space 3 space 5)(2 space 4)(6)$ and $sigma_2 = (1 space 2)(3 space 6 space 4)(5)$ on $S_6$, write $sigma_1 compose sigma_2$ in cycle notation. #mk(3)],
[State the order of $sigma_1$ and the order of $sigma_1 compose sigma_2$. #mk(2)],
[Let $f, g : RR -> RR$ be bijections and define $h : RR -> RR$ by $h(x) = f(x) dot g(x)$. Give a counterexample to disprove the statement "$h$ is a bijection". #mk(2)],
[A function $g : B -> A$ is a _left inverse_ of $f : A -> B$ if and only if $g(f(a)) = a$ for all $a in A$. Prove that if $f$ has a left inverse, then $f$ is injective. Is the converse true when $A = nothing$ and $B != nothing$? #mk(5)],
)]

// ============================================================================
= Set 4 · Induction and Recursion
// ============================================================================

Questions 4.1 and 4.2 use the following set. A set $S$ of strings over the alphabet ${a, b}$ is recursively defined as follows:
#pad(left: 1.2em, grid(columns: (auto, 1fr, auto), column-gutter: 0.7em, row-gutter: 0.5em,
  [(1)], [$a in S$.], [(base clause)],
  [(2)], [If $x in S$, then $x b in S$.], [(recursion clause)],
  [(3)], [If $x in S$, then $a x a in S$.], [(recursion clause)],
  [(4)], [Membership for $S$ can always be demonstrated by finitely many successive applications of the clauses above.], [(minimality clause)],
))

#q[4.1][after AY25/26 Q14][
How many elements of $S$ have length at most 5?
#opts(cols: 5, [8], [10], [12], [16], [None of these.])]

#q[4.2][after AY25/26 Q15][
The Fibonacci sequence is given by $F_0 = 0$, $F_1 = 1$ and $F_n = F_(n-1) + F_(n-2)$ for $n > 1$. Let $G_n$ denote the number of elements of $S$ with length $n$. Which of the following is correct?
#opts(
  [$G_n = F_n$ for $n >= 1$.],
  [$G_n = F_(n+1)$ for $n >= 1$.],
  [$G_n = F_(n-1)$ for $n >= 1$.],
  [$G_n = 2^(n-2)$ for $n >= 2$.],
  nota,
)]

#q[4.3][after AY25/26 Q16 · T7 Q5][
A sequence of sets $S_0, S_1, S_2, ...$ is recursively defined as follows:
#pad(left: 1.2em, grid(columns: (auto, 1fr), column-gutter: 0.7em, row-gutter: 0.5em,
  [(1)], [$S_0 = {0}$.],
  [(2)], [For every integer $n >= 0$, $S_(n+1) = S_n union {x + 2 : x in S_n} union {x + 5 : x in S_n}$.],
))
What is $union.big_(n >= 0) S_n$?
#opts(cols: 2,
  [$NN$],
  [$NN without {1, 3}$],
  [${2k : k in NN} union {5k : k in NN}$],
  [$NN without {1}$],
  nota,
)]

#q[4.4][after AY24/25 Q17][
A set $T$ of strings over the alphabet ${0, 1}$ is recursively defined as follows, where $epsilon$ is the empty string:
#pad(left: 1.2em, grid(columns: (auto, 1fr), column-gutter: 0.7em, row-gutter: 0.5em,
  [(1)], [$epsilon in T$.],
  [(2)], [If $x in T$, then $0 x 1 in T$ and $1 x 0 in T$.],
  [(3)], [Membership for $T$ can always be demonstrated by finitely many successive applications of the clauses above.],
))
What is $T$?
#opts(
  [All binary strings with equally many 0's and 1's.],
  [All binary strings of even length.],
  [All binary strings $x_1 x_2 dots.c x_(2n)$, $n >= 0$, such that $x_i != x_(2n+1-i)$ for every $i in {1, ..., 2n}$.],
  [All binary strings of the form $0^n 1^n$ or $1^n 0^n$, $n >= 0$.],
  nota,
)]

#q[4.5][after AY22/23 Q14 · AY23/24 Q15 · T7 Q10][
A set $S$ of integers is recursively defined as follows:
#pad(left: 1.2em, grid(columns: (auto, 1fr), column-gutter: 0.7em, row-gutter: 0.5em,
  [(1)], [$1 in S$.],
  [(2)], [If $x in S$, then $2x in S$ and $x + 3 in S$.],
  [(3)], [Membership for $S$ can always be demonstrated by finitely many successive applications of the clauses above.],
))
Which of the following statements are true?
#rom(
  [$2026 in S$.],
  [$2025 in S$.],
  [$forall x in S space (x^2 in S)$.],
)
#opts(cols: 2,
  [Only (i) and (iii).],
  [Only (i).],
  [Only (ii).],
  [All of (i), (ii) and (iii).],
  nota,
)]

#q[4.6][after AY22/23 Q15][
Given the recurrence relation $a_n = a_(n-1) + 3n$ with initial value $a_0 = 2$, what is the value of $a_20$?
#opts(cols: 5, [602], [630], [632], [692], [None of these.])]

#q(split: true)[4.7 · Mathematical induction #h(0.4em) \[14 marks\]][after AY22/23 Q21 · AY23/24 Q26 · T7 Q7, T8 Q9][
Let $F_0, F_1, F_2, ...$ be the Fibonacci sequence: $F_0 = 0$, $F_1 = 1$ and $F_(n+1) = F_n + F_(n-1)$ for $n >= 1$.
#parts(work: (7.5cm, 7.5cm, 2.5cm,),
[Prove by mathematical induction that for all $n in ZZ^+$, #mk(6)
$ sum_(i=1)^n F_(2i-1) = F_(2n). $],
[Prove by mathematical induction that $F_n < 2^n$ for all $n in NN$, stating every basis step needed. #mk(6)],
[Aiken "proves" that $F_n = 0$ for all $n in NN$ as follows. Point out the mistake. #mk(2)
#pad(left: 1em)[
1. Let $P(n) equiv (F_n = 0)$. $P(0)$ is true since $F_0 = 0$. \
2. Let $k in NN$ and assume $P(i)$ is true for all $i$ with $0 <= i <= k$. \
3. Then $F_(k+1) = F_k + F_(k-1) = 0 + 0 = 0$ by the induction hypothesis, so $P(k+1)$ is true. \
4. Therefore $P(n)$ is true for all $n in NN$ by strong induction.]],
)]

#q(split: true)[4.8 · Recursively defined sets #h(0.4em) \[14 marks\]][after AY24/25 Q26][
Consider a set $S$ recursively defined by the following three clauses:
#pad(left: 2em)[
Clause (1): $2 in S$. \
Clause (2): If $x in S$, then $x + 3 in S$. \
Clause (3): If $x in S$, then $2x in S$.]
Membership in $S$ can always be demonstrated by finitely many applications of the three clauses. Let $"Bool" = {"true", "false"}$.
#parts(work: (2.5cm, 5cm, 5cm, 5cm,),
[The principle of mathematical induction for $ZZ^+$ is the following proof rule for any predicate $P : ZZ^+ -> "Bool"$:
#pad(left: 2em)[$P(1)$ \ $forall x in ZZ^+ space (P(x) => P(x + 1))$ \ $therefore forall x in ZZ^+ space P(x)$]
Write a suitable induction principle, in the same format, for $S$. #mk(2)],
[Indicate whether each of the following statements is true or false. #mk(4)
#pad(left: 1em, grid(columns: (1fr, 1fr), row-gutter: 0.6em,
  [(i) $forall x in S space (x >= 2)$.], [(ii) $forall x in S space (3 divides.not x)$.],
  [(iii) $16 in S$.], [(iv) $forall x in S space (x "is even" or x mod 3 = 2)$.],
))],
[Use your principle from part (a) to prove statement (ii) of part (b), if it is true, or give a counterexample if it is false. #mk(4)],
[Define $f : ZZ^+ -> NN$ by $f(x) = 0$ if $x in.not S$, and otherwise $f(x)$ is the minimum number of clause applications needed to generate $x$. For example, $f(2) = 1$ (clause (1) only) and $f(5) = 2$ since $5 = 2 + 3$. Find $f(7)$, $f(11)$, $f(16)$ and $f(20)$. #mk(4)],
)]

// ============================================================================
= Set 5 · Cardinality
// ============================================================================

#q[5.1][after AY25/26 Q17][
Which of the following statements are true?
#rom(
  [If set $A$ is countable and set $B$ is uncountable, then $B without A$ is uncountable.],
  [If sets $A$ and $B$ are uncountable, then $A inter B$ is uncountable.],
  [If $A subset.eq B$ and $A$ is uncountable, then $B$ is uncountable.],
)
#opts(cols: 2,
  [Only (i).],
  [Only (iii).],
  [Only (i) and (iii).],
  [All of (i), (ii) and (iii).],
  nota,
)]

#q[5.2][after AY22/23 Q17 · AY23/24 Q16 · T8 D3][
Which of the following sets are countable?
#rom(
  [The set of all finite subsets of $NN$.],
  [The set of all functions $f : NN -> {0, 1}$.],
  [The set of all functions $f : {0, 1} -> NN$.],
  [$QQ times QQ$.],
)
#opts(cols: 2,
  [Only (i), (iii) and (iv).],
  [Only (iv).],
  [Only (i) and (iv).],
  [All of (i), (ii), (iii) and (iv).],
  nota,
)]

#q[5.3][after AY24/25 Q18][
Which of the following statements are true?
#rom(
  [If $A subset.eq ZZ$, then $A$ is countable.],
  [If $A in PP(RR)$ and $A != nothing$, then $A$ is uncountable.],
  [If $ZZ subset.eq A$, then $A$ is infinite.],
)
#opts(cols: 2,
  [Only (i).],
  [Only (ii).],
  [Only (i) and (ii).],
  [Only (i) and (iii).],
  nota,
)]

#q[5.4][after AY22/23 Q6 · T8 Q7][
For a set $A$, suppose there exists a surjection $f : NN -> PP(A)$. Which of the following statements is true?
#opts(
  [$A$ must be finite.],
  [$A$ must be countably infinite.],
  [$A$ is countable, and both the finite and the countably infinite cases can occur.],
  [No such set $A$ exists.],
  nota,
)]

#q[5.5][after AY25/26 Q13][
An equivalence relation $simq$ on $RR$ is defined by: $x simq y$ if and only if $x - y in ZZ$. Let $Q = RR slash simq$ be the quotient set. Which of the following statements are true?
#rom(
  [Every equivalence class in $Q$ is countably infinite.],
  [$Q$ is countable.],
  [There exists a bijection $Q -> {x in RR : 0 <= x < 1}$.],
)
#opts(cols: 2,
  [Only (i).],
  [Only (i) and (ii).],
  [Only (i) and (iii).],
  [All of (i), (ii) and (iii).],
  nota,
)]

#q[5.6][after AY25/26 Q18 · AY24/25 Q19][
Which of the following statements are true?
#rom(
  [Every partition of $ZZ$ has a countably infinite component.],
  [Every partition of $ZZ$ into finitely many components has an infinite component.],
  [There is a partition of $ZZ$ into countably infinitely many components, each of which is countably infinite.],
)
#opts(cols: 2,
  [Only (ii).],
  [Only (iii).],
  [Only (i) and (ii).],
  [Only (ii) and (iii).],
  nota,
)]

#q(split: true)[5.7 · Cardinality #h(0.4em) \[10 marks\]][after AY22/23 Q25 · T8 Q1, Q2, Q4][
You may quote without proof: (1) a subset of a countable set is countable; (2) the union of two countable sets is countable; (3) $QQ$ is countable and $RR$ is uncountable.
#parts(work: (3.75cm, 5cm, 3.75cm,),
[Define a bijection $g : NN -> ZZ without {0}$. No proof is needed. #mk(3)],
[Let $A$ be an uncountable set and let $B subset.eq A$ be countable. Prove that $A without B$ is uncountable. #mk(4)],
[Prove that the set of irrational numbers is uncountable. #mk(3)],
)]

// ============================================================================
= Set 6 · Counting and Probability
// ============================================================================

#q[6.1][after AY23/24 Q21][
What is the smallest natural number $n$ such that in any set of $n$ numbers chosen from ${1, 2, ..., 20}$ there must be two numbers whose sum is 21?
#opts(cols: 5, [10], [11], [12], [20], [None of these.])]

#q[6.2][after AY23/24 Q22 · T9 Q5][
Four couples (eight people) sit around a circular table. In how many ways can they be seated so that Aiken and Dueet, who are one of the couples, do not sit next to each other?
#opts(cols: 5, [$7! - 2 times 6!$], [$7! - 6!$], [$8! - 2 times 7!$], [$2 times 6!$], [None of these.])]

#q[6.3][after AY24/25 Q23][
Two fair six-sided dice, one red and one blue, are rolled once. Define the following three events:
#pad(left: 2em)[
$A$: the red die shows an odd number. \
$B$: the blue die shows an odd number. \
$C$: the sum of the two dice is odd.]
Which of the following is true?
#opts(
  [Events $A$, $B$, $C$ have different probabilities.],
  [Events $A$, $B$, $C$ are not pairwise independent.],
  [Events $A$, $B$, $C$ are pairwise independent but not mutually independent.],
  [Events $A$, $B$, $C$ are mutually independent.],
  nota,
)]

#q[6.4][after AY25/26 Q23][
A yoghurt bar offers 8 toppings. Members may choose exactly 3 different toppings for a bowl; other customers choose exactly 2 different toppings. If 25% of the customers are members, what is the expected number of distinct bowls available to a customer?
#opts(cols: 5, [21], [28], [35], [56], [None of these.])]

#q(split: true)[6.5 · Counting and probability #h(0.4em) \[20 marks\]][after AY25/26 Q24][
Working is not required for this question.
#parts(work: (2.5cm, 2.5cm, 2.5cm, 2.5cm, 2.5cm, 2.5cm, 3.75cm, 2.5cm,),
[How many distinct arrangements are there of the nine letters of the word COMMITTEE? Write your answer as a single number. #mk(2)],
[A committee of 4 is to be formed from 7 men and 5 women such that there are at least 2 women. How many possible committees are there? Write your answer as a single number. #mk(2)],
[A password consists of 5 letters chosen from the 26 uppercase letters A to Z, with no letter repeated. The vowels are A, E, I, O and U. How many passwords contain exactly 2 vowels? Write your answer as a single number. #mk(2)],
[How many ways are there to seat $n$ couples ($2n$ people), $n > 1$, in a straight row of $2n$ seats if men and women must alternate? All people are distinct. #mk(2)],
[How many ways are there to seat $n$ couples ($2n$ people), $n > 1$, around a circular table if the $n$ men must occupy $n$ consecutive seats? All people are distinct. #mk(2)],
[A drawer contains 9 red, 6 blue, 5 green and 3 black socks. What is the minimum number of socks you must draw without looking to guarantee that you have 4 socks of the same colour? Write your answer as a single number. #mk(2)],
[You roll 3 fair dice. The dice are distinguishable. In how many ways can the sum of the 3 dice be 9? Write your answer as a single number. #mk(3)],
[(Total: 5 marks) A factory has two machines. Machine $A$ makes 60% of the items and machine $B$ makes 40%. An item from machine $A$ is defective with probability 0.02 and an item from machine $B$ is defective with probability 0.05. One item is chosen at random; let $D$ be the event that it is defective.
#rom(
  [Determine $P(D)$. #mk(2)],
  [Determine $P(B | D)$. #mk(2)],
  [The chosen item turns out to be *not* defective. Which machine is it more likely to have come from? #mk(1)],
)],
)]

#q(split: true)[6.6 · Counting and probability #h(0.4em) \[20 marks\]][after AY24/25 Q24 · AY23/24 Q25 · AY22/23 Q22 · AY20/21 Q20][
Working is not required for this question. Write each answer as a single number or a single fraction.
#parts(work: (2.5cm, 2.5cm, 2.5cm, 2.5cm, 2.5cm, 2.5cm, 2.5cm, 2.5cm,),
[How many integer solutions does $x_1 + x_2 + x_3 + x_4 = 15$ have, assuming that $x_i >= 0$? #mk(2)],
[How many integer solutions does the equation in (a) have, assuming that $x_i >= 0$, $x_1 >= 2$ and $x_2 >= 3$? #mk(2)],
[How many integer solutions does the equation in (a) have, assuming that $x_i >= 0$ and $x_4 <= 2$? #mk(2)],
[A loaded coin has probability 0.7 of landing heads. It is tossed four times. What is the probability of getting exactly two heads? #mk(2)],
[How many surjective functions are there from a set with 6 elements to a set with 3 elements? #mk(2)],
[Find the term independent of $x$ in the expansion of $(x^2 + 2/x)^6$. #mk(2)],
[(Total: 4 marks) Six couples (twelve persons) went to watch a horror movie. Three of the twelve persons, chosen at random, left the cinema hall in the middle of the movie.
#rom(
  [Fix an arbitrary couple. What is the probability that both persons of that couple watched the entire movie? #mk(2)],
  [What is the expected number of couples of which both persons watched the entire movie? #mk(2)],
)],
[(Total: 4 marks) Aaron draws two markers at random, one at a time and without replacement, from a box of red and blue markers.
#rom(
  [The box contains 5 red and 3 blue markers. What is the probability that the second marker drawn is red? #mk(2)],
  [Another box contains 16 markers, with more red markers than blue markers. The probability of drawing two markers of the same colour equals the probability of drawing two markers of different colours. How many red markers are in this box? #mk(2)],
)],
)]

// ============================================================================
= Set 7 · Graphs and Trees
// ============================================================================

#q[7.1][after AY25/26 Q20 · AY24/25 Q20 · AY20/21 Q12][
A directed graph has vertex set ${a, b, c}$ and exactly four edges: $(a, a)$, $(a, b)$, $(b, c)$ and $(c, a)$. Which of the following has the maximum number of walks of length 4 among all pairs of vertices?
#opts(cols: 2,
  [Vertex $a$ to vertex $b$.],
  [Vertex $a$ to vertex $a$.],
  [Vertex $c$ to vertex $a$.],
  [Vertex $b$ to vertex $c$.],
  nota,
)]

#q[7.2][after AY22/23 Q18 · AY24/25 Q22][
Which of the following statements are true?
#rom(
  [$K_(3,3) - {e}$ is planar, where $e$ is one of the edges of $K_(3,3)$.],
  [$K_6$ is Eulerian.],
  [Every planar representation of a connected simple planar graph with 8 vertices and 12 edges has 6 faces.],
)
#opts(cols: 2,
  [Only (i).],
  [Only (ii).],
  [Only (iii).],
  [Only (i) and (iii).],
  nota,
)]

#q[7.3][after AY22/23 Q20 · AY24/25 Q21][
How many non-isomorphic simple undirected graphs with 4 vertices and exactly 3 edges are there?
#opts(cols: 5, [2], [3], [4], [5], [None of these.])]

#q[7.4][after AY22/23 Q19 · AY23/24 Q18][
Which of the following statements are true?
#rom(
  [There is a simple undirected graph with 5 vertices of degrees 3, 3, 3, 3 and 2.],
  [Every simple undirected graph with 7 vertices and 16 edges is connected.],
  [Every graph in which every vertex has even degree has an Euler circuit.],
)
#opts(cols: 2,
  [Only (i) and (ii).],
  [Only (i).],
  [Only (ii) and (iii).],
  [All of (i), (ii) and (iii).],
  nota,
)]

#q[7.5][after AY25/26 Q21 · AY22/23 Q23(e)][
A certain binary tree $T$ has the following pre-order and in-order traversals:
#pad(left: 2em)[Pre-order: #h(0.5em) K D B F E P S Q \ In-order: #h(1em) B D E F K P Q S]
What is the post-order traversal of $T$?
#opts(cols: 2,
  [B D E F K P Q S],
  [E F B D Q S P K],
  [B E F D Q S P K],
  [B F E D S Q P K],
  nota,
)]

#q[7.6][after AY25/26 Q22][
How many distinct binary trees have the following pre-order and post-order traversals?
#pad(left: 2em)[Pre-order: #h(0.8em) P Q R S T U \ Post-order: #h(0.5em) R Q U T S P]
#opts(cols: 5, [2], [4], [8], [16], [None of these.])]

#q(split: true)[7.7 · Graphs and trees #h(0.4em) \[20 marks\]][after AY25/26 Q25 · AY24/25 Q25][
#infobox[Definitions][
The *chromatic number* $chi(G)$ of an undirected graph $G$ is the minimum number of colours required to colour the vertices of $G$ so that no two adjacent vertices have the same colour. \
The *cycle graph* $C_n$, $n >= 3$, is the connected graph on $n$ vertices that consists of a single cycle through every vertex. \
A *bipartite graph* $G = (U, V, E)$ has its vertices divided into disjoint sets $U$ and $V$ with every edge connecting a vertex of $U$ to a vertex of $V$. A *matching* is a set $F subset.eq E$ in which no two edges share a vertex; a *perfect matching* covers every vertex of the graph. \
*Hall's Marriage Theorem.* $G = (U, V, E)$ has a matching that covers all vertices in $U$ if and only if $|N(S)| >= |S|$ for every $S subset.eq U$, where $N(S)$ is the set of neighbours of $S$ in $V$.]
Working is not required. $K_n$ is the complete graph and $K_(m,n)$ the complete bipartite graph with $|U| = m$, $|V| = n$; assume $m, n >= 2$.
#parts(work: (2.5cm, 2.5cm, 2.5cm, 5cm, 6.25cm, 2.5cm, 3.75cm,),
[Is $K_(2,5)$ a planar graph? Answer "yes" or "no". #mk(2)],
[What is the necessary and sufficient condition on $n >= 3$ for $K_n$ to be an Eulerian graph? #mk(2)],
[What is the necessary and sufficient condition on $m, n >= 2$ for $K_(m,n)$ to have an Euler trail between two distinct vertices? #mk(2)],
[What is the chromatic number of each of the following graphs? #mk(4)
#pad(left: 1em)[(i) $K_2026$ #h(2em) (ii) $K_(20,26)$ #h(2em) (iii) $C_2026$ #h(2em) (iv) $C_2027$]],
[#block(breakable: false)[An undirected weighted graph is shown below. #mk(5)
#align(center, gdraw(
  (([$a$], 0.3, 1.9), ([$b$], 0.3, 0.3), ([$c$], 1.6, 1.1), ([$d$], 3.4, 1.1), ([$e$], 4.7, 0.3), ([$f$], 4.7, 1.9)),
  ((0, 1, 2), (1, 2, 2), (0, 2, 2), (2, 3, 5), (3, 4, 3), (4, 5, 3), (3, 5, 3), (1, 4, 6)),
  w: 5cm, h: 2.2cm))
(i) What is the weight of its minimum spanning tree? \
(ii) How many distinct minimum spanning trees does it have?]],
[Let $G_1 = (U, V, E)$ be a bipartite graph with $U = {a, b, c, d}$, $V = {w, x, y, z}$ and \ $E = {(a, w), (a, x), (b, x), (c, x), (c, y), (d, y), (d, z)}$. Is there a perfect matching for $G_1$? If there is, write out its edges; if there is not, give a set $S$ that violates the condition in Hall's Marriage Theorem. #mk(2)],
[Let $G_2 = (U, V, E)$ be a bipartite graph with $U = {a, b, c, d}$, $V = {w, x, y, z}$ and \ $E = {(a, w), (b, w), (c, w), (c, x), (c, y), (d, y), (d, z)}$. Is there a perfect matching for $G_2$? If there is, write out its edges; if there is not, give a set $S$ that violates the condition in Hall's Marriage Theorem. #mk(3)],
)]

#q(split: true)[7.8 · Graphs and trees #h(0.4em) \[20 marks\]][after AY23/24 Q24 · AY22/23 Q23 · AY20/21 Q21][
Working is not required for this question.
#parts(work: (2.5cm, 3.75cm, 3.75cm, 5cm, 2.5cm, 3.75cm, 3.75cm,),
[The edge weight matrix $W$ of a simple undirected graph is given below; the entry $w_(i,j)$ is the weight of the edge between vertex $i$ and vertex $j$. What is the weight of its minimum spanning tree? #mk(2)
$ W = mat(0, 2, 6, 4, 7; 2, 0, 3, 5, 7; 6, 3, 0, 3, 8; 4, 5, 3, 0, 6; 7, 7, 8, 6, 0) $],
[The adjacency matrix $A$ of a directed graph with vertex set ${v_1, v_2, v_3}$ is given below; the entry $a_(i,j)$ is the number of directed edges from $v_i$ to $v_j$. Find the number of walks of length 3 from $v_1$ to $v_3$. #mk(3)
$ A = mat(0, 1, 1; 1, 0, 2; 1, 0, 1) $],
[State whether each of the following statements is true or false. #mk(3)
#rom(
  [Every tree with at least two vertices has at least two vertices of degree 1.],
  [If a connected graph has exactly two vertices of odd degree, then it has an Euler trail but no Euler circuit.],
  [If $G$ is a connected simple graph with $n$ vertices and $n$ edges, then removing any one edge of $G$ leaves a tree.],
)],
[A simple undirected graph $G$ has 10 vertices and exactly 2 connected components. Find (i) the maximum and (ii) the minimum number of edges in $G$. #mk(4)],
[The pre-order and post-order traversals of a full binary tree are given below. What is the in-order traversal of the tree? #mk(2)
#pad(left: 2em)[Pre-order: #h(0.8em) R A C D B E F G H \ Post-order: #h(0.5em) C D A E G H F B R]],
[A _binary search tree_ (BST) is a binary tree in which, for every vertex with value $x$, all values in its left subtree are smaller than $x$ and all values in its right subtree are greater than $x$. Find the number of distinct BSTs (i) on the 5 values 1, 2, 3, 4, 5, and (ii) on these 5 values with 3 at the root. #mk(3)],
[Six modules $A, B, C, D, E, F$ need exam slots. Two modules _conflict_ if some student takes both, and conflicting modules need different slots. The conflict list is
#pad(left: 2em)[$A$: $B, C$; #h(1em) $B$: $A, C, D$; #h(1em) $C$: $A, B, D$; #h(1em) $D$: $B, C, E$; #h(1em) $E$: $D, F$; #h(1em) $F$: $E$.]
Model this as a graph colouring problem. What is the minimum number of slots needed? Give one assignment of modules to slots that uses this minimum. #mk(3)],
)]

#pagebreak()
// ============================================================================
= Answer Key
// ============================================================================

#let keyrow(..xs) = xs.pos().map(x => [#x])
#table(columns: (auto,) + (1fr,) * 10,
  align: center,
  [Set], [1], [2], [3], [4], [5], [6], [7], [8], [9], [10],
  [1], ..keyrow("D", "B", "A", "C", "D", "B", "A", "D", "", ""),
  [2], ..keyrow("C", "B", "C", "A", "B", "D", "C", "B", "C", "A"),
  [3], ..keyrow("B", "C", "A", "B", "D", "B", "", "", "", ""),
  [4], ..keyrow("C", "A", "B", "C", "A", "C", "", "", "", ""),
  [5], ..keyrow("C", "A", "D", "A", "C", "D", "", "", "", ""),
  [6], ..keyrow("B", "A", "C", "C", "", "", "", "", "", ""),
  [7], ..keyrow("B", "D", "B", "A", "C", "C", "", "", "", ""),
)

#table(columns: (auto, 1fr),
  [Question], [Short answers],
  [3.7], [(a) D, C, B, A. #h(0.6em) (b) $[3]$; #h(0.3em) $2x + 1 space (mod 7)$; #h(0.3em) order 6, and $[6]$ has order 1.],
  [3.8], [(a) $(1 space 4 space 5)(2 space 6)(3)$. #h(0.6em) (b) $(1 space 4 space 5)(2 space 3 space 6)$. #h(0.6em) (c) 6 and 3.],
  [4.8], [(b) true, true, true, false. #h(0.6em) (d) 3, 4, 4, 4.],
  [6.5], [(a) 45360 #h(0.5em) (b) 285 #h(0.5em) (c) 1596000 #h(0.5em) (d) $2 (n!)^2$ #h(0.5em) (e) $(n!)^2$ #h(0.5em) (f) 13 #h(0.5em) (g) 25 #h(0.5em) (h) 0.032; 0.625; machine $A$.],
  [6.6], [(a) 816 #h(0.5em) (b) 286 #h(0.5em) (c) 361 #h(0.5em) (d) 0.2646 #h(0.5em) (e) 540 #h(0.5em) (f) 240 #h(0.5em) (g) $6/11$; $36/11$ #h(0.5em) (h) $5/8$; 10.],
  [7.7], [(a) yes #h(0.5em) (b) $n$ odd #h(0.5em) (c) one of $m, n$ equals 2 and the other is odd #h(0.5em) (d) 2026, 2, 2, 3 #h(0.5em) (e) 15; 9 #h(0.5em) (f) yes: ${(a, w), (b, x), (c, y), (d, z)}$ #h(0.5em) (g) no: $S = {a, b}$.],
  [7.8], [(a) 14 #h(0.5em) (b) 5 #h(0.5em) (c) true, true, false #h(0.5em) (d) 36; 8 #h(0.5em) (e) C A D R E B G F H #h(0.5em) (f) 42; 4 #h(0.5em) (g) 3 slots.],
)

*Marking a mock paper.* Each MCQ is worth 2 marks. Mock 1 MCQ key in paper order (1.1, 1.3, 1.5, 1.7, 2.1, 2.3, 2.5, 2.7, 2.9, 3.1, 3.3, 3.5, 4.1, 4.3, 4.5, 5.1, 5.3, 5.5, 6.1, 6.3, 7.1, 7.3, 7.5): #h(0.3em) D A D A C #h(0.4em) C B C C B #h(0.4em) A D C B A #h(0.4em) C D C B C #h(0.4em) B B C. \
Mock 2 MCQ key in paper order (1.2, 1.4, 1.6, 1.8, 2.2, 2.4, 2.6, 2.8, 2.10, 3.2, 3.4, 3.6, 4.2, 4.4, 4.6, 5.2, 5.4, 5.6, 6.2, 6.4, 7.2, 7.4, 7.6): #h(0.3em) B C B D B #h(0.4em) A D B A C #h(0.4em) B B A C C #h(0.4em) A A D A C #h(0.4em) D A C.

// ============================================================================
= Solutions · Set 1 Logic and Proof
// ============================================================================

#sol[1.1][D][The premises $p <-> q$ and $p and lnot q$ cannot both be true: the second forces $p$ true and $q$ false, which makes the first false. There is no critical row, so the argument is valid (vacuously). A sound argument is a valid argument whose premises are all true, which is impossible here, so it is unsound. An argument is not a statement, so "contradiction" does not apply (§4).]

#sol[1.2][B][(i) Valid: by cases on $p$; either way $q$ follows. (ii) Invalid: $p$ false, $q$ true, $r$ false makes both premises true and $q -> r$ false. (iii) Valid: proof by division into cases.]

#sol[1.3][A][$lnot r$ and $(p and q) -> r$ give $lnot (p and q)$ by modus tollens. With $q$ true, $p$ is false. Then $p or s$ gives $s$ by elimination. So $p$ = F, $q$ = T, $r$ = F, $s$ = T. $p <-> r$ is true (both false). $s -> p$ is false, $lnot p and lnot s$ is false, $q -> p$ is false.]

#sol[1.4][C][$p arrow.t p equiv lnot p$ and $q arrow.t q equiv lnot q$, so $(p arrow.t p) arrow.t (q arrow.t q) equiv lnot (lnot p and lnot q) equiv p or q$. The statement is $(p or q) -> lnot (p and q) equiv lnot (p or q) or lnot (p and q)$. Since $lnot (p or q)$ implies $lnot (p and q)$, this is $lnot (p and q) equiv lnot p or lnot q$. Check: it is false only when $p$ and $q$ are both true.]

#sol[1.5][D][(i) False: take $x = 0$, $z = 1$; no $y$ gives $0 dot y = 1$. (ii) True: take $x = 1$; for each $z$ choose $y = z$. (iii) True: take $z = 0$; for each $x$ choose $y = 0$.]

#sol[1.6][B][Negate from the outside in: $exists x space forall y space lnot (P(x) -> (Q(y) and R(x, y)))$. Since $lnot (u -> v) equiv u and lnot v$, the body is $P(x) and lnot (Q(y) and R(x, y)) equiv P(x) and (lnot Q(y) or lnot R(x, y)) equiv P(x) and (Q(y) -> lnot R(x, y))$. Option (A) keeps the implication, (C) is the negation of a conjunction, and (D) does not swap the quantifiers.]

#sol[1.7][A][Let $r$ be a robot that is a student (second premise). By the first premise $r$ is not a tutor, so (i) holds. (ii) and (iii) can fail together: let the only tutor also be a student, with a separate robot student. Then every tutor is a student and some student is a tutor, while both premises hold.]

#sol[1.8][D][(i) False: $a = 1$, $b = -1$. (ii) True: if $n = 2k$ then $n^2 = 4k^2$; if $n = 2k + 1$ then $n^2 = 4(k^2 + k) + 1$. (iii) True: $-17 = 5 dot (-4) + 3$ and $0 <= 3 < 5$.]

// ============================================================================
= Solutions · Set 2 Sets, Relations and Partial Orders
// ============================================================================

#sol[2.1][C][(i) False for all $A, B$: $nothing in PP(A without B)$, but $nothing in PP(B)$, so $nothing in.not PP(A) without PP(B)$. (ii) True: if $X subset.eq A$ or $X subset.eq B$, then $X subset.eq A union B$. (iii) True: $A in PP(A) = PP(B)$ gives $A subset.eq B$, and symmetrically $B subset.eq A$.]

#sol[2.2][B][Collect the elements of each member of $B$: $nothing$ contributes nothing, ${1}$ gives $1$, ${1, {2}}$ gives $1$ and ${2}$, and ${{1}}$ gives ${1}$. The set is ${1, {1}, {2}}$. $nothing$ is a member of $B$, not an element of a member of $B$.]

#sol[2.3][C][Symmetry, antisymmetry and transitivity are universal statements with a hypothesis of the form "$x R y$", which is never true for $R = nothing$, so all three hold vacuously. Reflexivity needs $(x, x) in R$ for each $x in A$; since $A != nothing$, it fails.]

#sol[2.4][A][A reflexive relation contains the 3 pairs $(x, x)$. A symmetric relation contains both or neither of $(x, y)$ and $(y, x)$ for each of the $binom(3, 2) = 3$ unordered pairs of distinct elements. So there are $2^3 = 8$ relations.]

#sol[2.5][B][(i) True: reflexivity, symmetry and transitivity each pass to the intersection. (ii) False: on ${1, 2, 3}$ let $R$ have classes ${1, 2}, {3}$ and $S$ have classes ${1}, {2, 3}$; then $(1, 2), (2, 3) in R union S$ but $(1, 3) in.not R union S$. (iii) True: for each $x in A$, $(x, x) in R$ and $(x, x) in S$, so $(x, x) in S compose R$.]

#sol[2.6][D][$R$ is the bijection $1 |-> 2 |-> 3 |-> 1$, $4 |-> 4$, so composing $R$ with itself three times gives the identity on $A$, and the fivefold composition equals the twofold one: $1 |-> 3$, $2 |-> 1$, $3 |-> 2$, $4 |-> 4$. The answer does not depend on the order convention for $compose$ because only powers of $R$ are involved.]

#sol[2.7][C][$x simq y <=> |x| = |y|$, so $[x] = {x, -x}$. Addition: $[1] = [-1]$, but $[1 + 1] = [2]$ and $[1 + (-1)] = [0]$ differ, so $+$ is not well defined. Multiplication: if $[x] = [x']$ and $[y] = [y']$, then $(x y)^2 = x^2 y^2 = x'^2 y'^2 = (x' y')^2$, so $[x y] = [x' y']$ and $dot$ is well defined (§23, §30).]

#sol[2.8][B][Numbers of positive divisors: 1 has 1; the primes 2, 3, 5, 7, 11 have 2; 4 and 9 have 3; 6, 8, 10 have 4; 12 has 6. The classes are ${1}$, ${2, 3, 5, 7, 11}$, ${4, 9}$, ${6, 8, 10}$ and ${12}$: five classes.]

#sol[2.9][C][(i) True: a largest element would be a multiple of every element; 12, 18 and 27 do not divide one another. (ii) False: $2 divides.not 3$; the minimal elements are 2 and 3 and there is no smallest element. (iii) True: 12, 18 and 27 divide no other element, while $2 dv 4$, $3 dv 6$, $4 dv 12$, $6 dv 12$ and $9 dv 18$.]

#sol[2.10][A][The Hasse diagram gives $a prec c$, $b prec c$ and the chain $b prec d prec e$. Write the chain $b, d, e$ in order and insert $c$ somewhere after $b$, then $a$ somewhere before $c$. If the order is $b, c, d, e$, then $a$ has 2 positions; for $b, d, c, e$, 3 positions; for $b, d, e, c$, 4 positions. Total $2 + 3 + 4 = 9$ (§25).]

// ============================================================================
= Solutions · Set 3 Functions
// ============================================================================

#sol[3.1][B][$R$ is a function iff every $x in A$ has exactly one $y in B$ with $y^2 = x$. (i) $0 |-> 0$, $1 |-> 1$, $4 |-> 2$: a function. (ii) $1$ is related to both $1$ and $-1$: not a function. (iii) $2$ is related to nothing: not a function. (iv) With $A = nothing$ the condition holds vacuously and $R = nothing$ is a function.]

#sol[3.2][C][Writing T, F for true, false: $f("T", "T") = ("F", "T")$, $f("F", "T") = ("F", "F")$, $f("F", "F") = ("T", "T")$ and $f("T", "F") = ("T", "F")$. So $f$ is a bijection made of one cycle of length 3 and one fixed point; its order is 3. Hence $f compose f != idf$ and $f != f^(-1)$, but $f compose f compose f = idf$.]

#sol[3.3][A][A strictly increasing $f$ is determined by its range, a 3-element subset of ${1, ..., 5}$: $|F| = binom(5, 3) = 10$. Injective $g$: $|G| = 4 times 3 = 12$. Surjective $h$: all $2^3$ functions except the 2 constant ones, $|H| = 6$. So $|G| = 2|H|$.]

#sol[3.4][B][(i) True: if $f(a_1) = f(a_2)$ then $g(f(a_1)) = g(f(a_2))$, so $a_1 = a_2$ (T6 Q6). (iii) True: for $c in C$ there is $a$ with $g(f(a)) = c$, and $f(a) in B$ is a preimage of $c$ under $g$. (ii) and (iv) are false: take $A = {1}$, $B = {1, 2}$, $C = {1}$, $f(1) = 1$ and $g(1) = g(2) = 1$. Then $g compose f$ is a bijection, $g$ is not injective and $f$ is not surjective.]

#sol[3.5][D][$g$ has a cycle $1 |-> 2 |-> 3 |-> 1$ of length 3 and a cycle $4 |-> 5 |-> 4$ of length 2, so its order is $lcm(3, 2) = 6$. $(g compose k)(x) = g(k(x))$: $1 |-> 2$, $2 |-> 1$, $3 |-> 3$, $4 |-> 4$, $5 |-> 5$. This swaps 1 and 2 only, so its order is 2.]

#sol[3.6][B][(i) False: $f({1, 2}) = {1, 4}$ and $f^(-1)({1, 4}) = {-2, -1, 1, 2}$. (ii) False: $f^(-1)({1, 2, 4}) = {-2, -1, 1, 2}$, whose image is ${1, 4}$. (iii) True: neither 2 nor 3 is a perfect square. In general $X subset.eq f^(-1)(f(X))$ and $f(f^(-1)(Y)) subset.eq Y$, with equality for injective and surjective $f$ respectively (T6 Q9).]

#sol[3.7][][
*(a)* (i) *D.* $f$ swaps $2k$ and $2k + 1$, so $f compose f = idf_ZZ$ and $f$ is its own inverse. \
(ii) *C.* $g(nothing) = 0$, $g({1}) = 1$, $g({1, 2}) = 2$, $g({1, 2, 3}) = 3$, so $g$ is surjective; $g({1}) = g({2})$, so it is not injective. \
(iii) *B.* By unique prime factorization $2^a 3^b = 2^c 3^d$ forces $a = c$ and $b = d$. The value 1 is not attained since $a, b >= 1$. \
(iv) *A.* $k(0) = k(2) = 0$, and $k(x) = (x - 1)^2 - 1 >= -1$, so $-2$ is not attained. \
*(b)* (i) Solve $3x + 2 equiv 4$, that is $3x equiv 2 space (mod 7)$. Since $3 dot 5 equiv 1$, $x equiv 10 equiv 3$: $z^(-1)([4]) = [3]$. \
(ii) $z^((2))(x) = 3(3x + 2) + 2 = 9x + 8 equiv 2x + 1 space (mod 7)$. \
(iii) $[1] |-> [5] |-> [3] |-> [4] |-> [0] |-> [2] |-> [1]$: the order of $[1]$ is *6*. Order 1 means $3x + 2 equiv x$, so $2x equiv -2$ and $x equiv 6$: $[6]$ is the fixed point.]

#sol[3.8][][
*(a)* $1 |-> 4 |-> 5 |-> 1$, $2 |-> 6 |-> 2$, $3 |-> 3$: $sigma = (1 space 4 space 5)(2 space 6)(3)$. \
*(b)* Apply $sigma_2$ first: $1 |-> 2 |-> 4$, $4 |-> 3 |-> 5$, $5 |-> 5 |-> 1$, $2 |-> 1 |-> 3$, $3 |-> 6 |-> 6$, $6 |-> 4 |-> 2$. So $sigma_1 compose sigma_2 = (1 space 4 space 5)(2 space 3 space 6)$. \
*(c)* The order of a permutation is the lcm of its cycle lengths: $lcm(3, 2, 1) = 6$ for $sigma_1$ and $lcm(3, 3) = 3$ for $sigma_1 compose sigma_2$. \
*(d)* Let $f(x) = g(x) = x$. Both are bijections, but $h(x) = x^2$ has $h(1) = h(-1)$, so $h$ is not injective. \
*(e)* Proof.
+ Suppose $g : B -> A$ is a left inverse of $f$, and let $a_1, a_2 in A$ with $f(a_1) = f(a_2)$.
+ Then $g(f(a_1)) = g(f(a_2))$ #j[$g$ is a function].
+ So $a_1 = a_2$ #j[$g(f(a)) = a$ for all $a in A$].
+ Hence $f$ is injective. #qed
The converse fails when $A = nothing$ and $B != nothing$: the empty function $f : nothing -> B$ is injective (vacuously), but there is no function from the non-empty set $B$ to $nothing$, so $f$ has no left inverse.]

// ============================================================================
= Solutions · Set 4 Induction and Recursion
// ============================================================================

#sol[4.1][C][By length: 1: $a$. 2: $a b$. 3: $a b b$, $a a a$. 4: $a b b b$, $a a a b$, $a a b a$. 5: $a b b b b$, $a a a b b$, $a a b a b$, $a a a a a$, $a a b b a$. That is $1 + 1 + 2 + 3 + 5 = 12$ elements.]

#sol[4.2][A][An element of length $n >= 3$ that ends in $b$ is $x b$ with $x in S$ of length $n - 1$; one that ends in $a$ is $a x a$ with $x in S$ of length $n - 2$. The two forms are distinct and each determines $x$, so $G_n = G_(n-1) + G_(n-2)$ with $G_1 = G_2 = 1$. This is the Fibonacci recurrence with $G_1 = F_1$ and $G_2 = F_2$, so $G_n = F_n$.]

#sol[4.3][B][$S_n$ is the set of numbers $2i + 5j$ with $i, j in NN$ and $i + j <= n$, so the union is ${2i + 5j : i, j in NN}$. It contains every even number, and every odd number that is at least 5 (as $5 + 2i$). The numbers 1 and 3 are not of this form.]

#sol[4.4][C][Each application of clause (2) wraps the string in two different symbols, so every element has even length and its $i$th symbol differs from its $i$th-last symbol. Conversely any such string is $0 x 1$ or $1 x 0$ where $x$ again has the property, so it is in $T$ by induction on length. (A) fails for $0110$, (B) fails for $00$, and (D) misses $0101 in T$.]

#sol[4.5][A][Claim: $S = {x in ZZ^+ : 3 divides.not x}$. Both clauses preserve "positive and not divisible by 3" ($2x equiv 2, 1$ when $x equiv 1, 2 space (mod 3)$). Conversely $1 in S$, $2 = 2 dot 1 in S$, and adding 3 repeatedly reaches every positive integer not divisible by 3. (i) $2026 = 3 dot 675 + 1$: true. (ii) $2025 = 3 dot 675$: false. (iii) If $3 divides.not x$ then $3 divides.not x^2$ and $x^2 > 0$: true.]

#sol[4.6][C][$a_20 = a_0 + 3(1 + 2 + dots.c + 20) = 2 + 3 dot 210 = 632$.]

#sol[4.7][][
*(a)* Proof.
+ For each $n in ZZ^+$ let $P(n)$ be the proposition $sum_(i=1)^n F_(2i-1) = F_(2n)$.
+ Basis step: $sum_(i=1)^1 F_(2i-1) = F_1 = 1 = F_2$, so $P(1)$ is true.
+ Inductive step: let $k in ZZ^+$ and assume $P(k)$, that is $sum_(i=1)^k F_(2i-1) = F_(2k)$.
  + $sum_(i=1)^(k+1) F_(2i-1) = (sum_(i=1)^k F_(2i-1)) + F_(2k+1)$ #j[definition of sum]
  + $= F_(2k) + F_(2k+1)$ #j[induction hypothesis]
  + $= F_(2k+2) = F_(2(k+1))$ #j[Fibonacci recurrence].
  + So $P(k+1)$ is true.
+ Therefore $P(n)$ is true for all $n in ZZ^+$ #j[mathematical induction]. #qed
*(b)* Proof. Two basis steps are needed because the recurrence refers to two earlier terms.
+ For each $n in NN$ let $P(n)$ be the proposition $F_n < 2^n$.
+ Basis steps: $F_0 = 0 < 1 = 2^0$ and $F_1 = 1 < 2 = 2^1$, so $P(0)$ and $P(1)$ are true.
+ Inductive step: let $k in ZZ^+$ and assume $P(k-1)$ and $P(k)$.
  + $F_(k+1) = F_k + F_(k-1)$ #j[recurrence, valid as $k >= 1$]
  + $< 2^k + 2^(k-1)$ #j[induction hypotheses]
  + $< 2^k + 2^k = 2^(k+1)$ #j[$2^(k-1) < 2^k$].
  + So $P(k+1)$ is true.
+ Therefore $P(n)$ is true for all $n in NN$ #j[strong induction]. #qed
*(c)* Line 3 uses $F_(k+1) = F_k + F_(k-1)$, which is valid only for $k >= 1$. For $k = 0$ it refers to $F_(-1)$, which does not exist, so the step from $P(0)$ to $P(1)$ is not proved. A second basis step $P(1)$ is needed, and $P(1)$ is false since $F_1 = 1$.]

#sol[4.8][][
*(a)* For any predicate $P : S -> "Bool"$:
#pad(left: 2em)[$P(2)$ \ $forall x in S space (P(x) => P(x + 3))$ \ $forall x in S space (P(x) => P(2x))$ \ $therefore forall x in S space P(x)$]
*(b)* $S = {2, 4, 5, 7, 8, 10, 11, ...}$, the integers $x >= 2$ with $3 divides.not x$. (i) True. (ii) True. (iii) True: $2 -> 4 -> 8 -> 16$. (iv) False: $7 in S$ ($2 -> 4 -> 7$) is odd and $7 mod 3 = 1$. \
*(c)* Proof by structural induction with $P(x) equiv (3 divides.not x)$.
+ Basis: $3 divides.not 2$, so $P(2)$ is true.
+ Let $x in S$ and assume $P(x)$, so $x = 3q + r$ for some $q in ZZ$ and $r in {1, 2}$ #j[quotient-remainder theorem].
  + $x + 3 = 3(q + 1) + r$ with $r in {1, 2}$, so $3 divides.not (x + 3)$: $P(x + 3)$ is true.
  + If $r = 1$, then $2x = 3(2q) + 2$; if $r = 2$, then $2x = 3(2q + 1) + 1$. In both cases the remainder is not 0, so $3 divides.not 2x$: $P(2x)$ is true.
+ Therefore $forall x in S space (3 divides.not x)$ #j[the principle in part (a)]. #qed
*(d)* Work outwards from 2, one clause at a time: after 2 clauses $\{4, 5\}$; after 3 clauses $\{7, 8, 10\}$; after 4 clauses $\{11, 13, 14, 16, 20\}$. So $f(7) = 3$ ($2, 4, 7$), $f(11) = 4$ ($2, 5, 8, 11$), $f(16) = 4$ ($2, 4, 8, 16$) and $f(20) = 4$ ($2, 5, 10, 20$).]

// ============================================================================
= Solutions · Set 5 Cardinality
// ============================================================================

#sol[5.1][C][(i) True: $B subset.eq (B without A) union A$; if $B without A$ were countable, $B$ would be a subset of a union of two countable sets and so countable. (ii) False: $A = {x in RR : x <= 0}$ and $B = {x in RR : x >= 0}$ are uncountable with $A inter B = {0}$. (iii) True: the contrapositive is "a subset of a countable set is countable".]

#sol[5.2][A][(i) Countable: for each $n$ there are finitely many subsets of ${0, ..., n}$, and listing these for $n = 0, 1, 2, ...$ lists every finite subset. (ii) Uncountable: by Cantor's diagonal argument; these functions correspond to the subsets of $NN$. (iii) Countable: $f |-> (f(0), f(1))$ is a bijection onto $NN times NN$. (iv) Countable: a Cartesian product of two countable sets (§37, §38).]

#sol[5.3][D][(i) True: a subset of the countable set $ZZ$ is countable. (ii) False: ${0} in PP(RR)$ is finite. (iii) True: a set with an infinite subset is infinite. $A$ need not be countable in (iii), for example $A = RR$.]

#sol[5.4][A][A surjection from $NN$ lists all elements of $PP(A)$ in a sequence, so $PP(A)$ is countable. If $A$ were infinite, it would have a countably infinite subset $B$, and $PP(B) subset.eq PP(A)$ is uncountable (T8 Q7), a contradiction. So $A$ is finite. Finite sets do occur: for $A = nothing$, $PP(A) = {nothing}$ and the constant function is a surjection.]

#sol[5.5][C][(i) True: $[x] = {x + n : n in ZZ}$ and $n |-> x + n$ is a bijection from $ZZ$. (iii) True: each class contains exactly one element of ${x : 0 <= x < 1}$, namely $x - floor(x)$, so $[x] |-> x - floor(x)$ is a well-defined bijection. (ii) False: by (iii), $Q$ has the cardinality of an interval of $RR$, which is uncountable.]

#sol[5.6][D][(i) False: the partition ${{n} : n in ZZ}$ has only finite components. (ii) True: a union of finitely many finite sets is finite, and $ZZ$ is infinite. (iii) True: for $k >= 1$ let $C_k$ be the set of non-zero integers whose largest power-of-2 divisor is $2^k$, and let $C_0$ be the odd integers together with 0. Each $C_k$ is infinite and countable.]

#sol[5.7][][
*(a)* One such bijection, which lists $1, -1, 2, -2, 3, -3, ...$, is
$ g(n) = cases(n slash 2 + 1 & "if" n "is even;", -(n + 1) slash 2 & "if" n "is odd.") $
*(b)* Proof by contradiction.
+ Suppose $A without B$ is countable.
+ $A = (A without B) union B$ #j[$B subset.eq A$].
+ Then $A$ is a union of two countable sets, so $A$ is countable #j[fact (2)].
+ This contradicts the assumption that $A$ is uncountable.
+ Hence $A without B$ is uncountable. #qed
*(c)* The set of irrational numbers is $RR without QQ$. $RR$ is uncountable, and $QQ subset.eq RR$ is countable #j[fact (3)]. By part (b) with $A = RR$ and $B = QQ$, $RR without QQ$ is uncountable. #qed]

// ============================================================================
= Solutions · Set 6 Counting and Probability
// ============================================================================

#sol[6.1][B][Pigeonholes: the 10 pairs ${1, 20}, {2, 19}, ..., {10, 11}$, each summing to 21. Any 11 numbers put two in the same pair. Ten numbers are not enough: ${1, 2, ..., 10}$ has no two elements with sum 21.]

#sol[6.2][A][Eight people can be seated around a circular table in $7!$ ways. Treat Aiken and Dueet as one unit to count the arrangements with the two adjacent: $6!$ circular arrangements of 7 units, times 2 internal orders. Answer $7! - 2 times 6! = 3600$.]

#sol[6.3][C][$P(A) = P(B) = P(C) = 1/2$. $P(A inter B) = 1/4$; $A inter C$ is "red odd and blue even" with probability $1/4$; $B inter C$ likewise. So the events are pairwise independent. But $A inter B inter C = nothing$ (two odd numbers have an even sum), so $P(A inter B inter C) = 0 != 1/8$ and they are not mutually independent (§45).]

#sol[6.4][C][A member has $binom(8, 3) = 56$ possible bowls and another customer has $binom(8, 2) = 28$. Expected value $0.25 times 56 + 0.75 times 28 = 14 + 21 = 35$.]

#sol[6.5][][
*(a)* M, T and E each appear twice: $9! slash (2! space 2! space 2!) = 45360$. \
*(b)* Exactly 2, 3 or 4 women: $binom(5, 2) binom(7, 2) + binom(5, 3) binom(7, 1) + binom(5, 4) = 210 + 70 + 5 = 285$. \
*(c)* Choose the vowels, the consonants, then order the 5 letters: $binom(5, 2) binom(21, 3) dot 5! = 10 dot 1330 dot 120 = 1596000$. \
*(d)* The row starts with a man or with a woman (2 ways); then arrange the men in their seats and the women in theirs: $2 (n!)^2$. \
*(e)* Glue the men into one block. The block and the $n$ women are $n + 1$ units around a circle: $n!$ arrangements. The men can be ordered inside the block in $n!$ ways: $(n!)^2$. \
*(f)* Worst case: 3 red, 3 blue, 3 green and all 3 black, which is 12 socks with no four alike. The 13th sock is red, blue or green and completes four of a colour: *13*. \
*(g)* Solutions of $x_1 + x_2 + x_3 = 9$ with $1 <= x_i <= 6$. Put $y_i = x_i - 1$: $y_1 + y_2 + y_3 = 6$ with $0 <= y_i <= 5$. Without the upper bound there are $binom(8, 2) = 28$; remove the 3 solutions in which some $y_i = 6$: *25*. \
*(h)* (i) $P(D) = 0.6 times 0.02 + 0.4 times 0.05 = 0.012 + 0.020 = 0.032$. \
(ii) $P(B | D) = 0.020 slash 0.032 = 0.625$ #j[Bayes' theorem]. \
(iii) $P(A | overline(D)) = (0.6 times 0.98) slash 0.968 approx 0.607 > 0.5$: machine *$A$*.]

#sol[6.6][][
*(a)* Multiset formula with $n = 4$, $r = 15$: $binom(18, 3) = 816$. \
*(b)* Give 2 to $x_1$ and 3 to $x_2$ first; distribute the remaining 10: $binom(13, 3) = 286$. \
*(c)* Split on $x_4 = 0, 1, 2$; the other three variables sum to $15, 14, 13$: $binom(17, 2) + binom(16, 2) + binom(15, 2) = 136 + 120 + 105 = 361$. \
*(d)* $binom(4, 2) (0.7)^2 (0.3)^2 = 6 times 0.49 times 0.09 = 0.2646$. \
*(e)* Inclusion and exclusion on the elements of the codomain that are missed: $3^6 - 3 dot 2^6 + 3 dot 1^6 = 729 - 192 + 3 = 540$. \
*(f)* The general term is $binom(6, k) (x^2)^(6-k) (2 slash x)^k = binom(6, k) 2^k x^(12 - 3k)$. For $k = 4$: $binom(6, 4) dot 2^4 = 240$. \
*(g)* (i) All three leavers come from the other 10 persons: $binom(10, 3) slash binom(12, 3) = 120 slash 220 = 6/11$. \
(ii) By linearity of expectation over the 6 couples: $6 times 6/11 = 36/11$. \
*(h)* (i) By symmetry each marker is equally likely to be drawn second, so the probability is $5/8$. Check: $5/8 dot 4/7 + 3/8 dot 5/7 = 35/56$. \
(ii) With $r$ red and $b$ blue, $P("different") = 2 r b slash (16 dot 15) = 1/2$ gives $r b = 60$ with $r + b = 16$, so ${r, b} = {10, 6}$. More red than blue: *10* red markers.]

// ============================================================================
= Solutions · Set 7 Graphs and Trees
// ============================================================================

#sol[7.1][B][With vertices in the order $a, b, c$:
$ A = mat(1, 1, 0; 0, 0, 1; 1, 0, 0), quad A^2 = mat(1, 1, 1; 1, 0, 0; 1, 1, 0), quad A^4 = (A^2)^2 = mat(3, 2, 1; 1, 1, 1; 2, 1, 1). $
The $(i, j)$ entry of $A^4$ counts the walks of length 4 from vertex $i$ to vertex $j$ (§48). The largest entry is 3, from $a$ to $a$; the listed alternatives have 2, 2 and 1 walks.]

#sol[7.2][D][(i) True: removing one edge of $K_(3,3)$ leaves a planar graph; $K_(3,3)$ itself is the smallest non-planar bipartite example. (ii) False: every vertex of $K_6$ has degree 5, which is odd. (iii) True: Euler's formula $f = e - v + 2 = 12 - 8 + 2 = 6$ holds for every planar representation of a connected planar graph (§49).]

#sol[7.3][B][The three edges form a triangle (plus an isolated vertex), a path through all four vertices, or a star $K_(1,3)$. These have degree sequences $(2, 2, 2, 0)$, $(2, 2, 1, 1)$ and $(3, 1, 1, 1)$, so no two are isomorphic: 3 graphs.]

#sol[7.4][A][(i) True: take the cycle $1, 2, 3, 4$ with the chord ${2, 4}$, and join vertex 5 to 1 and 3; the degrees are $3, 3, 3, 3, 2$. (ii) True: a disconnected simple graph on 7 vertices has at most $binom(6, 2) = 15$ edges ($K_6$ plus an isolated vertex). (iii) False: two disjoint triangles have all degrees even and no Euler circuit; connectedness is required (§47).]

#sol[7.5][C][Root K (first in pre-order). In-order splits into left B D E F and right P Q S. Left subtree: pre-order D B F E, so root D with left child B and right subtree {E, F}: root F with left child E. Right subtree: pre-order P S Q, in-order P Q S, so root P with no left child and right child S, whose left child is Q. Post-order: B E F D, then Q S P, then K.]

#sol[7.6][C][P is the root. Its first child is Q; in the post-order Q's subtree ends at Q, so it is {R, Q}, and the remaining vertices {S, T, U} form the subtree of P's second child S. P has two children, so Q is the left child and S the right child. Q has the single child R, S has the single child T, and T has the single child U; each single child can be a left or a right child: $2^3 = 8$ trees (§51).]

#sol[7.7][][
*(a)* *Yes.* $K_(2,n)$ is planar for every $n$: place the $n$ vertices on a line and the two others on opposite sides of it. \
*(b)* *$n$ is odd.* $K_n$ is connected and every vertex has degree $n - 1$, which must be even. \
*(c)* An Euler trail between two distinct vertices needs exactly two vertices of odd degree. The $m$ vertices of $U$ have degree $n$ and the $n$ vertices of $V$ have degree $m$. With $m, n >= 2$ this happens iff *one of $m, n$ equals 2 and the other is odd*. \
*(d)* (i) *2026*: all vertices are pairwise adjacent. (ii) *2*: colour $U$ and $V$. (iii) *2*: an even cycle alternates two colours. (iv) *3*: an odd cycle cannot alternate two colours. \
*(e)* (i) Kruskal: two of the three weight-2 edges of triangle $a b c$, two of the three weight-3 edges of triangle $d e f$, then $\{c, d\}$ of weight 5, which is cheaper than $\{b, e\}$ of weight 6. Weight $2 + 2 + 3 + 3 + 5 = 15$. \
(ii) Each triangle can drop any one of its three edges: $3 times 3 = 9$ minimum spanning trees. \
*(f)* *Yes:* ${(a, w), (b, x), (c, y), (d, z)}$. \
*(g)* *No.* Take $S = {a, b}$: $N(S) = {w}$, so $|N(S)| = 1 < 2 = |S|$. Both $a$ and $b$ can only be matched to $w$.]

#sol[7.8][][
*(a)* Kruskal: $\{1, 2\}$ of weight 2, $\{2, 3\}$ and $\{3, 4\}$ of weight 3; $\{1, 4\}$ and $\{2, 4\}$ would close circuits; vertex 5 joins by its cheapest edge $\{4, 5\}$ of weight 6. Weight $2 + 3 + 3 + 6 = 14$. \
*(b)* $A^2 = mat(2, 0, 3; 2, 1, 3; 1, 1, 2)$. The $(1, 3)$ entry of $A^3 = A^2 A$ is $2 dot 1 + 0 dot 2 + 3 dot 1 = 5$. \
*(c)* (i) *True*: the two ends of a longest path have degree 1. (ii) *True*: an Euler circuit needs every degree even; with exactly two odd vertices there is an Euler trail between them. (iii) *False*: $G$ has exactly one circuit; removing an edge that is not on the circuit disconnects $G$ (for example a triangle with a pendant edge). \
*(d)* (i) *36*: components with $k$ and $10 - k$ vertices have at most $binom(k, 2) + binom(10 - k, 2)$ edges, which is largest for $k = 1$: $K_9$ plus an isolated vertex. (ii) *8*: each component is connected, so it has at least (vertices $- 1$) edges; two trees give $10 - 2 = 8$. \
*(e)* In a full binary tree every internal vertex has two children. Root R; its left child is A (next in pre-order), whose subtree ends at A in the post-order: {C, D, A}. The right subtree has root B with left child E and right child F, whose children are G and H. In-order: *C A D R E B G F H*. \
*(f)* (i) The number of BSTs on $n$ values satisfies $c_0 = 1$, $c_n = sum_(i=1)^n c_(i-1) c_(n-i)$: $1, 1, 2, 5, 14, 42$. So *42*. (ii) Root 3 leaves {1, 2} on the left and {4, 5} on the right: $c_2 dot c_2 = 4$. \
*(g)* Vertices are modules, edges join conflicting modules, and colours are slots. $A, B, C$ are pairwise in conflict, so at least 3 slots are needed, and 3 suffice: slot 1: $A, D, F$; slot 2: $B, E$; slot 3: $C$. Minimum *3*.]
