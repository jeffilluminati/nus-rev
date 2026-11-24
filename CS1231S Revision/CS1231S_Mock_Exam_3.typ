#import "exam_style.typ": *
#show: setup.with(doc-title: "CS1231S Mock Exam 3", running: [CS1231S · Mock Exam 3])

// ============================================================================
//  CS1231S Mock Exam 3 — statement trios and cross-topic questions
//  A full paper in the AY24/25 and AY25/26 format: Part A, 23 original MCQs (46 marks);
//  Part B, Q24 Counting and Probability (20), Q25 Graphs and Trees (20),
//  Q26 Recursively Defined Sets and Cardinality (14); answer key and worked solutions.
//  Compile:  typst compile CS1231S_Mock_Exam_3.typ "CS1231S Mock Exam 3.pdf"
//  Part A was re-solved blind and checked by brute force (solve_mock3.py); every
//  numeric answer of Part B is checked by brute force (partb_mock3.py).
// ============================================================================

// ---- helpers (same as CS1231S_Exam_Exercise_Sets.typ) ---------------------------
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
#let nota = [None of options (A), (B), (C), (D) is correct.]
#let sol(id, answer, body) = block(width: 100%, above: 0.85em, below: 0.85em, breakable: true, {
  text(weight: "bold", fill: accent)[#id]
  h(0.5em)
  if answer != none { ans(answer); h(0.5em) }
  body
})
#let none5 = [None of these.]
#let all3 = [All of (i), (ii) and (iii).]
#let pleqa = $scripts(pleq)_1$   // the order on A
#let pleqb = $scripts(pleq)_2$   // the order on B
// Structured-question parts (as in CS1231S_Exam_Exercise_Sets.typ). `work` lists the
// height of the ruled working panel under each part (none for no panel). Here a part
// and its panel are kept together on one page.
#let workpanel(h) = block(width: 100%, height: h, above: 0.6em, below: 0.3em,
  stroke: 0.4pt + luma(200), radius: 1.5pt)[]
#let parts(work: (), ..o) = pad(left: 0.4em, y: 0.15em, grid(
  columns: (1.7em, 1fr), row-gutter: 0.7em,
  ..o.pos().enumerate().map(((i, x)) => ([(#numbering("a", i + 1))], block(width: 100%, breakable: false, {
    x
    let h = work.at(i, default: none)
    if h != none { workpanel(h) }
  }))).flatten(),
))
#let mk(n) = { h(1fr); text(size: 8.4pt, fill: muted)[\[#n #if n == 1 [mark] else [marks]\]] }
#let cap(it) = text(size: 8pt, fill: muted, it)          // caption under a figure
#let seq(..xs) = xs.pos().join(h(0.75em))                // a traversal: items set apart

// ============================================================================
#text(size: 20pt, weight: "bold", fill: accent)[CS1231S · Mock Exam 3]
#v(1pt)
#text(size: 12pt, weight: "bold")[Statement trios and cross-topic questions #h(0.8em) · #h(0.8em) Time allowed: 2 hours]
#v(2pt)

#grid(columns: (1fr, auto), column-gutter: 1.6em, align: horizon,
[*INSTRUCTIONS*
+ This paper contains TWENTY SIX (26) questions in TWO (2) parts.
+ This is an OPEN BOOK assessment.
+ Printed and written materials are allowed. Apart from calculators, electronic devices are not allowed.
+ Answer ALL questions. In Part A shade exactly one option for each question. In Part B write each answer in the panel under its part.
+ The maximum mark of this paper is 100.],
table(columns: (auto, auto), align: (left, center),
  [Question], [Max. mark],
  [Part A: Q1 – 23], [46],
  [Part B: Q24], [20],
  [Part B: Q25], [20],
  [Part B: Q26], [14],
  [Total], [100],
))

*Conventions.* $NN = {0, 1, 2, ...}$ and $ZZ^+ = {1, 2, 3, ...}$; $lnot p$ is the negation of $p$; $PP(A)$ is the power set of $A$; $g compose f$ applies $f$ first; _countable_ means finite or countably infinite. Graphs are finite and undirected. In a binary tree every child is a left child or a right child, and the two are distinguished. Answers and solutions start on a new page after Question 26.

// ============================================================================
= Part A · Multiple Choice Questions
// ============================================================================
*\[Total: $23 times 2 = 46$ marks\]* #h(0.4em) Each multiple choice question is worth TWO marks and has exactly one correct option; shade one option only. In a row of numerical options, "None of these" stands for "None of options (A), (B), (C), (D) is correct".

#q[1][Logic · tautologies][
Which of the following statement forms are tautologies?
#rom(
  [$(p -> q) or (q -> r)$],
  [$((p -> q) -> p) -> p$],
  [$(p -> q) -> ((p -> r) -> (q -> r))$],
)
#opts(cols: 2,
  [Only (i).],
  [Only (ii).],
  [Only (i) and (ii).],
  all3,
  nota,
)]

#q[2][Logic · quantifiers][
For a set $D subset.eq RR$, let $S(D)$ be the statement
$ forall x in D space exists y in D space (x < y and forall z in D space (x < z -> y <= z)). $
Which of the following statements are true?
#rom(
  [$S(ZZ^-)$, where $ZZ^-$ is the set of negative integers.],
  [$S(QQ)$.],
  [$S(nothing)$.],
)
#opts(cols: 2,
  [Only (iii).],
  [Only (i) and (iii).],
  [Only (ii) and (iii).],
  all3,
  nota,
)]

#q[3][Methods of proof][
Dueet has to prove a statement of the form
$ forall x in D space (P(x) -> (Q(x) or R(x))). $
Which of the following, each taken on its own and carried out correctly, are enough to establish the statement?
#rom(
  [Take an arbitrary $x in D$, suppose that $P(x)$ and $lnot Q(x)$, and deduce $R(x)$.],
  [Take an arbitrary $x in D$, suppose that $lnot P(x)$, and deduce $lnot Q(x) and lnot R(x)$.],
  [Prove the statement $forall x in D space (lnot Q(x) -> lnot P(x))$.],
)
#opts(cols: 2,
  [Only (i).],
  [Only (i) and (ii).],
  [Only (ii) and (iii).],
  all3,
  nota,
)]

#q[4][Sets][
Which of the following statements are true for all sets $A$, $B$ and $C$?
#rom(
  [If $A times C = B times C$, then $A = B$.],
  [If $A union C = B union C$ and $A inter C = B inter C$, then $A = B$.],
  [If $PP(A) union PP(B) = PP(A union B)$, then $A subset.eq B$ or $B subset.eq A$.],
)
#opts(cols: 2,
  [Only (ii).],
  [Only (ii) and (iii).],
  [Only (i) and (iii).],
  all3,
  nota,
)]

#q[5][Relations][
Define a relation $R$ on $ZZ times ZZ$ by
$ (a, b) thick R thick (c, d) <=> a + c = b + d. $
Which of the following statements are true?
#rom(
  [$R$ is reflexive.],
  [$R$ is transitive.],
  [$R compose R$ is an equivalence relation on $ZZ times ZZ$.],
)
#opts(cols: 2,
  [Only (i).],
  [Only (i) and (ii).],
  all3,
  [Only (iii).],
  nota,
)]

#q[6][Equivalence classes · functions][
A function $f : ZZ^+ -> ZZ^+$ satisfies
$ f(n) = f(n slash 2) "for every even" n in ZZ^+ #h(1.5em) "and" #h(1.5em) f(n) = f(n + 7) "for every odd" n in ZZ^+. $
What is the largest possible number of elements in the range of $f$?
#opts(cols: 5, [1], [2], [3], [7], none5)]

#q[7][Partial orders][
Let $(A, pleqa)$ and $(B, pleqb)$ be partially ordered sets, where $A$ and $B$ are non-empty. The relation $pleq$ on $A times B$ defined by
$ (a, b) pleq (c, d) <=> a pleqa c "and" b pleqb d $
is a partial order. In a partially ordered set, a subset is a _chain_ if every two of its elements are comparable, and an _antichain_ if no two distinct elements of it are comparable. Which of the following statements are true for all such $A$ and $B$?
#rom(
  [If $C subset.eq A$ and $D subset.eq B$ are antichains, then $C times D$ is an antichain in $A times B$.],
  [If $C subset.eq A$ and $D subset.eq B$ are chains, then $C times D$ is a chain in $A times B$.],
  [If $a$ is a maximal element of $A$ and $b$ is a maximal element of $B$, then $(a, b)$ is a maximal element of $A times B$.],
)
#opts(cols: 2,
  [Only (i) and (iii).],
  [Only (ii) and (iii).],
  [Only (iii).],
  all3,
  nota,
)]

