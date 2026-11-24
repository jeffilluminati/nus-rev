#import "exam_style.typ": *
#show: setup.with(doc-title: "CS1231S Mock Exam 1", running: [CS1231S · Mock Exam 1])

// ============================================================================
//  CS1231S Mock Exam 1 · edge cases and definitions
//  A full paper in the format of the AY2025/26 final: Part A, 23 original
//  multiple-choice questions (46 marks); Part B, Q24 Counting and Probability
//  (20), Q25 Graphs and Trees (20), Q26 Functions and Relations (14).
//  The answer key, short MCQ solutions and worked Part B solutions follow.
//  Compile:  typst compile CS1231S_Mock_Exam_1.typ "CS1231S Mock Exam 1.pdf"
// ============================================================================

// ---- helpers (as in CS1231S_Exam_Exercise_Sets.typ) ---------------------------
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
// of the ruled working panel under each part (none for no panel). A part and its panel are
// kept on one page.
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
#let nota = [None of options (A), (B), (C), (D) is correct.]
#let sol(id, answer, body) = block(width: 100%, above: 0.85em, below: 0.85em, breakable: true, {
  text(weight: "bold", fill: accent)[#id]
  h(0.5em)
  if answer != none { ans(answer); h(0.5em) }
  body
})
// numbered clauses of a recursive definition
#let clauses(..c) = pad(left: 1.2em, grid(columns: (auto, 1fr, auto), column-gutter: 0.7em, row-gutter: 0.5em,
  ..c.pos().enumerate().map(((i, x)) => ([(#(i + 1))], x.at(0), x.at(1))).flatten()))
// the four options of a two-statement question
#let pairopts = opts(
  [Both (i) and (ii) are false.],
  [(i) is true and (ii) is false.],
  [(i) is false and (ii) is true.],
  [Both (i) and (ii) are true.],
)

// ============================================================================
#text(size: 20pt, weight: "bold", fill: accent)[CS1231S · Mock Exam 1]
#h(0.6em)
#text(size: 11pt, fill: muted)[Edge cases and definitions]
#v(2pt)

#text(weight: "bold")[Time allowed: 2 hours]

#block(width: 100%, inset: (x: 10pt, y: 8pt), radius: 2pt, stroke: 0.6pt + accent, above: 0.8em, below: 0.9em)[
#text(weight: "bold", fill: accent, tracking: 0.5pt)[INSTRUCTIONS]
+ This paper contains TWENTY SIX (26) questions in TWO (2) parts and comprises #context counter(page).at(<end-of-paper>).first() printed pages. The answer key and the solutions start on the page after "End of paper".
+ This is an OPEN BOOK assessment.
+ Printed and written materials are allowed. Apart from calculators, electronic devices are not allowed.
+ Answer ALL questions. In Part A choose exactly one option for each question; every question has exactly one correct option. In Part B write your answers in the boxes provided.
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

*Conventions.* $NN = {0, 1, 2, ...}$ and $ZZ^+ = {1, 2, 3, ...}$; $lnot p$ is the negation of $p$; $exists!$ means "there exists exactly one"; $PP(A)$ is the power set of $A$; $g compose f$ applies $f$ first. A graph is undirected and may have loops and parallel edges unless it is said to be simple. All other terms are as defined in the lectures.

= Part A: Multiple Choice Questions

Each multiple choice question is worth two marks. #h(1fr) #text(size: 8.4pt, fill: muted)[\[Total: 23 × 2 = 46 marks\]]

#q[1][Logic · arguments][
Let $p$, $q$, $r$ and $s$ be the following statements.
#pad(left: 2em, grid(columns: (1fr, 1fr), row-gutter: 0.5em,
  [$p$: #h(0.3em) 12 is divisible by 4.], [$r$: #h(0.3em) 0 is positive.],
  [$q$: #h(0.3em) 12 is even.], [$s$: #h(0.3em) 0 is odd.],
))
Consider the two arguments below.
#pad(left: 2em, grid(columns: (1fr, 1fr),
  grid(columns: (auto, auto), column-gutter: 0.8em, [Argument I:], [$p -> q$ \ $q$ \ $therefore p$]),
  grid(columns: (auto, auto), column-gutter: 0.8em, [Argument II:], [$r -> s$ \ $r$ \ $therefore s$]),
))
Which of the following is true?
#opts(
  [Both arguments are valid.],
  [Argument I is valid and sound; Argument II is invalid.],
  [Argument I is invalid; Argument II is valid but unsound.],
  [Argument I is invalid; Argument II is valid and sound.],
  nota,
)]

#q[2][Logic · conditionals][
Let $S$ be the set of students in a class. For $x in S$, let $P(x)$ be "$x$ passes the final examination" and $A(x)$ be "$x$ gets an A". Which of the following states that passing the final examination is *necessary but not sufficient* for getting an A?
#opts(
  [$(forall x in S thin (P(x) -> A(x))) and (exists x in S thin (A(x) and lnot P(x)))$],
  [$(forall x in S thin (A(x) -> P(x))) and (forall x in S thin (P(x) -> lnot A(x)))$],
  [$(forall x in S thin (A(x) -> P(x))) and (exists x in S thin (P(x) -> lnot A(x)))$],
  [$(forall x in S thin (lnot P(x) -> lnot A(x))) and (exists x in S thin (P(x) and lnot A(x)))$],
  nota,
)]

#q[3][Logic · quantifiers][
Let $D$ be a set of integers and consider the statement
$ exists x in D thin (x > 0 -> x < 0). $
For which sets $D$ is this statement true?
#opts(
  [Only for $D = nothing$.],
  [Exactly for the sets $D$ that contain no positive integer.],
  [Exactly for the sets $D$ that contain at least one negative integer.],
  [For no set $D$: the statement is false whatever $D$ is.],
  nota,
)]

#q[4][Logic · quantifiers][
Given these two statements:
#rom(
  [$exists! x in NN space forall y in NN space (x y = y)$],
  [$forall y in NN space exists! x in NN space (x y = y)$],
)
Which of the following is correct?
#pairopts]

#q[5][Methods of proof][
Let $p$ and $q$ be statements. Which of the following facts, each taken on its own, is enough to conclude that the conditional statement $p -> q$ is true?
#rom(
  [$p$ is false.],
  [$q$ is true.],
  [$lnot p -> lnot q$ is true.],
  [$(p and lnot q) -> lnot p$ is true.],
)
#opts(cols: 2,
  [Only (i), (ii) and (iv).],
  [Only (i) and (ii).],
  [Only (iv).],
  [Only (iii) and (iv).],
  nota,
)]

#q[6][Sets][
Let $A = {nothing, {nothing}, {nothing, nothing}, {nothing, {nothing}}, {{{nothing}}}}$. What is $|A inter PP(A)|$?
#opts(cols: 5, [2], [3], [4], [5], [None of these.])]

