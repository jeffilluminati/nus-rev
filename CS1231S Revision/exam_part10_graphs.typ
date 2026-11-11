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

=== Colouring: chromatic number and chromatic index

#defn[Chromatic number $chi(G)$ · Chromatic index $chi'(G)$ (AY24/25 Q25 · W12 s52)][
The *chromatic number* $chi(G)$ is the minimum number of colours needed to colour the *vertices* of $G$ so that no two adjacent vertices have the same colour. \
The *chromatic index* $chi'(G)$ is the minimum number of colours needed to colour the *edges* of $G$ so that no two adjacent edges (edges sharing an endpoint) have the same colour. \
$Delta(G)$ denotes the maximum degree of $G$.]

#thm[Values and bounds for $chi$ and $chi'$ (W12 s53–54, s58)][
#table(columns: (3.1cm, 2.5cm, 2.9cm, 1fr),
  [Graph], [$chi$], [$chi'$], [Reason],
  [$K_n$], [$n$], [$n - 1$ ($n$ even), $n$ ($n$ odd)], [all vertices mutually adjacent; for odd $n$ a colour covers at most $(n - 1) slash 2$ of the $n(n-1) slash 2$ edges],
  [$C_n$], [2 ($n$ even), 3 ($n$ odd)], [2 ($n$ even), 3 ($n$ odd)], [alternate two colours round the cycle; an odd cycle needs a third],
  [bipartite with an edge: $K_(m,n)$, trees], [2], [$Delta$ #h(0.3em) ($max(m, n)$ for $K_(m,n)$)], [colour by side; König's theorem for $chi'$],
  [Petersen graph], [3], [4], [has odd cycles; $chi' = Delta + 1$],
  [friendship graph $F_n$, $n >= 2$], [3], [$2n$], [triangles; the centre has degree $2n$],
)
- *Lower bounds:* if $G$ contains $K_k$ as a subgraph then $chi(G) >= k$ (a triangle, or any odd cycle, forces 3). $chi'(G) >= Delta(G)$, since the edges at one vertex all need different colours.
- *Upper bounds:* $chi(G) <= Delta(G) + 1$ (colour the vertices one at a time; at most $Delta$ colours are blocked). For a simple graph $chi'(G)$ is $Delta$ or $Delta + 1$.
- $chi(G) = 1$ iff $G$ has no edges; $chi(G) <= 2$ iff $G$ is bipartite (§47).]

#grid(columns: (1fr, auto), gutter: 14pt,
defn[Petersen graph (AY24/25 Q25 · W12 s53–55)][
An outer 5-cycle, an inner 5-cycle drawn as a pentagram, and five spokes joining them.
- *10 vertices, 15 edges*, every vertex of degree 3; the shortest cycle has length 5 (no triangles, not bipartite).
- $chi = 3$ and $chi' = 4$, although $Delta = 3$.
- *Not Eulerian* (every degree is odd). *Not Hamiltonian*, although a path through all 10 vertices exists.
- *Not planar:* every face would have at least 5 edges, so $5 f <= 2 e = 30$ and $f <= 6$; but Euler's formula (§49) needs $f = 15 - 10 + 2 = 7$.],
align(center + horizon, gdraw(
  (([], 1.2, 2.15), ([], 0.249, 1.459), ([], 0.612, 0.341), ([], 1.788, 0.341), ([], 2.151, 1.459),
   ([], 1.2, 1.63), ([], 0.744, 1.298), ([], 0.918, 0.762), ([], 1.482, 0.762), ([], 1.656, 1.298)),
  ((0,1),(1,2),(2,3),(3,4),(4,0),(0,5),(1,6),(2,7),(3,8),(4,9),(5,7),(7,9),(9,6),(6,8),(8,5)),
  w: 2.4cm, h: 2.4cm, r: 2.6pt)))

#tip[Modelling a conflict or scheduling problem as vertex colouring (L12 s13–18)][
+ *Vertices* are the objects to be assigned: items, guests, classes, radio stations, traffic signals.
+ *Edges* join two objects that *conflict* (cannot share a container, table, time slot, frequency).
+ *Colours* are the resources. Vertices of the same colour are objects that may share one resource.
+ The minimum number of resources is $chi(G)$. *Lower bound:* find a triangle or a larger $K_k$. *Upper bound:* exhibit a colouring, taking vertices of high degree first. When the bounds meet, the answer is proved.
*Wedding planner (L12 s16–17):* guests $B, C, D$ are in mutual conflict, so 3 tables are needed; ${A, B, E}$, ${C, F}$, ${D, G, H}$ works. *3 tables.*]

#exam[AY22/23 Q23(f)–(i) · Volatile item packing as graph colouring][
Items $A, dots, K$ (no $I$); conflicts A: B, C; B: A, C, D; C: A, B, D; D: B, C, E, F; E: D, F, G, H; F: D, E, J, K; G: E, H; H: E, G; J: F, K; K: F, J. \
*(f)* Vertices are items; two vertices are adjacent iff the items conflict; vertices of the same colour go into the same container. \
*(g)* 14 edges: $A B, A C, B C, B D, C D, D E, D F, E F, E G, E H, G H, F J, F K, J K$. \
*(h)* The triangle $A B C$ forces 3 colours, and 3 suffice: colour 1: $A, D, G, J$; colour 2: $B, E, K$; colour 3: $C, F, H$. \
*(i)* *3 containers:* ${A, D, G, J}$, ${B, E, K}$, ${C, F, H}$.]