#q[8][Functions · images and preimages][
Let $f : X -> Y$ be a function. For $A subset.eq X$ and $C subset.eq Y$, write $f(A) = {f(x) : x in A}$ and $f^(-1)(C) = {x in X : f(x) in C}$. Which of the following statements are true for every function $f : X -> Y$, all $A, B subset.eq X$ and all $C subset.eq Y$?
#rom(
  [$f(A inter f^(-1)(C)) = f(A) inter C$.],
  [$f(A) without f(B) subset.eq f(A without B)$.],
  [If $f(A) inter f(B) = nothing$, then $A inter B = nothing$.],
)
#opts(cols: 2,
  [Only (ii).],
  [Only (i) and (iii).],
  [Only (ii) and (iii).],
  all3,
  nota,
)]

#q[9][Functions · bijections][
The _order_ of a bijection $g : A -> A$ is the smallest $n in ZZ^+$ such that $underbrace(g compose g compose dots.c compose g, n "many" g"'s") = idf_A$. \
Let $A$ be a set with exactly 2026 elements, and let $f : A -> A$ be a function such that $f compose f compose f = idf_A$. Which of the following statements must be true?
#rom(
  [$f(x) = x$ for at least one $x in A$.],
  [$f$ is a bijection and $f^(-1) = f compose f$.],
  [$f$ is a bijection of order 3.],
)
#opts(cols: 2,
  [Only (ii).],
  [Only (i) and (ii).],
  [Only (ii) and (iii).],
  all3,
  nota,
)]

#q[10][Functions · well-definedness][
For $n in ZZ^+$, $ZZ_n = {[0]_n, [1]_n, ..., [n - 1]_n}$ is the set of equivalence classes of $ZZ$ under congruence modulo $n$, where $[x]_n$ is the class of $x$. Which of the following rules are well defined, that is, define a function with the stated domain and co-domain?
#rom(
  [$f : ZZ_3 -> ZZ_6$, #h(0.6em) $f([x]_3) = [2x]_6$.],
  [$g : ZZ_4 -> ZZ_8$, #h(0.6em) $g([x]_4) = [x^2]_8$.],
  [$h : ZZ_3 -> ZZ_9$, #h(0.6em) $h([x]_3) = [x^2]_9$.],
)
#opts(cols: 2,
  [Only (i).],
  [Only (ii).],
  [Only (i) and (iii).],
  all3,
  nota,
)]

#q[11][Induction · find the error][
Aiken claims that for every integer $n >= 2$, every simple graph with $n$ vertices in which every vertex has degree at least 1 is connected. The claim is false (take two disjoint edges on 4 vertices), yet Aiken offers the following "proof".
#pad(left: 1.2em, y: 0.15em, grid(columns: (1.5em, 1fr), row-gutter: 0.55em,
  [1.], [For $n >= 2$, let $P(n)$ be the statement "every simple graph with $n$ vertices in which every vertex has degree at least 1 is connected".],
  [2.], [Basis step: a simple graph with 2 vertices in which both vertices have degree at least 1 consists of the two vertices joined by an edge, so it is connected. Hence $P(2)$ is true.],
  [3.], [Inductive step: let $k >= 2$ and assume that $P(k)$ is true.],
  [4.], [Let $G$ be any simple graph with $k$ vertices in which every vertex has degree at least 1. By $P(k)$, $G$ is connected.],
  [5.], [Add a new vertex $v$ to $G$ and join $v$ to at least one vertex of $G$. This gives a simple graph $G'$ with $k + 1$ vertices in which every vertex has degree at least 1.],
  [6.], [$G'$ is connected, because $G$ is connected and $v$ is joined to a vertex of $G$.],
  [7.], [Therefore $P(k + 1)$ is true, and by mathematical induction $P(n)$ is true for all $n >= 2$.],
))
Which of the following correctly identifies the error?
#opts(
  [Line 2: $P(2)$ is false.],
  [Line 4: the inductive hypothesis $P(k)$ cannot be applied to $G$, because $P(k)$ has not been proved.],
  [Line 6: $G'$ need not be connected.],
  [Line 7: lines 4 to 6 deal only with graphs $G'$ built by adding a vertex to a $k$-vertex graph in which every vertex has degree at least 1, and not every $(k + 1)$-vertex graph in which every vertex has degree at least 1 can be built in this way.],
  nota,
)]

#q[12][Induction · choosing the predicate][
A sequence of real numbers $s_1, s_2, s_3, ...$ satisfies
$ s_(n+1) = s_n + 1 / 2^(n+1) #h(1.5em) "for every" n in ZZ^+. $
Nothing is assumed about $s_1$. For which of the following predicates $P(n)$ is the inductive step
$ forall k in ZZ^+ space (P(k) -> P(k + 1)) $
true for *every* such sequence?
#rom(
  [$P(n) equiv (s_n < 1)$],
  [$P(n) equiv (s_n <= 1 - 1 slash 2^n)$],
  [$P(n) equiv (s_n = 1 - 1 slash 2^n)$],
)
#opts(cols: 2,
  [Only (i).],
  [Only (ii).],
  [Only (ii) and (iii).],
  all3,
  nota,
)]

#q[13][Recursion · trees][
A set $cal(T)$ of binary trees is recursively defined as follows:
#pad(left: 1.2em, grid(columns: (auto, 1fr, auto), column-gutter: 0.7em, row-gutter: 0.5em,
  [(1)], [The binary tree that consists of a single vertex is in $cal(T)$.], [(base clause)],
  [(2)], [If $T_1, T_2 in cal(T)$, then the binary tree whose root has left subtree $T_1$ and right subtree $T_2$ is in $cal(T)$.], [(recursion clause)],
  [(3)], [Membership for $cal(T)$ can always be demonstrated by finitely many successive applications of the clauses above.], [(minimality clause)],
))
The vertices are not labelled: two trees are the same exactly when they have the same shape, with left and right children distinguished. The _height_ of a rooted tree is the maximum level of its vertices, the root being at level 0. How many trees in $cal(T)$ have height exactly 3?
#opts(cols: 5, [9], [21], [25], [26], none5)]

#q[14][Cardinality][
Which of the following sets are countable?
#rom(
  [The set of all functions $f : NN -> NN$ such that $f(n) < f(n + 1)$ for every $n in NN$.],
  [The set of all functions $f : NN -> NN$ such that $f(n) >= f(n + 1)$ for every $n in NN$.],
  [The set of all functions $f : NN -> NN$ whose range is a finite set.],
)
#opts(cols: 2,
  [Only (ii).],
  [Only (i) and (ii).],
  [Only (ii) and (iii).],
  all3,
  nota,
)]

#q[15][Cardinality · equivalence relations][
Let $cal(E)$ be the set of all equivalence relations on $NN$; each $R in cal(E)$ is a subset of $NN times NN$. Which of the following subsets of $cal(E)$ are countable?
#rom(
  [The set of all $R in cal(E)$ that contain only finitely many pairs $(x, y)$ with $x != y$.],
  [The set of all $R in cal(E)$ that have exactly two equivalence classes.],
  [The set of all $R in cal(E)$ in which every equivalence class is a finite set.],
)
#opts(cols: 2,
  [Only (i) and (ii).],
  [Only (i) and (iii).],
  all3,
  [Only (i).],
  nota,
)]

#q[16][Cardinality][
Which of the following statements are true?
#rom(
  [For all sets $A$ and $B$, if there is a function $f : A -> B$ that is injective but not surjective, then $A$ and $B$ do not have the same cardinality.],
  [There is a bijection from the closed interval $[0, 1]$ to the open interval $(0, 1)$.],
  [If $A$ is an uncountable set and $B$ is a countable set, then no function $g : B -> A$ is surjective.],
)
#opts(cols: 2,
  [Only (iii).],
  [Only (ii) and (iii).],
  [Only (i) and (ii).],
  all3,
  nota,
)]

#q[17][Counting · bijections][
Let $A = {1, 2, 3, 4, 5}$. How many bijections $f : A -> A$ satisfy $f(x) = x$ for exactly two elements $x in A$?
#opts(cols: 5, [20], [30], [50], [60], none5)]

#q[18][Conditional probability][
Each child of a certain couple is, independently of the other children, a boy or a girl with probability $1 slash 2$ each, and is born on each of the seven days of the week with probability $1 slash 7$ each; the sex and the day of birth are independent. The couple has two children. Given that at least one of the two children is a boy who was born on a Tuesday, what is the probability that both children are boys?
#opts(cols: 5, [$1 slash 4$], [$1 slash 3$], [$13 slash 27$], [$1 slash 2$], none5)]

#q[19][Expected value · functions][
A function $f : {1, 2, 3, 4} -> {1, 2, 3}$ is chosen at random, each of the $3^4 = 81$ functions being equally likely. What is the expected number of elements in the range of $f$?
#opts(cols: 5, [$16 slash 27$], [$37 slash 16$], [$80 slash 27$], [$3$], none5)]

