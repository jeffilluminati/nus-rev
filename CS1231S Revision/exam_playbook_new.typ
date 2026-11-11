#import "exam_style.typ": *

// Playbook material for Lectures 7–13. Each piece is placed by the Exam Condensed
// and by its addendum under the same section number.

#let exam-approach = [
#tip[Final exam format and approach (AY25/26 paper)][
*Format:* 2 hours, open book, calculators allowed, 100 marks. Part A: 23 MCQ at 2 marks each (46). Part B: three structured questions (54), recently Counting and Probability, Graphs and Trees, and Functions; many parts need the answer only, "as a single number".
- *Coverage is the whole module.* Roughly the first third of Part A is logic, sets and relations (§1–25); the rest is functions, induction and recursion, cardinality, counting, graphs and trees (§26–52).
- *New definitions in the question* (matchings, dominating sets, order of a function, left inverses) are routine: copy the definition onto scratch paper and test it on the smallest example.
- *Counting answers:* decide ordered or unordered, repetition or not (table in §56), then check the formula on a case small enough to list.
- *"Single number" answers* get no method marks: recompute by a second route (difference rule against direct cases).
- *Proof parts:* use the class format for induction (§32), the injective/surjective templates (§28), and name the theorem used at each step.]
]

#let formula-sheet = [
#block(breakable: false, grid(columns: (1fr, 1fr), gutter: 12pt,
  [
    #table(columns: (1fr, auto),
      [Counting], [Value],
      [integers from $m$ to $n$], $n - m + 1$,
      [ordered, repetition allowed], $n^k$,
      [ordered, no repetition], $P(n, k) = n! slash (n - k)!$,
      [unordered, no repetition], $binom(n, k) = n! slash (k! (n - k)!)$,
      [unordered, repetition allowed], $binom(k + n - 1, k)$,
      [orderings with repeated types], $n! slash (n_1 ! dots.c n_k !)$,
      [circular arrangements of $n$], $(n - 1)!$,
      [$x_1 + dots.c + x_n = r$, $x_i >= 0$], $binom(r + n - 1, r)$,
      [same, $x_i >= 1$], $binom(r - 1, n - 1)$,
      [functions $A -> B$, $|A| = m$, $|B| = n$], $n^m$,
      [injections; bijections ($m = n$)], [$P(n, m)$; $n!$],
      [subsets of an $n$-set], $2^n$,
      [pigeons: some hole has at least], $ceil(n slash m)$,
    )
    #table(columns: (1fr, auto),
      [Sums], [Closed form],
      $1 + 2 + dots.c + n$, $n(n+1) slash 2$,
      $1^2 + 2^2 + dots.c + n^2$, $n(n+1)(2n+1) slash 6$,
      [$sum_(i=0)^n r^i$ ($r != 1$)], $(r^(n+1) - 1) slash (r - 1)$,
      $sum_(k=0)^n binom(n, k) a^(n-k) b^k$, $(a + b)^n$,
      $sum_(k=0)^n binom(n, k)$, $2^n$,
    )
  ],
  [
    #table(columns: (1fr, auto),
      [Probability], [Formula],
      [equally likely outcomes], $P(E) = |E| slash |S|$,
      [complement], $P(overline(A)) = 1 - P(A)$,
      [union], $P(A) + P(B) - P(A inter B)$,
      [conditional], $P(B | A) = P(A inter B) slash P(A)$,
      [independent], $P(A inter B) = P(A) P(B)$,
      [expected value], $sum a_k p_k$,
      [linearity], $E[X + Y] = E[X] + E[Y]$,
      [binomial], $binom(n, k) p^k (1 - p)^(n-k)$,
    )
    #table(columns: (1fr, auto),
      [Graphs and trees], [Fact],
      [total degree], $2 |E|$,
      [edges of $K_n$; of $K_(m,n)$], [$n(n-1) slash 2$; $m n$],
      [simple graphs on $n$ labelled vertices], $2^(n(n-1) slash 2)$,
      [Euler circuit], [connected, all degrees even],
      [Euler trail $v$ to $w$], [connected, only $v, w$ odd],
      [walks of length $n$ from $v_i$ to $v_j$], [entry $i j$ of $A^n$],
      [connected planar], $f = e - v + 2$,
      [tree on $n$ vertices], [$n - 1$ edges, at least 2 leaves],
      [full binary tree, $k$ internal], [$2k + 1$ vertices, $k + 1$ leaves],
      [binary tree of height $h$], [at most $2^h$ leaves],
      [labelled trees on $n$ vertices], $n^(n-2)$,
    )
  ]))
