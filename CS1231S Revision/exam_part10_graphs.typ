#import "exam_style.typ": *

// ============================================================================
= Part X · Graphs and Trees
// ============================================================================

== 46 · Graphs, special graphs, degree

#defn[Undirected graph (L12 s7) · Directed graph (L12 s8)][
An *undirected graph* $G = (V, E)$ consists of two finite sets: a non-empty set $V$ of *vertices* and a set $E$ of *edges*, where each edge is associated with a set of one or two vertices called its *endpoints*. Write $e = {v, w}$. \
An edge *connects* its endpoints and is *incident on* each of them; vertices joined by an edge are *adjacent*; an edge with a single endpoint is a *loop* (its vertex is adjacent to itself); edges with the same endpoints are *parallel*; edges sharing an endpoint are *adjacent edges*. \
A *directed graph* (digraph) has directed edges, each associated with an *ordered pair* of vertices: $e = (v, w)$ goes from $v$ to $w$.]

#defn[Simple graph (L12 s19) · Complete graph $K_n$ (L12 s20) · Bipartite, $K_(m,n)$ (L12 s21) · Subgraph (L12 s22)][
- A *simple graph* is an undirected graph with no loops and no parallel edges.
- The *complete graph* $K_n$ ($n > 0$) is the simple graph on $n$ vertices with exactly one edge between each pair of distinct vertices. It has $binom(n, 2) = n(n-1) slash 2$ edges.
- A *bipartite graph* is a simple graph whose vertices can be divided into two disjoint sets $U$ and $V$ such that every edge connects a vertex in $U$ to one in $V$. In the *complete bipartite graph* $K_(m,n)$, with $|U| = m$ and $|V| = n$, every vertex of $U$ is joined to every vertex of $V$; it has $m n$ edges.
- $H$ is a *subgraph* of $G$ iff every vertex of $H$ is a vertex of $G$, every edge of $H$ is an edge of $G$, and every edge of $H$ has the same endpoints as in $G$.]

#defn[Degree, total degree (L12 s23) · Indegree, outdegree (L12 s26) · Complement, self-complementary, triangle (T10)][
The *degree* $deg(v)$ is the number of edges incident on $v$, *with a loop counted twice*. The *total degree* of $G$ is the sum of the degrees of all its vertices. \
In a digraph, the *indegree* $deg^(-)(v)$ is the number of edges ending at $v$ and the *outdegree* $deg^(+)(v)$ the number starting at $v$; $sum_(v in V) deg^(-)(v) = sum_(v in V) deg^(+)(v) = |E|$. \
The *complement* $overline(G)$ of a simple graph $G$ has the same vertices; distinct $v, w$ are adjacent in $overline(G)$ iff they are not adjacent in $G$. $G$ is *self-complementary* iff $G tilde.equiv overline(G)$. A *triangle* is a simple circuit of length 3. \
A *vertex colouring* assigns colours to vertices so that adjacent vertices get different colours (L12 s13).]

#thm[Theorem 10.1.1 Handshake theorem · Corollary 10.1.2 · Proposition 10.1.3 (L12 s25)][
- For any graph $G$ with vertices $v_1, dots, v_n$: $quad deg(v_1) + deg(v_2) + dots.c + deg(v_n) = 2 dot |E|$.
- The total degree of a graph is even.
- In any graph there is an even number of vertices of odd degree.]

#proofb[Handshake theorem · Proposition 10.1.3][
+ Let $e$ be an edge of $G$ with endpoints $v_i$ and $v_j$. If $i != j$, then $e$ contributes 1 to $deg(v_i)$ and 1 to $deg(v_j)$; if $i = j$ (a loop), it contributes 2 to $deg(v_i)$ #j[definition of degree].
+ So every edge contributes exactly 2 to the total degree, which is therefore $2 |E|$. #qed
*Proposition 10.1.3.* The total degree $T$ is even. Let $E$ be the sum of the even degrees and $O$ the sum of the odd degrees, so $O = T - E$ is even #j[difference of even integers]. A sum of odd integers is even only if the number of terms is even. #qed]