#q[7][Sets · partitions][
Which of the following statements are true for *every* set $A$?
#rom(
  [${A}$ is a partition of $A$.],
  [${{x} : x in A}$ is a partition of $A$.],
  [Every partition of $A$ is a subset of $PP(A)$.],
)
#opts(cols: 2,
  [Only (ii).],
  [Only (i) and (ii).],
  [All of (i), (ii) and (iii).],
  [Only (ii) and (iii).],
  nota,
)]

#q[8][Relations][
Let $R$ be a binary relation on a non-empty set $A$. Given these statements:
#rom(
  [If $R$ is symmetric and antisymmetric, then $R$ is transitive.],
  [If $R$ is symmetric and antisymmetric, then $R$ is reflexive.],
  [If $R$ is antisymmetric, then $R$ is not symmetric.],
)
Which of the following is correct?
#opts(cols: 2,
  [Only (i) is true.],
  [Only (i) and (ii) are true.],
  [Only (iii) is true.],
  [All of (i), (ii) and (iii) are true.],
  nota,
)]

#q[9][Equivalence relations][
Let $A = {1, 2, 3, 4, 5, 6}$ and let $simq$ be an equivalence relation on $A$ with exactly three distinct equivalence classes. Regard $simq$ as a subset of $A times A$. What are the smallest and the largest possible numbers of elements of $simq$?
#opts(cols: 5, [3 and 6], [6 and 12], [12 and 18], [12 and 14], [None of these.])]

#q[10][Equivalence relations · graphs][
Let $G = (V, E)$ be a simple graph. Define a binary relation $R$ on $V$ as follows: for all $x, y in V$,
$ x R y <=> "there is a walk of even length from" x "to" y "in" G. $
(Recall that the trivial walk from a vertex to itself is a walk of length 0.) Which of the following is true?
#opts(
  [For some $G$, $R$ is not reflexive.],
  [For some $G$, $R$ is not transitive.],
  [For every $G$, $R$ is an equivalence relation; and whenever $G$ is connected, $R$ has exactly one equivalence class.],
  [For every $G$, $R$ is an equivalence relation; and whenever $G$ is connected, $R$ has at most two equivalence classes.],
  nota,
)]

#q[11][Partial orders][
Let $A = {1, 2, 3}$ and let $cal(O)$ be the set of all partial orders on $A$. Every element of $cal(O)$ is a subset of $A times A$, so $subset.eq$ is a partial order on $cal(O)$. Which of the following is true of the partially ordered set $(cal(O), subset.eq)$?
#opts(
  [It has exactly 6 maximal elements.],
  [It has a largest element, namely $A times A$.],
  [It has no smallest element.],
  [It has exactly one maximal element, namely ${(x, y) in A times A : x <= y}$.],
  nota,
)]

#q[12][Functions][
Let $B = {1, 2}$. Let $m$ be the number of functions from $nothing$ to $B$, let $n$ be the number of functions from $B$ to $nothing$, and let $k$ be the number of functions from $nothing$ to $nothing$. What is $(m, n, k)$?
#opts(cols: 5, [$(0, 0, 0)$], [$(1, 1, 1)$], [$(1, 0, 0)$], [$(0, 0, 1)$], [None of these.])]

#q[13][Functions · composition][
Let $A$ be a set, and let $f : A -> A$ and $g : A -> A$ be any functions such that $g compose f = idf_A$. Given these two statements:
#rom(
  [If $A = {1, 2, 3}$, then $f compose g = idf_A$ must hold.],
  [If $A = NN$, then $f compose g = idf_A$ must hold.],
)
Which of the following is correct?
#pairopts]

#q[14][Functions · quotient sets][
For $n in ZZ^+$, let $zn(n) = {\[0\]_n, \[1\]_n, ..., \[n - 1\]_n}$ be the set of equivalence classes of integers under congruence modulo $n$, where $\[x\]_n$ is the class of $x$. Which of the following rules are well defined, that is, define functions?
#rom(
  [$f : zn(3) -> zn(6)$, #h(0.6em) $f(\[x\]_3) = \[x\]_6$.],
  [$g : zn(3) -> zn(6)$, #h(0.6em) $g(\[x\]_3) = \[2x\]_6$.],
  [$h : zn(4) -> zn(8)$, #h(0.6em) $h(\[x\]_4) = \[x^2\]_8$.],
)
#opts(cols: 2,
  [Only (i).],
  [Only (ii).],
  [Only (ii) and (iii).],
  [All of (i), (ii) and (iii).],
  nota,
)]

#q[15][Induction][
Let $P(n)$ be a predicate defined for all $n in NN$. Which of the following sets of hypotheses guarantee that $P(n)$ is true for every $n in NN$?
#rom(
  [For every $k in NN$: if $P(i)$ is true for all $i in NN$ with $i < k$, then $P(k)$ is true.],
  [$P(0)$ is true; and for every $k in ZZ^+$: if $P(k - 1)$ and $P(k)$ are both true, then $P(k + 1)$ is true.],
  [$P(0)$ and $P(1)$ are true; and for every $k in NN$: if $P(k)$ is true, then $P(k + 2)$ is true.],
)
#opts(cols: 2,
  [Only (iii).],
  [Only (i) and (iii).],
  [Only (ii) and (iii).],
  [All of (i), (ii) and (iii).],
  nota,
)]

#q[16][Recursively defined sets][
A set $S$ of strings over the alphabet ${a, b}$ is recursively defined as follows:
#clauses(
  ([$a b in S$.], [(base clause)]),
  ([If $x in S$, then $a x b in S$.], [(recursion clause)]),
  ([If $x in S$ and $y in S$, then $x y in S$.], [(recursion clause)]),
  ([Membership for $S$ can always be demonstrated by finitely many successive applications of the clauses above.], [(minimality clause)]),
)
Which of the following statements are true?
#rom(
  [Every string in $S$ starts with $a$, ends with $b$, and contains equally many $a$'s and $b$'s.],
  [Every string over ${a, b}$ that starts with $a$, ends with $b$, and contains equally many $a$'s and $b$'s is in $S$.],
  [$S$ contains exactly 5 strings of length 6.],
)
#opts(cols: 2,
  [Only (i) and (iii).],
  [Only (i).],
  [Only (i) and (ii).],
  [All of (i), (ii) and (iii).],
  nota,
)]