#text(size: 8.6pt)[*Function properties under composition (§29).* $f, g$ injective $=>$ $g compose f$ injective; $f, g$ surjective $=>$ $g compose f$ surjective; $g compose f$ injective $=>$ $f$ injective; $g compose f$ surjective $=>$ $g$ surjective; $(g compose f)^(-1) = f^(-1) compose g^(-1)$. *Finite sets (§35):* injection $A -> B$ gives $|A| <= |B|$; surjection gives $|A| >= |B|$; bijection gives $|A| = |B|$. For $|A| = |B|$ finite, injective $<=>$ surjective $<=>$ bijective.]
]

#let locator-new = [
#table(columns: (auto, 1fr, auto), align: (left, left, left),
  [Tutorial question], [Topic], [Solved in],
  [T6 D1, D3, D4; Q1, Q2], [Is it a function; equality; a wrong proof; images and preimages], [§26, §27, §29, §26],
  [T6 Q3, Q6], [Inverse of a composition; $g compose f$ injective], [§29],
  [T6 Q4, Q5], [Classify four functions; left and right inverses], [§28],
  [T6 Q7, Q8; T8 Q10(c)], [Order of a bijection and of an input], [§29],
  [T6 Q9, Q10; T8 Q10(a), (b)], [$f^(-1)(f(X))$; well-defined operations on a quotient], [§26, §30],
  [T7 Q1, D2, D3], [Mistakes in induction proofs], [§32],
  [T7 Q2, Q3, Q4], [Sum of squares; Bernoulli; divisibility by $2^(n+2)$], [§32],
  [T7 Q5, Q6, Q7], [\$3 and \$5 notes; sums of powers of 2; three-term recurrence], [§33],
  [T7 Q8, Q9; T8 Q9], [Fibonacci identities; Tower of Hanoi], [§33],
  [T7 Q10, Q11], [Membership of recursively defined sets], [§34],
  [T8 D1, D2, D3; Q1], [Countable or not; bijection $NN -> ZZ$], [§37, §38],
  [T8 Q2, Q3, Q4, Q5], [Unions of countable sets; limits of induction], [§37],
  [T8 Q6, Q7, Q8], [$X union Y -> X$; $PP(A)$ uncountable; $|A| <= |R|$], [§38, §38, §35],
  [T9 D1, D4; Q1, Q2, Q5], [Replacement; birthdays; cards; cheque numbers; round tables], [§45, §45, §39],
  [T9 Q3, Q4, Q6, Q7], [Inclusion/exclusion; consecutive boxes; committees; investments], [§40, §42],
  [T9 Q8, Q9; T10 Q10, Q12], [Pigeonhole arguments], [§41],
  [T10 D1, Q3, Q4; Q5, Q6], [Expected value; Bayes; random relations], [§44, §45],
  [T10 D2, D3, Q1, Q2], [Counting functions; binomial term; choosing block ends], [§43, §42],
  [T10 Q7, Q8; T11 D1, D2], [Friendship graph; small graphs; edge counts], [§47, §46],
  [T11 Q1, Q3, Q4–Q7], [Self-complementary graphs; trees; edge bounds; stones], [§49, §50],
  [T11 D3, Q8, Q9], [Traversals and rebuilding binary trees], [§51],
)
#table(columns: (auto, 1fr), align: (left, left),
  [AY25/26 final question], [Solved in],
  [Q9; Q10; Q11, Q12, Q26(b)], [§47; §43; §29],
  [Q13, Q17, Q18; Q14–Q16], [§38; §34],
  [Q19, Q21, Q22; Q23], [§51; §44],
  [Q24(a)–(e), (g); Q24(f); Q24(h)], [§42; §41; §45],
  [Q25(a); Q25(b)–(d)], [§49; §47],
)
#text(size: 8.4pt, fill: muted)[The folder has no official answers for the AY25/26 final; those solutions are worked here.]
]