#example[Degree arguments · T11 D1, D2 · T10 Q8][
- *No graph has degrees $1, 1, 2, 3$:* the total would be 7, which is odd.
- *No simple graph has degrees $1, 1, 3, 3$ on 4 vertices:* each vertex of degree 3 is adjacent to all three others, so every other vertex has degree at least 2.
- *T11 D1.* A connected simple graph on $n$ vertices has between $n - 1$ edges (a tree) and $n(n-1) slash 2$ edges ($K_n$).
- *T11 D2.* Simple graphs on $n$ labelled vertices: each of the $binom(n, 2)$ possible edges is present or absent, so $2^(n(n-1) slash 2)$; for $n = 3$ there are 8 (in 4 isomorphism classes).
- *T10 Q8.* Non-isomorphic undirected graphs with two vertices and two edges: *4* (two parallel edges; one edge and one loop; two loops at one vertex; one loop at each vertex). The question does not say "simple".
- *$K_n$ and $K_(m,n)$:* every vertex of $K_n$ has degree $n - 1$; in $K_(m,n)$ the degrees are $n$ (in $U$) and $m$ (in $V$). Check: $n(n-1) = 2 dot binom(n, 2)$ and $m n + n m = 2 m n$.]

== 47 · Walks, connectedness, Euler and Hamiltonian circuits

#defn[Walk, trail, path, closed walk, circuit, simple circuit (L12 s32–33)][
A *walk* from $v$ to $w$ is a finite alternating sequence $v_0 e_1 v_1 e_2 dots.c v_(n-1) e_n v_n$ of adjacent vertices and edges with $v_0 = v$, $v_n = w$, and $v_(i-1), v_i$ the endpoints of $e_i$. Its *length* is $n$, the number of edges. The *trivial walk* from $v$ to $v$ is the single vertex $v$.
#table(columns: (auto, auto, auto, auto, 1fr),
  [], [Repeated edge?], [Repeated vertex?], [Closed?], [Notes],
  [Walk], [allowed], [allowed], [allowed], [],
  [Trail], [no], [allowed], [allowed], [a walk with no repeated edge],
  [Path], [no], [no], [no], [a trail with no repeated vertex],
  [Closed walk], [allowed], [allowed], [yes], [],
  [Circuit (cycle)], [no], [allowed], [yes], [closed walk of length at least 3, no repeated edge],
  [Simple circuit], [no], [first and last only], [yes], [],
)
An undirected graph is *cyclic* if it contains a loop or a cycle; otherwise it is *acyclic*. (Other books say "path" for trail and "cycle" for simple circuit; the course follows Epp.)]

#defn[Connected (L12 s35) · Connected component (L12 s38)][
Vertices $v$ and $w$ are *connected* iff there is a walk from $v$ to $w$. $G$ is *connected* iff $forall v, w in V$ there is a walk from $v$ to $w$. \
$H$ is a *connected component* of $G$ iff (1) $H$ is a subgraph of $G$, (2) $H$ is connected, and (3) no connected subgraph of $G$ has $H$ as a subgraph and contains vertices or edges not in $H$. A connected component is a connected subgraph of largest possible size.]

#thm[Lemma 10.2.1 (L12 s37)][
Let $G$ be a graph.
- (a) If $G$ is connected, then any two distinct vertices of $G$ can be connected by a *path*.
- (b) If $v$ and $w$ are part of a circuit and one edge is removed from the circuit, there is still a trail from $v$ to $w$.
- (c) If $G$ is connected and contains a circuit, then an edge of the circuit can be removed without disconnecting $G$.]

#defn[Euler circuit, Eulerian graph (L12 s41) · Euler trail (L12 s43) · Hamiltonian circuit, Hamiltonian graph (L12 s49)][
An *Euler circuit* for $G$ is a circuit that contains every vertex and traverses *every edge exactly once*; a graph with one is *Eulerian*. \
An *Euler trail* from $v$ to $w$ ($v != w$) starts at $v$, ends at $w$, passes through every vertex at least once and traverses every edge exactly once. \
A *Hamiltonian circuit* for $G$ is a simple circuit that includes *every vertex* (each exactly once, except that the first and last are the same); a graph with one is *Hamiltonian*.]

#thm[Theorems 10.2.2–10.2.4 · Corollary 10.2.5 · Proposition 10.2.6 (L12 s41–43, s52)][
- *10.2.2.* If a graph has an Euler circuit, then every vertex has positive even degree. (Contrapositive: an odd-degree vertex rules out an Euler circuit.)
- *10.2.3.* If $G$ is connected and every vertex has positive even degree, then $G$ has an Euler circuit.
- *10.2.4.* $G$ has an Euler circuit *iff* $G$ is connected and every vertex has positive even degree.
- *10.2.5.* There is an Euler trail from $v$ to $w$ iff $G$ is connected, $v$ and $w$ have odd degree, and every other vertex has positive even degree.
- *10.2.6.* If $G$ has a Hamiltonian circuit, then $G$ has a subgraph $H$ that (1) contains every vertex of $G$, (2) is connected, (3) has as many edges as vertices, and (4) has every vertex of degree 2.
There is no simple criterion for Hamiltonian circuits. To show none exists, use the contrapositive of 10.2.6.]