#exam[AY24/25 Q25(a)–(c), (f) · Chromatic number and index][
*(a)* $chi(K_1231) = 1231$; $chi(K_(1231,1231)) = 2$; $chi(C_1231) = 3$ (odd cycle); $chi("Petersen") = 3$. \
*(b)* $chi'(K_100) = 99$ ($n$ even); $chi'(K_(1231,1231)) = 1231$ (bipartite, $Delta = 1231$); $chi'("Petersen") = 4$. \
*(c)* The Petersen graph is not Eulerian and not Hamiltonian. \
*(f)* The graph in (e) is the *friendship graph* (T10 Q7), here $F_6$. With $2n + 1$ vertices and $n > 1$: $chi' = 2n$. The $2n$ edges at the centre need $2n$ colours; each rim edge then takes the colour of a spoke of another triangle. ($F_1 = K_3$ needs 3, hence $n > 1$.)]

=== Matchings and dominating sets

#defn[Matching · Maximal, maximum, perfect matching · Neighbours $N(S)$ (AY25/26 Q25)][
A *matching* in $G = (V, E)$ is a subset $F subset.eq E$ in which no two edges share a vertex.
- *Maximal matching:* cannot be extended by adding another edge (every other edge meets an edge of $F$).
- *Maximum matching:* contains the largest possible number of edges.
- *Perfect matching:* covers every vertex of the graph.
For a set $S$ of vertices, $N(S)$ is the set of vertices adjacent to at least one vertex of $S$. \
Every maximum matching is maximal, *not conversely*. Every perfect matching is maximum.]

#thm[Hall's Marriage Theorem (AY25/26 Q25)][
A bipartite graph $G = (U, V, E)$ has a matching that covers all vertices in $U$ *iff* for every subset $S subset.eq U$: $quad |N(S)| >= |S|$.]

#tip[Using Hall's theorem in both directions][
*To show a matching covering $U$ exists:* write one down. Start with the vertices of degree 1 (their edge is forced), delete the matched vertices, repeat. Checking Hall's condition directly means all $2^(|U|)$ subsets. \
*To show none exists:* give one set $S subset.eq U$ with $|N(S)| < |S|$. Look for several vertices of $U$ whose neighbours all lie in a small part of $V$; a vertex of degree 0 and the case $|U| > |V|$ ($S = U$) are instant. \
*Perfect matching:* a matching covering $U$ has $|U|$ edges and meets $|U|$ vertices of $V$, so it is perfect iff also $|U| = |V|$.]

#grid(columns: (1fr, auto), gutter: 14pt,
exam[AY25/26 Q25(e)–(h) · Matchings][
*(e)* The additional condition is $|U| = |V|$. \
*(f)* $U = {a, b}$, $V = {x, y}$, $E = {a x, a y, b x}$ (drawn on the right). ${a x}$ is *maximal* ($a y$ shares $a$, $b x$ shares $x$) but has 1 edge; ${a y, b x}$ is *maximum* with 2 edges. \
*(g)* $G_1$: $a$ has only $x$ and $c$ has only $y$, so $a x$ and $c y$ are forced; then $b w$ and $d z$. *Yes:* ${(a, x), (b, w), (c, y), (d, z)}$. \
*(h)* $G_2$: take $S = {a, b, c}$. $N(S) = {w, x}$, so $|N(S)| = 2 < 3 = |S|$. *No perfect matching.*],
align(center + horizon, gdraw((([a], 0.3, 1.1), ([b], 0.3, 0.3), ([x], 1.6, 1.1), ([y], 1.6, 0.3)),
  ((0,2),(0,3),(1,2)), w: 1.9cm, h: 1.4cm)))

#exam[T10 Q11 (AY21/22 exam) · Dominating sets][
$D subset.eq V$ is a *dominating set* of a simple graph iff every vertex not in $D$ is adjacent to at least one vertex in $D$; it is *minimal* iff no proper subset of $D$ is dominating. \
*(a) Size one* (one vertex adjacent to all others), on four vertices: $K_4$ with any vertex; the star $K_(1,3)$ with its centre. \
*(b) Size three*, on four vertices: one edge plus two isolated vertices (the two isolated vertices and one end of the edge); the star $K_(1,3)$ with its three leaves. \
Minimal is not minimum: the star has minimal dominating sets of sizes 1 and 3.]

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