#let selftest-new = [
#text(size: 8.4pt, fill: muted)[Decide each statement before reading the reason.]
#table(columns: (1fr, auto, 1.15fr),
  [Statement], [], [Reason],
  [$f^(-1)(B)$ is defined only when $f$ is a bijection], [*F*], [the setwise preimage exists for every function (§26)],
  [$f: ZZ -> ZZ$, $f(x) = 3x + 1$ is a bijection], [*F*], [injective, but 0 has no preimage],
  [$g compose f$ injective $=>$ $g$ injective], [*F*], [only $f$ must be injective (§29)],
  [the composition of two bijections is a bijection], [*T*], [Theorems 7.3.3 and 7.3.4],
  [$f: ZZ -> ZZ$ and $g: ZZ -> QQ$ with the same formula are equal], [*F*], [different co-domains (Theorem 7.1.1)],
  [$X = f^(-1)(f(X))$ for every $X subset.eq A$], [*F*], [only $subset.eq$; equality needs injectivity],
  [$[x]_3 |-> [x]_2$ is a function $ZZ_3 -> ZZ_2$], [*F*], [$[0]_3 = [3]_3$ but $[0]_2 != [3]_2$],
  [$2n + 1 < 2^n$ for all $n >= 1$], [*F*], [fails at $n = 1, 2$; true from $n = 3$],
  [strong induction proves more statements than weak induction], [*F*], [1PI, 2PI and WOP are equivalent],
  [every non-empty subset of $ZZ$ has a least element], [*F*], [WOP is about $ZZ_(>= 0)$; take $ZZ^-$],
  [an empty sum is 0 and an empty product is 1], [*T*], [conventions (§31)],
  [$|ZZ| = |2 ZZ|$], [*T*], [$n |-> 2n$ is a bijection],
  [every infinite subset of $RR$ is uncountable], [*F*], [$ZZ$, $QQ$],
  [every subset of $QQ$ is countable], [*T*], [Theorem 7.4.3],
  [a countable union of finite sets can be infinite], [*T*], [$union.big {i} = ZZ^+$; still countable],
  [$PP(NN)$ is countable], [*F*], [diagonal argument (§38)],
  [$P(n, r) = binom(n, r) dot r!$], [*T*], [choose a subset, then order it],
  [the number of multisets of size 3 from 4 elements is $binom(4, 3)$], [*F*], [$binom(6, 3) = 20$],
  [$binom(n, r) = binom(n, n - r)$], [*T*], [choose which to leave out],
  [disjoint events are independent], [*F*], [if both have positive probability they are dependent],
  [$E[X + Y] = E[X] + E[Y]$ needs independence], [*F*], [linearity always holds],
  [$P(A | B) = P(B | A)$], [*F*], [equal only if $P(A) = P(B)$ or $P(A inter B) = 0$],
  [a graph can have exactly three vertices of odd degree], [*F*], [Proposition 10.1.3],
  [all degrees even $=>$ the graph has an Euler circuit], [*F*], [it must also be connected],
  [every Eulerian graph is Hamiltonian], [*F*], [friendship graph $F_2$],
  [a graph with $n$ vertices and $n - 1$ edges is a tree], [*F*], [only if connected (Theorem 10.5.4)],
  [$K_(3,3)$ is planar], [*F*], [Kuratowski; $K_5$ is not planar either],
  [equal degree lists $=>$ isomorphic], [*F*], [$C_6$ and two disjoint triangles],
  [pre-order and post-order determine a binary tree], [*F*], [a one-child vertex is ambiguous (§51)],
  [a full binary tree has an odd number of vertices], [*T*], [$2k + 1$],
  [all spanning trees of a graph have the same number of edges], [*T*], [Proposition 10.7.1],
)
]

#let symbols-new = [
#table(columns: (auto, 1fr, auto, 1fr, auto, 1fr), align: (center, left, center, left, center, left),
  [Symbol], [Read as], [Symbol], [Read as], [Symbol], [Read as],
  $f: X -> Y$, [function from $X$ to $Y$], $x |-> y$, [$x$ maps to $y$], $f(A)$, [setwise image],
  $f^(-1)(B)$, [setwise preimage], $f^(-1)$, [inverse function], $g compose f$, [$f$ then $g$],
  $idf_X$, [identity on $X$], $A^*$, [strings over $A$], $epsilon$, [empty string],
  $ZZ_n$, [$ZZ$ mod $n$ (L7); ${1, dots, n}$ (L9)], $floor(x), ceil(x)$, [floor, ceiling], $n!$, [$n$ factorial],
  $sum_(k=m)^n a_k$, [sum of $a_m, dots, a_n$], $product_(k=m)^n a_k$, [product], $F_n$, [Fibonacci number],
  $aleph_0$, [$|ZZ^+|$, aleph-zero], $|A| = |B|$, [same cardinality], $P(n, r)$, [$r$-permutations],
  $binom(n, r)$, [$n$ choose $r$], $P(E)$, [probability of $E$], $P(B | A)$, [$B$ given $A$],
  $E[X]$, [expected value], $G = (V, E)$, [graph], $deg(v)$, [degree],
  $deg^(-)(v), deg^(+)(v)$, [indegree, outdegree], $K_n$, [complete graph], $K_(m,n)$, [complete bipartite graph],
  $overline(G)$, [complement graph], $G tilde.equiv G'$, [isomorphic], $A^n$, [$n$-th matrix power],
  $w(e), w(G)$, [edge weight, total weight], $C_n$, [cycle graph], $I_n$, [identity matrix],
)
]