#proofb[Theorem 10.2.2 · An Euler circuit forces every degree to be positive and even][
+ Let $C$ be an Euler circuit of $G$ and $v$ any vertex. $C$ contains $v$, so $deg(v) > 0$.
+ Follow $C$ once around. Each time it passes through $v$ it arrives on one edge and leaves on another, using two edge-ends at $v$; if $v$ is the starting vertex, the first departure pairs with the final arrival.
+ $C$ uses every edge exactly once, so the edge-ends at $v$ are split into pairs. Hence $deg(v)$ is even. #qed]

#grid(columns: (1fr, auto), gutter: 14pt,
example[Euler and Hamilton · Königsberg · T10 Q7 · AY25 final Q25(b)–(d)][
- *Königsberg* (4 land masses, 7 bridges): degrees $5, 3, 3, 3$. No Euler circuit; no Euler trail either, since four vertices are odd.
- "Every vertex has positive even degree" alone is not enough: two disjoint triangles are not connected.
- *$K_n$* ($n >= 3$) is Hamiltonian; it is Eulerian iff $n$ is odd.
- *$K_(m,n)$* ($m, n >= 2$) is Eulerian iff $m$ and $n$ are both even; it is Hamiltonian iff $m = n$ (a circuit alternates between the two sides).
- *Cycle graph $C_n$* is bipartite iff $n$ is even: $C_12$ and $C_8888$ are; $C_57$, $C_123$, $C_1231$, $C_12345$ are not.
- *Friendship graph $F_n$* ($n$ triangles sharing a centre, T10 Q7): Eulerian, since the degrees are $2$ and $2n$. Not Hamiltonian for $n >= 2$: passing from one triangle to another repeats the centre.],
align(center + horizon, stack(spacing: 6pt,
  gdraw((([], 1, 1.85), ([], 0.14, 1.23), ([], 0.47, 0.22), ([], 1.53, 0.22), ([], 1.86, 1.23)),
    ((0,1),(0,2),(0,3),(0,4),(1,2),(1,3),(1,4),(2,3),(2,4),(3,4)), w: 2cm, h: 2cm, r: 2.6pt),
  text(size: 7.5pt, fill: muted)[$K_5$],
  gdraw((([], 0.3, 1.3), ([], 1, 1.3), ([], 1.7, 1.3), ([], 0.3, 0.2), ([], 1, 0.2), ([], 1.7, 0.2)),
    ((0,3),(0,4),(0,5),(1,3),(1,4),(1,5),(2,3),(2,4),(2,5)), w: 2cm, h: 1.5cm, r: 2.6pt),
  text(size: 7.5pt, fill: muted)[$K_(3,3)$],
)))

#exam[AY25 final Q9 · Relations from walks][
On the vertex set of a graph let $x R y$ iff there is a walk from $x$ to $y$. \
*Undirected:* $R$ is an equivalence relation (reflexive by the trivial walk; symmetric by reversing a walk; transitive by joining walks). Its classes are the vertex sets of the connected components. \
*Directed:* $R$ need not be a partial order. Even with no pair of opposite edges, the directed cycle $a -> b -> c -> a$ gives $a R b$ and $b R a$ with $a != b$, so antisymmetry fails. Only (i) is true.]

== 48 · Adjacency matrices and counting walks

#defn[Adjacency matrix (L12 s61–62) · Matrix product (L12 s64) · Identity, powers (L12 s69–70)][
For a graph $G$ with ordered vertices $v_1, dots, v_n$, the *adjacency matrix* is the $n times n$ matrix $A = (a_(i j))$ over the non-negative integers with
- *directed:* $a_(i j)$ = the number of arrows from $v_i$ to $v_j$;
- *undirected:* $a_(i j)$ = the number of edges connecting $v_i$ and $v_j$.
The matrix of an undirected graph is *symmetric*: $a_(i j) = a_(j i)$. \
For an $m times k$ matrix $A$ and a $k times n$ matrix $B$, the *product* $A B = (c_(i j))$ has $c_(i j) = sum_(r=1)^k a_(i r) b_(r j)$ (row $i$ of $A$ times column $j$ of $B$). Matrix multiplication is associative but *not commutative*. \
$I_n$ is the $n times n$ *identity matrix* (1 on the main diagonal, 0 elsewhere). *Powers:* $A^0 = I$ and $A^n = A A^(n-1)$ for $n >= 1$.]