#grid(columns: (1fr, auto), gutter: 14pt,
exam[AY22/23 Q23(a), (b) · AY23/24 Q24(c)(i) · Where an Euler trail starts and ends][
By Corollary 10.2.5 an Euler trail exists iff the graph is connected with *exactly two* odd vertices, and every Euler trail *starts at one of them and ends at the other*. No odd vertex: an Euler circuit, which may start anywhere. More than two: neither. \
*AY22/23 Q23.* Degrees: $a$ 2, $b$ 4, $c$ 3, $d$ 4, $e$ 4, $f$ 3, $g$ 4, $h$ 2. *(a)* One trail: $c, a, b, c, g, d, b, e, d, f, e, h, g, f$ (the edge labels on the right give the order). *(b)* It may start at *$c$ or $f$* only. \
*AY23/24 Q24(c)(i).* Remove an edge ${u, v}$, $u != v$, from a graph with an Euler circuit: the edge lies on a circuit, so $G'$ stays connected (Lemma 10.2.1(c)), and exactly $u$ and $v$ become odd. $G'$ has an Euler trail from $u$ to $v$: *true*. (If the removed edge were a loop, $G'$ would keep an Euler circuit instead.)],
align(center + horizon, gdraw(
  (([a], 0.2, 2.0), ([b], 1.5, 2.0), ([c], 0.2, 1.1), ([d], 1.5, 1.1), ([e], 2.8, 1.1), ([f], 2.15, 0.65), ([g], 1.5, 0.2), ([h], 2.8, 0.2)),
  ((0,1,2),(0,2,1),(1,2,3),(1,3,6),(1,4,7),(2,6,4),(3,4,8),(3,5,9),(3,6,5),(4,5,10),(4,7,11),(5,6,13),(6,7,12)),
  w: 3.9cm, h: 2.9cm, u: 1.3cm, size: 6.8pt, r: 5.5pt)))

=== Bipartite graphs and odd cycles

#thm[A graph is bipartite iff it has no cycle of odd length (AY24/25 Q22 · AY22/23 Q19)][
Equivalently: $G$ is bipartite iff its vertices can be coloured with at most 2 colours ($chi(G) <= 2$). \
So $K_(m,n)$, trees, forests and even cycles are bipartite; a graph containing a triangle, or any odd cycle, is not.]

#proofb[Bipartite $<=>$ no odd cycle][
+ ($=>$) Let $G$ be bipartite with sides $U$, $V$, and let $v_0 v_1 dots.c v_k$ with $v_k = v_0$ be a cycle. Every edge joins $U$ to $V$, so the vertices alternate sides #j[definition of bipartite].
+ After $k$ steps the cycle is back on the side of $v_0$, so $k$ is even.
+ ($arrow.l.double$) Suppose $G$ has no odd cycle. Treat each connected component separately; pick a vertex $r$ in it, and let $d(x)$ be the length of a shortest path from $r$ to $x$ #j[Lemma 10.2.1(a)].
+ Put $x$ in $U$ if $d(x)$ is even and in $V$ if $d(x)$ is odd.
+ Suppose an edge ${x, y}$ had both ends on the same side. The shortest paths from $r$ to $x$ and from $r$ to $y$, with the edge ${x, y}$, form a closed walk of length $d(x) + d(y) + 1$, which is odd.
+ A closed walk of odd length contains a cycle of odd length: contradiction. So every edge joins $U$ to $V$. #qed]

#exam[AY24/25 Q22 · AY22/23 Q19 · True or false][
*AY24/25 Q22.* (i) Bipartite iff no odd cycle: *true*. (ii) Bipartite iff the sum of all degrees is even: *false*, since that sum is even for every graph (handshake theorem), for example $K_3$. (iii) $K_(2,n)$ is planar for $n > 3$: *true* (§49). Answer: only (i) and (iii). \
*AY22/23 Q19.* (i) A simple graph with 6 vertices, 5 edges and no cycles cannot have exactly one vertex of degree 1: *true*. A forest with $c$ components has $v - c$ edges, so $c = 1$: it is a tree, with at least two leaves. (ii) Not connected $=> e < n - 1$: *false* ($K_4$ plus an isolated vertex: $n = 5$, $e = 6$). (iii) All cycles in $K_(3,4)$ have an even number of edges: *true* (bipartite). Answer: only (i) and (iii).]

=== Cut-points, bridges, vertex cut sets

#defn[$G - v$, cut-point · $G - e$, bridge (AY22/23 Q23) · Vertex cut set (AY24/25 Q25)][
Let $G = (V, E)$ be a connected undirected graph. \
$G - v$ is $G$ with the vertex $v$ and all edges incident to $v$ deleted; $v$ is a *cut-point* (cut vertex) iff $G - v$ is disconnected. \
$G - e$ is $G$ with the edge $e$ deleted (its endpoints stay); $e$ is a *bridge* iff $G - e$ is disconnected. \
A *vertex cut set* is a set $S subset.eq V$ whose removal, with all incident edges, disconnects $G$. A *minimum vertex cut set* is one of the smallest possible size.]

#thm[Bridges and cut-points · AY22/23 Q23(c), (d)][
- An edge is a bridge *iff it lies on no circuit*. (On a circuit: removing it keeps $G$ connected, Lemma 10.5.3. On no circuit: if $G - e$ were connected, a path between the endpoints of $e$ together with $e$ would be a circuit.)
- *In a tree with 2 or more vertices every edge is a bridge* (a tree has no circuits): Q23(d) *true*.
- *In a tree every vertex of degree greater than 1 is a cut-point*: Q23(c) *true*. Two neighbours of $v$ are joined by the unique path through $v$ (§50), so they are separated in $T - v$. A leaf is never a cut-point.
- $K_n$ has no vertex cut set. In $C_n$ ($n >= 4$) no single vertex is a cut-point; two non-adjacent vertices form a minimum vertex cut set.
- The neighbours of a vertex $v$ form a vertex cut set whenever other vertices remain, so a minimum vertex cut set has at most (minimum degree) vertices. Search sizes $1, 2, dots$ in turn.]