#q[17][Recursively defined sets][
A set $S$ of integers is recursively defined as follows:
#clauses(
  ([$0 in S$.], [(base clause)]),
  ([If $x in S$, then $x + 4 in S$ and $x - 6 in S$.], [(recursion clause)]),
  ([Membership for $S$ can always be demonstrated by finitely many successive applications of the clauses above.], [(minimality clause)]),
)
Let $T$ be a set of integers such that $0 in T$ and, for every $x in T$, both $x + 4 in T$ and $x - 6 in T$. (So $T$ satisfies clauses (1) and (2), but not necessarily clause (3).) Which of the following statements must be true?
#rom(
  [$T subset.eq S$.],
  [$S subset.eq T$.],
  [If $T != S$, then $T = ZZ$.],
)
#opts(cols: 2,
  [Only (i).],
  [Only (ii).],
  [Only (ii) and (iii).],
  [All of (i), (ii) and (iii).],
  nota,
)]

#q[18][Cardinality][
Let $A$ be a countably infinite set and let $B$ be a countable set. Which of the following statements must be true?
#rom(
  [$A union B$ is countably infinite.],
  [$A times B$ is countably infinite.],
  [The set of all functions from $B$ to $A$ is countable.],
)
#opts(cols: 2,
  [Only (i) and (ii).],
  [Only (i) and (iii).],
  [All of (i), (ii) and (iii).],
  [Only (i).],
  nota,
)]

#q[19][Cardinality][
Which of the following sets are countable?
#rom(
  [The set of all functions $f : NN -> NN$ such that $f(n + 1) < f(n)$ for every $n in NN$.],
  [The set of all functions $f : NN -> NN$ such that $f(n + 1) > f(n)$ for every $n in NN$.],
  [The set of all functions $f : NN -> NN$ such that $f(n + 1) <= f(n)$ for every $n in NN$.],
)
#opts(cols: 2,
  [Only (i).],
  [Only (iii).],
  [Only (i) and (iii).],
  [None of (i), (ii) and (iii).],
  nota,
)]

#q[20][Counting][
How many functions $f : {1, 2, 3} -> {1, 2, 3, 4}$ are neither injective nor surjective?
#opts(cols: 5, [4], [24], [57], [64], [None of these.])]

#q[21][Probability][
A fair six-sided die is rolled once, so the sample space is $S = {1, 2, 3, 4, 5, 6}$ and an event is a subset of $S$. Events $A$ and $B$ are _independent_ if and only if $P(A inter B) = P(A) dot P(B)$. Which of the following is true for *all* events $A$ and $B$?
#opts(
  [If $A inter B = nothing$, then $A$ and $B$ are not independent.],
  [If $A subset.eq B$, then $A$ and $B$ are not independent.],
  [$A$ and $A$ are not independent; that is, no event is independent of itself.],
  [If $A subset.eq B$ and $A$ and $B$ are independent, then $A = nothing$ or $B = S$.],
  nota,
)]

#q[22][Graphs][
A graph $G$ has vertex set ${u, v}$ and exactly three edges: $e_1$ and $e_2$, each with endpoints $u$ and $v$, and $e_3$, a loop at $v$. What are $deg(v)$ and the number of walks of length 3 from $u$ to $v$, respectively?
#opts(cols: 5, [3 and 10], [4 and 10], [4 and 16], [3 and 2], [None of these.])]

#q[23][Trees][
Which of the following statements are true?
#rom(
  [Every tree has at least two vertices of degree 1.],
  [A rooted tree that consists of a single vertex is a full binary tree.],
  [Every full binary tree has an odd number of vertices.],
)
#opts(cols: 2,
  [Only (ii) and (iii).],
  [Only (i) and (iii).],
  [Only (iii).],
  [All of (i), (ii) and (iii).],
  nota,
)]

// ============================================================================
= Part B: Structured Questions
// ============================================================================

There are 3 questions in this part. #h(1fr) #text(size: 8.4pt, fill: muted)[\[Total: 54 marks\]]