#thm[Theorem 10.3.2 · Counting walks (L12 s74)][
If $A$ is the adjacency matrix of a graph with vertices $v_1, dots, v_m$, then for every positive integer $n$ and all $i, j$:
$ "the" i j"-th entry of" A^n = "the number of walks of length" n "from" v_i "to" v_j. $]

#example[L12 s72–73 · Walks of length 2][
$G$ has vertices $v_1, v_2, v_3$ and edges $e_1 = {v_1, v_2}$, a loop $e_2$ at $v_2$, and parallel edges $e_3, e_4 = {v_2, v_3}$.
$ A = mat(0, 1, 0; 1, 1, 2; 0, 2, 0), wide A^2 = mat(1, 1, 2; 1, 6, 2; 2, 2, 4). $
Entry $(2, 2)$ of $A^2$ is $1 dot 1 + 1 dot 1 + 2 dot 2 = 6$: one walk via $v_1$ ($v_2 e_1 v_1 e_1 v_2$), one via the loop ($v_2 e_2 v_2 e_2 v_2$), and four via $v_3$ (choose $e_3$ or $e_4$ each way). A walk may repeat edges, and different parallel edges give different walks. \
*Reading a matrix:* a non-zero diagonal entry is a loop; an entry greater than 1 means parallel edges; in a simple graph the row sum of $v_i$ is $deg(v_i)$, and the diagonal of $A^2$ lists the degrees.]

== 49 · Isomorphism and planar graphs

#defn[Isomorphic graphs (L12 s79)][
$G = (V_G, E_G)$ is *isomorphic* to $G' = (V_(G'), E_(G'))$, written $G tilde.equiv G'$, iff there are bijections $g: V_G -> V_(G')$ and $h: E_G -> E_(G')$ that preserve the edge-endpoint functions: for all $v in V_G$ and $e in E_G$,
$ v "is an endpoint of" e <=> g(v) "is an endpoint of" h(e). $
*For simple graphs:* $G tilde.equiv G'$ iff there is a bijection $pi: V_G -> V_(G')$ such that ${u, v} in E_G <=> {pi(u), pi(v)} in E_(G')$.]

#thm[Theorem 10.4.1 (L12 s81) · Invariants][
Graph isomorphism is an equivalence relation on any set of graphs. (Reflexive: identity maps. Symmetric: inverse bijections. Transitive: compose the bijections.) \
Isomorphic graphs agree on every structural property: number of vertices, number of edges, the list of degrees, number of connected components, number of circuits of each length, being bipartite, being Eulerian or Hamiltonian.]

#tip[Isomorphic or not?][
*To prove isomorphic:* write the bijection on vertices explicitly and check that every edge maps to an edge (and the edge counts agree). \
*To prove not isomorphic:* name one invariant that differs. Compare in this order: vertices, edges, sorted degree list, then circuits of length 3 or 4, then what the vertices of a given degree are adjacent to. Equal degree lists do *not* prove isomorphism.]

#defn[Planar graph (L12 s82) · Subdivision (L12 s84)][
A *planar graph* is a graph that *can be* drawn on a plane without edges crossing. One drawing with crossings does not show a graph is non-planar. A planar drawing divides the plane into *faces* (regions), including the outer one. \
A *subdivision* of $G$ is obtained by inserting new vertices into edges of $G$ (replace an edge by a path through a new vertex).]

#thm[Kuratowski's theorem (L12 s83) · Euler's formula (L12 s86)][
- $K_5$ and $K_(3,3)$ are not planar. A finite graph is planar *iff* it has no subgraph that is a subdivision of $K_5$ or of $K_(3,3)$.
- For a *connected planar* simple graph with $v$ vertices, $e$ edges and $f$ faces: $quad f = e - v + 2$.
Examples: $K_4$ is planar with $v = 4$, $e = 6$, $f = 4$. $K_(3,4)$ is not planar, since it contains $K_(3,3)$ (AY25 Q25(a)). A tree has $f = (v - 1) - v + 2 = 1$ face.]

#exam[T11 Q1 · Self-complementary graphs on $n = 3, 4, 5, 6$ vertices][
If $G tilde.equiv overline(G)$ then $G$ and $overline(G)$ have the same number of edges, so $binom(n, 2)$ is even. For $n = 3$ and $n = 6$, $binom(n, 2) = 3$ and $15$: *none*. \
$n = 4$ (3 edges): the path on 4 vertices, and only that. $quad n = 5$ (5 edges): the cycle $C_5$, and the "bull" (a triangle with a pendant edge at two of its vertices): *two*.]

== 50 · Trees