#grid(columns: (auto, 1fr), gutter: 14pt,
align(center + horizon, gdraw(
  (([A], 1.0, 1.9), ([F], 2.6, 1.9), ([B], 0.2, 1.05), ([G], 1.35, 1.05), ([H], 2.15, 1.05), ([I], 2.95, 1.05), ([E], 3.9, 1.05), ([C], 1.0, 0.2), ([D], 2.6, 0.2)),
  ((0,1),(0,2),(0,3),(2,3),(2,7),(7,3),(7,8),(3,8),(4,5),(4,8),(5,8),(5,1),(5,6),(1,6),(8,6)),
  w: 4.1cm, h: 2.1cm)),
exam[AY24/25 Q25(d) · Minimum vertex cut set][
No single vertex disconnects the graph, so the minimum size is 2. The left part ${A, B, C, G}$ is joined to the rest only by $A F$, $C D$ and $G D$. \
*${A, D}$* separates ${B, C, G}$ from ${E, F, H, I}$; *${D, F}$* separates ${A, B, C, G}$ from ${E, H, I}$; *${D, I}$* isolates $H$, whose only neighbours are $D$ and $I$. Any one of these three is a correct answer, and there are no others of size 2.])

#exam[Edge counts and components · AY23/24 Q19, Q20, Q24(c)(iii), Q24(d)][
*Extremes.* A simple graph with $n$ vertices and $k$ connected components has between $n - k$ edges (a forest) and $binom(n - k + 1, 2)$ edges ($K_(n-k+1)$ with $k - 1$ isolated vertices). So a disconnected simple graph has at most $binom(n - 1, 2)$ edges, and $binom(n - 1, 2) + 1$ edges force connectedness. \
*Q24(d).* $G$ is connected on $n$ vertices ($n$ even); removing one edge leaves two complete graphs $K_a$ and $K_(n-a)$. $|E| = binom(a, 2) + binom(n - a, 2) + 1$, least when $a = n slash 2$: *$n(n - 2) slash 4 + 1$* (check $n = 4$: 3, the path). \
*Q24(c)(iii).* "Every vertex of degree $n - 2$ is possible for all $n > 3$": *false*. The total degree $n(n - 2)$ must be even, so $n$ must be even (then $K_n$ minus a perfect matching works). \
*Q19, Q20.* $v_i$ and $v_j$ are joined iff $5 dv (i + j)$. Indices with residues 1 and 4 (mod 5) form one component, residues 2 and 3 another, residue 0 a third. At most 3 components; the residue-0 component has $floor(n slash 5)$ vertices; the other two differ in size by at most 1: *all of (i), (ii), (iii)*. If $5 dv n$ the sizes are $2n slash 5$, $2n slash 5$, $n slash 5$: *two components with $2n slash 5$ vertices each*.]

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

#tip[Walks of length 3 or 4 without computing every entry][
Rows are "from", columns are "to"; a digraph's matrix need not be symmetric, and a loop puts 1 on the diagonal. Compute $A^2$ in full, then only the entry wanted:
$ (A^3)_(i j) = ("row" i "of" A) dot ("column" j "of" A^2), wide (A^4)_(i j) = ("row" i "of" A^2) dot ("column" j "of" A^2). $]

#exam[AY25/26 Q20 · AY24/25 Q20 · AY23/24 Q24(b) · AY20/21 Q12 · Counting walks in a digraph][
*AY25/26 Q20.* Arrows $a -> c$, $b -> a$, $b -> b$, $c -> a$, $c -> b$ (rows and columns in the order $a, b, c$):
$ A = mat(0, 0, 1; 1, 1, 0; 1, 1, 0), wide A^2 = mat(1, 1, 0; 1, 1, 1; 1, 1, 1), wide A^4 = (A^2)^2 = mat(2, 2, 1; 3, 3, 2; 3, 3, 2). $
Walks of length 4: $a$ to $c$: 1; $b$ to $b$: 3; $c$ to $a$: 3; $c$ to $b$: 3. The least of all nine entries is *$a$ to $c$* (option A). \
*AY24/25 Q20.* Arrows $a -> a$, $a -> b$, $a -> c$, $b -> a$, $b -> c$, $c -> a$:
$ A = mat(1, 1, 1; 1, 0, 1; 1, 0, 0), wide A^2 = mat(3, 1, 2; 2, 1, 1; 1, 1, 1), wide A^4 = mat(13, 6, 9; 9, 4, 6; 6, 3, 4). $
$a$ to $b$: 6; $b$ to $b$: 4; $c$ to $a$: 6; $c$ to $b$: 3, the least entry: *$c$ to $b$* (option D). \
*AY23/24 Q24(b).* $A = mat(1, 2, 0; 2, 1, 2; 0, 1, 2)$, $A^2 = mat(5, 4, 4; 4, 7, 6; 2, 3, 6)$. Walks of length 4 from $v_1$ to $v_3$: $(5, 4, 4) dot (4, 6, 6) = 20 + 24 + 24 =$ *68*. \
*AY20/21 Q12.* Rows of $A$: $(1, 1, 0, 1)$, $(0, 0, 1, 1)$, $(0, 0, 1, 1)$, $(0, 1, 0, 1)$. Column 4 of $A^2$ is $(3, 2, 2, 2)$, so walks of length 3 from vertex 1 to vertex 4: $(1, 1, 0, 1) dot (3, 2, 2, 2) =$ *7*.]

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