#q(split: true)[24 · Counting and Probability #h(0.4em) \[Total: 20 marks\]][][
Working is not required for this question, except for the justification asked for in part (d). Write every other answer as a single number or a single fraction.
#parts(work: (2.5cm, 2.5cm, 2.5cm, 3.75cm, 2.5cm, 2.5cm, 3.25cm, 3.75cm,),
[How many distinct arrangements of the nine letters of the word SEVENTEEN have no two E's next to each other? #mk(2)],
[A committee of 4 people is to be formed from 5 married couples (10 people). How many possible committees contain no married couple, that is, no two members of the committee are married to each other? #mk(2)],
[A bakery sells 4 kinds of doughnut and has plenty of each kind. A box holds 6 doughnuts, and two boxes are the same if they hold the same number of doughnuts of each kind. How many different boxes are missing at least one of the 4 kinds? #mk(2)],
[What is the smallest positive integer $n$ such that among any $n$ distinct integers there must be two whose sum or whose difference is divisible by 7? Justify your answer briefly: name the pigeonholes, and give $n - 1$ distinct integers which show that $n - 1$ is not enough. #mk(3)],
[How many integers from 1 to 1000 inclusive are divisible by none of 6, 10 and 15? #mk(2)],
[Events $A$ and $B$ of a sample space satisfy $P(A) = 0.7$ and $P(B) = 0.6$. What are the smallest and the largest possible values of $P(A inter B)$? #mk(2)],
[Five distinct balls are placed into three distinct boxes. Each ball is placed independently of the others and is equally likely to go into each of the three boxes. What is the expected number of empty boxes? #mk(3)],
[(Total: 4 marks) A bag contains three coins: a fair coin, a coin with heads on both sides, and a coin with tails on both sides. One coin is drawn at random from the bag, each coin being equally likely, and is tossed twice. Both tosses show heads.
#rom(
  [What is the probability that the coin drawn is the coin with heads on both sides? #mk(2)],
  [The same coin is tossed a third time. What is the probability that it shows heads again? #mk(2)],
)],
)]

#q(split: true)[25 · Graphs and Trees #h(0.4em) \[Total: 20 marks\]][][
Working is not required for this question. $K_n$ is the complete graph on $n$ vertices, and $K_(m,n)$ is the complete bipartite graph whose two sides have $m$ and $n$ vertices. For $n >= 3$, $K_n - e$ denotes the graph obtained from $K_n$ by deleting one edge $e$; both endpoints of $e$ are kept, so $K_n - e$ still has $n$ vertices.
#parts(work: (2.5cm, 3.75cm, 3cm, 2.5cm, 5cm, 3cm, 2.5cm,),
[For which pairs of positive integers $(m, n)$ is $K_(m,n)$ a tree? Give a necessary and sufficient condition. #mk(2)],
[(Total: 4 marks) Answer each part with a necessary and sufficient condition on $n$, where $n >= 3$. If no value of $n$ works, write "none".
#rom(
  [For which $n$ does $K_n - e$ have an Euler circuit? #mk(1)],
  [For which $n$ does $K_n - e$ have an Euler trail from some vertex to a different vertex? #mk(2)],
  [For which $n$ is $K_n - e$ a Hamiltonian graph? #mk(1)],
)],
[A full binary tree has exactly 2027 vertices. (i) How many of its vertices are leaves (terminal vertices)? (ii) What is the smallest possible height of the tree? (iii) What is the largest possible height of the tree? #mk(3)],
[The pre-order traversal and the in-order traversal of a certain binary tree with five vertices are both #h(0.2em) #box[V W X Y Z]. Write out its post-order traversal and state its height. #mk(2)],
[A binary tree has the in-order and post-order traversals below. Write out its pre-order traversal. #mk(3)
#pad(left: 2em)[In-order: #h(1.25em) A L G O R I T H M \ Post-order: #h(0.5em) A G O L I T M H R]],
[#block(breakable: false)[An undirected weighted graph is shown below. #mk(4)
#align(center, gdraw(
  (([$a$], 0.4, 2.0), ([$b$], 2.2, 2.0), ([$c$], 4.0, 2.0), ([$d$], 0.4, 0.4), ([$e$], 2.2, 0.4), ([$f$], 4.0, 0.4)),
  ((0, 1, 1), (3, 4, 1), (0, 3, 2), (1, 4, 2), (0, 4, 4), (1, 2, 3), (4, 5, 3), (2, 5, 3), (1, 5, 5)),
  w: 4.4cm, h: 2.4cm))
(i) What is the weight of its minimum spanning tree? \
(ii) How many distinct minimum spanning trees does it have?]],
[In the graph of part (f), the weight of the edge ${c, f}$ is changed from 3 to a positive real number $x$, and all the other weights stay the same. For which values of $x$ does the edge ${c, f}$ belong to (i) every minimum spanning tree; (ii) no minimum spanning tree? #mk(2)],
)]

#q(split: true)[26 · Functions and Relations #h(0.4em) \[Total: 14 marks\]][][
Define a relation $simq$ on $NN times NN$ as follows: for all $(a, b), (c, d) in NN times NN$,
$ (a, b) tilde.op (c, d) <=> a + d = b + c. $
You may use without proof that $simq$ is an equivalence relation on $NN times NN$. Write $[(a, b)]$ for the equivalence class of $(a, b)$, and let $Q = (NN times NN) slash simq$ be the set of all equivalence classes. Recall that $0 in NN$.
#parts(work: (2.5cm, 3.75cm, 8.5cm, 4.5cm,),
[List all the elements $(a, b)$ of the equivalence class $[(3, 1)]$ that have $a <= 5$. #mk(2)],
[Three rules are proposed below. For each rule, state whether it is well defined, that is, whether it defines a function on $Q$. For each rule that is *not* well defined, give two elements of $NN times NN$ that lie in the same equivalence class but are given different outputs by the rule. #mk(3)
#rom(
  [$G : Q -> NN$, #h(0.6em) $G([(a, b)]) = a + b$.],
  [$M : Q -> NN$, #h(0.6em) $M([(a, b)]) = max(a, b) - min(a, b)$.],
  [$P : Q -> Q$, #h(0.6em) $P([(a, b)]) = [(a^2, b^2)]$.],
)],
[Define $F : Q -> ZZ$ by setting $F([(a, b)]) = a - b$ for all $(a, b) in NN times NN$. Prove that $F$ is well defined and that $F$ is a bijection. #mk(5)],
[(Total: 4 marks) The rules
$ H([(a, b)]) = [(b, a)], quad S([(a, b)]) = [(a + 1, b)] quad "and" quad D([(a, b)]) = [(2a, 2b)] $
define functions $H$, $S$ and $D$ from $Q$ to $Q$; you need not prove this. The _order_ of a bijection $f : X -> X$ is the smallest $n in ZZ^+$ such that $underbrace(f compose f compose dots.c compose f, n "many" f"'s") = idf_X$, if such an $n$ exists; otherwise $f$ has no order.
#rom(
  [Is $D$ injective? Is $D$ surjective? #mk(1)],
  [$S$ is a bijection. Write $S^(-1)([(a, b)])$ in the form $[(dots, dots)]$, with a formula that is valid for every $(a, b) in NN times NN$. #mk(1)],
  [$H$ and $H compose S$ are bijections. State the order of $H$ and the order of $H compose S$. Does $S$ have an order? #mk(2)],
)],
)]

#align(center, text(size: 8.4pt, fill: muted)[— End of paper —]) <end-of-paper>

#pagebreak()
// ============================================================================
= Answer Key
// ============================================================================

Part A. #h(0.3em) The answers to Part B follow the Part A solutions.


#let keyrow(..xs) = xs.pos().map(x => [#x])
#table(columns: (auto,) + (1fr,) * 12, align: center,
  [Question], ..keyrow("1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12"),
  [*Answer*], ..keyrow("C", "D", "E", "B", "A", "B", "D", "A", "C", "D", "A", "E"),
  [*Question*], ..keyrow("13", "14", "15", "16", "17", "18", "19", "20", "21", "22", "23", "").map(x => strong(x)),
  [*Answer*], ..keyrow("B", "C", "B", "A", "C", "D", "C", "E", "D", "B", "A", ""),
)

In paper order: #h(0.3em) C D E B A #h(0.4em) B D A C D #h(0.4em) A E B C B #h(0.4em) A C D C E #h(0.4em) D B A. #h(0.6em) Each question is worth 2 marks.

// ============================================================================
= Part A Solutions
// ============================================================================

#sol[1][C][*Validity belongs to the form, not to the truth of the statements.* Argument I is $p -> q$, $q$ $therefore p$, the converse error: the row $p$ = F, $q$ = T makes both premises true and the conclusion false, so I is invalid although its premises and conclusion are all true (not A, B). Argument II is modus ponens, so it is valid in spite of its false conclusion; its premise $r$ is false, so it is unsound (not D). The premise $r -> s$ is vacuously true.]

#sol[2][D][Necessary: $forall x thin (A(x) -> P(x))$, which D writes as the contrapositive $forall x thin (lnot P(x) -> lnot A(x))$. Not sufficient: $lnot forall x thin (P(x) -> A(x)) equiv exists x thin (P(x) and lnot A(x))$. A swaps the two roles (sufficient but not necessary). B negates "sufficient" with another $forall$; it says that nobody who passes gets an A. C puts $->$ under $exists$: its second half is true as soon as one student fails.]

#sol[3][E][$x > 0 -> x < 0 equiv lnot (x > 0) or x < 0 equiv x <= 0$, so the statement says $exists x in D thin (x <= 0)$: *$D$ contains an integer that is not positive*, which is not among the options. A: an existential statement over $nothing$ is false; only universal statements are vacuously true. B reads $exists$ as $forall$: it is wrong for $D = nothing$ and for $D = {-1, 1}$. C forgets 0: $D = {0}$ makes the statement true. D: take $D = {-1}$.]

#sol[4][B][(i) True: $x = 1$ gives $1 dot y = y$ for every $y$, and the case $y = 1$ forces $x = 1$, so there is exactly one such $x$. (ii) False: for $y = 0$ every $x in NN$ satisfies $x dot 0 = 0$, so $x$ is not unique. The trap: $exists x thin forall y$ implies $forall y thin exists x$, but with $exists!$ the uniqueness does not carry over, and $0 in NN$.]

#sol[5][A][$p -> q equiv lnot p or q$. (i) $lnot p$ gives it at once (the conditional is vacuously true) and (ii) $q$ gives it at once, whatever $p$ is. (iii) is the inverse, which is equivalent to the converse and not to $p -> q$: with $p$ = T and $q$ = F it is true and $p -> q$ is false. (iv) $(p and lnot q) -> lnot p equiv lnot p or q or lnot p equiv p -> q$; this is the shape of a proof by contradiction.]

#sol[6][B][${nothing, nothing} = {nothing}$, so $A$ has four elements: $nothing$, ${nothing}$, ${nothing, {nothing}}$ and ${{{nothing}}}$. An element $x$ of $A$ is in $PP(A)$ iff $x subset.eq A$. $nothing subset.eq A$ always; ${nothing} subset.eq A$ as $nothing in A$; ${nothing, {nothing}} subset.eq A$ as $nothing in A$ and ${nothing} in A$; but ${{{nothing}}} subset.eq.not A$ as ${{nothing}} in.not A$. The answer is 3. (2 forgets $nothing subset.eq A$; 4 is $|A|$; 5 counts ${nothing, nothing}$ as a new element.)]

#sol[7][D][(i) fails for $A = nothing$ and only there: ${nothing}$ has an empty component. (ii) holds for every $A$; for $A = nothing$ it is the empty partition $nothing$, which satisfies both conditions of the definition vacuously. (iii) Each component is a subset of $A$, that is, an element of $PP(A)$, so the partition is a subset of $PP(A)$ (it is not an element of $PP(A)$ in general). C overlooks $A = nothing$.]

#sol[8][A][If $R$ is symmetric and antisymmetric, then $x R y$ gives $y R x$ and hence $x = y$, so $R subset.eq {(x, x) : x in A}$. (i) True: if $x R y$ and $y R z$ then $x = y$, so $x R z$. (ii) False: $R = nothing$ on the non-empty set $A$ is symmetric and antisymmetric but not reflexive; $R$ need not be the whole identity relation. (iii) False: $nothing$ and the identity relation are both. Antisymmetric does not mean "not symmetric".]

#sol[9][C][With classes $S_1, S_2, S_3$ the relation is $(S_1 times S_1) union (S_2 times S_2) union (S_3 times S_3)$, so it has $|S_1|^2 + |S_2|^2 + |S_3|^2$ ordered pairs, every $(x, x)$ included. Class sizes $2, 2, 2$ give 12; $3, 2, 1$ give 14; $4, 1, 1$ give 18. A counts unordered pairs of distinct elements, B leaves out the six pairs $(x, x)$, and D misses the sizes $4, 1, 1$.]

#sol[10][D][Reflexive: the trivial walk has length 0, which is even, so even a vertex of degree 0 is related to itself (not A). Symmetric: reverse the walk. Transitive: even + even is even (not B). If $G$ is connected, fix $v in V$: the vertices with an even walk from $v$ are related to $v$, and any two vertices with an odd walk from $v$ are related to each other (odd + odd is even), so there are at most two classes. $K_2$ has two (not C); a triangle has one.]

#sol[11][A][The identity relation ${(x, x) : x in A}$ is a partial order contained in every partial order on $A$, so it is the smallest element (not C; $nothing$ is not reflexive, so it is not in $cal(O)$ at all). $A times A$ is not antisymmetric, so it is not in $cal(O)$ either (not B). A partial order with two noncomparable elements can be enlarged, so the maximal elements are the $3! = 6$ total orders; none contains another, so there is no largest element (not D).]

#sol[12][E][$(m, n, k) = (1, 0, 1)$. A function $X -> Y$ is a relation $f subset.eq X times Y$ in which every $x in X$ has exactly one image. $nothing times B = nothing$, and $f = nothing$ satisfies the condition vacuously: one function ($2^0 = 1$). $B times nothing = nothing$, but under $f = nothing$ the element $1 in B$ has no image: no function ($0^2 = 0$). From $nothing$ to $nothing$ the empty function works again ($0^0 = 1$).]

#sol[13][B][$g compose f = idf_A$ makes $f$ injective. (i) An injection from a finite set to itself is a bijection (pigeonhole principle), so $f^(-1)$ exists and $g = g compose f compose f^(-1) = f^(-1)$; hence $f compose g = idf_A$. (ii) On $NN$ take $f(n) = n + 1$, and $g(n) = n - 1$ for $n >= 1$ with $g(0) = 0$. Then $g(f(n)) = n$ for all $n$, but $f(g(0)) = 1 != 0$. A left inverse need not be a right inverse; $f compose g$ and $g compose f$ are different functions.]

#sol[14][C][A rule on classes defines a function only if the output is the same for every representative. (i) $\[0\]_3 = \[3\]_3$ but $\[0\]_6 != \[3\]_6$: not well defined. (ii) If $x' = x + 3k$ then $2x' = 2x + 6k$, so $\[2x'\]_6 = \[2x\]_6$. (iii) If $x' = x + 4k$ then $x'^2 = x^2 + 8 k x + 16 k^2$, so $\[x'^2\]_8 = \[x^2\]_8$. B distrusts squaring; D does not test (i) with two representatives.]

#sol[15][B][(i) is strong induction, and it needs no separate basis: for $k = 0$ the condition "$P(i)$ for all $i < 0$" is vacuously true, so (i) itself yields $P(0)$. (ii) has a missing base case: its first step, $k = 1$, needs $P(1)$, which is never supplied. The predicate $P(n) equiv (n = 0)$ satisfies (ii) but is false at 1. (iii) $P(0)$ gives every even $n$ and $P(1)$ every odd $n$. C goes by appearance: (i) looks baseless and (ii) looks like strong induction.]

#sol[16][A][(i) By structural induction: $a b$ has the three properties, and $a x b$ and $x y$ keep them. (ii) is the converse of (i) and is false: in every string of $S$ each prefix has at least as many $a$'s as $b$'s (structural induction again), so $a b b a a b in.not S$. The strings of lengths 2 and 4 with the three properties are all in $S$, so small cases do not expose this. (iii) $a a a b b b$, $a a b a b b$, $a a b b a b$, $a b a a b b$, $a b a b a b$.]

#sol[17][C][$S$ is the set of even integers: $2 = 4 + 4 - 6$ and $-2 = 4 - 6$, and every element of $S$ is even. (ii) True, and it is what the minimality clause means: by structural induction over $S$ with $P(x) equiv (x in T)$, every element of $S$ lies in $T$. (i) False: $T = ZZ$ satisfies clauses (1) and (2). (iii) True: if $T != S$ then $T$ has an odd element $t$, hence every $t + 4a - 6b$ with $a, b in NN$, that is, every odd integer.]

#sol[18][D][(i) True: $A union B$ contains $A$, so it is infinite, and a union of two countable sets is countable. (ii) False: "countable" includes finite and empty; $B = nothing$ gives $A times B = nothing$. (iii) False: $B$ may be countably infinite, and the set of all functions $NN -> NN$ is uncountable (given a list $f_0, f_1, ...$, the function $d(n) = f_n (n) + 1$ is not on it). A forgets $B = nothing$; B reads "countable" as "finite".]

#sol[19][C][(i) No such function exists: its range would be a non-empty subset of $NN$ with no smallest element. The set is $nothing$, which is finite and so countable. (ii) Uncountable: each $b : NN -> {0, 1}$ gives a different strictly increasing function $f_b (n) = n + b(0) + dots.c + b(n)$. (iii) Countable: such an $f$ decreases at most $f(0)$ times, so it is constant from some point on and is fixed by a finite string of natural numbers, and there are countably many finite strings.]

#sol[20][E][The answer is 40. No function from a 3-element set to a 4-element set is surjective (dual pigeonhole principle), so "neither" means "not injective": $4^3 - 4 dot 3 dot 2 = 64 - 24 = 40$. A subtracts a further 36, the number of surjections from a 4-element set onto a 3-element set. B is the number of injections. C takes the total to be $3^4$. D takes "not surjective" alone.]

#sol[21][D][$nothing$ is independent of every event, since $P(nothing inter B) = 0 = P(nothing) P(B)$; it is also disjoint from every event and a subset of every event, so A and B fail with $A = nothing$ (B also with $B = S$). C fails for $nothing$ and for $S$. D: if $A subset.eq B$ then $A inter B = A$, so independence gives $P(A) = P(A) P(B)$, hence $P(A) = 0$ or $P(B) = 1$; on a fair die this means $A = nothing$ or $B = S$. "Disjoint events are dependent" needs both probabilities positive.]

#sol[22][B][A loop counts twice in the degree: $deg(v) = 2 + 2 = 4$ (check: total degree $2 + 4 = 2 dot 3$). In the adjacency matrix a loop counts once and parallel edges count separately: $A = mat(0, 2; 2, 1)$, $A^2 = mat(4, 2; 2, 5)$ and $(A^3)_(u v) = 0 dot 2 + 2 dot 5 = 10$. Directly: $u, v, v, v$ in $2 dot 1 dot 1$ ways and $u, v, u, v$ in $2 dot 2 dot 2$ ways. A counts the loop once in the degree, C counts it twice in the matrix, D merges $e_1$ and $e_2$.]

#sol[23][A][(i) False: the trivial tree (one vertex, no edge) has no vertex of degree 1; the lemma is about non-trivial trees. (ii) True: in a full binary tree every _parent_ has exactly two children, and a single vertex has no parent, so the condition holds vacuously. (iii) True: a full binary tree with $k$ internal vertices has $2k + 1$ vertices, and $k = 0$ is the single vertex. B and C reject (ii); D forgets the trivial tree.]

#pagebreak(weak: true)
// ============================================================================
= Part B Answers
// ============================================================================

#table(columns: (auto, 1fr),
  [Question], [Final answers],
  [24], [(a) 900 #h(0.5em) (b) 80 #h(0.5em) (c) 74 #h(0.5em) (d) $n = 5$; pigeonholes ${0}$, ${1, 6}$, ${2, 5}$, ${3, 4}$ (remainders modulo 7); $0, 1, 2, 3$ shows that 4 is not enough #h(0.5em) (e) 734 #h(0.5em) (f) smallest 0.3, largest 0.6 #h(0.5em) (g) $32/81$ #h(0.5em) (h) (i) $4/5$; (ii) $9/10$.],
  [25], [(a) $m = 1$ or $n = 1$ #h(0.5em) (b) (i) none; (ii) $n$ is odd or $n = 4$; (iii) $n >= 4$ #h(0.5em) (c) (i) 1014; (ii) 10; (iii) 1013 #h(0.5em) (d) Z Y X W V; height 4 #h(0.5em) (e) R L A O G H T I M #h(0.5em) (f) (i) 10; (ii) 6 #h(0.5em) (g) (i) $x < 3$; (ii) $x > 3$.],
  [26], [(a) $(2, 0)$, $(3, 1)$, $(4, 2)$, $(5, 3)$ #h(0.5em) (b) (i) not well defined, for example $(1, 0) tilde.op (2, 1)$ with outputs 1 and 3; (ii) well defined; (iii) not well defined, for example $(1, 0) tilde.op (2, 1)$ with outputs $[(1, 0)] != [(4, 1)]$ #h(0.5em) (c) proof below #h(0.5em) (d) (i) injective, not surjective; (ii) $[(a, b + 1)]$; (iii) 2 and 2; $S$ has no order.],
)

*Marking Part B.* Parts with a single final answer are right or wrong. Where a part has several answers, the marks are shared equally between them, with these exceptions. In 24(d), 1 mark is for $n = 5$, 1 for the pigeonholes and 1 for a set of four integers. In 26(c), 1 mark is for well-definedness, 2 for injectivity and 2 for surjectivity. 26(d)(i) needs both answers for its mark, and in 26(d)(iii) 1 mark is for the two orders and 1 for the answer about $S$.

== Worked solutions to Part B

#sol[24][][
*(a)* *900.* The word has four E's, two N's and one each of S, V, T. Arrange the five other letters S, V, N, T, N first: $5! slash 2! = 60$ ways. They leave 6 gaps (the two ends included), and the four E's must go into four different gaps: $binom(6, 4) = 15$ ways. $60 times 15 = 900$. \
*(b)* *80.* No couple may supply two members, so the 4 members come from 4 different couples: choose the couples in $binom(5, 4) = 5$ ways, then one person from each in $2^4 = 16$ ways. Check: committees with exactly one couple number $5 dot binom(4, 2) dot 2^2 = 120$ and with two couples $binom(5, 2) = 10$, and $80 + 120 + 10 = 210 = binom(10, 4)$. \
*(c)* *74.* A box is a multiset of size 6 from 4 kinds: $binom(6 + 4 - 1, 4 - 1) = binom(9, 3) = 84$ boxes. A box that has all four kinds is one doughnut of each kind plus any multiset of size 2: $binom(5, 3) = 10$ boxes. By the difference rule, $84 - 10 = 74$. \
*(d)* *$n = 5$.* Sort integers by their remainder modulo 7 into the four pigeonholes ${0}$, ${1, 6}$, ${2, 5}$, ${3, 4}$. Among any 5 integers, two lie in the same pigeonhole #j[pigeonhole principle]. If these two have the same remainder, their difference is divisible by 7; otherwise their remainders are $r$ and $7 - r$, and their sum is divisible by 7. Four integers are not enough: among $0, 1, 2, 3$ the sums of two are $1, 2, 3, 3, 4, 5$ and the differences are $1, 2, 3$ up to sign, none divisible by 7. \
*(e)* *734.* Let $A_6$, $A_10$, $A_15$ be the sets of multiples of 6, 10, 15 in ${1, ..., 1000}$: $|A_6| = 166$, $|A_10| = 100$, $|A_15| = 66$. A number is divisible by two of 6, 10, 15 iff it is divisible by their least common multiple, and $"lcm"(6, 10) = "lcm"(6, 15) = "lcm"(10, 15) = "lcm"(6, 10, 15) = 30$, so each pairwise intersection and the triple intersection is the set of the 33 multiples of 30. By inclusion and exclusion $|A_6 union A_10 union A_15| = 166 + 100 + 66 - 33 - 33 - 33 + 33 = 266$, and $1000 - 266 = 734$. (Using the products 60, 90 and 150 in place of the least common multiples is the trap.) \
*(f)* *0.3 and 0.6.* $P(A inter B) = P(A) + P(B) - P(A union B) >= 1.3 - 1 = 0.3$, with equality when $A union B$ is the whole sample space. Also $A inter B subset.eq B$, so $P(A inter B) <= P(B) = 0.6$, with equality when $B subset.eq A$. Both values occur: for one roll of a fair ten-sided die, $A = {1, ..., 7}$ with $B = {5, ..., 10}$ gives 0.3, and with $B = {1, ..., 6}$ gives 0.6. In particular $A$ and $B$ cannot be disjoint; the product $0.42$ is the value for independent events, not a bound. \
*(g)* *$32/81$.* For $i = 1, 2, 3$ let $X_i = 1$ if box $i$ is empty and $X_i = 0$ otherwise. Box $i$ is empty iff all five balls go elsewhere: $P(X_i = 1) = (2/3)^5 = 32/243$, so $E[X_i] = 32/243$. The number of empty boxes is $X_1 + X_2 + X_3$, and by linearity of expectation its expected value is $3 dot 32/243 = 32/81$. (The $X_i$ are not independent; linearity does not need independence.) \
*(h)* The coin is fair, two-headed or two-tailed with probability $1/3$ each, and $P("HH" | "fair") = 1/4$, $P("HH" | "two-headed") = 1$, $P("HH" | "two-tailed") = 0$. So $P("HH") = 1/3 (1/4 + 1 + 0) = 5/12$. \
(i) $P("two-headed" | "HH") = (1/3 dot 1) slash (5/12) =$ *$4/5$* #j[Bayes' theorem]. \
(ii) Given HH the coin is two-headed with probability $4/5$ and fair with probability $1/5$; the two-tailed coin is ruled out. So $P("third toss is heads" | "HH") = 4/5 dot 1 + 1/5 dot 1/2 =$ *$9/10$*.]

#sol[25][][
*(a)* *$m = 1$ or $n = 1$.* $K_(m,n)$ is connected and has $m + n$ vertices and $m n$ edges. A tree with $m + n$ vertices has $m + n - 1$ edges #j[Theorem 10.5.2], and $m n = m + n - 1 <=> (m - 1)(n - 1) = 0$. Conversely $K_(1,n)$ is connected with $n + 1$ vertices and $n$ edges, so it is a tree #j[Theorem 10.5.4]. If $m, n >= 2$, two vertices on each side form a circuit of length 4. The case $K_(1,1) = K_2$ is included. \
*(b)* Let $e = {u, v}$. In $K_n - e$, $deg(u) = deg(v) = n - 2$, the other $n - 2$ vertices have degree $n - 1$, and the graph is connected. \
(i) *None.* $n - 2$ and $n - 1$ have different parities and both degrees occur (as $n >= 3$), so some vertex has odd degree #j[Theorem 10.2.2]. \
(ii) *$n$ is odd, or $n = 4$.* An Euler trail between two distinct vertices exists iff the graph is connected, exactly these two vertices have odd degree, and the others have positive even degree #j[Corollary 10.2.5]. If $n$ is odd, exactly $u$ and $v$ have odd degree $n - 2$: there is an Euler trail from $u$ to $v$ (for $n = 3$ the graph is a path with two edges). If $n$ is even, the odd vertices are the $n - 2$ others, and $n - 2 = 2$ only for $n = 4$ (degrees $3, 3, 2, 2$). \
(iii) *$n >= 4$.* $K_3 - e$ is a path with two edges and has no circuit at all. For $n >= 4$, list the vertices round a circle so that $u$ and $v$ are not neighbours; every two neighbours on the circle are adjacent in $K_n - e$, so this is a Hamiltonian circuit. \
*(c)* (i) *1014.* A full binary tree with $k$ internal vertices has $2k + 1$ vertices and $k + 1$ leaves #j[Theorem 10.6.1]: $2k + 1 = 2027$ gives $k = 1013$ and $1014$ leaves. \
(ii) *10.* A binary tree of height $h$ has at most $2^h$ leaves #j[Theorem 10.6.2], and $2^9 = 512 < 1014 <= 1024 = 2^10$, so $h >= 10$. Height 10 occurs: start with the full binary tree whose 512 leaves are all on level 9 and give two children to 502 of these leaves; this leaves $10 + 1004 = 1014$ leaves. \
(iii) *1013.* In a full binary tree of height $h$, each of the levels $1, ..., h$ has at least two vertices (a vertex on level $i$ has a parent, which has two children), so $1 + 2h <= 2027$ and $h <= 1013$. Height 1013 occurs when every internal vertex has a leaf as one of its children. \
*(d)* *Z Y X W V; height 4.* The first vertex of the pre-order, V, is the root. In the in-order nothing comes before V, so V has no left child, and its right subtree has pre-order and in-order both W X Y Z. Repeating the argument, the tree is the chain in which W is the right child of V, X of W, Y of X and Z of Y. Its post-order is the reverse, Z Y X W V, and its height is 4. (A binary tree need not be full, and a single child can be a right child.) \
*(e)* *R L A O G H T I M.* The root is R, the last vertex of the post-order. The in-order splits into A L G O (left subtree) and I T H M (right subtree), so the post-order splits into A G O L and I T M H. \
Left subtree: root L; the in-order A | L | G O gives the left child A and a right subtree on G, O with post-order G O, that is, root O with left child G. \
Right subtree: root H; the in-order I T | H | M gives a left subtree on I, T with post-order I T, that is, root T with left child I, and the right child M. \
Pre-order: R, then L A O G, then H T I M.
#align(center, gdraw(
  (([R], 2.2, 2.9), ([L], 1.1, 2.1), ([H], 3.3, 2.1), ([A], 0.5, 1.3), ([O], 1.7, 1.3), ([G], 1.3, 0.5), ([T], 2.9, 1.3), ([M], 3.9, 1.3), ([I], 2.5, 0.5)),
  ((0, 1), (0, 2), (1, 3), (1, 4), (4, 5), (2, 6), (2, 7), (6, 8)), w: 4.4cm, h: 3.3cm))
*(f)* (i) *10.* Kruskal's algorithm takes $a b$ and $d e$ (weight 1). Next come $a d$ and $b e$ (weight 2): both join the component ${a, b}$ to the component ${d, e}$, so exactly one of them is taken. Then come $b c$, $e f$ and $c f$ (weight 3), which join $c$ and $f$ to the rest: any two of them are taken and the third would close a circuit. The edges $a e$ (4) and $b f$ (5) are never taken. Weight $1 + 1 + 2 + 3 + 3 = 10$. \
(ii) *6.* There are 2 choices at weight 2 and $binom(3, 2) = 3$ choices at weight 3: $2 times 3 = 6$ minimum spanning trees. \
*(g)* (i) *$x < 3$.* If a minimum spanning tree $T$ did not contain $c f$, adding $c f$ to $T$ would close a circuit through $c$; that circuit uses the edge $b c$, the only other edge at $c$, of weight $3 > x$. Replacing $b c$ by $c f$ would give a lighter spanning tree, a contradiction. \
(ii) *$x > 3$.* Then $c f$ is the single heaviest edge of the circuit $b, c, f, e, b$ (weights $3, x, 3, 2$). If a spanning tree contains $c f$, removing $c f$ splits it into two parts, and one of the other three edges of the circuit joins the two parts again at a smaller weight. So no minimum spanning tree contains $c f$. \
For $x = 3$ the edge is in 4 of the 6 minimum spanning trees, so neither answer includes $x = 3$.]

#sol[26][][
*(a)* $(c, d) tilde.op (3, 1) <=> c + 1 = d + 3 <=> c = d + 2$. With $c <= 5$ and $d in NN$: *$(2, 0)$, $(3, 1)$, $(4, 2)$, $(5, 3)$*. The class is ${(d + 2, d) : d in NN}$; $(1, -1)$ is not in $NN times NN$. \
*(b)* A rule on classes is well defined iff the output is the same for every representative of a class. Note that $(a, b) tilde.op (c, d) <=> a - b = c - d$. \
(i) *Not well defined.* $(1, 0) tilde.op (2, 1)$ as $1 + 1 = 0 + 2$, but the rule gives $1 + 0 = 1$ and $2 + 1 = 3$. \
(ii) *Well defined.* $max(a, b) - min(a, b) = |a - b|$, and $a - b$ is the same for all representatives of a class. \
(iii) *Not well defined.* $(1, 0) tilde.op (2, 1)$, but the rule gives $[(1, 0)]$ and $[(4, 1)]$, and $(1, 0) tilde.not (4, 1)$ because $1 + 1 != 0 + 4$. \
*(c)* Proof.
+ ($F$ is well defined.) Let $(a, b), (c, d) in NN times NN$ with $[(a, b)] = [(c, d)]$.
  + Then $(a, b) tilde.op (c, d)$ #j[Lemma Rel.1].
  + So $a + d = b + c$ #j[definition of $simq$], and hence $a - b = c - d$ #j[basic algebra].
  + Also $a - b in ZZ$ #j[closure of $ZZ$ under subtraction].
  + So the value $a - b$ does not depend on the representative chosen, and it lies in the co-domain: $F$ is well defined.
+ ($F$ is injective.) Let $[(a, b)], [(c, d)] in Q$ with $F([(a, b)]) = F([(c, d)])$.
  + Then $a - b = c - d$ #j[definition of $F$], so $a + d = b + c$ #j[basic algebra].
  + So $(a, b) tilde.op (c, d)$ #j[definition of $simq$], and hence $[(a, b)] = [(c, d)]$ #j[Lemma Rel.1].
+ ($F$ is surjective.) Let $z in ZZ$.
  + Case 1: $z >= 0$. Then $(z, 0) in NN times NN$ and $F([(z, 0)]) = z - 0 = z$.
  + Case 2: $z < 0$. Then $-z in NN$, so $(0, -z) in NN times NN$, and $F([(0, -z)]) = 0 - (-z) = z$.
  + In both cases $z = F(X)$ for some $X in Q$.
+ Therefore $F$ is injective and surjective, that is, $F$ is a bijection. #qed
*(d)* The bijection $F$ of part (c) turns $H$ into $z |-> -z$, $S$ into $z |-> z + 1$ and $D$ into $z |-> 2z$ on $ZZ$, which explains every answer below. \
(i) *Injective, not surjective.* If $D([(a, b)]) = D([(c, d)])$ then $2a + 2d = 2b + 2c$, so $a + d = b + c$ and $[(a, b)] = [(c, d)]$. The class $[(1, 0)]$ is not a value of $D$: $(2a, 2b) tilde.op (1, 0)$ would need $2a = 2b + 1$, an even number equal to an odd number. \
(ii) *$S^(-1)([(a, b)]) = [(a, b + 1)]$.* Check: $S([(a, b + 1)]) = [(a + 1, b + 1)] = [(a, b)]$, as $(a + 1) + b = (b + 1) + a$. The tempting answer $[(a - 1, b)]$ is not valid for $a = 0$, since $(-1, b) in.not NN times NN$. \
(iii) *The order of $H$ is 2:* $H(H([(a, b)])) = [(a, b)]$ for every class, and $H != idf_Q$ because $H([(1, 0)]) = [(0, 1)] != [(1, 0)]$. \
*The order of $H compose S$ is 2:* $(H compose S)([(a, b)]) = H([(a + 1, b)]) = [(b, a + 1)]$, and applying $H compose S$ again gives $[(a + 1, b + 1)] = [(a, b)]$; also $H compose S != idf_Q$, since it sends $[(0, 0)]$ to $[(0, 1)]$. \
*$S$ has no order:* for every $n in ZZ^+$, $n$ applications of $S$ send $[(a, b)]$ to $[(a + n, b)] != [(a, b)]$, so no composition of $S$ with itself is $idf_Q$. A composition of a bijection of order 2 with a bijection of no order can have order 2.]