#defn[Circuit-free, tree, trivial tree, forest (L13 s4) · Leaf, internal vertex (L13 s9)][
A graph is *circuit-free* iff it has no circuits. A simple graph is a *tree* iff it is *circuit-free and connected*. A *trivial tree* is a single vertex. A simple graph is a *forest* iff it is circuit-free and not connected. \
In a tree with one or two vertices each vertex is a *terminal vertex* (*leaf*). In a tree with at least three vertices, a vertex of degree 1 is a *leaf* and a vertex of degree greater than 1 is an *internal vertex*.]

#thm[Lemma 10.5.1 · Theorem 10.5.2 · Lemma 10.5.3 · Theorem 10.5.4 · Lemma 10.5.5 (L13 s7–15, T11)][
- *10.5.1.* Any non-trivial tree has at least one vertex of degree 1 (in fact at least two).
- *10.5.2.* Any tree with $n$ vertices ($n > 0$) has $n - 1$ edges.
- *10.5.3.* If $G$ is connected and $C$ is a circuit in $G$, removing one edge of $C$ leaves $G$ connected.
- *10.5.4.* If $G$ is a *connected* graph with $n$ vertices and $n - 1$ edges, then $G$ is a tree.
- *10.5.5 (T11).* In a simple graph, if there are two distinct paths from $v$ to a different vertex $w$, then $G$ contains a cycle.
Connectedness is needed in 10.5.4: a triangle with a pendant edge, together with one isolated vertex, has 5 vertices and 4 edges but is not a tree (L13 s17).]

#proofb[Lemma 10.5.1 (L13 s7) · Theorem 10.5.2 by induction (L13 s10–11) · At least two leaves (L13 s12)][
*10.5.1.* Start at any vertex $v$ and walk along edges, never reusing an edge. A vertex cannot be revisited #j[$T$ is circuit-free], and $T$ has finitely many vertices, so the walk stops at a vertex with no unused edge: a vertex of degree 1. \
*10.5.2.* Let $P(n) equiv$ "any tree with $n$ vertices has $n - 1$ edges".
+ $P(1)$: a tree with one vertex has no edges #j[a simple graph has no loops].
+ Assume $P(k)$ for an arbitrary $k >= 1$. Let $T$ be any tree with $k + 1$ vertices.
+ $T$ is non-trivial, so it has a vertex $v$ of degree 1 #j[Lemma 10.5.1]; let $e$ be the edge at $v$.
+ Let $T'$ be $T$ with $v$ and $e$ removed. $T'$ has $k$ vertices, is circuit-free (a subgraph of $T$) and is connected (no path between other vertices passes through $v$, as $deg(v) = 1$). So $T'$ is a tree.
+ $T'$ has $k - 1$ edges #j[inductive hypothesis], so $T$ has $k = (k + 1) - 1$ edges. Thus $P(k + 1)$ is true. #qed
*Two leaves.* Let $T$ be a tree with $n >= 2$ vertices. Every degree is at least 1 #j[connected]. If at most one vertex had degree 1, the total degree would be at least $1 + 2(n - 1) = 2n - 1$; but it equals $2(n - 1) = 2n - 2$ #j[Theorem 10.5.2 and the handshake theorem]. Contradiction. #qed]

#proofb[Theorem 10.5.4 · A connected graph with $n$ vertices and $n - 1$ edges is a tree (L13 s15–16)][
+ Let $G$ be connected with $n$ vertices and $n - 1$ edges. It suffices to show that $G$ is circuit-free.
+ Suppose $G$ has a circuit. Remove an edge of it; the graph stays connected #j[Lemma 10.5.3]. Repeat while a circuit remains.
+ The result $G''$ is connected and circuit-free, so it is a tree with $n$ vertices and therefore $n - 1$ edges #j[Theorem 10.5.2].
+ But at least one edge was removed, so $G''$ has at most $n - 2$ edges: contradiction.
+ Hence $G$ is circuit-free, and $G$ is a tree. #qed]

#grid(columns: (1fr, auto), gutter: 14pt,
example[L13 s13 · T11 Q3 · Trees on few vertices][
A tree with 4 vertices has 3 edges and total degree 6, with at least two leaves: the degree lists are $1, 1, 2, 2$ (a path) and $1, 1, 1, 3$ (a star). So there are *two* non-isomorphic trees with 4 vertices. \
*Labelled copies (T11 Q3):* $n = 1$: 1; $n = 2$: 1; $n = 3$: one tree (the path), 3 copies (choose the middle vertex); $n = 4$: the path has $4! slash 2 = 12$ copies and the star has 4 (choose the centre), 16 in all. In general there are $n^(n-2)$ labelled trees.],
align(center + horizon, stack(spacing: 8pt,
  gdraw((([], 0.2, 0.2), ([], 0.8, 0.2), ([], 1.4, 0.2), ([], 2.0, 0.2)), ((0,1),(1,2),(2,3)), w: 2.2cm, h: 0.4cm, r: 2.6pt),
  gdraw((([], 1.1, 0.75), ([], 1.1, 1.4), ([], 0.5, 0.25), ([], 1.7, 0.25)), ((0,1),(0,2),(0,3)), w: 2.2cm, h: 1.6cm, r: 2.6pt),
)))

