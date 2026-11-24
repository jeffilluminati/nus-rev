#import "exam_style.typ": *
#show: setup.with(doc-title: "CS1231S Mock Exam 2", running: [CS1231S · Mock Exam 2])
// ============================================================================
//  CS1231S Mock Exam 2 · "count what you defined"
//  A full paper in the format of the AY2025/26 final: Part A, 23 original
//  multiple-choice questions (46 marks); Part B, Q24 Counting and Probability
//  (20), Q25 Graphs and Trees (20), Q26 Mathematical Induction and Recurrences
//  (14). The answer key, short MCQ solutions and worked Part B solutions follow.
//  Every numeric answer is checked by brute force: Part A in solve_mock2.py
//  (every option evaluated), Part B in partb_mock2.py. Q16 and the proofs of
//  Q26 are checked by hand.
//  Compile:  typst compile CS1231S_Mock_Exam_2.typ "CS1231S Mock Exam 2.pdf"
// ============================================================================

// ---- helpers (as in CS1231S_Exam_Exercise_Sets.typ) ----------------------------
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
// Structured-question parts (as in CS1231S_Exam_Exercise_Sets.typ). `work` lists the height
// of the ruled working panel under each part (none for no panel). Each part, with its
// panel, is kept on one page.
#let workpanel(h) = block(width: 100%, height: h, above: 0.6em, below: 0.3em,
  stroke: 0.4pt + luma(200), radius: 1.5pt)[]
#let parts(work: (), ..o) = pad(left: 0.4em, y: 0.15em, grid(
  columns: (1.7em, 1fr), row-gutter: 0.7em,
  ..o.pos().enumerate().map(((i, x)) => ([(#numbering("a", i + 1))], block(breakable: false, width: 100%, {
    x
    let h = work.at(i, default: none)
    if h != none { workpanel(h) }
  }))).flatten(),
))
#let mk(n) = { h(1fr); text(size: 8.4pt, fill: muted)[\[#n #if n == 1 [mark] else [marks]\]] }
#let nota = [None of options (A), (B), (C), (D) is correct.]
#let sol(id, answer, body) = block(width: 100%, above: 0.85em, below: 0.85em, breakable: true, {
  text(weight: "bold", fill: accent)[#id]
  h(0.5em)
  if answer != none { ans(answer); h(0.5em) }
  body
})
// Four short options (A) to (D) on one line, then option (E) on its own line.
#let numopts(..o) = pad(left: 1.2em, top: 0.15em, stack(spacing: 0.55em,
  grid(columns: (1fr,) * 4, column-gutter: 1em,
    ..o.pos().enumerate().map(((i, x)) => grid(columns: (1.3em, 1fr), [#letters.at(i).], x))),
  grid(columns: (1.3em, 1fr), [E.], nota),
))
// Numbered clauses of a recursive definition.
#let clauses(..o) = pad(left: 1.2em, y: 0.1em, grid(
  columns: (auto, 1fr, auto), column-gutter: 0.7em, row-gutter: 0.5em,
  ..o.pos().enumerate().map(((i, x)) => ([(#(i + 1))], x.at(0), text(fill: muted, x.at(1)))).flatten(),
))
#let minimality = [Membership can always be demonstrated by finitely many successive applications of the clauses above.]

// ============================================================================
#text(size: 20pt, weight: "bold", fill: accent)[CS1231S · Mock Exam 2]
#h(0.5em)
#text(size: 11pt, fill: muted)[count what you defined]
#v(2pt)

#text(weight: "bold")[Time allowed: 2 hours]

#block(width: 100%, inset: (x: 10pt, y: 8pt), radius: 2pt, stroke: 0.6pt + accent, above: 0.8em, below: 0.9em)[
#text(weight: "bold", fill: accent, tracking: 0.5pt)[INSTRUCTIONS]
+ This paper contains TWENTY SIX (26) questions in TWO (2) parts and comprises #context counter(page).at(<end-of-paper>).first() printed pages. The answer key and the worked solutions start on the page after "End of paper".
+ This is an OPEN BOOK assessment.
+ Printed and written materials are allowed. Apart from calculators, electronic devices are not allowed.
+ Answer ALL questions. In Part A shade exactly one option for each question; every question has exactly one correct option. In Part B write your answers in the boxes provided.
+ The maximum mark of this paper is 100.
#align(center, table(columns: (auto, auto), align: (left, center), inset: (x: 14pt, y: 4pt),
  [Question], [Max. mark],
  [Part A: Q1 – 23], [46],
  [Part B: Q24], [20],
  [Part B: Q25], [20],
  [Part B: Q26], [14],
  [*Total*], [*100*],
))
]

*Conventions.* $NN = {0, 1, 2, ...}$ and $ZZ^+ = {1, 2, 3, ...}$; $lnot p$ is the negation of $p$; $PP(A)$ is the power set of $A$; $|A|$ is the number of elements of a finite set $A$; $g compose f$ applies $f$ first; $d dv n$ means that $d$ divides $n$. All other terms are as defined in the lectures.

= Part A: Multiple Choice Questions

Each multiple choice question is worth two marks and has exactly one correct option. #h(1fr) #text(size: 8.4pt, fill: muted)[\[Total: 23 × 2 = 46 marks\]]

#q[1][Logic][
Two statement forms in the variables $p$ and $q$ are regarded as the same if they are logically equivalent, so there are exactly 16 statement forms in $p$ and $q$, one for each truth table. An argument is valid if and only if its conclusion is true in every row of the truth table in which all of its premises are true. For how many of these 16 statement forms $X$ is the following argument valid?
#pad(left: 2em)[$p -> q$ \ $X$ \ $therefore q$]
#numopts([2], [4], [7], [8])]

#q[2][Logic][
Let $A = {1, 2, 3}$ and $B = {1, 2}$. For a relation $R$ from $A$ to $B$, consider the two statements
#rom(
  [$forall x in A space exists y in B space (x R y)$,],
  [$exists y in B space forall x in A space (x R y)$.],
)
For how many of the $2^6 = 64$ relations $R$ from $A$ to $B$ is (i) true and (ii) false?
#numopts([6], [11], [12], [27])]

#q[3][Proofs][
A _counterexample_ to a statement of the form $forall n in D space (P(n) -> Q(n))$ is an element $n in D$ for which $P(n)$ is true and $Q(n)$ is false. Let $D = {1, 2, ..., 100}$. How many counterexamples does the following statement have?
$ forall n in D space (12 dv n^2 -> 12 dv n) $
#numopts([0], [16], [84], [92])]

#q[4][Sets][
Let $A = {nothing, 1, {1}, {2}, {1, {2}}, {{1}, 2}}$, where 1 and 2 are numbers and not sets. How many elements of $A$ are also subsets of $A$? In other words, what is $|A inter PP(A)|$?
#numopts([2], [3], [4], [5])]

#q[5][Sets][
Let $U = {1, 2, ..., 8}$. For sets $A$ and $B$, the symmetric difference is $A xor B = (A without B) union (B without A)$. As $A$ and $B$ range over all subsets of $U$ with $|A| = 5$ and $|B| = 4$, how many different values does $|A xor B|$ take?
#numopts([4], [5], [7], [8])]