#thm[Consequences of Euler's formula (AY22/23 Q18 · AY23/24 Q18 · AY24/25 Q22)][
Let $G$ be a *simple connected planar* graph with $v >= 3$ vertices and $e$ edges.
- $e <= 3v - 6$. $quad$ If $G$ has no triangles (for example $G$ bipartite): $e <= 2v - 4$.
- *Every simple planar graph has a vertex of degree at most 5.*
- $K_5$: $e = 10 > 9$. $K_(3,3)$: no triangles and $e = 9 > 8$. Both are non-planar. The inequalities are necessary only: the Petersen graph has $15 <= 24$ edges and is not planar.
- *Planar:* $K_n$ iff $n <= 4$; $K_(m,n)$ iff $min(m, n) <= 2$. *$K_(2,n)$ is planar for every $n$:* put the $n$ vertices in a column and the other two on its left and right. *$K_5$ minus one edge is planar:* draw $K_4$ as a triangle with a centre and join a fifth vertex, placed outside, to the three corners; only the edge from centre to outside is absent.
- With $c$ connected components the formula becomes $f = e - v + c + 1$.]

#proofb[$e <= 3v - 6$ · $e <= 2v - 4$ · A vertex of degree at most 5][
+ Every face is bounded by at least 3 edges #j[simple, $v >= 3$] and every edge borders at most 2 faces, so $3 f <= 2 e$.
+ Substitute $f = e - v + 2$ #j[Euler's formula]: $3(e - v + 2) <= 2e$, that is $e <= 3v - 6$.
+ With no triangles every face has at least 4 edges: $4 f <= 2 e$, so $2(e - v + 2) <= e$, that is $e <= 2v - 4$.
+ Suppose every vertex of a simple planar graph had degree at least 6; pick a connected component (it has $v >= 7$). Then $2e >= 6v$ #j[handshake theorem], so $e >= 3v > 3v - 6$: contradiction with line 2. #qed]

#exam[AY22/23 Q18 · AY23/24 Q18 · Planarity true or false][
*AY22/23 Q18.* (i) $K_5 - {e}$ is planar: *true*. (ii) $K_5$ is Eulerian and Hamiltonian: *true* (connected, every degree 4; $K_n$ is Hamiltonian for $n >= 3$). (iii) A simple planar graph with 6 vertices, 8 edges and 7 faces: *false*. $f = e - v + c + 1 = 3 + c$ needs $c = 4$ components, but 6 vertices in 4 components carry at most $binom(3, 2) = 3$ edges. Answer: only (i) and (ii). \
*AY23/24 Q18.* (i) Two spanning trees of a graph always share an edge: *false* (§52). (ii) Every simple planar graph has a vertex of degree at most 5: *true*.]

#exam[T11 Q1 · Self-complementary graphs on $n = 3, 4, 5, 6$ vertices][
If $G tilde.equiv overline(G)$ then $G$ and $overline(G)$ have the same number of edges, so $binom(n, 2)$ is even. For $n = 3$ and $n = 6$, $binom(n, 2) = 3$ and $15$: *none*. \
$n = 4$ (3 edges): the path on 4 vertices, and only that. $quad n = 5$ (5 edges): the cycle $C_5$, and the "bull" (a triangle with a pendant edge at two of its vertices): *two*.]

#thm[Self-complementary graphs need $n equiv 0$ or $1 space (mod 4)$ · AY20/21 Q21(b), (c)][
A self-complementary simple graph on $n$ vertices has exactly $n(n - 1) slash 4$ edges. Hence $n equiv 0$ or $1 space (mod 4)$; in particular there is *no* self-complementary graph with $4k + 2$ (or $4k + 3$) vertices.]

#proofb[Edge count of a self-complementary graph][
+ Let $G tilde.equiv overline(G)$ with $n$ vertices. Isomorphic graphs have the same number of edges, so $|E| = |overline(E)|$ #j[Theorem 10.4.1, invariants].
+ Each of the $binom(n, 2)$ pairs of vertices is an edge of exactly one of $G$, $overline(G)$: $|E| + |overline(E)| = n(n - 1) slash 2$. So $|E| = n(n - 1) slash 4$.
+ $|E|$ is an integer, so $4 dv n(n - 1)$. One of $n$, $n - 1$ is odd, so 4 divides the other: $n equiv 0$ or $1 space (mod 4)$.
+ For $n = 4k + 2$: $n(n - 1) slash 2 = (2k + 1)(4k + 1)$ is odd, so it cannot be split into two equal parts. No such graph exists. #qed]