#proofb[T11 Q4–Q6 · Edge bounds and the unique-path characterization][
Let $G = (V, E)$ be a simple graph.
+ *Connected $=> |E| >= |V| - 1$.* While $G$ has a circuit, remove one of its edges; $G$ stays connected #j[Lemma 10.5.3]. The process ends with a connected circuit-free graph on $V$, a tree with $|V| - 1$ edges #j[Theorem 10.5.2], all of which are edges of $G$. *Converse false:* a triangle plus an isolated vertex has $3 >= 4 - 1$ edges and is not connected.
+ *Acyclic $=> |E| <= |V| - 1$.* Each connected component is a tree. With $c >= 1$ components of sizes $n_1, dots, n_c$, $|E| = sum (n_i - 1) = |V| - c <= |V| - 1$. *Converse false:* the same graph has $3 <= 3$ edges and contains a cycle.
+ *$G$ is a tree iff there is exactly one path between every pair of distinct vertices.* \
  ($=>$) $G$ is connected, so any two distinct vertices are joined by a path #j[Lemma 10.2.1(a)]. Two distinct paths between them would give a cycle #j[Lemma 10.5.5], contradicting circuit-freeness. \
  ($arrow.l.double$) A path between every pair makes $G$ connected. If $G$ had a circuit, two vertices on it would be joined by two distinct paths (the two ways round), contradicting uniqueness. So $G$ is circuit-free and connected. #qed]

#exam[T11 Q7 (AY17/18 exam) · Splitting a pile of $n$ stones][
Splitting a pile of $k$ into $k_1$ and $k_2$ earns $k_1 k_2$ dollars. Model the stones as the vertices of $K_n$, where an edge means "still in the same pile". A split into $k_1$ and $k_2$ deletes exactly the $k_1 k_2$ edges between the two parts and earns one dollar per deleted edge. At the end every stone is alone, so all $binom(n, 2)$ edges have been deleted exactly once. The total is *$n(n-1) slash 2$ whatever the strategy*.]

== 51 · Rooted trees and binary trees

#defn[Rooted tree, level, height · Child, parent, sibling, ancestor, descendant (L13 s19)][
A *rooted tree* is a tree with one distinguished vertex, the *root*. The *level* of a vertex is the number of edges on the unique path between it and the root (the root has level 0). The *height* of a rooted tree is the maximum level of any vertex. \
The *children* of $v$ are the vertices adjacent to $v$ and one level farther from the root; then $v$ is their *parent*; distinct vertices with the same parent are *siblings*. If $v$ lies on the unique path between $w$ and the root ($v != w$), then $v$ is an *ancestor* of $w$ and $w$ a *descendant* of $v$.]

#defn[Binary tree, full binary tree · Left and right subtree (L13 s22)][
A *binary tree* is a rooted tree in which every parent has at most two children, each designated a *left child* or a *right child* (not both), with at most one of each. A *full binary tree* is a binary tree in which each parent has *exactly two* children. \
The *left subtree* of a parent $v$ is the binary tree whose root is the left child of $v$ and whose vertices are that child and all its descendants; the *right subtree* is defined analogously.]

#thm[Theorem 10.6.1 Full binary tree theorem (L13 s27) · Theorem 10.6.2 (L13 s29)][
- *10.6.1.* A full binary tree with $k$ internal vertices has $2k + 1$ vertices in total and $k + 1$ leaves.
- *10.6.2.* A binary tree of height $h$ with $t$ leaves satisfies $t <= 2^h$; equivalently $log_2 t <= h$.
Hence: no full binary tree has 10 internal vertices and 13 leaves (it would have 11 leaves); no binary tree of height 5 has 38 leaves ($38 > 32$). A binary tree of height $h$ has at most $2^(h+1) - 1$ vertices.]