#q[6][Relations][
Let $A = {1, 2, 3}$. How many relations on $A$ are symmetric and transitive but not reflexive?
#numopts([0], [5], [10], [15])]

#q[7][Equivalence relations][
Let $A = {1, 2, 3, 4, 5}$. For an equivalence relation $simq$ on $A$, the quotient $A slash simq$ is the set of all equivalence classes. How many equivalence relations $simq$ on $A$ satisfy $|A slash simq| = 3$?
#numopts([10], [25], [40], [150])]

#q[8][Partial orders][
A _linearization_ of a partial order $pleq$ on a set $A$ is a total order $plin$ on $A$ such that $forall x, y in A space (x pleq y -> x plin y)$. How many partial orders $pleq$ on ${1, 2, 3}$ have the usual order $<=$ on ${1, 2, 3}$ as a linearization?
#numopts([6], [7], [8], [19])]

#q[9][Partial orders][
Consider the partial order $subset.eq$ on $PP({1, 2, 3, 4})$. How many lines does its Hasse diagram have?
#numopts([32], [64], [65], [81])]

#q[10][Functions][
Let $A = {1, 2, 3}$. How many functions $f : A -> A$ satisfy $f compose f = f$?
#numopts([4], [7], [9], [10])]

#q[11][Functions][
The _order_ of a bijection $f : A -> A$ is the smallest $n in ZZ^+$ such that $underbrace(f compose f compose dots.c compose f, n "many" f"'s") = idf_A$. Let $A = {1, 2, ..., 7}$. What is the largest order that a bijection $f : A -> A$ can have?
#numopts([7], [10], [12], [5040])]

#q[12][Functions][
Let $A = {1, 2, 3, 4, 5}$ and $B = {a, b, c}$. How many surjective functions $f : A -> B$ satisfy $f(1) = a$?
#numopts([14], [36], [81], [150])]

#q[13][Recursion][
A set $S$ of strings over the alphabet ${a, b}$ is recursively defined as follows, where $epsilon$ is the empty string (its length is 0):
#clauses(
  ([$epsilon in S$.], [(base clause)]),
  ([If $x in S$, then $a x b in S$.], [(recursion clause)]),
  ([If $x in S$ and $y in S$, then $x y in S$.], [(recursion clause)]),
  (minimality, [(minimality clause)]),
)
How many elements of $S$ have length at most 6?
#numopts([8], [9], [10], [29])]

#q[14][Recursion][
A set $T$ of strings over the alphabet ${a, b, c}$ is recursively defined as follows, where $epsilon$ is the empty string:
#clauses(
  ([$epsilon in T$.], [(base clause)]),
  ([If $x in T$, then $x a in T$.], [(recursion clause)]),
  ([If $x in T$, then $x b b in T$ and $x c c in T$.], [(recursion clause)]),
  (minimality, [(minimality clause)]),
)
Let $G_n$ denote the number of elements of $T$ with length $n$. What is $G_6$?
#numopts([13], [21], [43], [64])]

#q[15][Induction][
A predicate $P$ on $ZZ^+$ is known to satisfy the following three statements, and nothing else is known about it.
#pad(left: 1.2em, grid(columns: (auto, 1fr), column-gutter: 0.7em, row-gutter: 0.5em,
  [(1)], [$P(1)$ is true.],
  [(2)], [For every $k in ZZ^+$, $P(k) -> P(3k)$.],
  [(3)], [For every integer $k >= 3$, $P(k) -> P(k - 2)$.],
))
For how many $n in {1, 2, ..., 20}$ can we conclude that $P(n)$ is true? (That is, for how many such $n$ is $P(n)$ true for every predicate $P$ on $ZZ^+$ that satisfies (1), (2) and (3)?)
#numopts([3], [8], [10], [20])]

#q[16][Cardinality][
A function $f : NN -> NN$ is _non-increasing_ if $f(a) >= f(b)$ whenever $a < b$, and it is _strictly increasing_ if $f(a) < f(b)$ whenever $a < b$. Consider the following two statements:
#rom(
  [The set of all non-increasing functions $f : NN -> NN$ is countable.],
  [The set of all strictly increasing functions $f : NN -> NN$ is countable.],
)
Which of the following is correct?
#opts(cols: 2,
  [Both (i) and (ii) are false.],
  [(i) is true and (ii) is false.],
  [(i) is false and (ii) is true.],
  [Both (i) and (ii) are true.],
)]

#q[17][Cardinality][
Let $A = {1, 2, 3}$. There are $8^3 = 512$ functions $f : A -> PP(A)$. For each of them, define the set $D_f = {x in A : x in.not f(x)}$. For how many of the 512 functions $f$ is $D_f$ an element of the range of $f$?
#numopts([0], [64], [448], [512])]

#q[18][Counting][
What is the smallest natural number $n$ such that every set of $n$ integers chosen from ${1, 2, ..., 20}$ contains two integers that differ by exactly 3?
#numopts([4], [10], [11], [12])]

#q[19][Counting][
A bag contains 4 red, 4 green and 4 blue marbles. Marbles of the same colour are identical. How many different selections of 7 marbles can be made from the bag?
#numopts([4], [12], [30], [36])]

#q[20][Probability][
A condition affects 10% of a population. For a person who has the condition, a test is positive with probability 0.9. For a person who does not have the condition, the test is positive with probability 0.3. A person chosen at random from the population takes the test twice; given whether or not the person has the condition, the two results are independent. Both results are positive. What is the probability that the person has the condition?
#numopts([$1 slash 2$], [$3 slash 4$], [$81 slash 100$], [$9 slash 10$])]

#q[21][Probability][
Let $A = {1, 2, 3, 4}$. A _fixed point_ of a function $f : A -> A$ is an element $x in A$ with $f(x) = x$. Let $X$ be the number of fixed points of a function chosen uniformly at random from all $4^4 = 256$ functions $A -> A$, and let $Y$ be the number of fixed points of a bijection chosen uniformly at random from all $4! = 24$ bijections $A -> A$. Which of the following is true?
#opts(
  [$E[X] < E[Y]$.],
  [$E[X] = E[Y]$ and $P(X = 0) = P(Y = 0)$.],
  [$E[X] = E[Y]$ and $P(X = 0) > P(Y = 0)$.],
  [$E[X] = E[Y]$ and $P(X = 0) < P(Y = 0)$.],
  nota,
)]

#q[22][Graphs][
Consider the simple graphs with vertex set ${1, 2, 3, 4}$. Two such graphs are different if their edge sets are different, so there are $2^6 = 64$ of them. How many of these 64 graphs are connected?
#numopts([16], [26], [32], [41])]

#q[23][Trees][
In a binary tree every child is designated either a left child or a right child. The root is at level 0 and the height of the tree is the maximum level of its vertices. How many binary trees with exactly four vertices, labelled $A$, $B$, $C$, $D$, have in-order traversal $A space B space C space D$ and height 2?
#numopts([4], [6], [8], [14])]

#pagebreak(weak: true)
// ============================================================================
= Part B: Structured Questions
// ============================================================================

There are 3 questions in this part. #h(1fr) #text(size: 8.4pt, fill: muted)[\[Total: 54 marks\]]