#example[Small enumerations up to isomorphism · AY22/23 Q20 · AY24/25 Q21 · AY20/21 Q20(d)][
- *Simple graphs on $n = 1, 2, 3, 4, 5$ vertices:* 1, 2, 4, 11, 34 classes; connected ones: 1, 1, 2, 6, 21.
- *The 11 on 4 vertices, by number of edges* $0, 1, dots, 6$: $1, 1, 2, 3, 2, 1, 1$ (the list is symmetric under taking complements). With 3 edges: path, star, triangle plus isolated vertex.
- *AY22/23 Q20.* Disconnected simple graphs on 4 vertices: $11 - 6 =$ *5* (no edge; one edge; two disjoint edges; two adjacent edges plus an isolated vertex; triangle plus an isolated vertex).
- *AY24/25 Q21.* 25 labelled simple graphs on 3 vertices fall into 4 isomorphism classes (0, 1, 2 or 3 edges), so at least $ceil(25 slash 4) =$ *7* are isomorphic to one another (generalized pigeonhole, §41).
- *AY20/21 Q20(d).* Directed graphs on 3 labelled vertices, no parallel edges: each of the 9 ordered pairs (loops included) is present or absent, $2^9 =$ *512*. With at least one loop: $512 - 2^6 =$ *448*.]

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

#example[Counting trees · W12 s51 · AY20/21 Q21(e)][
- *Non-isomorphic trees on $n = 1, dots, 6$ vertices:* $1, 1, 1, 2, 3, 6$.
- *5 vertices (W12 s51):* 4 edges, total degree 8, at least two leaves; the other three degrees sum to 6: ${1, 1, 4}$ (star), ${1, 2, 3}$, ${2, 2, 2}$ (path). *3 trees.*
- *Rooted trees* (an isomorphism must send root to root) on $n = 1, dots, 5$ vertices: $1, 1, 2, 4, 9$. *AY20/21 Q21(e), 5 vertices:* delete the root and list the sizes of the subtrees hanging from it. Sizes ${4}$: 4 trees (one per rooted tree on 4 vertices); ${3, 1}$: 2; ${2, 2}$: 1; ${2, 1, 1}$: 1; ${1, 1, 1, 1}$: 1. Total *9*.
- *Forest:* with $c$ components, $e = v - c$. So "no cycles and $e = v - 1$" already forces a tree (AY22/23 Q19(i), §47).]

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

#tip[Pre-order + post-order · When the tree is unique, and how to rebuild it][
+ The root is the *first* item of the pre-order and the *last* of the post-order.
+ If more items remain, the *second* item $c$ of the pre-order is the root of the first subtree. Find $c$ in the post-order: the items up to and including $c$ form that subtree (say $k$ items); the next $k$ items of the pre-order after the root are the same set.
+ The items left over (before the root in the post-order) form the second subtree. Recurse on each block.
+ *Ambiguity:* if $c$ is the second-last item of the post-order, nothing is left over: the vertex has *one* child, which may be a left or a right child. Each such vertex doubles the count ($2^s$ trees, AY25/26 Q22).
*Unique iff no vertex has exactly one child.* For a *full* binary tree (given, as in AY23/24 Q24(e), or found, as in AY24/25 Q25(g)) step 4 never occurs: the first block is the left subtree and the rest the right subtree.]

#grid(columns: (1fr, auto), gutter: 14pt,
exam[AY24/25 Q25(g) · AY23/24 Q24(e) · In-order from pre-order and post-order][
*AY24/25 Q25(g).* Pre A M P L I T U D E, post P L M T D E U I A. Root $A$. Next is $M$; in the post-order $M$ ends the block P L M, so the left subtree is ${M, P, L}$ and the right is ${I, T, U, D, E}$. \
Left (pre M P L, post P L M): $M$ with children $P$, $L$. Right (pre I T U D E, post T D E U I): $I$ with left child $T$ (block T) and right subtree pre U D E, post D E U: $U$ with children $D$, $E$. No one-child vertex, so the tree is unique. *In-order: P M L A T I D U E.* \
*AY23/24 Q24(e)* (full binary tree). Pre S U R E C A N D O I T, post E C R A U O I D T N S. Root $S$; left block E C R A U (root $U$: left $R$ with children $E$, $C$; right $A$); right block O I D T N (root $N$: left $D$ with children $O$, $I$; right $T$). *In-order: E R C U A S O D I N T.*],
align(center + horizon, gdraw(
  (([A], 1.7, 2.6), ([M], 0.8, 1.8), ([I], 2.6, 1.8), ([P], 0.3, 1.0), ([L], 1.3, 1.0), ([T], 2.1, 1.0), ([U], 3.1, 1.0), ([D], 2.6, 0.2), ([E], 3.6, 0.2)),
  ((0,1),(0,2),(1,3),(1,4),(2,5),(2,6),(6,7),(6,8)), w: 3.9cm, h: 2.9cm)))

#exam[AY22/23 Q23(e) · AY20/21 Q21(d) · Rebuilding with the in-order][
*AY22/23 Q23(e).* In-order E D B C G F A H K, pre-order C B D E A G F H K. Root $C$; left part E D B is the chain $B$, left child $D$, left child $E$. Right part G F A H K: root $A$; left $G$ with right child $F$; right $H$ with right child $K$. *Post-order: E D B F G K H A C.* \
*AY20/21 Q21(d).* In-order U C A N D O I T Y E H, post-order C U N A T Y I H E O D. Root $D$. Left part U C A N: root $A$, left child $U$ (with right child $C$), right child $N$. Right part O I T Y E H: root $O$ with no left child and right child $E$; $E$ has left child $I$ and right child $H$; $I$ has right child $Y$; $Y$ has left child $T$. (Pre-order: D A U C N O E I Y T H.)]