#proofb[Theorem 10.6.1 (L13 s27) · Theorem 10.6.2 by strong induction (L13 s30–34)][
*10.6.1.* Every vertex except the root has a parent. Each of the $k$ internal vertices has exactly two children, so $2k$ vertices have a parent. Total: $2k + 1$. Leaves: $(2k + 1) - k = k + 1$. #qed \
*10.6.2.* Let $P(h) equiv$ "every binary tree of height $h$ has at most $2^h$ leaves".
+ $P(0)$: the tree is a single vertex, a leaf: $t = 1 = 2^0$.
+ Let $k >= 0$ and assume $P(i)$ for $0 <= i <= k$. Let $T$ have height $k + 1$, root $v$ and $t$ leaves. Since $k + 1 >= 1$, $v$ has a child.
+ Case 1 ($v$ has one child): its subtree $T_L$ has height $k$, so $t_L <= 2^k$ #j[inductive hypothesis]. In the slides the root, having degree 1, is also counted, so $t = t_L + 1 <= 2^k + 1 <= 2^k + 2^k = 2^(k+1)$ #j[$2^k >= 1$].
+ Case 2 ($v$ has two children): the subtrees $T_L$, $T_R$ have heights $h_L, h_R <= k$, so $t = t_L + t_R <= 2^(h_L) + 2^(h_R) <= 2^k + 2^k = 2^(k+1)$ #j[inductive hypothesis].
+ In both cases $P(k + 1)$ is true. #qed]

#grid(columns: (1fr, auto), gutter: 14pt,
defn[Tree traversal: BFS and DFS (L13 s36–39)][
*Breadth-first search:* visit the root, then the vertices level by level, left to right. \
*Depth-first search*, three orders, each applied recursively:
- *Pre-order:* root, left subtree, right subtree.
- *In-order:* left subtree, root, right subtree.
- *Post-order:* left subtree, right subtree, root.
For the tree on the right (L13 s40): \
BFS: $F, B, G, A, D, I, C, E, H$ \
pre-order: $F, B, A, D, C, E, G, I, H$ \
in-order: $A, B, C, D, E, F, G, H, I$ \
post-order: $A, C, E, D, B, H, I, G, F$],
align(center + horizon, gdraw(
  (([F], 2.0, 3.0), ([B], 1.0, 2.2), ([G], 3.0, 2.2), ([A], 0.4, 1.4), ([D], 1.6, 1.4),
   ([C], 1.2, 0.6), ([E], 2.0, 0.6), ([I], 3.6, 1.4), ([H], 3.2, 0.6)),
  ((0,1),(0,2),(1,3),(1,4),(4,5),(4,6),(2,7),(7,8)), w: 4cm, h: 3.3cm)))

#tip[Rebuilding a binary tree from two traversals][
*Pre-order + in-order* (or *post-order + in-order*) determine the tree. The root is the *first* item of the pre-order (the *last* of the post-order). Find it in the in-order: everything to its left is the left subtree, everything to its right is the right subtree. Split the other traversal into blocks of the same sizes and recurse. \
*Pre-order + post-order* do not determine the tree: a vertex with exactly one child could have it on the left or the right, so there are $2^s$ trees, where $s$ is the number of one-child vertices. \
*Expression trees (L13 s24–26):* operators at internal vertices, operands at leaves; $((a - b) dot c) + (d slash e)$ has root $+$.]

#exam[T11 Q8, Q9, D3 · AY25 final Q19, Q21, Q22][
*T11 Q8(a).* In-order E A C K F H D B G, pre-order F A E K C D H G B. Root $F$; left part E A C K, right part H D B G. Left subtree: root $A$, left child $E$, right child $K$ with left child $C$. Right subtree: root $D$, left child $H$, right child $G$ with left child $B$. *Post-order: E, C, K, A, H, B, G, D, F.* \
*T11 Q8(b).* In-order D B F E A G C H K, post-order D F E B G K H C A. Root $A$; left subtree: root $B$, left child $D$, right child $E$ with left child $F$; right subtree: root $C$, left child $G$, right child $H$ with right child $K$. *Pre-order: A, B, D, E, F, C, G, H, K.* \
*T11 Q9.* Binary trees with in-order X Y Z: *5*; with in-order A B C D: *14* (the Catalan numbers: choose the root, then the shapes of the two sides). \
*AY25 Q21.* Pre-order G B E D F C A, in-order B G F D C E A: root $G$ with left child $B$; right subtree has root $E$, left child $D$ (children $F$ and $C$), right child $A$. Post-order: B, F, C, D, A, E, G. \
*AY25 Q22.* Pre-order A B C D E, post-order C E D B A: $A$ has the single child $B$; $B$ has children $C$ and $D$; $D$ has the single child $E$. Two one-child vertices: $2^2 = 4$ trees. \
*AY25 Q19.* Unlabelled rooted binary trees, left and right not distinguished: 2 with 3 vertices, 3 with 4 vertices, *6* with 5 vertices.]