#q(split: true)[24][Counting and Probability #h(0.4em) \[Total: 20 marks\]][
Working is not required for this question. Write each answer as a single number or a single fraction.
#parts(work: (2.5cm, 2.5cm, 2.5cm, 2.5cm, 2.5cm, 2.5cm, 2.5cm, 2.5cm,),
[How many distinct arrangements of the nine letters of the word INDUCTION have the two N's next to each other and the two I's *not* next to each other? #mk(2)],
[Three married couples (six people) sit in a row of six seats. In how many ways can they be seated so that nobody sits next to his or her own spouse? #mk(3)],
[Sixteen identical cookies are shared out among four children (the children are distinguishable), and all sixteen are given out. In how many ways can this be done if every child gets at least 1 and at most 6 cookies? #mk(3)],
[Let $cal(F)$ be the set of all 3-element subsets of ${1, 2, 3, 4, 5, 6}$, so that $|cal(F)| = 20$. What is the smallest $n$ such that every set of $n$ elements of $cal(F)$ contains two elements $X$ and $Y$ with $X inter Y = nothing$? #mk(2)],
[How many functions $f : {1, 2, 3, 4} -> {1, 2, 3, 4, 5, 6}$ satisfy $f(1) <= f(2) <= f(3) <= f(4)$? #mk(2)],
[Parts (f), (g) and (h) are about the following experiment. Let $A = {1, 2, 3, 4}$. A relation $R$ on $A$ is chosen uniformly at random from all $2^16$ relations on $A$; equivalently, each of the 16 ordered pairs in $A times A$ is put into $R$ with probability $1 slash 2$, independently of the other pairs. \
Given that $R$ has exactly three elements (that is, $R$ consists of exactly three ordered pairs), what is the probability that $R$ is symmetric? #mk(3)],
[What is the expected number of elements $x in A$ that are related to no element of $A$, that is, for which there is no $y in A$ with $x R y$? #mk(2)],
[Call an ordered triple $(x, y, z) in A times A times A$ a _gap_ of $R$ if $x R y$ and $y R z$ but $(x, z) in.not R$; the elements $x$, $y$, $z$ need not be distinct. (So $R$ is transitive if and only if it has no gap.) \
What is the expected number of gaps of $R$? #mk(3)],
)]

#q(split: true)[25][Graphs and Trees #h(0.4em) \[Total: 20 marks\]][
Working is not required for this question. Parts (a) to (d) are about the simple graph $G$ shown below, which has the five vertices $a, b, c, d, e$ and seven edges. $A$ denotes the adjacency matrix of $G$ with the vertices taken in the order $a, b, c, d, e$.
#align(center, gdraw(
  (([$a$], 0.3, 1.5), ([$b$], 1.5, 1.5), ([$c$], 2.7, 1.5), ([$d$], 3.9, 1.5), ([$e$], 2.1, 0.3)),
  ((0, 1), (1, 2), (2, 3), (0, 4), (1, 4), (2, 4), (3, 4)),
  w: 4.2cm, h: 1.8cm))
#parts(work: (2.5cm, 2.5cm, 3cm, 2.5cm, 2.5cm, 3.75cm, 3cm,),
[(Total: 3 marks)
#rom(
  [How many walks of length 4 are there from $a$ to $d$ in $G$? #mk(2)],
  [How many of the walks counted in (i) are paths? #mk(1)],
)],
[What is the sum of the five diagonal entries of $A^3$? #mk(2)],
[(Total: 3 marks) Two spanning trees of $G$ are different if their edge sets are different.
#rom(
  [How many spanning trees does $G$ have? #mk(2)],
  [What is the largest number of spanning trees of $G$ that can be chosen so that no two of the chosen trees are isomorphic? #mk(1)],
)],
[$G$ has an Euler trail but no Euler circuit. (i) Which two vertices are the two ends of every Euler trail of $G$? (ii) Exactly one edge of $G$ has the property that deleting it (its endpoints are kept) leaves a graph with an Euler circuit. Which edge is it? #mk(2)],
[A tree $T$ has exactly two vertices of degree 4 and exactly three vertices of degree 3. Every other vertex of $T$ has degree 1 or 2. How many vertices of degree 1 does $T$ have? #mk(2)],
[#block(breakable: false)[(Total: 5 marks) An undirected weighted graph $H$ is shown below.
#align(center, gdraw(
  (([$a$], 0.3, 1.9), ([$b$], 1.9, 1.9), ([$c$], 3.5, 1.9), ([$d$], 0.3, 0.3), ([$e$], 1.9, 0.3), ([$f$], 3.5, 0.3), ([$g$], 4.8, 1.1)),
  ((0, 1, 4), (1, 2, 8), (0, 3, 7), (1, 4, 2), (2, 5, 3), (3, 4, 6), (4, 5, 9), (0, 4, 5), (1, 5, 10), (2, 6, 11), (5, 6, 1)),
  w: 5.1cm, h: 2.2cm))
#rom(
  [Prim's algorithm is started at the vertex $a$. List the edges of $H$ in the order in which the algorithm adds them to its tree. #mk(2)],
  [Kruskal's algorithm examines the edges of $H$ one at a time in increasing order of weight, and stops as soon as its tree is complete. How many edges does it examine altogether, and which of the examined edges does it reject (that is, not add)? #mk(2)],
  [The edge ${b, c}$ is now deleted from $H$. What is the weight of a minimum spanning tree of the remaining graph? #mk(1)],
)]],
[The _level-order_ traversal of a binary tree lists the root, then the vertices on level 1 from left to right, then the vertices on level 2 from left to right, and so on (breadth-first search). The level-order and in-order traversals of a certain binary tree are given below. Write out its post-order traversal. #mk(3)
#pad(left: 2em)[Level-order: #h(0.5em) C O M P U T E R S \ In-order: #h(1.55em) O E P R C U S M T]],
)]

#pagebreak(weak: true)
#q(split: true)[26][Mathematical Induction and Recurrences #h(0.4em) \[Total: 14 marks\]][
For $n in ZZ^+$ let $A_n = {1, 2, ..., n}$. An _involution_ of $A_n$ is a function $f : A_n -> A_n$ with $f compose f = idf_(A_n)$; in other words, $f(f(x)) = x$ for every $x in A_n$. Every involution is a bijection and is its own inverse. Let $a_n$ denote the number of involutions of $A_n$. For example, $a_1 = 1$ and $a_2 = 2$: the involutions of $A_2$ are the identity function and the function that swaps 1 and 2.
#parts(work: (2.5cm, 5cm, 3.75cm, 9cm,),
[List all the involutions of $A_3$, writing each one as the triple $(f(1), f(2), f(3))$, and state the value of $a_3$. #mk(2)],
[Let $n >= 3$ be an integer. By considering the value of $f(n)$, explain why
$ a_n = a_(n-1) + (n - 1) dot a_(n-2). $
Hence find $a_4$, $a_5$ and $a_6$. #mk(3)],
[Dueet claims that $a_n <= 2^n$ for all $n in ZZ^+$ and gives the "proof" below. #mk(3)
#pad(left: 1em)[
1. Let $P(n) equiv (a_n <= 2^n)$ for $n in ZZ^+$. \
2. Basis step: $a_1 = 1 <= 2^1$ and $a_2 = 2 <= 2^2$, so $P(1)$ and $P(2)$ are true. \
3. Inductive step: let $k >= 2$ be an integer and assume that $P(i)$ is true for every integer $i$ with $1 <= i <= k$. \
4. Then $a_(k+1) = a_k + k dot a_(k-1) <= 2^k + k dot 2^(k-1)$, by the recurrence of part (b) and the induction hypothesis, used for $k$ and for $k - 1$. \
5. But $2^k + k dot 2^(k-1) = (2 + k) dot 2^(k-1) <= 4 dot 2^(k-1) = 2^(k+1)$, so $a_(k+1) <= 2^(k+1)$ and $P(k + 1)$ is true. \
6. Therefore $P(n)$ is true for all $n in ZZ^+$, by strong induction.]
(i) Which line contains the mistake, and what exactly is wrong with it? \
(ii) What is the smallest $n in ZZ^+$ for which the statement $a_n <= 2^n$ is false?],
[Prove by strong induction that $a_n > 2^n$ for every integer $n >= 6$. #mk(6)],
)]

#align(center, text(size: 8.4pt, fill: muted)[— End of paper —]) <end-of-paper>

#pagebreak()
// ============================================================================
= Answer Key
// ============================================================================

Part A. #h(0.3em) The answers to Part B follow the Part A solutions.

#table(columns: (auto,) + (1fr,) * 12, align: center,
  [Question], ..range(1, 13).map(i => [#i]),
  [Answer], [D], [C], [E], [B], [A], [C], [B], [B], [A], [D], [C], [E],
  [*Question*], ..range(13, 24).map(i => [*#i*]), [],
  [Answer], [B], [C], [C], [B], [A], [D], [E], [A], [D], [E], [B], [],
)

In paper order: #h(0.3em) D C E B A #h(0.5em) C B B A D #h(0.5em) C E B C C #h(0.5em) B A D E A #h(0.5em) D E B. #h(0.5em) Each question is worth 2 marks. Every answer was checked by exhaustive enumeration, with every option evaluated, except Q16, which is proved below. Topics: Q1–3 logic and proof, Q4–5 sets, Q6–9 relations, Q10–12 functions, Q13–15 induction and recursion, Q16–17 cardinality, Q18–21 counting and probability, Q22–23 graphs and trees.

// ============================================================================
= Part A Solutions
// ============================================================================

#sol[1][D][Rows $(p, q)$: in TT and FT the conclusion $q$ is true, and in TF the premise $p -> q$ is false. Only the row FF can be a critical row with a false conclusion, so the argument is valid iff $X$ is false in row FF; $X$ is free in the other three rows: $2^3 = 8$. *Trap (C) 7:* if $X$ is a contradiction there is no critical row, and the argument is then valid by the definition. *(B) 4* also demands that $X$ implies $p$, which wrongly fixes row FT. (A) counts only $p$ and $p and q$.]

#sol[2][C][Let the row of $x$ be ${y : x R y}$. (i) says that every row is one of ${1}$, ${2}$, ${1, 2}$: $3^3 = 27$ relations. (ii) says that some $y$ lies in all three rows, and (ii) implies (i). All rows contain 1: $2^3 = 8$; all contain 2: 8; both: 1. So (ii) holds for $8 + 8 - 1 = 15$ relations and the answer is $27 - 15 = 12$. *Trap (B) 11* subtracts 16, counting $A times B$ twice. (A) 6 counts only the functions onto $B$; (D) 27 is (i) alone.]

#sol[3][E][$12 dv n^2$ iff $2 dv n$ and $3 dv n$ iff $6 dv n$ (then $36 dv n^2$). The counterexamples are the multiples of 6 that are not multiples of 12: $6, 18, 30, 42, 54, 66, 78, 90$. That is $16 - 8 = 8$, which is not listed. *Trap (A) 0:* "$d dv n^2 -> d dv n$" holds when $d$ is prime, not for $d = 12 = 2^2 dot 3$. (B) 16 counts every $n$ with a true hypothesis; (C) 84 counts the $n$ with a false hypothesis; (D) 92 counts the $n$ for which the conditional is true.]

#sol[4][B][$x subset.eq A$ needs $x$ to be a set whose elements all belong to $A$. $nothing$: yes (vacuously). ${1}$: yes, as $1 in A$. ${1, {2}}$: yes, as $1 in A$ and ${2} in A$. ${2}$: no, as $2 in.not A$ (only ${2}$ is an element). ${{1}, 2}$: no, as $2 in.not A$. The number 1 is not a set. Answer 3. *Trap (C) 4* accepts ${2}$ because ${2} in A$: membership is not inclusion. (A) 2 forgets $nothing$; (D) 5 counts every element that is a set.]

#sol[5][A][$|A xor B| = |A| + |B| - 2|A inter B| = 9 - 2k$ with $k = |A inter B|$. Here $k <= |B| = 4$, and $k >= |A| + |B| - |U| = 1$ because $|A union B| <= 8$. Each of $k = 1, 2, 3, 4$ occurs, giving the values $7, 5, 3, 1$: four values. *Trap (B) 5* allows $k = 0$, but disjoint $A$ and $B$ would need 9 elements. (C) 7 and (D) 8 ignore that $9 - 2k$ is always odd.]

#sol[6][C][A symmetric and transitive $R$ is an equivalence relation on the set $S$ of elements that are related to something (if $x R y$ then $y R x$, so $x R x$), and it relates nothing else. $S = nothing$: 1 relation; $|S| = 1$: 3; $|S| = 2$: $3 dot 2$; $S = A$: 5. Total 15, and the 5 with $S = A$ are reflexive: $15 - 5 = 10$. *Trap (A) 0:* "symmetric and transitive imply reflexive" needs every element to be related to something. (B) 5 counts the equivalence relations; (D) 15 forgets to remove them.]

#sol[7][B][Count the partitions of $A$ into 3 components. Sizes $3 + 1 + 1$: $binom(5, 3) = 10$. Sizes $2 + 2 + 1$: choose the singleton (5 ways), then split the other four elements into two pairs (3 ways): 15. Total 25. *Trap (C) 40* uses $binom(5, 2) binom(3, 2) = 30$ for the second type, counting each pair of pairs twice. (D) 150 is the number of surjections onto three _labelled_ classes; dividing by $3!$ gives 25. (A) 10 counts only the first type.]

#sol[8][B][$<=$ is a linearization of $pleq$ iff $x pleq y$ implies $x <= y$. So $pleq$ consists of $(1, 1), (2, 2), (3, 3)$ and a subset $T$ of ${(1, 2), (1, 3), (2, 3)}$. Antisymmetry is automatic, and transitivity fails only for $T = {(1, 2), (2, 3)}$, which lacks $(1, 3)$: $2^3 - 1 = 7$. *Trap (C) 8* forgets transitivity. (A) 6 also throws out $T = nothing$ (equality) or $<=$ itself, but both are partial orders with $<=$ as a linearization. (D) 19 is the number of all partial orders on ${1, 2, 3}$.]

#sol[9][A][A line joins $X$ (below) to $Y$ iff $X subset.neq Y$ with no set strictly between, that is, $Y = X union {a}$ with $a in.not X$. So $X$ has $4 - |X|$ lines going up, and the total is $sum_(k=0)^4 binom(4, k)(4 - k) = 4 dot 2^3 = 32$. *Trap (C) 65* $= 3^4 - 2^4$ counts every pair $X subset.neq Y$; lines implied by transitivity are not drawn. (B) 64 $= 16 dot 4$ counts each line from both ends. (D) 81 $= 3^4$ is the number of ordered pairs in the relation $subset.eq$ itself.]

#sol[10][D][$f compose f = f$ iff $f(y) = y$ for every $y$ in the range of $f$. Choose the range $R$, whose elements are fixed, then send each remaining element to any element of $R$. $|R| = 1$: $3 dot 1$; $|R| = 2$: $3 dot 2$; $|R| = 3$: 1 (the identity). Total $3 + 6 + 1 = 10$. *Trap (A) 4* finds only the identity and the three constant functions. (B) 7 counts one function for each 2-element range instead of two; (C) 9 forgets the identity.]

#sol[11][C][Splitting $A$ into the cycles of $f$, the order of $f$ is the least common multiple of the cycle lengths, and the lengths add up to 7. Lengths 3 and 4 give $"lcm"(3, 4) = 12$, for example $1 |-> 2 |-> 3 |-> 1$ and $4 |-> 5 |-> 6 |-> 7 |-> 4$. No other split does better: $7$ gives 7, $5 + 2$ gives 10, $3 + 2 + 2$ gives 6, $4 + 2 + 1$ gives 4. *Trap (A) 7:* the longest cycle does not give the largest order. (B) 10 stops at $5 + 2$. (D) 5040 $= 7!$ is the number of bijections.]

#sol[12][E][There are $3^5 - 3 dot 2^5 + 3 = 150$ surjections, and by symmetry a third of them have $f(1) = a$: 50, which is not listed. Directly: $a$ is already hit, so $f(2), ..., f(5)$ must only cover $b$ and $c$: $3^4 - 2 dot 2^4 + 1 = 50$. *Trap (B) 36* asks the other four elements to be onto $B$ by themselves. (A) 14 forbids them from taking the value $a$. (C) 81 ignores surjectivity; (D) 150 ignores $f(1) = a$.]

#sol[13][B][Length 0: $epsilon$. Length 2: $a b$. Length 4: $a a b b$, $a b a b$. Length 6: $a a a b b b$, $a a b a b b$, $a a b b a b$, $a b a a b b$, $a b a b a b$. Total $1 + 1 + 2 + 5 = 9$. *Trap (C) 10* counts derivations: $a b a b a b = (a b)(a b a b) = (a b a b)(a b)$ is one element. (A) 8 forgets $epsilon$. (D) 29 $= 1 + 2 + 6 + 20$ counts all strings with equally many $a$'s and $b$'s, but $b a in.not S$ and $a b b a in.not S$: by structural induction no prefix of an element of $S$ has more $b$'s than $a$'s.]

#sol[14][C][Every non-empty element of $T$ ends in $a$, $b b$ or $c c$, and removing that ending leaves an element of $T$; so each string is built in exactly one way. Hence $G_n = G_(n-1) + 2 G_(n-2)$ with $G_0 = 1$ (for $epsilon$) and $G_1 = 1$: $1, 1, 3, 5, 11, 21, 43$. *Trap (A) 13* uses $G_n = G_(n-1) + G_(n-2)$, but two constructors add length 2. (B) 21 is $G_5$, obtained by starting from $G_0 = 0$ (forgetting $epsilon$). (D) 64 $= 2^6$ doubles at every step.]

#sol[15][C][By (2), $P(1)$ gives $P(3)$, $P(9)$, $P(27)$. By (3), $P(27)$ gives $P(25), P(23), ..., P(1)$. So $P(n)$ is forced for all 10 odd $n <= 20$. No even $n$ is forced: the predicate "$n$ is odd" satisfies (1), (2) and (3). *Trap (D) 20:* going up and then down proves everything only when the downward step is 1. *Trap (B) 8* never leaves ${1, ..., 20}$: it reaches $1, 3, 9, 7, 5, 15, 13, 11$ but not 17 and 19, which come down from $21 = 3 dot 7$ or 27. (A) 3 uses (2) only.]

#sol[16][B][(i) True: $f(0) >= f(1) >= dots.c >= 0$, so the value can drop at most $f(0)$ times and $f$ is constant from some index on; let $m$ be the least such index. Then $f |-> (f(0), f(1), ..., f(m))$ is an injection into the set of finite sequences of natural numbers, which is countable, and a set that injects into a countable set is countable. (ii) False: if the set were countable, some sequence $f_0, f_1, f_2, ...$ would contain every strictly increasing function (Lemma 9.2); but then the function $g$ with $g(0) = f_0 (0) + 1$ and $g(n) = max(g(n - 1), f_n (n)) + 1$ for $n >= 1$ is strictly increasing with $g(n) != f_n (n)$ for every $n$, so $g$ is not in the sequence, a contradiction. *Trap:* treating the two kinds of monotone function alike, as (A) and (D) do; (C) swaps them.]

#sol[17][A][For every $x in A$: $x in D_f$ iff $x in.not f(x)$, so the sets $D_f$ and $f(x)$ disagree about $x$ and $D_f != f(x)$. Hence $D_f$ is never in the range of $f$: the answer is 0 for all 512 functions. This is the diagonal argument that no function $A -> PP(A)$ is surjective. (B) 64 $= 4^3$ is the number of $f$ with $D_f = nothing$; (C) 448 is its complement; (D) 512 is all of them.]

#sol[18][D][Sort ${1, ..., 20}$ into the chains $1, 4, ..., 19$ (7 numbers), $2, 5, ..., 20$ (7) and $3, 6, ..., 18$ (6); two numbers differ by 3 iff they are neighbours in a chain. Avoiding neighbours allows at most $4 + 4 + 3 = 11$ numbers, for example ${1, 2, 3, 7, 8, 9, 13, 14, 15, 19, 20}$, so 12 are needed. *Trap (C) 11* is the size of the largest set with no such pair. (B) 10 pairs up ${1, 4}, ..., {15, 18}$ and forgets that 19 and 20 are two more pigeonholes. (A) 4 only forces a difference that is a multiple of 3.]

#sol[19][E][Count the triples $(r, g, b)$ with $r + g + b = 7$ and $0 <= r, g, b <= 4$. Without the upper bounds: $binom(9, 2) = 36$. With $r >= 5$: $binom(4, 2) = 6$, the same for each colour, and never two colours at once. So $36 - 18 = 18$, which is not listed (check: $(4, 3, 0)$ in 6 orders, $(4, 2, 1)$ in 6, $(3, 3, 1)$ in 3, $(3, 2, 2)$ in 3). *Trap (D) 36* ignores the supply. (C) 30 subtracts for one colour only; (B) 12 keeps only the selections with 4 of some colour; (A) 4 counts patterns without assigning colours.]

#sol[20][A][Let $C$ be "has the condition", so $P(C) = 0.1$. Two positive results have probability $0.81$ given $C$ and $0.09$ given not $C$ (the squares of 0.9 and 0.3). By Bayes' theorem the answer is $(0.1 dot 0.81) slash (0.1 dot 0.81 + 0.9 dot 0.09) = 0.081 slash 0.162 = 1 slash 2$. *Trap (D) 9/10* $= 0.81 slash (0.81 + 0.09)$ ignores the base rate of 10%; (B) 3/4 $= 0.9 slash (0.9 + 0.3)$ does the same for a single test. (C) 81/100 is the probability of two positives given $C$, the conditional the wrong way round. (After one positive result the answer would be $1 slash 4$.)]

#sol[21][D][For each $i in A$, $P(f(i) = i) = 1 slash 4$ both for a random function and for a random bijection, so by linearity of expectation $E[X] = E[Y] = 4 dot 1/4 = 1$, and (A) is false. $P(X = 0) = (3 slash 4)^4 = 81 slash 256 approx 0.316$. The bijections with no fixed point are the six 4-cycles and the three double swaps: $P(Y = 0) = 9 slash 24 = 0.375$. *Trap (B):* equal expected values do not give equal distributions. *Trap (C):* $P(Y = 0)$ is not $3/4 dot 2/3 dot 1/2 = 1/4$, because the values of a bijection are not chosen independently.]

#sol[22][E][Count by the number of edges; a connected graph needs at least 3. 3 edges: the 16 trees (12 paths, 4 stars). 4 edges: all $binom(6, 4) = 15$, since a disconnected graph on 4 vertices has at most 3 edges. 5 edges: 6. 6 edges: 1. Total 38, which is not listed. *Trap (D) 41* $= 64 - 23$ removes only the 23 graphs with an isolated vertex; the 3 graphs made of two disjoint edges are also disconnected. (C) 32 $= 64 - 4 dot 8$ skips inclusion and exclusion; (A) 16 counts trees only; (B) 26 counts the disconnected graphs.]

#sol[23][B][The in-order sequence fixes the labels once the shape is chosen, so count the shapes with 4 vertices and height 2. Height at most 1 allows only 3 vertices, so the height is 2 or 3. There are 14 shapes in all, and height 3 means a chain in which each of the 3 children is a left or a right child: $2^3 = 8$. So $14 - 8 = 6$. Directly, by the sizes of the root's left and right subtrees: $(1, 2)$ and $(2, 1)$ give 2 each, $(3, 0)$ and $(0, 3)$ give 1 each. *Trap (A) 4* forgets the last two cases. (C) 8 counts the chains; (D) 14 ignores the height.]

#pagebreak(weak: true)
// ============================================================================
= Part B Answers
// ============================================================================

#table(columns: (auto, 1fr),
  [Question], [Final answers],
  [24], [(a) 15120 #h(0.5em) (b) 240 #h(0.5em) (c) 125 #h(0.5em) (d) 11 #h(0.5em) (e) 126 #h(0.5em) (f) $1/20$ #h(0.5em) (g) $1/4$ #h(0.5em) (h) $9/2$.],
  [25], [(a) (i) 9; (ii) 3 #h(0.5em) (b) 18 #h(0.5em) (c) (i) 21; (ii) 3 #h(0.5em) (d) (i) $b$ and $c$; (ii) the edge ${b, c}$ #h(0.5em) (e) 9 #h(0.5em) (f) (i) ${a, b}$, ${b, e}$, ${d, e}$, ${b, c}$, ${c, f}$, ${f, g}$; (ii) 8 edges examined, ${a, e}$ and ${a, d}$ rejected; (iii) 25 #h(0.5em) (g) E R P O S U T M C.],
  [26], [(a) $(1, 2, 3)$, $(2, 1, 3)$, $(3, 2, 1)$, $(1, 3, 2)$; $a_3 = 4$ #h(0.5em) (b) explanation below; $a_4 = 10$, $a_5 = 26$, $a_6 = 76$ #h(0.5em) (c) (i) line 5: $(2 + k) dot 2^(k-1) <= 4 dot 2^(k-1)$ holds only for $k <= 2$; (ii) $n = 6$ #h(0.5em) (d) proof below.],
)

*Marking Part B.* Parts with a single final answer are right or wrong. Where a part has several answers, the marks are shared equally between them. In 26(b), 2 marks are for the explanation (1 for each case) and 1 for the three values. In 26(c), 1 mark is for naming line 5, 1 for saying that its inequality needs $k <= 2$ while $k$ is any integer with $k >= 2$, and 1 for $n = 6$. In 26(d), 1 mark is for stating $P(n)$, 2 for the two basis cases, 2 for the inductive step with the hypothesis used on $k$ and on $k - 1$, and 1 for the range of $k$ and the conclusion. Every numeric answer of Part B was checked by brute-force enumeration.

== Worked solutions to Part B

#sol[24][][
*(a)* *15120.* Glue the two N's into one block NN. The eight units NN, I, I, D, U, C, T, O, with I appearing twice, can be arranged in $8! slash 2! = 20160$ ways; these are the arrangements with the N's together. Among them, those with the I's together as well are the arrangements of the seven distinct units NN, II, D, U, C, T, O: $7! = 5040$. By the difference rule, $20160 - 5040 = 15120$. (Starting from all $9! slash (2! thin 2!) = 90720$ arrangements and removing those with the I's together gives $90720 - 20160 = 70560$, which forgets that the N's must be together.) \
*(b)* *240.* For $i = 1, 2, 3$ let $A_i$ be the set of seatings in which couple $i$ sit next to each other. Gluing a couple into a block that has 2 inner orders gives $|A_i| = 2 dot 5! = 240$, $|A_i inter A_j| = 2^2 dot 4! = 96$ and $|A_1 inter A_2 inter A_3| = 2^3 dot 3! = 48$. By inclusion and exclusion $|A_1 union A_2 union A_3| = 3 dot 240 - 3 dot 96 + 48 = 480$, so the answer is $6! - 480 = 240$. (Stopping after the first term gives $720 - 720 = 0$, which is the warning that the sets overlap.) \
*(c)* *125.* Let child $i$ get $x_i$ cookies: $x_1 + x_2 + x_3 + x_4 = 16$ with $1 <= x_i <= 6$. Put $y_i = x_i - 1$: $y_1 + y_2 + y_3 + y_4 = 12$ with $0 <= y_i <= 5$. Without the upper bounds there are $binom(15, 3) = 455$ solutions. Those with one particular $y_i >= 6$: give that child 6 first and share out the other 6, $binom(9, 3) = 84$. Those with two particular $y_i >= 6$: nothing is left, 1 solution. Three at once is impossible ($18 > 12$). By inclusion and exclusion, $455 - 4 dot 84 + binom(4, 2) dot 1 = 455 - 336 + 6 = 125$. (Forgetting to add back the 6 gives 119.) \
*(d)* *11.* Two 3-element subsets of a 6-element set are disjoint iff each is the complement of the other. So sort the 20 subsets into the 10 pigeonholes ${X, {1, ..., 6} without X}$. Any 11 elements of $cal(F)$ put two in one pigeonhole #j[pigeonhole principle], and those two are disjoint. Ten are not enough: the $binom(5, 2) = 10$ subsets that contain the number 1 meet one another. (Each element of $cal(F)$ is disjoint from exactly one other element, its complement; so "no two disjoint" means "at most one from each pigeonhole".) \
*(e)* *126.* Such an $f$ is determined by how many times each of the values $1, ..., 6$ is used, that is, by a multiset of size 4 chosen from 6 values (list the multiset in increasing order to recover $f$): $binom(4 + 6 - 1, 4) = binom(9, 4) = 126$. ($binom(6, 4) = 15$ counts only the strictly increasing functions, and $6^4 = 1296$ counts all functions.) \
*(f)* *$1/20$.* There are $binom(16, 3) = 560$ relations with exactly three ordered pairs, all equally likely. A symmetric relation is made of pairs $(x, x)$ and of two-pair blocks ${(x, y), (y, x)}$ with $x != y$. Three ordered pairs are either three pairs $(x, x)$, in $binom(4, 3) = 4$ ways, or one pair $(x, x)$ and one block, in $4 dot binom(4, 2) = 24$ ways. So $P = 28 slash 560 = 1 slash 20$. (Counting only the first kind gives $1/140$.) \
*(g)* *$1/4$.* For $x in A$ let $X_x = 1$ if $x$ is related to no element and $X_x = 0$ otherwise. $X_x = 1$ iff none of the four pairs $(x, 1), (x, 2), (x, 3), (x, 4)$ is in $R$, and this includes the pair $(x, x)$: $P(X_x = 1) = (1/2)^4 = 1/16$. By linearity of expectation the answer is $4 dot 1/16 = 1/4$. (Leaving out $y = x$ gives $(1/2)^3$ and the wrong answer $1/2$.) \
*(h)* *$9/2$.* For each triple $t = (x, y, z)$ let $X_t = 1$ if $t$ is a gap of $R$ and $X_t = 0$ otherwise; the number of gaps is the sum of the 64 variables $X_t$.
- If $x = y$, a gap would need $(y, z) = (x, z)$ to be in $R$ and not in $R$: impossible, so $E[X_t] = 0$.
- If $y = z$, a gap would need $(x, y) = (x, z)$ to be in $R$ and not in $R$: impossible, so $E[X_t] = 0$.
- If $x != y$ and $y != z$, then $(x, y)$, $(y, z)$ and $(x, z)$ are three different ordered pairs (this includes the case $x = z$, where the third pair is $(x, x)$), so $E[X_t] = 1/2 dot 1/2 dot 1/2 = 1/8$.
There are $4 dot 3 dot 3 = 36$ triples of the third kind, so by linearity of expectation the answer is $36 dot 1/8 = 9/2$. (All 64 triples would give 8; only the 24 triples of distinct elements would give 3, missing gaps such as $1 R 2$, $2 R 1$, $(1, 1) in.not R$.)]

#sol[25][][
*(a)* With the vertices in the order $a, b, c, d, e$:
$ A = mat(0, 1, 0, 0, 1; 1, 0, 1, 0, 1; 0, 1, 0, 1, 1; 0, 0, 1, 0, 1; 1, 1, 1, 1, 0), quad A^2 = mat(2, 1, 2, 1, 1; 1, 3, 1, 2, 2; 2, 1, 3, 1, 2; 1, 2, 1, 2, 1; 1, 2, 2, 1, 4). $
(i) *9.* The $(a, d)$ entry of $A^4 = A^2 A^2$ is (row $a$ of $A^2$) $dot$ (column $d$ of $A^2$) $= (2, 1, 2, 1, 1) dot (1, 2, 1, 2, 1) = 2 + 2 + 2 + 2 + 1 = 9$ #j[Theorem 10.3.2]. The nine walks are $a b e c d$, $a e b c d$, $a e d c d$, $a b a e d$, $a e a e d$, $a b c e d$, $a e b e d$, $a e c e d$, $a e d e d$. \
(ii) *3.* A path repeats no vertex, so a path of length 4 visits all five vertices: $a b c e d$, $a b e c d$ and $a e b c d$. The other six walks repeat a vertex. \
*(b)* *18.* The $(v, v)$ entry of $A^3$ is the number of walks of length 3 from $v$ back to $v$. $G$ is simple, so such a walk goes once round a triangle through $v$, in one of 2 directions. The triangles are $a b e$, $b c e$ and $c d e$, so the diagonal of $A^3$ is $2, 4, 4, 2, 6$ and the sum is 18 (3 triangles, each counted from 3 starting vertices in 2 directions). \
*(c)* (i) *21.* A spanning tree has 4 of the 7 edges. Sort the spanning trees by the set $K$ of edges kept among $a b$, $b c$, $c d$. The edges of $K$ cut the row $a, b, c, d$ into blocks of consecutive vertices. Each block must be joined to $e$ by exactly one of its edges to $e$: with none the block is cut off from $e$, and with two there is a circuit. So $K$ gives (product of the block sizes) spanning trees. \
$K = nothing$: blocks $1, 1, 1, 1$, giving 1. One edge kept (3 ways): blocks $2, 1, 1$, giving 2 each, 6 in all. Two edges kept: ${a b, b c}$ and ${b c, c d}$ give $3 dot 1 = 3$ each, and ${a b, c d}$ gives $2 dot 2 = 4$, 10 in all. All three kept: one block of 4, giving 4. Total $1 + 6 + 10 + 4 = 21$. \
(ii) *3.* There are only three non-isomorphic trees with 5 vertices (degrees $2, 2, 2, 1, 1$; $3, 2, 1, 1, 1$; $4, 1, 1, 1, 1$), and each of them is a spanning tree of $G$: the path $a b c d e$, the tree with edges $a e, b e, c e, c d$, and the star with the four edges at $e$. \
*(d)* The degrees are $a$: 2, $b$: 3, $c$: 3, $d$: 2, $e$: 4. \
(i) *$b$ and $c$.* An Euler trail from $v$ to $w$ exists iff the graph is connected, $v$ and $w$ have odd degree and all other vertices have positive even degree #j[Corollary 10.2.5]. So every Euler trail joins the two odd vertices. \
(ii) *The edge ${b, c}$.* An Euler circuit needs every degree to be even #j[Theorem 10.2.2]. Deleting an edge changes the degrees of its two endpoints only, so the endpoints must be the two odd vertices $b$ and $c$. After deleting ${b, c}$ the graph is still connected (every vertex is adjacent to $e$) and its degrees are $2, 2, 2, 2, 4$, so it has an Euler circuit #j[Theorem 10.2.3], for example $e a b e c d e$. \
*(e)* *9.* Let $T$ have $ell$ vertices of degree 1 and $m$ vertices of degree 2, so it has $5 + m + ell$ vertices and $4 + m + ell$ edges #j[Theorem 10.5.2]. The total degree is twice the number of edges #j[handshake theorem]: $2 dot 4 + 3 dot 3 + 2m + ell = 2(4 + m + ell)$, that is $17 + ell = 8 + 2 ell$, so $ell = 9$ whatever $m$ is. (Such trees exist: take a path $u_1 v_1 v_2 v_3 u_2$ and hang 3 leaves on each of $u_1, u_2$ and 1 leaf on each of $v_1, v_2, v_3$.) \
*(f)* (i) *${a, b}$, ${b, e}$, ${d, e}$, ${b, c}$, ${c, f}$, ${f, g}$.* From $a$ the cheapest edge is $a b$ (4, against 5 and 7). From ${a, b}$: $b e$ (2). From ${a, b, e}$: $d e$ (6, against $a d$ 7, $b c$ 8, $e f$ 9, $b f$ 10). From ${a, b, d, e}$: $b c$ (8). Then $c f$ (3) and $f g$ (1). Prim's tree is connected at every stage, so the light edges $c f$ and $f g$ come last. \
(ii) *8 edges; it rejects ${a, e}$ and ${a, d}$.* In order of weight: $f g$ (1), $b e$ (2), $c f$ (3) and $a b$ (4) are added; $a e$ (5) is rejected, as it closes the circuit $a b e$; $d e$ (6) is added; $a d$ (7) is rejected, as it closes the circuit $a b e d$; $b c$ (8) is added. The tree now has $7 - 1 = 6$ edges, so the algorithm stops: the edges of weight 9, 10 and 11 are never examined. Both algorithms give the same tree (shown in bold), of weight $1 + 2 + 3 + 4 + 6 + 8 = 24$; it is the only minimum spanning tree, because the weights are all different.
#align(center, gdraw(
  (([$a$], 0.3, 1.9), ([$b$], 1.9, 1.9), ([$c$], 3.5, 1.9), ([$d$], 0.3, 0.3), ([$e$], 1.9, 0.3), ([$f$], 3.5, 0.3), ([$g$], 4.8, 1.1)),
  ((0, 1, 4), (1, 2, 8), (0, 3, 7), (1, 4, 2), (2, 5, 3), (3, 4, 6), (4, 5, 9), (0, 4, 5), (1, 5, 10), (2, 6, 11), (5, 6, 1)),
  bold: (0, 1, 3, 4, 5, 10), w: 5.1cm, h: 2.2cm))
(iii) *25.* Kruskal's algorithm runs as before up to $a d$ (7). The parts ${a, b, d, e}$ and ${c, f, g}$ must still be joined, and without $b c$ the cheapest edge between them is $e f$ (9): $1 + 2 + 3 + 4 + 6 + 9 = 25$. \
*(g)* *E R P O S U T M C.* The root is C, the first vertex of the level-order. The in-order splits into O E P R (left subtree) and U S M T (right subtree). Within a subtree, the vertex that comes first in the level-order is its root. \
Left subtree: of O, E, P, R the level-order lists O first, so O is its root. In the in-order O comes first, so O has no left child, and its right subtree has E, P, R with root P (first of these in the level-order); the in-order E | P | R makes E the left child and R the right child of P. \
Right subtree: of U, S, M, T the level-order lists M first. The in-order U S | M | T gives a left subtree on U, S with root U (before S in the level-order) and S as the right child of U (S comes after U in the in-order), and the right child T. \
Post-order: E R P O, then S U T M, then C. (Check: the levels of this tree are C; O M; P U T; E R S.)
#align(center, gdraw(
  (([C], 2.2, 2.9), ([O], 1.1, 2.1), ([M], 3.3, 2.1), ([P], 1.7, 1.3), ([E], 1.3, 0.5), ([R], 2.1, 0.5), ([U], 2.8, 1.3), ([T], 3.9, 1.3), ([S], 3.2, 0.5)),
  ((0, 1), (0, 2), (1, 3), (3, 4), (3, 5), (2, 6), (2, 7), (6, 8)), w: 4.4cm, h: 3.3cm))]

#sol[26][][
*(a)* *$(1, 2, 3)$, $(2, 1, 3)$, $(3, 2, 1)$, $(1, 3, 2)$; $a_3 = 4$.* These are the identity and the three functions that swap two elements and fix the third. The other two bijections are not involutions: for $(f(1), f(2), f(3)) = (2, 3, 1)$ we get $f(f(1)) = f(2) = 3 != 1$, and likewise for $(3, 1, 2)$. \
*(b)* Let $n >= 3$ and let $f$ be an involution of $A_n$. Exactly one of the following two cases occurs.
- *Case 1: $f(n) = n$.* Since $f$ is a bijection, it maps $A_(n-1)$ onto $A_(n-1)$, and its restriction to $A_(n-1)$ is an involution of $A_(n-1)$. Conversely every involution of $A_(n-1)$ extends in exactly one way, by $f(n) = n$. This case gives $a_(n-1)$ involutions.
- *Case 2: $f(n) = j$ for some $j in A_(n-1)$.* There are $n - 1$ choices of $j$. Then $f(j) = f(f(n)) = n$, so $f$ swaps $n$ and $j$. Since $f$ is a bijection, it maps the other $n - 2$ elements among themselves, and its restriction to them is an involution of a set with $n - 2$ elements, which can be chosen in $a_(n-2)$ ways. This case gives $(n - 1) dot a_(n-2)$ involutions.
By the addition rule $a_n = a_(n-1) + (n - 1) dot a_(n-2)$. Hence $a_4 = a_3 + 3 a_2 = 4 + 6 =$ *10*, $a_5 = a_4 + 4 a_3 = 10 + 16 =$ *26* and $a_6 = a_5 + 5 a_4 = 26 + 50 =$ *76*. \
*(c)* (i) *Line 5.* The step $(2 + k) dot 2^(k-1) <= 4 dot 2^(k-1)$ needs $2 + k <= 4$, that is $k <= 2$. But in line 3, $k$ is an arbitrary integer with $k >= 2$, so the inequality is true only for $k = 2$ and false for every $k >= 3$. The argument therefore proves $P(3)$ from $P(1)$ and $P(2)$ and nothing more. Lines 1 to 4 are correct: two basis cases are given, and the recurrence and both uses of the hypothesis are valid for $k >= 2$. \
(ii) *$n = 6$.* $a_3 = 4 <= 8$, $a_4 = 10 <= 16$ and $a_5 = 26 <= 32$, but $a_6 = 76 > 64$. So the statement happens to be true when $n$ is 4 or 5, although the "proof" does not establish it there; checking a few small cases does not reveal the mistake. \
*(d)* Proof.
+ For each integer $n >= 6$ let $P(n) equiv (a_n > 2^n)$.
+ Basis step: $a_6 = 76 > 64 = 2^6$, and $a_7 = a_6 + 6 a_5 = 76 + 156 = 232 > 128 = 2^7$ #j[part (b)]. So $P(6)$ and $P(7)$ are true.
+ Inductive step: let $k >= 7$ be an integer and assume that $P(i)$ is true for every integer $i$ with $6 <= i <= k$.
  + Then $6 <= k - 1 <= k$ #j[as $k >= 7$], so $P(k)$ and $P(k - 1)$ are true: $a_k > 2^k$ and $a_(k-1) > 2^(k-1)$ #j[induction hypothesis].
  + $a_(k+1) = a_k + k dot a_(k-1)$ #j[recurrence of part (b), valid as $k + 1 >= 3$]
  + $> 2^k + k dot 2^(k-1)$ #j[line 3.1, and $k > 0$]
  + $>= 2^k + 2 dot 2^(k-1)$ #j[$k >= 2$ and $2^(k-1) > 0$]
  + $= 2^k + 2^k = 2^(k+1)$ #j[basic algebra].
  + So $P(k + 1)$ is true.
+ Therefore $P(n)$ is true for every integer $n >= 6$ #j[strong induction]. #qed
Two basis cases are needed because the step uses both $P(k)$ and $P(k - 1)$: with $P(6)$ alone, the first step ($k = 6$) would call on $P(5)$, which is false. In line 3.4 the inequality $k >= 2$ points the right way, unlike in Dueet's line 5.]
