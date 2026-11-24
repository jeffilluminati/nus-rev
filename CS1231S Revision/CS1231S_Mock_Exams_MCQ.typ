#import "exam_style.typ": *
#show: setup.with(doc-title: "CS1231S Mock Exams MCQ", running: [CS1231S · Mock Exams 1 to 3 · MCQ])
#let accent = black
#let muted = luma(90)
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
#let pairopts = opts(
  [Both (i) and (ii) are false.],
  [(i) is true and (ii) is false.],
  [(i) is false and (ii) is true.],
  [Both (i) and (ii) are true.],
)
#let none5 = [None of these.]
#let all3 = [All of (i), (ii) and (iii).]
#let pleqa = $scripts(pleq)_1$
#let pleqb = $scripts(pleq)_2$

#text(size: 18pt, weight: "bold")[CS1231S · Mock Exams 1 to 3: Multiple Choice Questions]
#v(2pt)
Three papers of 23 questions each, 2 marks per question. Each question has exactly one correct option. Question numbers restart in each paper. The answer key is at the back.

#show heading.where(level: 1): it => block(above: 1em, below: 0.6em, sticky: true, text(size: 14pt, weight: "bold", it.body))

= Mock Exam 1

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

#pagebreak()

= Mock Exam 2

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

#pagebreak()

= Mock Exam 3

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
Which of the following, once it has been carried out correctly, is enough to establish the statement?
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
= Answer Key

#text(weight: "bold")[Mock Exam 1]

#table(columns: (auto,) + (1fr,) * 12, align: center,
  [*Question*], [1], [2], [3], [4], [5], [6], [7], [8], [9], [10], [11], [12],
  [*Answer*], [C], [D], [E], [B], [A], [B], [D], [A], [C], [D], [A], [E],
  [*Question*], [13], [14], [15], [16], [17], [18], [19], [20], [21], [22], [23], [],
  [*Answer*], [B], [C], [B], [A], [C], [D], [C], [E], [D], [B], [A], [],
)

#text(weight: "bold")[Mock Exam 2]

#table(columns: (auto,) + (1fr,) * 12, align: center,
  [*Question*], [1], [2], [3], [4], [5], [6], [7], [8], [9], [10], [11], [12],
  [*Answer*], [D], [C], [E], [B], [A], [C], [B], [B], [A], [D], [C], [E],
  [*Question*], [13], [14], [15], [16], [17], [18], [19], [20], [21], [22], [23], [],
  [*Answer*], [B], [C], [C], [B], [A], [D], [E], [A], [D], [E], [B], [],
)

#text(weight: "bold")[Mock Exam 3]

#table(columns: (auto,) + (1fr,) * 12, align: center,
  [*Question*], [1], [2], [3], [4], [5], [6], [7], [8], [9], [10], [11], [12],
  [*Answer*], [C], [A], [E], [B], [D], [C], [A], [D], [B], [E], [D], [C],
  [*Question*], [13], [14], [15], [16], [17], [18], [19], [20], [21], [22], [23], [],
  [*Answer*], [B], [A], [D], [B], [A], [C], [E], [D], [A], [E], [B], [],
)