#defn[Binary search tree (AY23/24 Q24(f)) · Height-balanced binary tree (W13 s7)][
A *binary search tree* (BST) is a binary tree with distinct values at its vertices such that, for every vertex with value $x$, all values in its left subtree are smaller than $x$ and all values in its right subtree are greater than $x$. Its in-order traversal lists the values in increasing order. \
A *height-balanced* binary tree is a binary tree in which, at every vertex, the heights of the left and right subtrees differ by at most 1 (an absent subtree has height $-1$).]

#thm[Catalan numbers count binary trees · Minimum size of a height-balanced tree][
- The number of BSTs on $n$ given values = the number of binary trees with a given in-order = the number of binary tree shapes with $n$ vertices = the *Catalan number*
  $ C_n = ((2n)!) / ((n + 1)! thin n!) = 1 / (n + 1) binom(2n, n): quad 1, 2, 5, 14, 42, 132, dots quad (n = 1, 2, 3, dots). $
  Choosing the root leaves $i$ values on the left and $n - 1 - i$ on the right: $C_n = sum_(i=0)^(n-1) C_i C_(n-1-i)$, $C_0 = 1$.
- *AY23/24 Q24(f):* BSTs with 2, 3, 4 values: *2, 5, 14* (compare T11 Q9).
- *Height-balanced, minimum number of vertices $N(h)$ for height $h$:* a root, a subtree of height $h - 1$ and one of height $h - 2$: $N(h) = 1 + N(h - 1) + N(h - 2)$ with $N(-1) = 0$, $N(0) = 1$, giving $1, 2, 4, 7, 12, 20$. Height 4 needs *12* vertices (AY22/23 Sem 2 Q20, W13 s7).
- *AY23/24 Q24(g)(i):* "a binary tree has $k$ leaves and $k + 1$ internal vertices" is *false* as a general claim; a full binary tree has it the other way round ($k$ internal, $k + 1$ leaves).]

== 52 · Spanning trees and minimum spanning trees

#defn[Spanning tree (L13 s45) · Weighted graph, minimum spanning tree (L13 s48)][
A *spanning tree* for a graph $G$ is a subgraph of $G$ that contains every vertex of $G$ and is a tree. \
A *weighted graph* is a graph in which each edge $e$ has a positive real *weight* $w(e)$; the *total weight* $w(G)$ is the sum of the weights of all edges. A *minimum spanning tree* (MST) for a connected weighted graph is a spanning tree with the least possible total weight.]

#thm[Proposition 10.7.1 (L13 s45)][
(1) Every connected graph has a spanning tree. (2) Any two spanning trees for a graph have the same number of edges ($n - 1$ for $n$ vertices). \
*Counting spanning trees:* if $G$ has exactly one circuit, of length $k$, removing any one of its edges gives a spanning tree: $k$ spanning trees (L13 s46: 3). $K_n$ has $n^(n-2)$.]

#thm[An edge lies in every spanning tree iff it is a bridge (AY23/24 Q24(g)(iii))][
Let $e$ be an edge of a connected graph $G$. Then $e$ is contained in every spanning tree of $G$ iff removing $e$ disconnects $G$.]

#proofb[Bridges and spanning trees][
+ ($arrow.l.double$) Let $e$ be a bridge and suppose a spanning tree $T$ does not contain $e$. Then $T$ is a connected subgraph of $G - e$ containing every vertex, so $G - e$ is connected: contradiction.
+ ($=>$, contrapositive) If $e$ is not a bridge, $G - e$ is connected, so it has a spanning tree $T$ #j[Proposition 10.7.1]. $T$ contains every vertex of $G$, so it is a spanning tree of $G$ that does not contain $e$. #qed]

#grid(columns: (1fr, auto), gutter: 14pt,
tip[Counting spanning trees when there is more than one circuit (T11 Q2 · L13 s46)][
A spanning tree keeps $n - 1$ edges: delete $e - (n - 1)$ edges so that every circuit is broken and the graph stays connected. Bridges are never deleted.
- *Circuits sharing no edge* (they meet only at vertices): delete one edge from each, independently, and *multiply* the circuit lengths. \
  *T11 Q2* (right): the 4-circuit $a d c b$ and the triangle $c f e$ share only the vertex $c$: $4 times 3 =$ *12*.
- *Two circuits sharing an edge* (or a path): split into cases. Shared edge deleted: one large circuit is left, delete any one of its edges. Shared edge kept: delete one other edge from each circuit. \
  A 4-circuit and a triangle sharing an edge: $5 + 3 times 2 = 11$. $quad$ $C_4$ plus a chord: $4 + 2 times 2 = 8$.
- Check on a known value: $K_n$ has $n^(n-2)$ ($K_4$: 16).],
align(center + horizon, gdraw(
  (([a], 0.25, 1.25), ([d], 1.25, 1.25), ([f], 2.25, 1.25), ([b], 0.25, 0.25), ([c], 1.25, 0.25), ([e], 2.25, 0.25)),
  ((0,1),(0,3),(3,4),(1,4),(4,2),(2,5),(4,5)), w: 2.5cm, h: 1.5cm)))

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