#q[20][Graphs][
For a simple graph $G$, the _complement_ $overline(G)$ has the same vertices as $G$, and two distinct vertices are adjacent in $overline(G)$ if and only if they are not adjacent in $G$. Which of the following statements are true?
#rom(
  [If $G$ is a connected simple graph in which every vertex has even degree, then removing any one edge from $G$ leaves a connected graph.],
  [For every simple graph $G$ with at least two vertices, at least one of $G$ and $overline(G)$ is connected.],
  [If two connected simple graphs have the same number of vertices and the same list of vertex degrees, then they are isomorphic.],
)
#opts(cols: 2,
  [Only (i).],
  [Only (iii).],
  [Only (ii) and (iii).],
  [Only (i) and (ii).],
  nota,
)]

#q[21][Graphs · the "divides" order][
Let $V$ be the set of positive divisors of 36, and let $G$ be the simple graph with vertex set $V$ in which two vertices $a$ and $b$ are adjacent if and only if $a slash b$ or $b slash a$ is a prime number. (So $G$ is the Hasse diagram of the partial order "divides" on $V$, read as a graph.) Which of the following statements are true?
#rom(
  [$G$ is bipartite.],
  [$G$ has a Hamiltonian circuit.],
  [$G$ has an Euler trail from some vertex to a different vertex.],
)
#opts(cols: 2,
  [Only (i).],
  [Only (i) and (ii).],
  [Only (i) and (iii).],
  all3,
  nota,
)]

#q[22][Trees · traversals][
Let $T$ be a binary tree with $n >= 2$ vertices, which are labelled with distinct letters. Which of the following statements are true?
#rom(
  [If $T$ is a full binary tree, then $T$ is the only binary tree whose pre-order and post-order traversals are the same as those of $T$.],
  [If the pre-order traversal and the in-order traversal of $T$ are the same sequence, then no vertex of $T$ has a left child.],
  [If the post-order traversal of $T$ is the reverse of its pre-order traversal, then $T$ is the only binary tree whose pre-order and post-order traversals are the same as those of $T$.],
)
#opts(cols: 2,
  [Only (i).],
  [Only (iii).],
  [Only (i) and (iii).],
  all3,
  nota,
)]

#q[23][Trees · minimum spanning trees][
Let $G$ be a connected weighted simple graph with at least 3 vertices, in which every edge has a positive weight. Which of the following statements are true for every such $G$?
#rom(
  [For every vertex $v$ of $G$, every minimum spanning tree of $G$ contains an edge that has the smallest weight among the edges incident on $v$.],
  [If $G$ has exactly one minimum spanning tree, then no two edges of $G$ have the same weight.],
  [If an edge $e$ lies on a circuit of $G$ and is heavier than every other edge of $G$, then no minimum spanning tree of $G$ contains $e$.],
)
#opts(cols: 2,
  [Only (i).],
  [Only (i) and (iii).],
  [Only (ii) and (iii).],
  all3,
  nota,
)]

#pagebreak()
// ============================================================================
= Part B · Structured Questions
// ============================================================================
*\[Total: 54 marks\]* #h(0.4em) There are 3 questions in this part. Write your answer to each part in the panel below it.