== 52 · Spanning trees and minimum spanning trees

#defn[Spanning tree (L13 s45) · Weighted graph, minimum spanning tree (L13 s48)][
A *spanning tree* for a graph $G$ is a subgraph of $G$ that contains every vertex of $G$ and is a tree. \
A *weighted graph* is a graph in which each edge $e$ has a positive real *weight* $w(e)$; the *total weight* $w(G)$ is the sum of the weights of all edges. A *minimum spanning tree* (MST) for a connected weighted graph is a spanning tree with the least possible total weight.]

#thm[Proposition 10.7.1 (L13 s45)][
(1) Every connected graph has a spanning tree. (2) Any two spanning trees for a graph have the same number of edges ($n - 1$ for $n$ vertices). \
*Counting spanning trees:* if $G$ has exactly one circuit, of length $k$, removing any one of its edges gives a spanning tree: $k$ spanning trees (L13 s46: 3). $K_n$ has $n^(n-2)$.]

#grid(columns: (1fr, 1fr), gutter: 10pt,
tip[Algorithm 10.7.1 · Kruskal (L13 s50)][
Input: a connected weighted graph $G$ with $n$ vertices.
+ Initialize $T$ with all vertices of $G$ and no edges.
+ Let $E$ be the set of all edges of $G$; let $m = 0$.
+ While $m < n - 1$:
  + find an edge $e$ in $E$ of least weight;
  + delete $e$ from $E$;
  + if adding $e$ to $T$ does not produce a circuit, add $e$ to $T$ and set $m = m + 1$.
Output: $T$, a minimum spanning tree for $G$.],
tip[Algorithm 10.7.2 · Prim (L13 s55)][
Input: a connected weighted graph $G$ with $n$ vertices.
+ Pick a vertex $v$; let $T$ be the graph with this vertex only.
+ Let $V$ be the set of all vertices of $G$ except $v$.
+ For $i = 1$ to $n - 1$:
  + find an edge $e$ of least weight among those connecting $T$ to a vertex in $V$; let $w$ be its endpoint in $V$;
  + add $e$ and $w$ to $T$, and delete $w$ from $V$.
Output: $T$, a minimum spanning tree for $G$.])

#grid(columns: (auto, 1fr), gutter: 14pt,
align(center + horizon, gdraw(
  (([a], 0.3, 1.7), ([b], 1.7, 1.7), ([c], 0.9, 0.5), ([d], 3.1, 1.7), ([e], 2.7, 0.4)),
  ((0,1,4),(0,2,2),(1,2,1),(1,3,5),(2,3,8),(2,4,10),(3,4,2)), bold: (1, 2, 3, 6), w: 4.3cm, h: 2.6cm, u: 1.25cm)),
example[Kruskal and Prim on one graph][
Edges: $a b = 4$, $a c = 2$, $b c = 1$, $b d = 5$, $c d = 8$, $c e = 10$, $d e = 2$. \
*Kruskal:* $b c$ (1) added; $a c$ (2) added; $d e$ (2) added; $a b$ (4) rejected, since it closes the circuit $a b c$; $b d$ (5) added. Four edges: stop. \
*Prim from $a$:* add $a c$ (2), then $c b$ (1), then $b d$ (5), then $d e$ (2). \
Both give the same tree, of weight $1 + 2 + 2 + 5 = 10$, with the edges added in different orders.])

#example[L13 s52, s57 · The airline graph (8 cities)][
*Kruskal:* Chi–Mil 74, Lou–Cin 83, Lou–Nas 151, Cin–Det 230, StL–Lou 242, StL–Chi 262 added; Chi–Lou 269, Lou–Det 306, Lou–Mil 348 *not added* (each would close a circuit); Min–Chi 355 added. Total weight *1397*. \
*Prim from Minneapolis:* Min–Chi 355, Chi–Mil 74, Chi–StL 262, StL–Lou 242, Lou–Cin 83, Lou–Nas 151, Cin–Det 230. The same tree, total 1397.]

#trap[Minimum spanning trees][
- Kruskal may hold a *disconnected* forest midway; Prim's partial tree is always connected. Marking a Prim step that does not touch the current tree is an error.
- With repeated weights there may be several MSTs, but all have the same total weight; with all weights distinct the MST is unique. To count MSTs, look at each tie and see which choices are interchangeable.
- An MST is not a shortest-path tree. Dijkstra's algorithm (L13 s59 onward) is not examinable this semester.
- Stop after $n - 1$ edges. If a question asks for the order of edges added, follow the named algorithm exactly.]