#tip[Counting minimum spanning trees when weights tie][
Run Kruskal one weight class at a time. For each weight, look at the edges of that weight that do not close a circuit with *lighter* edges, and count the ways to choose among them; ties in different parts of the graph are independent, so *multiply*. A tie where every tied edge is rejected, or every tied edge is accepted, gives no choice. \
Equivalently: fix the forced edges, then count the spanning trees of what is left of the tied part.]

#exam[AY24/25 Q25(e) · W12 s60 (AY20/21 Sem 2 Q21b) · Number of MSTs][
*AY24/25 Q25(e).* Friendship graph $F_6$; the triangles (spoke, spoke, rim) have weights $(3, 3, 3)$, $(9, 9, 3)$, $(10, 10, 7)$, $(6, 3, 3)$, $(9, 3, 6)$, $(9, 3, 6)$. The triangles share only the centre, so each one independently drops one heaviest edge and keeps the other two. \
(i) Weight $6 + 12 + 17 + 6 + 9 + 9 =$ *59*. $quad$ (ii) Choices of the dropped edge: $3 times 2 times 2 times 1 times 1 times 1 =$ *12* MSTs. \
*W12 s60.* Edges $a b = 1$, $b c = 1$, $a e = 2$, $b e = 2$, $c d = 2$, $b d = 2$, a second $b d = 3$, $d e = 3$. Both edges of weight 1 are taken. Then $e$ is reached by $a e$ or $b e$ (not both: circuit $a b e$) and $d$ by $c d$ or the lighter $b d$ (not both: circuit $b c d$): $2 times 2 =$ *4* MSTs, each of weight 6.]

#grid(columns: (auto, 1fr), gutter: 14pt,
align(center + horizon, gdraw(
  (([a], 0.2, 1.0), ([b], 1.1, 1.8), ([c], 2.3, 1.8), ([d], 1.7, 1.0), ([e], 3.2, 1.0), ([f], 1.1, 0.2), ([g], 2.3, 0.2)),
  ((0,1,3),(1,2,3),(1,3,3),(2,3,3),(2,4,6),(0,3,4),(3,4,6),(0,5,3),(5,3,3),(3,6,2),(6,4,5),(5,6,7)),
  bold: (0, 1, 2, 7, 9, 10), w: 4.4cm, h: 2.6cm, u: 1.28cm)),
exam[T11 Q10 (AY23/24 Sem 2 exam) · Weight and number of MSTs][
Vertices are labelled here for reference. *Kruskal:* $d g$ (2) is taken. Weight 3: the six edges $a b, b c, b d, c d, a f, f d$ form a 4-circuit $a b d f$ and a triangle $b c d$ sharing $b d$; any spanning tree of this part (4 edges) is taken. Then $a d$ (4) is rejected and $g e$ (5) completes the tree; the edges of weight 6 and 7 are never used. \
*(a)* Weight $2 + 4 times 3 + 5 =$ *19*. \
*(b)* The tied part has $5 + 3 times 2 = 11$ spanning trees, so there are 11 MSTs on the labelled graph. Up to isomorphism there are *5*: degree lists $1,1,1,1,2,2,4$; $1,1,1,1,2,3,3$; $1,1,2,2,2,2,2$ (a path); and two different trees with $1,1,1,2,2,2,3$ (longest path of 4 edges, or of 5 edges). One MST is shown in bold.])

#exam[AY20/21 Q21(a) · AY23/24 Q24(a), Q24(g)(ii), Q18(i) · More on spanning trees][
*AY20/21 Q21(a).* Edges $a b$ 62, $b c$ 80, $a d$ 61, $b d$ 29, $b e$ 37, $b g$ 37, $c e$ 70, $d f$ 45, $d g$ 32, $e g$ 9, $e h$ 13, $f g$ 38, $g h$ 12. Kruskal takes ${e, g}$ 9, ${g, h}$ 12, ${b, d}$ 29, ${d, g}$ 32, ${f, g}$ 38, ${a, d}$ 61, ${c, e}$ 70 and rejects 13, both 37s (each closes a circuit), 45, 62, 80. *Weight 251*; the MST is unique in spite of the tie. \
*AY23/24 Q24(a).* From the weight matrix: $w_(1 2) = w_(1 4) = w_(2 4) = 3$, $w_(2 3) = w_(3 4) = 4$, every edge at vertex 5 weighs at least 5 ($w_(1 5) = w_(2 5) = w_(4 5) = 5$), $w_(3 5) = 6$, $w_(1 3) = 8$. Kruskal: two edges of weight 3, one of weight 4, one of weight 5. *Weight 15.* \
*AY23/24 Q24(g)(ii).* With all weights distinct the MST is unique, so Prim and Kruskal give the same tree: *true*. \
*AY23/24 Q18(i).* "Two spanning trees of a graph always share an edge": *false*. In $K_4$ the paths $1, 2, 3, 4$ and $2, 4, 1, 3$ are spanning trees with no common edge.]