#q(split: true)[24 · Counting and Probability #h(0.4em) \[Total: 20 marks\]][answers only][
Working is not required for this question. Write each numerical answer as a single number or as a single fraction in lowest terms.
#parts(work: (2.5cm, 2.5cm, 2.5cm, 2.5cm, 2.5cm, 3.2cm, 3.2cm, 4.2cm,),
[How many surjective functions $f : {1, 2, 3, 4, 5} -> {1, 2, 3}$ satisfy $f(1) != f(2)$? #mk(2)],
[How many arrangements of the eight letters of the word TRIANGLE have the three vowels in alphabetical order from left to right (A somewhere before E, and E somewhere before I) and also have no two vowels next to each other? #mk(2)],
[How many equivalence relations on the set ${1, 2, 3, 4, 5, 6}$ have exactly two equivalence classes? #mk(2)],
[How many simple graphs with vertex set ${1, 2, 3, 4, 5}$ have exactly 4 edges and no vertex of degree 0? Two graphs are counted as different when their edge sets are different, even if the graphs are isomorphic. #mk(2)],
[(Total: 2 marks) Two cards are dealt at random from a standard deck of 52 cards. The deck contains 4 aces, one of which is the ace of spades. Find the probability that both cards are aces, given that
#rom(
  [at least one of the two cards is an ace; #mk(1)],
  [one of the two cards is the ace of spades. #mk(1)],
)],
[A fair six-sided die is rolled twice. Define the following three events:
#pad(left: 2em)[
$A$: the first roll is a 6. \
$B$: the sum of the two rolls is 7. \
$C$: the sum of the two rolls is 11.]
Two events $X$ and $Y$ are _mutually exclusive_ if $X inter Y = nothing$. For each of the pairs ${A, B}$, ${A, C}$ and ${B, C}$, write *I* if the two events are independent, *M* if they are mutually exclusive, and *N* if they are neither. A letter may be used more than once, or not at all. #mk(3)],
[(Total: 2 marks) Let $A = {1, 2, ..., 8}$. A bijection $f : A -> A$ is chosen at random, each of the $8!$ bijections being equally likely. Find the expected number of
#rom(
  [elements $x in A$ such that $f(x) = x$; #mk(1)],
  [two-element subsets ${x, y}$ of $A$ such that $f(x) = y$ and $f(y) = x$. #mk(1)],
)],
[(Total: 5 marks) A scanner in a factory inspects microchips. Of all the chips, 1% are faulty. Each scan reports either "faulty" or "good", and the report is correct with probability 0.99, whether the chip is faulty or good. Given the condition of a chip (faulty or good), repeated scans of that chip are independent.
#rom(
  [A chip is chosen at random and scanned once; the report is "faulty". What is the probability that the chip is faulty? #mk(2)],
  [The same chip is scanned a second time, and the report is "faulty" again. What is the probability now that the chip is faulty? #mk(2)],
  [A chip is chosen at random and scanned twice. Let $F_1$ be the event that the first report is "faulty" and $F_2$ the event that the second report is "faulty". Are $F_1$ and $F_2$ independent events? #mk(1)],
)],
)]

#pagebreak()
#q(split: true)[25 · Graphs and Trees #h(0.4em) \[Total: 20 marks\]][parts (e), (f), (g) are proofs][
All graphs in this question are simple graphs. Working is not required for parts (a) to (d). Parts (e), (f) and (g) ask for proofs, which must be written out in full; you may quote the handshake theorem and the theorem that a tree with $n$ vertices has $n - 1$ edges.
#parts(work: (4cm, 4cm, 4cm, 2.8cm, 5.6cm, 5.6cm, 5.6cm,),
[#block(breakable: false)[(Total: 3 marks) Each of the graphs $G_1$, $G_2$ and $G_3$ below has 6 vertices, 7 edges and vertex degrees $3, 3, 2, 2, 2, 2$. Exactly two of the three graphs are isomorphic.
#align(center, grid(columns: 3, column-gutter: 2.6em, row-gutter: 4pt, align: center,
  gdraw((([$a$], 0.75, 2.05), ([$b$], 1.85, 2.05), ([$c$], 2.4, 1.15), ([$d$], 1.85, 0.25), ([$e$], 0.75, 0.25), ([$f$], 0.2, 1.15)),
    ((0, 1), (1, 2), (2, 3), (3, 4), (4, 5), (5, 0), (0, 3)), w: 2.6cm, h: 2.3cm),
  gdraw((([$p$], 0.25, 1.85), ([$q$], 1.3, 1.85), ([$r$], 2.35, 1.85), ([$s$], 0.25, 0.45), ([$t$], 1.3, 0.45), ([$u$], 2.35, 0.45)),
    ((0, 1), (1, 2), (3, 4), (4, 5), (0, 3), (1, 4), (2, 5)), w: 2.6cm, h: 2.3cm),
  gdraw((([$g$], 0.25, 1.85), ([$h$], 1.3, 1.85), ([$i$], 2.35, 1.85), ([$j$], 0.25, 0.45), ([$k$], 1.3, 0.45), ([$l$], 2.35, 0.45)),
    ((0, 1), (1, 2), (3, 4), (4, 5), (0, 3), (2, 5), (0, 4)), w: 2.6cm, h: 2.3cm),
  cap[$G_1$], cap[$G_2$], cap[$G_3$],
))
#rom(
  [Which two are isomorphic? Give an isomorphism by writing the image of each vertex. #mk(2)],
  [State a property of graphs, preserved by every isomorphism, that distinguishes the third graph from the two isomorphic ones. #mk(1)],
)]],
[#block(breakable: false)[#grid(columns: (1fr, auto), column-gutter: 1.2em, align: (top, horizon),
[(Total: 3 marks) The graph $H$ is shown on the right.
#rom(
  [$H$ has an Euler trail. Between which two vertices does it run? #mk(1)],
  [Write down a Hamiltonian circuit of $H$ as a list of vertices that starts and ends at $a$. #mk(1)],
  [Exactly one new edge can be added to $H$ so that the resulting simple graph has an Euler circuit. Which two vertices does it join? #mk(1)],
)],
gdraw((([$a$], 0.3, 1.85), ([$b$], 1.6, 1.85), ([$c$], 2.9, 1.85), ([$d$], 0.3, 0.35), ([$e$], 1.6, 0.35), ([$f$], 2.9, 0.35), ([$g$], 3.9, 1.1)),
  ((0, 1), (1, 2), (3, 4), (4, 5), (0, 3), (1, 4), (2, 5), (0, 4), (1, 5), (2, 6), (5, 6)), w: 4.2cm, h: 2.2cm))]],
[(Total: 3 marks) A binary tree $T$ has 11 vertices. Each vertex is labelled with one of the operators $+$, $-$, $times$, $div$ or with one of the letters $a, b, c, d, e, f$. Every vertex labelled with an operator has exactly two children, and every vertex labelled with a letter has no children. The post-order traversal of $T$ is
#align(center, seq($a$, $b$, $c$, $d$, $+$, $times$, $-$, $e$, $f$, $+$, $div$))
#rom(
  [Write down the pre-order traversal of $T$. #mk(2)],
  [What is the height of $T$? (The root is at level 0.) #mk(1)],
)],
[(Total: 2 marks) The _complement_ $overline(G)$ of a simple graph $G$ has the same vertices as $G$, and two distinct vertices are adjacent in $overline(G)$ if and only if they are not adjacent in $G$. Let $G$ be a simple graph with 8 vertices whose complement $overline(G)$ is a tree.
#rom(
  [How many edges does $G$ have? #mk(1)],
  [Consider the statement "$G$ must be connected". Write "true" if it is true; if it is false, describe a tree $overline(G)$ for which $G$ is not connected. #mk(1)],
)],
[Prove that a bipartite graph with an odd number of vertices has no Hamiltonian circuit. #mk(3)],
[Let $T$ be a tree with a vertex of degree $d$, where $d >= 2$. Prove that $T$ has at least $d$ vertices of degree 1. #mk(3)],
[Let $G$ be a simple graph with $n >= 2$ vertices in which every vertex has degree at least $(n - 1) slash 2$. Prove that $G$ is connected. #mk(3)],
)]

#pagebreak()
#q(split: true)[26 · Recursively Defined Sets and Cardinality #h(0.4em) \[Total: 14 marks\]][show your working][
A set $S$ of integers is recursively defined as follows:
#pad(left: 1.2em, grid(columns: (auto, 1fr, auto), column-gutter: 0.7em, row-gutter: 0.5em,
  [(1)], [$2 in S$.], [(base clause)],
  [(2)], [If $x in S$, then $-x in S$.], [(recursion clause)],
  [(3)], [If $x in S$, then $x + 5 in S$.], [(recursion clause)],
  [(4)], [Membership for $S$ can always be demonstrated by finitely many successive applications of the clauses above.], [(minimality clause)],
))
For integers $m$ and $n$, $m dv n$ means that $n = m k$ for some integer $k$.
#parts(work: (3cm, 8.5cm, 5cm, 11cm,),
[Show that $-3 in S$ and that $18 in S$. For each one, list the integers generated in order, starting from 2, and name the clause used at each step. #mk(2)],
[Prove by structural induction that $5 dv (x^2 + 1)$ for every $x in S$. #mk(5)],
[(Total: 3 marks)
#rom(
  [Use part (b) to show that $2026 in.not S$. #mk(2)],
  [It can be shown that $S = {5k + r : k in ZZ "and" r in R}$ for exactly one set $R subset.eq {0, 1, 2, 3, 4}$. Write down $R$. No proof is needed. #mk(1)],
)],
[(Total: 4 marks) A _derivation sequence_ is an infinite sequence $x_0, x_1, x_2, ...$ of integers such that $x_0 = 2$ and, for every $n in NN$, either $x_(n+1) = -x_n$ or $x_(n+1) = x_n + 5$. Let $D$ be the set of all derivation sequences.
#rom(
  [Is $S$ countable? Justify your answer. #mk(1)],
  [Is $D$ countable? Justify your answer with a proof. You may quote without proof that the set of all functions $NN -> {0, 1}$ is uncountable. #mk(3)],
)],
)]

#align(center, text(size: 8.5pt, fill: muted)[— End of paper —])

#pagebreak()
// ============================================================================
= Part A · Answer Key
// ============================================================================

#let keyrow(..xs) = xs.pos().map(x => [#x])
#table(columns: (auto,) + (1fr,) * 12, align: center,
  [Question], ..range(1, 13).map(i => [#i]),
  [Answer], ..keyrow("C", "A", "E", "B", "D", "C", "A", "D", "B", "E", "D", "C"),
)
#table(columns: (auto,) + (1fr,) * 12, align: center,
  [Question], ..range(13, 24).map(i => [#i]), [],
  [Answer], ..keyrow("B", "A", "D", "B", "A", "C", "E", "D", "A", "E", "B"), [],
)

Key in paper order: #h(0.3em) C A E B D #h(0.4em) C A D B E #h(0.4em) D C B A D #h(0.4em) B A C E D #h(0.4em) A E B. #h(0.6em) Each question is worth 2 marks; the total for Part A is 46. Every key was solved twice independently and checked by a brute-force script wherever the mathematics is finite; Questions 14, 15 and 16 rest on the proofs given below. The answers to Part B follow the Part A solutions.

// ============================================================================
= Part A · Solutions
// ============================================================================
#set par(justify: false)

#sol[1][C][(i) Tautology, although $p$ and $r$ are unrelated: if $q$ is true then $p -> q$ is true, and if $q$ is false then $q -> r$ is true. (ii) Tautology: if $p$ is true the whole form is true; if $p$ is false then $p -> q$ is true, so $(p -> q) -> p$ is false and the form is true. (iii) Not a tautology: $p$ = F, $q$ = T, $r$ = F gives $"T" -> ("T" -> "F")$, which is false. *Trap:* (iii) only resembles transitivity, which is $(p -> q) -> ((q -> r) -> (p -> r))$; choosing (D) accepts it by its shape, and (A), (B) reject one of two forms that look wrong and are not.]

#sol[2][A][$S(D)$ says that every element of $D$ has an immediate successor in $D$. (i) False: $x = -1$ has no $y in ZZ^-$ with $x < y$. $S(ZZ)$ and $S(NN)$ are true with $y = x + 1$, but a set with a largest element fails. (ii) False: for $x = 0$ and any $y > 0$, the rational $z = y slash 2$ has $x < z$ and $z < y$. (iii) True, vacuously: there is no $x in nothing$ to test. *Trap:* (B) treats $ZZ^-$ like $ZZ$; rejecting (iii) because "no $y$ exists" forgets that no $x$ asks for one.]

#sol[3][E][Write $p, q, r$ for $P(x), Q(x), R(x)$. (i) Enough: $(p and lnot q) -> r equiv lnot p or q or r equiv p -> (q or r)$. (ii) Not enough: $lnot p -> (lnot q and lnot r)$ is the inverse of the target; it is true and the target false when $p$ is true and $q$, $r$ are false. (iii) Enough: it is the contrapositive of $forall x in D space (P(x) -> Q(x))$, which implies the target since $Q(x)$ gives $Q(x) or R(x)$. A stronger statement need not be provable, but proving it settles the target. So exactly (i) and (iii) work, which is not among (A) to (D). *Trap:* dropping (iii) because it "ignores $R$" leads to (A).]

#sol[4][B][(i) False: if $C = nothing$ then $A times C = nothing = B times C$ for any $A$, $B$; take $A = {1}$, $B = nothing$. (It is true when $C != nothing$.) (ii) True: let $x in A$. If $x in C$, then $x in A inter C = B inter C$. If $x in.not C$, then $x in A union C = B union C$ and $x in.not C$. Either way $x in B$, so $A subset.eq B$; by symmetry $B subset.eq A$. (iii) True: $A union B in PP(A union B) = PP(A) union PP(B)$, so $A union B subset.eq A$ or $A union B subset.eq B$, that is, $B subset.eq A$ or $A subset.eq B$. *Trap:* (D) forgets the empty set in (i); (A) doubts (iii) because $PP(A) union PP(B) != PP(A union B)$ in general, which is why the hypothesis is strong.]

#sol[5][D][$R$ is not the familiar relation "$a + d = b + c$". (i) False: $(1, 0) thick R thick (1, 0)$ would need $1 + 1 = 0 + 0$. (ii) False: $(1, 0) thick R thick (0, 1)$ and $(0, 1) thick R thick (1, 0)$, but $(1, 0)$ is not related to itself. (iii) True: if $a + c = b + d$ and $c + e = d + f$, subtracting gives $a - b = e - f$; conversely, if $a - b = e - f$ then $(a, b) thick R thick (b, a)$ and $(b, a) thick R thick (e, f)$. So $(a, b) thick (R compose R) thick (e, f) <=> a - b = e - f$, which is an equivalence relation. *Trap:* (C) reads $R$ as the textbook equivalence relation; (A), (B) come from testing only pairs with $a = b$.]

#sol[6][C][$f$ must be constant on each class of the smallest equivalence relation $tilde.op$ with $n tilde.op n slash 2$ ($n$ even) and $n tilde.op n + 7$ ($n$ odd), and it may take different values on different classes, so the answer is the number of classes. Adding 7 keeps the remainder modulo 7 and halving multiplies it by 4, so the sets ${7, 14, ...}$, ${n : n mod 7 in {1, 2, 4}}$ and ${n : n mod 7 in {3, 5, 6}}$ are never mixed. Every $n > 7$ is linked to a smaller number ($n slash 2$, or $(n + 7) slash 2$ for odd $n$), and $1 tilde.op 8 tilde.op 4 tilde.op 2$, $3 tilde.op 10 tilde.op 5 tilde.op 12 tilde.op 6$, $7 tilde.op 14$: exactly 3 classes. *Trap:* (B) is right for "$n + 5$" or "$n + 3$", where the non-multiples form one class; (D) forgets the halving links; (A) forgets that divisibility by 7 is preserved.]

#sol[7][A][(i) True: let $(a, b), (c, d) in C times D$ with $(a, b) pleq (c, d)$. Then $a pleqa c$ with $a, c$ in the antichain $C$, so $a = c$; likewise $b = d$. So distinct elements of $C times D$ are not comparable. (ii) False: in ${0, 1} times {0, 1}$ with $<=$ on each factor, $C = D = {0, 1}$ are chains but $(0, 1)$ and $(1, 0)$ are not comparable. (iii) True: if $(a, b) pleq (c, d)$ then $a pleqa c$ and $b pleqb d$, so $c = a$ and $d = b$ by maximality. *Trap:* (D) assumes chains behave like antichains under products; (C) rejects (i) because $(a, b)$ and $(a, b')$ share a coordinate, but $b$ and $b'$ are still not comparable.]

#sol[8][D][(i) If $x in A$ and $f(x) in C$, then $f(x) in f(A) inter C$; conversely, if $y = f(x)$ with $x in A$ and $y in C$, then $x in A inter f^(-1)(C)$. (ii) If $y = f(x)$ with $x in A$ and $y in.not f(B)$, then $x in.not B$, so $y in f(A without B)$. (iii) Contrapositive: $x in A inter B$ gives $f(x) in f(A) inter f(B)$. All three hold. *Trap:* the remembered failures are $f(A inter B) = f(A) inter f(B)$ and $f(A without B) subset.eq f(A) without f(B)$, both false for a constant $f$ on disjoint non-empty $A$, $B$. Statements (i) to (iii) are the inclusions that survive, so (A), (B), (C) each reject a true statement.]

#sol[9][B][(ii) True: $f compose (f compose f) = (f compose f) compose f = idf_A$, so $f compose f$ is the inverse of $f$. (i) True: each set ${x, f(x), f(f(x))}$ has 1 or 3 elements (if two of them are equal, injectivity gives $f(x) = x$), and these sets partition $A$. Since $2026 = 3 dot 675 + 1$ is not a multiple of 3, some set is a singleton. (iii) False: $f = idf_A$ satisfies the condition and has order 1. *Trap:* (D) reads "$f compose f compose f = idf_A$" as "order 3"; (A) misses the counting argument, which would fail for 2025 elements.]

#sol[10][E][A rule on classes is well defined iff its value does not depend on the representative. (i) If $x equiv y space (mod 3)$ then $2x equiv 2y space (mod 6)$: well defined. (ii) $(x + 4k)^2 = x^2 + 8k x + 16k^2 equiv x^2 space (mod 8)$: well defined. (iii) $[1]_3 = [4]_3$, but the rule gives $[1]_9$ from the representative 1 and $[16]_9 = [7]_9$ from the representative 4: not well defined, since $(x + 3k)^2 = x^2 + 6k x + 9k^2$ (the rule $[x]_3 |-> [x^3]_9$ would work). So exactly (i) and (ii) are well defined, which is not among (A) to (D). *Trap:* (D) copies the pattern of (ii) to (iii); (A), (B) apply the rule of thumb "the new modulus must divide the old one", which is only for $[x]_m |-> [x]_n$.]

#sol[11][D][Lines 1 to 6 are all correct. $P(2)$ is true, so (A) fails. Applying the inductive hypothesis to a $k$-vertex graph that satisfies its condition is what an inductive step does, so (B) fails. A new vertex joined to a connected graph gives a connected graph, so (C) fails. The error is the *build-up* in line 7: $P(k + 1)$ is about an arbitrary graph with $k + 1$ vertices, and the proof must start from one and remove a vertex. Two disjoint edges on 4 vertices cannot be built from a 3-vertex graph with all degrees at least 1: deleting any vertex leaves a vertex of degree 0. Indeed $P(2)$, $P(3)$ are true and $P(4)$ is false.]

#sol[12][C][(i) fails: $s_1 = 0.9$ makes $P(1)$ true, but $s_2 = 1.15$, so $P(2)$ is false; $s_k < 1$ alone says nothing about $s_k + 1 slash 2^(k+1)$. (ii) holds: if $s_k <= 1 - 1 slash 2^k$, then $s_(k+1) <= 1 - 1 slash 2^k + 1 slash 2^(k+1) = 1 - 1 slash 2^(k+1)$. (iii) holds by the same line with "$=$". For $s_1 = 1 slash 2$ all three predicates are true for every $n$, yet only the stronger ones can be proved by induction: strengthen the inductive hypothesis. *Trap:* (D) reasons that the weakest claim must be the easiest, or checks the step only for the sequence with $s_1 = 1 slash 2$.]

#sol[13][B][$cal(T)$ is the set of full binary trees. Let $a_h$ be the number of trees in $cal(T)$ of height at most $h$. A tree in $cal(T)$ of height at most $h + 1$ is a single vertex, or a root with two subtrees of height at most $h$: $a_0 = 1$ and $a_(h+1) = 1 + a_h^2$, giving $1, 2, 5, 26$. Height exactly 3: $26 - 5 = 21$. *Trap:* (D) counts height at most 3; (C) is $5^2$, a root with two subtrees of height at most 2, without removing the 4 trees of height 1 or 2; (A) is $3^2$, which wrongly requires both subtrees to have height exactly 2.]

#sol[14][A][(ii) Countable: a sequence $f(0) >= f(1) >= dots.c$ in $NN$ can drop at most $f(0)$ times, so $f$ is constant from some point on and is determined by a finite sequence of natural numbers; there are countably many finite sequences. (i) Uncountable: for $b : NN -> {0, 1}$ let $f_b (n) = sum_(i=0)^n (1 + b(i))$; then $f_b$ is strictly increasing and $b |-> f_b$ is injective, and there are uncountably many $b$. (iii) Uncountable: every function $NN -> {0, 1}$ has a finite range. *Trap:* (B) treats the two monotone cases alike; (C) takes "finite range" to mean "finitely described".]

#sol[15][D][(i) Countable: $R$ is determined by the finite set $R without {(n, n) : n in NN}$, and the countable set $NN times NN$ has countably many finite subsets. (ii) Uncountable: for each $A subset.eq ZZ^+$ with $A != ZZ^+$, the classes $A union {0}$ and $NN without (A union {0})$ give a relation with two classes, and different $A$ give different relations. (iii) Uncountable: for $S subset.eq NN$, put $2k$ and $2k + 1$ in one class exactly when $k in S$, all other classes being singletons; different $S$ give different relations. *Trap:* few classes (A) or small classes (B) do not make the *set of relations* small; only (i) leaves finitely many choices per relation.]

#sol[16][B][(i) False: $f : NN -> NN$, $f(n) = n + 1$ is injective and not surjective, while $NN$ has the same cardinality as itself. For finite sets the statement is true (pigeonhole principle); for infinite sets it fails. (ii) True: send $0 |-> 1 slash 2$, $1 |-> 1 slash 3$, $1 slash n |-> 1 slash (n + 2)$ for $n >= 2$, and fix every other point (Tutorial 8 Q6: an infinite set absorbs finitely many extra points). (iii) True: if $g$ were surjective, listing $B$ as $b_0, b_1, ...$ (a finite or an infinite list) would give a list $g(b_0), g(b_1), ...$ containing every element of $A$, so $A$ would be countable. *Trap:* (D) applies finite intuition to (i); (A) believes a closed interval has "two more points" than an open one.]

#sol[17][A][Choose the two elements that are fixed: $binom(5, 2) = 10$ ways. The other three must all move, and a 3-element set has exactly 2 bijections with no fixed element (the two 3-cycles). Total $10 times 2 = 20$. *Trap:* (D) $10 times 3!$ lets the other three do anything, which counts "at least two" with repeats; (C) $10 times (3! - 1)$ removes only the identity; (B) $10 times 3$ counts the three swaps, each of which fixes a third element.]

#sol[18][C][There are $14 times 14 = 196$ equally likely outcomes (sex and day of the elder, sex and day of the younger). At least one Tuesday boy: $14 + 14 - 1 = 27$ outcomes. Both boys among these: $7 + 7 - 1 = 13$. So the probability is $13 slash 27$. *Trap:* (A) ignores the condition; (B) is the answer to "at least one is a boy"; (D) is the answer to "the elder is a boy born on a Tuesday". A family with two boys is almost twice as likely to contain a Tuesday boy as a family with one boy, which moves the answer from $1 slash 3$ almost to $1 slash 2$.]

#sol[19][E][For $y in {1, 2, 3}$ let $I_y = 1$ if $y$ is in the range and 0 otherwise. $P(y "is missed") = (2 slash 3)^4 = 16 slash 81$, so $E[I_y] = 65 slash 81$, and by linearity the expected size of the range is $3 times 65 slash 81 = 65 slash 27$, which is not listed. Check: 3 constant functions, 42 with two values and 36 surjections give $(3 + 84 + 108) slash 81 = 65 slash 27$. *Trap:* (A) is the expected number of values that are *missed*; (B) exchanges the two sets, $4(1 - (3 slash 4)^3)$; (C) uses $(1 slash 3)^4$ for the probability that $y$ is missed; (D) assumes $f$ is surjective.]

#sol[20][D][(i) True: suppose removing the edge ${u, w}$ disconnects $G$. The component of $u$ in the new graph has $u$ as its only vertex of odd degree, contradicting the handshake theorem. (ii) True: if $G$ is not connected, two vertices in different components are adjacent in $overline(G)$, and two vertices in the same component are both adjacent in $overline(G)$ to a vertex of another component; so $overline(G)$ is connected. (iii) False: a triangle $a b c$ with the path $c d e$ attached, and a 4-cycle with one pendant edge, are both connected with degrees $1, 2, 2, 2, 3$, but only the first contains a triangle. *Trap:* degree lists are necessary for isomorphism, not sufficient.]

#sol[21][A][$V = {1, 2, 3, 4, 6, 9, 12, 18, 36}$ and $G$ is a $3 times 3$ grid (the exponents of 2 and of 3), with 12 edges. (i) True: every edge changes the number of prime factors by one, so the sides are ${1, 4, 6, 9, 36}$ and ${2, 3, 12, 18}$. (ii) False: a circuit in a bipartite graph alternates between the sides and has even length, but a Hamiltonian circuit of $G$ would have length 9. (iii) False: 2, 3, 12 and 18 have degree 3, and an Euler trail needs exactly two vertices of odd degree. *Trap:* (B) finds a path through all 9 vertices and assumes it closes up; (C) confuses "some odd vertices" with "exactly two".]

#sol[22][E][(i) True: when no vertex has exactly one child, the second item of the pre-order is the left child of the root, its position in the post-order ends the left subtree, and the same step rebuilds every subtree; nothing is left to choose. (ii) True: the in-order begins with the root only if the root has no left child; repeat the argument in the right subtree. (iii) False: the hypothesis holds exactly when every parent has one child, and each of those $n - 1$ children may be a left or a right child, so $2^(n-1) >= 2$ trees share both traversals. So exactly (i) and (ii) are true, which is not among (A) to (D). *Trap:* (A) doubts (ii); (C), (D) accept (iii) because the tree is "just a path".]

#sol[23][B][(i) True: suppose a minimum spanning tree $T$ contains no lightest edge at $v$, and let $e$ be a lightest edge at $v$. Adding $e$ to $T$ creates a circuit, which leaves $v$ along another edge $f$ of $T$; $f$ is heavier than $e$, so replacing $f$ by $e$ gives a lighter spanning tree. (ii) False: a triangle with weights $1, 1, 2$ has only one minimum spanning tree (the two edges of weight 1). Distinct weights are sufficient for uniqueness, not necessary. (iii) True: if a minimum spanning tree $T$ contained $e$, removing $e$ would split $T$ into two parts; $G$ without $e$ is still connected because $e$ lies on a circuit, so another edge $f$ joins the parts, and replacing $e$ by $f$ gives a lighter spanning tree. *Trap:* (D) turns "distinct weights give a unique tree" round; (A) drops (iii) by thinking of a heaviest edge that is a bridge, which is excluded by "lies on a circuit".]

// ============================================================================
= Part B · Answers and Worked Solutions
// ============================================================================

#table(columns: (auto, 1fr),
  [Question], [Final answers],
  [24], [(a) 114 #h(0.5em) (b) 2400 #h(0.5em) (c) 31 #h(0.5em) (d) 135 #h(0.5em) (e) $1 slash 33$; #h(0.2em) $1 slash 17$ #h(0.5em) (f) I, N, M #h(0.5em) (g) 1; #h(0.2em) $1 slash 2$ #h(0.5em) (h) $1 slash 2$; #h(0.2em) $99 slash 100$; #h(0.2em) no.],
  [25], [(a) $G_1$ and $G_2$, for example by $a |-> q$, $b |-> p$, $c |-> s$, $d |-> t$, $e |-> u$, $f |-> r$; #h(0.2em) $G_3$ contains a triangle ($g, j, k$) and the other two do not. #h(0.5em) (b) $a$ and $c$; #h(0.2em) $a, b, c, g, f, e, d, a$ or its reverse; #h(0.2em) $a$ and $c$. #h(0.5em) (c) pre-order #seq($div$, $-$, $a$, $times$, $b$, $+$, $c$, $d$, $+$, $e$, $f$), #h(0.2em) height 4. #h(0.5em) (d) 21; #h(0.2em) false, take $overline(G)$ to be the star $K_(1,7)$. #h(0.5em) (e), (f), (g) proofs below.],
  [26], [(a) $2, -2, 3, -3$ and $2, -2, 3, 8, 13, 18$. #h(0.5em) (b) proof below. #h(0.5em) (c) $2026^2 + 1$ leaves remainder 2 on division by 5; #h(0.2em) $R = {2, 3}$. #h(0.5em) (d) $S$ is countable; #h(0.2em) $D$ is uncountable.],
)

Every numeric answer above was checked by exhaustive enumeration. The marks for each part are printed beside it in the paper; in parts 25(e) to (g), 26(b) and 26(d)(ii) the marks are for the proof, so a bare claim earns nothing.

#sol[24][][
*(a)* *114.* By inclusion–exclusion there are $3^5 - 3 dot 2^5 + 3 = 150$ surjections. Those with $f(1) = f(2)$ correspond to the surjections from a 4-element set (merge 1 and 2 into one element): $3^4 - 3 dot 2^4 + 3 = 36$. So $150 - 36 = 114$. *Traps:* $3 dot 2 dot 3^3 = 162$ forgets that $f$ must be surjective; $150 times 2 slash 3 = 100$ assumes that $f(2)$ is equally likely to be each value once $f(1)$ is fixed, which fails among surjections. \
*(b)* *2400.* Arrange the 5 consonants T, R, N, G, L in $5! = 120$ ways. They leave 6 gaps (4 between consonants and 2 at the ends). Choose 3 different gaps for the vowels, in $binom(6, 3) = 20$ ways, so that no two vowels are adjacent. The vowels then go into the chosen gaps in the order A, E, I: 1 way. Total $120 times 20 = 2400$. *Trap:* $120 times 20 times 3! = 14400$ ignores the alphabetical order, and $8! slash 3! = 6720$ ignores the adjacency condition. \
*(c)* *31.* Such a relation is given by its partition ${X, A without X}$ of $A = {1, ..., 6}$, where $X != nothing$ and $X != A$. There are $2^6 - 2 = 62$ choices of $X$, and $X$ and $A without X$ give the same partition: $62 slash 2 = 31$. \
*(d)* *135.* There are $binom(5, 2) = 10$ possible edges, hence $binom(10, 4) = 210$ graphs with 4 edges. If a given vertex has degree 0, the 4 edges are chosen from the $binom(4, 2) = 6$ pairs of other vertices: $binom(6, 4) = 15$ graphs, for each of the 5 vertices. No graph is counted twice, because two vertices of degree 0 would leave only $binom(3, 2) = 3$ possible edges. So $210 - 5 times 15 = 135$. \
*(e)* There are $binom(52, 2) = 1326$ equally likely hands, and $binom(4, 2) = 6$ of them consist of two aces. \
(i) $binom(48, 2) = 1128$ hands have no ace, so $1326 - 1128 = 198$ hands have at least one: $6 slash 198 = 1 slash 33$. \
(ii) 51 hands contain the ace of spades, and in 3 of them the other card is an ace: $3 slash 51 = 1 slash 17$. \
*Trap:* (i) and (ii) are different conditions. Naming the ace almost doubles the probability, for the same reason that the answer to Question 18 is not $1 slash 3$. \
*(f)* *I, N, M.* There are 36 equally likely outcomes, with $P(A) = 1 slash 6$, $P(B) = 6 slash 36 = 1 slash 6$ and $P(C) = 2 slash 36 = 1 slash 18$. \
${A, B}$: $A inter B = {(6, 1)}$ and $1 slash 36 = P(A) P(B)$, so the events are independent (and not mutually exclusive). \
${A, C}$: $A inter C = {(6, 5)}$ is not empty, and $1 slash 36 != P(A) P(C) = 1 slash 108$: neither. \
${B, C}$: a sum cannot be both 7 and 11, so $B inter C = nothing$: mutually exclusive. Since $P(B inter C) = 0 != P(B) P(C)$, they are not independent. Mutually exclusive events of positive probability are never independent. \
*(g)* For each object use an indicator variable that is 1 when the object has the property. The expected count is the sum of the probabilities #j[linearity of expectation], although the indicators are dependent. \
(i) $P(f(x) = x) = 7! slash 8! = 1 slash 8$ for each of the 8 elements: the expected number is $8 times 1 slash 8 = 1$. \
(ii) $P(f(x) = y "and" f(y) = x) = 6! slash 8! = 1 slash 56$ for each of the $binom(8, 2) = 28$ subsets: the expected number is $28 slash 56 = 1 slash 2$. \
*(h)* Let $T$ be the event that the chip is faulty, so $P(T) = 0.01$. \
(i) $P(F_1) = 0.01 times 0.99 + 0.99 times 0.01 = 0.0198$ #j[total probability], so $P(T | F_1) = 0.0099 slash 0.0198 = 1 slash 2$ #j[Bayes' theorem]. *Trap (base rate):* 0.99 is $P(F_1 | T)$, not $P(T | F_1)$. Faulty chips are so rare that a true alarm ($0.01 times 0.99$) is exactly as likely as a false alarm ($0.99 times 0.01$). \
(ii) $P(F_1 inter F_2) = 0.01 times 0.99^2 + 0.99 times 0.01^2 = 0.009801 + 0.000099 = 0.0099$, so $P(T | F_1 inter F_2) = 0.009801 slash 0.0099 = 99 slash 100$. \
(iii) *No.* $P(F_2 | F_1) = 0.0099 slash 0.0198 = 1 slash 2$, whereas $P(F_2) = 0.0198$. The two reports are independent only once the condition of the chip is given. A first "faulty" report makes a faulty chip, and so a second "faulty" report, much more likely.]

#sol[25][][
*(a)* (i) *$G_1$ and $G_2$.* In each of them the two vertices of degree 3 are adjacent ($a, d$ and $q, t$), so they correspond. One isomorphism is
$ a |-> q, quad b |-> p, quad c |-> s, quad d |-> t, quad e |-> u, quad f |-> r. $
Check the 7 edges: $a b |-> q p$, $b c |-> p s$, $c d |-> s t$, $d e |-> t u$, $e f |-> u r$, $f a |-> r q$ and $a d |-> q t$ are exactly the edges of $G_2$. There are four isomorphisms ($a$ goes to $q$ or to $t$, and $b$ to either of the two other neighbours of that vertex), and any one of them, or its inverse from $G_2$ to $G_1$, is a correct answer. Listing the images of $a, b, c, d, e, f$ in order, they are #h(0.3em) $q, p, s, t, u, r$; #h(0.3em) $q, r, u, t, s, p$; #h(0.3em) $t, s, p, q, r, u$; #h(0.3em) $t, u, r, q, p, s$. \
(ii) $G_3$ contains a triangle (a circuit of length 3), namely $g, j, k$, and $G_1$ and $G_2$ contain none: both are bipartite, with sides ${a, c, e}$, ${b, d, f}$ and ${p, r, t}$, ${q, s, u}$. An isomorphism sends a triangle to a triangle. Other correct answers: $G_3$ is not bipartite; $G_3$ has a circuit of length 5; $G_3$ has no circuit of length 4; the two vertices of degree 3 of $G_3$ have a common neighbour. *Trap:* $G_2$ and $G_3$ look alike, and all three graphs have the same number of vertices, number of edges and degree list, which therefore decide nothing (compare Question 20(iii)). \
*(b)* The degrees are $a$: 3, $b$: 4, $c$: 3, $d$: 2, $e$: 4, $f$: 4, $g$: 2. \
(i) *Between $a$ and $c$.* $H$ is connected and $a$, $c$ are its only vertices of odd degree, so an Euler trail exists, and every Euler trail starts at one of them and ends at the other #j[Corollary 10.2.5]. One such trail is $a, d, e, a, b, e, f, b, c, g, f, c$. \
(ii) *$a, b, c, g, f, e, d, a$* (or the same list reversed). There is no other Hamiltonian circuit: $d$ and $g$ have degree 2, so the edges $a d$, $d e$, $c g$, $g f$ are forced. Then $a$ cannot use $a e$, which would close the triangle $a, d, e$, so it uses $a b$. If $c$ used $c f$, then $e$ could only be joined to $b$, and the circuit $a, b, e, d, a$ would close without $c$, $f$, $g$. So $c$ uses $c b$, and $e$ uses $e f$. \
(iii) *$a$ and $c$.* The new edge ${a, c}$ makes both odd degrees even and the graph stays connected, so every vertex has positive even degree and there is an Euler circuit #j[Theorem 10.2.3]. A new edge changes the parity of its two endpoints only, so any other new edge leaves a vertex of odd degree. \
*(c)* Read the post-order from left to right, keeping a stack of subtrees. A letter is a leaf: push it. An operator is the root of a subtree whose right subtree is the top of the stack and whose left subtree is the item below it: replace these two by the new subtree. \
Here $a, b, c, d$ are pushed; $+$ takes $c$ and $d$; $times$ takes $b$ and $c + d$; $-$ takes $a$ and $b times (c + d)$; $e, f$ are pushed; $+$ takes $e$ and $f$; $div$ takes the two subtrees that remain. So $T$ represents $(a - b times (c + d)) div (e + f)$, and the root $div$ has left child $-$ and right child $+$. \
(i) Pre-order: #h(0.4em) #seq($div$, $-$, $a$, $times$, $b$, $+$, $c$, $d$, $+$, $e$, $f$). \
(ii) *Height 4:* the path $div, -, times, +, c$ from the root has 4 edges, and no vertex is deeper. \
A post-order alone does not usually determine a binary tree. Here it does, because every label says how many children its vertex has, so the stack rule leaves no choice. \
*(d)* (i) *21.* $K_8$ has $binom(8, 2) = 28$ edges and a tree with 8 vertices has 7 edges, so $G$ has $28 - 7 = 21$. \
(ii) *False.* Let $overline(G)$ be the star $K_(1,7)$, in which one vertex $v$ is adjacent to the other seven. Then $v$ has degree 0 in $G$, so $G$ is not connected. \
The star is the only such tree. If $G$ is not connected, let $X$ be the vertex set of one connected component and $Y$ the set of all other vertices; every vertex of $X$ is adjacent in $overline(G)$ to every vertex of $Y$. If $X$ and $Y$ both had at least two vertices, $overline(G)$ would contain a circuit $x_1, y_1, x_2, y_2, x_1$. So one of the sets is a single vertex, adjacent in $overline(G)$ to all 7 others, and these 7 edges are the whole tree. Question 20(ii) says that at least one of $G$, $overline(G)$ is connected, not that both are. \
*(e)* Proof (by contradiction).
+ Let $G$ be a bipartite graph with $n$ vertices, where $n$ is odd. The vertex set of $G$ is the union of two disjoint sets $U$ and $W$ such that every edge joins a vertex of $U$ to a vertex of $W$ #j[definition of bipartite graph].
+ Suppose $G$ has a Hamiltonian circuit $v_0, v_1, ..., v_(n-1), v_0$. Here $v_0, v_1, ..., v_(n-1)$ are the $n$ vertices of $G$, each listed exactly once #j[definition of Hamiltonian circuit].
+ Rename the two sets, if necessary, so that $v_0 in U$.
+ For $0 <= i <= n - 2$, ${v_i, v_(i+1)}$ is an edge, so $v_i$ and $v_(i+1)$ lie in different sets #j[line 1]. Starting from $v_0 in U$, this gives $v_1 in W$, $v_2 in U$, and so on: $v_i in U$ when $i$ is even and $v_i in W$ when $i$ is odd.
+ $n - 1$ is even #j[$n$ is odd], so $v_(n-1) in U$.
+ But ${v_(n-1), v_0}$ is an edge of the circuit and both of its endpoints are in $U$, which contradicts line 1.
+ Therefore $G$ has no Hamiltonian circuit. #qed
This is statement (ii) of Question 21 in general: the graph there is bipartite with 9 vertices. \
*(f)* Proof.
+ Let $T$ have $n$ vertices, let $v$ be a vertex with $deg(v) = d >= 2$, and let $ell$ be the number of vertices of $T$ of degree 1.
+ $T$ has $n - 1$ edges #j[Theorem 10.5.2], so the sum of the degrees of all its vertices is $2(n - 1)$ #j[handshake theorem].
+ Every vertex of $T$ has degree at least 1: $T$ has more than one vertex ($v$ has a neighbour) and is connected, and a vertex of degree 0 is not joined by a walk to any other vertex.
+ $v$ is not one of the $ell$ vertices of degree 1 #j[$d >= 2$]. The other $n - 1 - ell$ vertices do not have degree 1, so each of them has degree at least 2 #j[line 3].
+ Adding up the degrees: $2(n - 1) >= d + ell dot 1 + 2(n - 1 - ell) = 2(n - 1) + d - ell$.
+ Hence $ell >= d$: $T$ has at least $d$ vertices of degree 1. #qed
*(g)* Proof.
+ Let $u$ and $w$ be distinct vertices of $G$. It is enough to find a walk from $u$ to $w$ #j[definition of connected].
+ Case 1: $u$ and $w$ are adjacent. Then $u, w$ is a walk from $u$ to $w$.
+ Case 2: $u$ and $w$ are not adjacent. Let $N(u)$ be the set of vertices adjacent to $u$, and $N(w)$ the set of vertices adjacent to $w$.
  + $|N(u)| = deg(u)$ and $|N(w)| = deg(w)$ #j[$G$ is simple: no loops, no parallel edges].
  + Neither $u$ nor $w$ is in $N(u)$ or in $N(w)$ #j[no loops; $u$ and $w$ are not adjacent]. So $N(u)$ and $N(w)$ are subsets of the set $V'$ of the other $n - 2$ vertices.
  + $|N(u)| + |N(w)| >= (n - 1) slash 2 + (n - 1) slash 2 = n - 1 > n - 2$ #j[hypothesis on the degrees].
  + If $N(u) inter N(w) = nothing$, then $N(u) union N(w)$ would be a subset of $V'$ with $|N(u)| + |N(w)| > n - 2$ elements, which is impossible. So there is a vertex $x in N(u) inter N(w)$.
  + Then $u, x, w$ is a walk from $u$ to $w$.
+ In both cases there is a walk from $u$ to $w$. Therefore $G$ is connected. #qed
The bound cannot be lowered: two disjoint triangles have $n = 6$ and every degree equal to $2 = (n - 2) slash 2$. Compare Question 11, where "degree at least 1" was claimed to be enough.]

#sol[26][][
*(a)* $-3$: #h(0.4em) $2$ (clause 1), #h(0.2em) $-2$ (clause 2), #h(0.2em) $3$ (clause 3), #h(0.2em) $-3$ (clause 2). \
$18$: #h(0.4em) $2$ (clause 1), #h(0.2em) $-2$ (clause 2), #h(0.2em) $3$ (clause 3), then $8$, $13$, $18$ (clause 3, three times). \
These are the shortest lists; any longer list in which every step is an application of clause (2) or (3) is equally correct. \
*(b)* Proof by structural induction over $S$.
+ For $x in S$ let $P(x)$ be the statement $5 dv (x^2 + 1)$.
+ Basis step: the only founder is 2, and $2^2 + 1 = 5 = 5 dot 1$. So $P(2)$ is true.
+ Induction step: let $x in S$ and assume that $P(x)$ is true, that is, $x^2 + 1 = 5k$ for some $k in ZZ$.
  + (Clause 2) $(-x)^2 + 1 = x^2 + 1 = 5k$. So $P(-x)$ is true.
  + (Clause 3) $(x + 5)^2 + 1 = x^2 + 10x + 25 + 1 = (x^2 + 1) + 5(2x + 5) = 5(k + 2x + 5)$, and $k + 2x + 5 in ZZ$ #j[sums and products of integers are integers]. So $P(x + 5)$ is true.
+ Therefore $5 dv (x^2 + 1)$ for every $x in S$ #j[structural induction over $S$]. #qed
*(c)* (i) Suppose that $2026 in S$. Then $5 dv (2026^2 + 1)$ #j[part (b)]. But $2026 = 5 dot 405 + 1$, so
$ 2026^2 + 1 = 25 dot 405^2 + 10 dot 405 + 1 + 1 = 5(5 dot 405^2 + 2 dot 405) + 2, $
which leaves remainder 2 when it is divided by 5. This is a contradiction, so $2026 in.not S$. \
(ii) *$R = {2, 3}$.* For $x = 5k + r$, the remainder of $x^2 + 1$ on division by 5 equals that of $r^2 + 1$, which is $1, 2, 0, 0, 2$ for $r = 0, 1, 2, 3, 4$. By part (b) only $r = 2$ and $r = 3$ can occur. Both do: $2 in S$ and $3 in S$ (part (a)); clause (3) then gives $5k + 2$ and $5k + 3$ for every $k >= 0$; and clause (2) turns these into $-(5k + 3) = 5(-k - 1) + 2$ and $-(5k + 2) = 5(-k - 1) + 3$, which are the remaining integers of the two forms. So the converse of part (b) is true as well. \
*(d)* (i) *Yes.* $S subset.eq ZZ$, the set $ZZ$ is countable, and every subset of a countable set is countable #j[Theorem 7.4.3]. \
(ii) *No, $D$ is uncountable.* Proof.
+ For each function $b : NN -> {0, 1}$ define a sequence $x^b = (x_0, x_1, x_2, ...)$ by $x_0 = 2$ and, for every $n in NN$, $x_(n+1) = -x_n$ if $b(n) = 0$, and $x_(n+1) = x_n + 5$ if $b(n) = 1$. Then $x^b in D$ #j[definition of derivation sequence].
+ The function $b |-> x^b$ is injective. Let $b$ and $c$ be different functions $NN -> {0, 1}$, let $n$ be the smallest number with $b(n) != c(n)$, and write $x = x^b$ and $y = x^c$.
  + $x_i = y_i$ for every $i <= n$ #j[$b$ and $c$ agree below $n$, so both sequences are built by the same steps up to term $n$].
  + One of $x_(n+1)$, $y_(n+1)$ is $-x_n$ and the other is $x_n + 5$ #j[$b(n) != c(n)$ and $x_n = y_n$].
  + $-x_n != x_n + 5$, because equality would give $2 x_n = -5$, which is impossible for an integer $x_n$. So $x_(n+1) != y_(n+1)$ and $x^b != x^c$.
+ Suppose that $D$ is countable. Then its subset $D' = {x^b : b "is a function" NN -> {0, 1}}$ is countable #j[Theorem 7.4.3].
+ $b |-> x^b$ is a bijection from the set of all functions $NN -> {0, 1}$ to $D'$ #j[injective by line 2, and onto $D'$ by the definition of $D'$], so that set would be countable too. This contradicts the fact quoted in the question.
+ Therefore $D$ is uncountable. #qed
Alternative proof, which quotes nothing (diagonal argument).
+ Suppose that $D$ is countable. $D$ is not empty (it contains $2, 7, 12, 17, ...$), so there is a sequence $d_0, d_1, d_2, ...$ in which every element of $D$ appears #j[Lemma 9.2; if $D$ is finite, repeat one element for ever]. Each $d_n$ is itself a sequence; write $d_n = (d_(n,0), d_(n,1), d_(n,2), ...)$.
+ Define integers $e_0, e_1, e_2, ...$ as follows: $e_0 = 2$ and, for every $n in NN$, $e_(n+1) = -e_n$ if $d_(n,n+1) != -e_n$, and $e_(n+1) = e_n + 5$ if $d_(n,n+1) = -e_n$.
+ Then $e = (e_0, e_1, e_2, ...)$ is a derivation sequence, so $e in D$ #j[$e_0 = 2$, and each $e_(n+1)$ is $-e_n$ or $e_n + 5$].
+ Let $n in NN$. In the first case of line 2, $e_(n+1) = -e_n != d_(n,n+1)$. In the second case, $d_(n,n+1) = -e_n$ and $e_(n+1) = e_n + 5$, and these are different: $e_n + 5 = -e_n$ would give $2 e_n = -5$, which is impossible for an integer $e_n$. In both cases $e_(n+1) != d_(n,n+1)$.
+ So for every $n in NN$ the sequences $e$ and $d_n$ differ in term number $n + 1$, and $e != d_n$. Thus $e in D$ does not appear in the sequence $d_0, d_1, d_2, ...$, which contradicts line 1.
+ Therefore $D$ is uncountable. #qed
Every term of every derivation sequence is an element of the countable set $S$, and yet $D$ is uncountable: a derivation sequence records infinitely many free choices between two different successors, just as a function $NN -> {0, 1}$ does.]