#let new-theorem-rows = (
  [Theorem 7.1.1], [Function equality], [L7 s22], [§27],
  [Proposition (unnumbered); Theorem 7.2.3], [Unique inverse; bijective iff invertible], [L7 s34–36], [§28],
  [Theorems 7.3.1, 7.3.2], [Composition with identity; with the inverse], [L7 s44, 46], [§29],
  [Theorem (unnumbered); Theorems 7.3.3, 7.3.4], [Associativity; composing injections, surjections], [L7 s47, 50, 52], [§29],
  [Propositions (unnumbered)], [$+$ and $dot$ on $ZZ_n$ are well defined], [L7 s57–58], [§30],
  [Theorem 5.1.1], [Properties of sums and products], [L8 s14], [§31],
  [Theorem 5.2.2; Theorem 5.2.3], [Sum of first $n$ integers; geometric sum], [L8 s26, 28], [§32],
  [Proposition 5.3.1; Proposition 5.3.2], [$3 dv (2^(2n) - 1)$; $2n + 1 < 2^n$], [L8 s29–30], [§32],
  [Well-Ordering Principle], [Non-empty subsets of $ZZ_(>= 0)$ have a least element], [L8 s43–44], [§33],
  [Pigeonhole; Dual Pigeonhole], [Injections and surjections between finite sets], [L9 s6–8], [§35],
  [Theorem Cardinality.1], [Subsets of finite sets are finite], [L9 s11], [§35],
  [Theorem 7.4.1], [Same cardinality is an equivalence relation], [L9 s14–16], [§36],
  [Proposition 9.1; Lemma 9.2], [Countability via sequences], [L9 s33–34], [§37],
  [Theorem 7.4.2], [$(0, 1)$ is uncountable], [L9 s38–40], [§38],
  [Theorem 7.4.3; Corollary 7.4.4], [Subsets of countable sets; uncountable subsets], [L9 s41–43], [§37],
  [Proposition 9.3; Lemma 9.4], [Countably infinite subset; union of two], [L9 s44–45], [§37],
  [Theorem 9.1.1; Theorem 9.2.1], [Elements of a list; multiplication rule], [L10 s12, 21], [§39],
  [Theorem 9.2.2; Theorem 9.2.3], [Permutations; $r$-permutations], [L10 s34, 37], [§39],
  [Theorems 9.3.1, 9.3.2, 9.3.3], [Addition, difference, inclusion/exclusion], [L10 s40, 43, 50], [§40],
  [Generalized Pigeonhole Principle], [Some value has at least $k + 1$ preimages], [L10 s62, 65], [§41],
  [Theorem 9.5.1; Theorem 9.5.2], [Formula for $binom(n, r)$; repeated objects], [L11 s10, 15], [§42],
  [Theorem 9.6.1], [Multisets], [L11 s21], [§42],
  [Theorem 9.7.1; Theorem 9.7.2], [Pascal's formula; binomial theorem], [L11 s26, 34], [§43],
  [Theorem 9.9.1], [Bayes' theorem], [L11 s66], [§45],
  [Theorem 10.1.1; Corollary 10.1.2; Proposition 10.1.3], [Handshake theorem and consequences], [L12 s25], [§46],
  [Lemma 10.2.1], [Paths, circuits and connectedness], [L12 s37], [§47],
  [Theorems 10.2.2–10.2.4; Corollary 10.2.5], [Euler circuits and trails], [L12 s41–43], [§47],
  [Proposition 10.2.6], [Necessary conditions for a Hamiltonian circuit], [L12 s52], [§47],
  [Theorem 10.3.2], [Powers of the adjacency matrix count walks], [L12 s74], [§48],
  [Theorem 10.4.1; Kuratowski; Euler's formula], [Isomorphism; planarity], [L12 s81, 83, 86], [§49],
  [Lemma 10.5.1; Theorem 10.5.2], [Leaves; a tree has $n - 1$ edges], [L13 s7, 10], [§50],
  [Lemma 10.5.3; Theorem 10.5.4; Lemma 10.5.5], [Removing a circuit edge; converse; two paths], [L13 s14–15; T11], [§50],
  [Theorem 10.6.1; Theorem 10.6.2], [Full binary trees; leaves and height], [L13 s27, 29], [§51],
  [Proposition 10.7.1; Algorithms 10.7.1, 10.7.2], [Spanning trees; Kruskal; Prim], [L13 s45, 50, 55], [§52],
)
