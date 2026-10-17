#import "common.typ": *

#chapter("Chapter 5. Orthogonality, Projection, and Least Squares")

#sec("5.1", "Orthogonality")

#subsec("Orthogonality of Vectors") // Tyrtyshnikov §24.6


An inner product makes it possible to introduce the general notion of orthogonality of vectors: $bf(x)$ and $bf(y)$ are called _orthogonal_ if $bf(x) dot bf(y) = 0$. Notation: $bf(x) perp bf(y)$.

In Sections 5.1–5.3 the inner product is written as the dot product $bf(x) dot bf(y)$ of vectors in $bb(R)^n$. Unless the text says otherwise, the definitions and results hold verbatim in any space with an inner product $ip(bf(x), bf(y))$, real (a _Euclidean_ space, see Section 3.2) or complex (a _unitary_ space), once $bf(x) dot bf(y)$ is replaced by $ip(bf(x), bf(y))$ and $bb(R)^n$ by that space.

Note that in one and the same space an inner product can be introduced in many different ways (for $bb(R)^n$, see Section 3.2), and vectors that are orthogonal with respect to one inner product may fail to be orthogonal with respect to another inner product.

In a Euclidean space, one can also introduce the general notion of the _angle_ $theta = theta(bf(x), bf(y))$ between vectors $bf(x)$ and $bf(y)$. By definition,
$ cos theta = (bf(x) dot bf(y)) / (norm(bf(x)) norm(bf(y))). $
It should be noted that the right-hand side does not exceed $1$ in modulus (by virtue of the Cauchy–Bunyakovsky–Schwarz inequality). For orthogonal vectors, $theta = pi / 2$. For an obvious reason, this definition of angle _does not carry over_ to the case of unitary spaces. However, the notion of orthogonality works, of course, there as well.

#theorem(title: "Pythagorean Theorem")[
  If $bf(x) perp bf(y)$, then $norm(bf(x) + bf(y))^2 = norm(bf(x))^2 + norm(bf(y))^2$.
]

#proof[
  Let $bf(x) dot bf(y) = 0$. Then $(bf(x) + bf(y)) dot (bf(x) + bf(y)) = bf(x) dot bf(x) + bf(x) dot bf(y) + bf(y) dot bf(x) + bf(y) dot bf(y) = bf(x) dot bf(x) + bf(y) dot bf(y)$.
]

#remark[
  In a Euclidean (but not in a unitary!) space, the Pythagorean theorem can be inverted: if $norm(bf(x) + bf(y))^2 = norm(bf(x))^2 + norm(bf(y))^2$, then $bf(x) dot bf(y) = 0$—this is obvious since $bf(x) dot bf(y) + bf(y) dot bf(x) = 2 bf(x) dot bf(y)$. However, in a unitary space the equality $ip(bf(x), bf(y)) + ip(bf(y), bf(x)) = 2 ip(bf(x), bf(y))$ is not true for arbitrary vectors.
]

#subsec("Orthogonal Vectors and Orthogonal Sets", added: true) // added for MA1522: zero-vector convention; orthogonal and orthonormal sets; normalizing an orthogonal set

Since $bf(0) dot bf(v) = 0$ for every $bf(v) in bb(R)^n$, the zero vector is orthogonal to every vector, itself included. If $bf(u) != bf(0)$ and $bf(v) != bf(0)$, then $bf(u) dot bf(v) = 0$ means $cos theta = 0$, that is, $theta = pi \/ 2$. Thus two vectors of $bb(R)^n$ are orthogonal if and only if one of them is the zero vector or they are perpendicular. Clearly, if $bf(u) perp bf(v)$, then $s bf(u) perp t bf(v)$ for all $s, t in bb(R)$.

Recall (Section 3.2) that a _unit vector_ is a vector of norm $1$, and that for $bf(u) != bf(0)$ the unit vector $bf(u) \/ norm(bf(u))$ is obtained by _normalizing_ $bf(u)$.

#definition[
  A set $S = {bf(v)_1, ..., bf(v)_k}$ of vectors in $bb(R)^n$ is _orthogonal_ if its vectors are pairwise orthogonal, $bf(v)_i dot bf(v)_j = 0$ for all $i != j$. It is _orthonormal_ if, for all $i, j = 1, ..., k$,
  $ bf(v)_i dot bf(v)_j = cases(0\, & quad i != j\,, 1\, & quad i = j\,) $
  that is, if $S$ is orthogonal and consists of unit vectors.
]

#indent An orthogonal set in this sense may contain the zero vector; an orthonormal set cannot, since $norm(bf(0)) = 0$. Normalizing each vector of an orthogonal set of nonzero vectors produces an orthonormal set (multiplication by scalars preserves orthogonality); an orthogonal set that contains $bf(0)$ cannot be normalized. The book's own definition in Section 5.2 requires the vectors of an orthogonal set to be nonzero; where this matters we say "an orthogonal set of nonzero vectors".

#example[
  The set ${(1, 2, 2)^T, (2, 1, -2)^T, (2, -2, 1)^T}$ is orthogonal: the three pairwise dot products are $2 + 2 - 4$, $2 - 4 + 2$ and $4 - 2 - 2$, all equal to $0$. It is not orthonormal, since each of its vectors has norm $3$; dividing every vector by $3$ gives an orthonormal set. The set ${(1, 3)^T, (-3, 1)^T, bf(0)}$ in $bb(R)^2$ is orthogonal, but it cannot be normalized.
]

#subsec("Orthogonality of Sets") // Tyrtyshnikov §24.7


Let $L subset bb(R)^n$ be an arbitrary nonempty subset of vectors. A vector $bf(x) in bb(R)^n$ is said to be _orthogonal_ to the set $L$ if $bf(x) dot bf(y) = 0$ for all $bf(y) in L$. Notation: $bf(x) perp L$. By definition, sets $L$ and $M$ are _orthogonal_ if $bf(x) dot bf(y) = 0$ for any $bf(x) in L$ and $bf(y) in M$. Notation: $L perp M$.

The set $M$ of all vectors in $bb(R)^n$, each of which is orthogonal to a given set $L$, is called its _orthogonal complement_ in $bb(R)^n$. Notation: $M = L^perp$.

#proposition[
  For any set $L$, its orthogonal complement $L^perp$ is a subspace. Moreover, $L subset (L^perp)^perp$.
]

#proof[
  Let $bf(x), bf(y) in L^perp$. Then $bf(x) dot bf(z) = bf(y) dot bf(z) = 0 quad forall bf(z) in L => (alpha bf(x) + beta bf(y)) dot bf(z) = alpha (bf(x) dot bf(z)) + beta (bf(y) dot bf(z)) = 0 quad forall bf(z) in L => alpha bf(x) + beta bf(y) in L^perp$.

  By definition, the set $(L^perp)^perp$ contains all vectors orthogonal to $L^perp$, and hence all vectors from the set $L$.
]

#subsec([Orthogonality to a Subspace; $V^perp = Null(bf(A)^T)$], added: true) // added for MA1522: vector orthogonal to a subspace; spanning-set test; V^perp = Null(A^T); Row(A)^perp = Null(A)

Let $V$ be a subspace of $bb(R)^n$. In the notation above, a vector $bf(w)$ is _orthogonal to_ $V$, $bf(w) perp V$, if $bf(w) dot bf(v) = 0$ for every $bf(v) in V$, and the _orthogonal complement_ of $V$ is
$ V^perp = {bf(w) in bb(R)^n : bf(w) dot bf(v) = 0 "for all" bf(v) in V}. $
The zero vector is orthogonal to every subspace. For example, if $bf(a) in bb(R)^n$ is a nonzero vector, the solution set $V = {bf(v) in bb(R)^n : bf(v) dot bf(a) = 0}$ of the single homogeneous equation $a_1 v_1 + ... + a_n v_n = 0$ is a subspace, called a _hyperplane_ (a plane through the origin if $n = 3$), and $bf(a) perp V$; the vector $bf(a)$ is a _normal vector_ of the hyperplane. Thus the plane $a x + b y + c z = 0$ in $bb(R)^3$ consists of the vectors orthogonal to its normal vector $(a, b, c)^T$.

#theorem(title: "Orthogonality Test")[
  Let $S = {bf(u)_1, ..., bf(u)_k}$ be a spanning set for a subspace $V$ of $bb(R)^n$, $span(S) = V$. Then $bf(w) perp V$ if and only if $bf(w) dot bf(u)_i = 0$ for $i = 1, ..., k$.
]

#proof[
  If $bf(w) perp V$, then $bf(w) dot bf(u)_i = 0$ because $bf(u)_i in V$. Conversely, let $bf(w) dot bf(u)_i = 0$ for all $i$. Each $bf(v) in V$ can be written as $bf(v) = c_1 bf(u)_1 + ... + c_k bf(u)_k$, and then $bf(w) dot bf(v) = c_1 (bf(w) dot bf(u)_1) + ... + c_k (bf(w) dot bf(u)_k) = 0$.
]

#indent So, to check that $bf(w) perp V$, it suffices to check that $bf(w)$ is orthogonal to each vector of a spanning set (for example, of a basis) of $V$. These $k$ conditions form one homogeneous linear system.

#theorem(title: [$V^perp = Null(bf(A)^T)$])[
  Let $S = {bf(u)_1, ..., bf(u)_k}$ be a spanning set for a subspace $V$ of $bb(R)^n$, and let $bf(A) = mat(bf(u)_1, bf(u)_2, dots.c, bf(u)_k)$ be the $n times k$ matrix with these columns. Then
  $ bf(w) perp V quad <=> quad bf(A)^T bf(w) = bf(0) quad <=> quad bf(w) in Null(bf(A)^T). $
  Consequently, the orthogonal complement of $V$ is $V^perp = Null(bf(A)^T)$.
]

#proof[
  By block multiplication,
  $ bf(A)^T bf(w) = mat(bf(u)_1^T; dots.v; bf(u)_k^T) bf(w) = mat(bf(u)_1^T bf(w); dots.v; bf(u)_k^T bf(w)) = mat(bf(u)_1 dot bf(w); dots.v; bf(u)_k dot bf(w)), $
  so $bf(A)^T bf(w) = bf(0)$ if and only if $bf(w) dot bf(u)_i = 0$ for all $i$, that is, by the orthogonality test, if and only if $bf(w) perp V$. The set of all such $bf(w)$ is $V^perp$.
]

#algorithm(title: "Orthogonal complement of a subspace")[
  + Choose a spanning set ${bf(u)_1, ..., bf(u)_k}$ of $V$ (for example, a basis) and form the $k times n$ matrix $bf(A)^T$ whose rows are $bf(u)_1^T, ..., bf(u)_k^T$.
  + Reduce $bf(A)^T$ to RREF and write the general solution of the homogeneous system $bf(A)^T bf(w) = bf(0)$.
  + The vectors multiplying the parameters in the general solution form a basis for $V^perp = Null(bf(A)^T)$. A given vector $bf(w)$ is orthogonal to $V$ exactly when $bf(A)^T bf(w) = bf(0)$.
]

#example[
  Let $V = span{(1, 1, 0, 2)^T, (1, 2, 1, 3)^T} subset bb(R)^4$. A vector $bf(w) = (w_1, w_2, w_3, w_4)^T$ is orthogonal to $V$ if and only if $bf(A)^T bf(w) = bf(0)$, where
  $ bf(A)^T = mat(1, 1, 0, 2; 1, 2, 1, 3) stretch(->)^"RREF" mat(1, 0, -1, 1; 0, 1, 1, 1). $
  Hence $w_1 = s - t$, $w_2 = -s - t$, $w_3 = s$, $w_4 = t$ with $s, t in bb(R)$ arbitrary, and
  $ V^perp = span{(1, -1, 1, 0)^T, (-1, -1, 0, 1)^T}. $
]

#corollary[
  For every $m times n$ matrix $bf(A)$,
  $ Row(bf(A))^perp = Null(bf(A)), quad Col(bf(A))^perp = Null(bf(A)^T). $
]

#proof[
  The columns of $bf(A)$ span $Col(bf(A))$, so the theorem gives $Col(bf(A))^perp = Null(bf(A)^T)$. The rows of $bf(A)$ are the columns of $bf(A)^T$, so $Row(bf(A)) = Col(bf(A)^T)$ and $Row(bf(A))^perp = Null((bf(A)^T)^T) = Null(bf(A))$.
]

#subsec("Orthogonal Sum of Subspaces") // Tyrtyshnikov §24.8


Recall that the _sum of subspaces_ $L_1, L_2, ..., L_m$ is the set $L$ of all vectors of the form $bf(x) = bf(x)_1 + bf(x)_2 + ... + bf(x)_m$, where $bf(x)_i in L_i$ for all $i$ (see Tyrtyshnikov, §11.6). It is elementary to verify that $L$ is a subspace. Notation: $L = L_1 + ... + L_m$.

Recall also that $L$ is called a _direct sum_ (see Tyrtyshnikov, §12.4) if the subspaces $L_i$ are nonzero and each vector $bf(x) in L$ has a unique decomposition of the form $bf(x) = bf(x)_1 + ... + bf(x)_m$, where $bf(x)_i in L_i$ (if $bf(x) = bf(x)'_1 + ... + bf(x)'_m$ and $bf(x)'_i in L_i quad forall i$, then necessarily $bf(x)'_i = bf(x)_i quad forall i$).

A sum $L = L_1 + ... + L_m$ of nonzero subspaces is called an _orthogonal sum_ if $L_i perp L_j$ for $i != j$. Notation: $L = L_1 ⊕ ... ⊕ L_m$.

#proposition[
  An orthogonal sum of subspaces $L = L_1 ⊕ ... ⊕ L_m$ is a direct sum. Furthermore, if $bf(x)_i in L_i$, then
  #eq($ norm(bf(x)_1 + ... + bf(x)_m)^2 = norm(bf(x)_1)^2 + ... + norm(bf(x)_m)^2. $, $(*)$)
]

#proof[
  Let us first prove $(*)$. Taking into account that $bf(x)_i dot bf(x)_j = 0$ for $i != j$, we find
  $ norm(bf(x)_1 + ... + bf(x)_m)^2 = sum_(i=1)^m sum_(j=1)^m bf(x)_i dot bf(x)_j = sum_(i=1)^m bf(x)_i dot bf(x)_i = sum_(i=1)^m norm(bf(x)_i)^2. $
  Next, suppose $bf(x)_1 + ... + bf(x)_m = bf(x)'_1 + ... + bf(x)'_m$, where $bf(x)_i, bf(x)'_i in L_i quad forall i$. Then
  $ 0 = norm((bf(x)_1 - bf(x)'_1) + ... + (bf(x)_m - bf(x)'_m))^2 = norm(bf(x)_1 - bf(x)'_1)^2 + ... + norm(bf(x)_m - bf(x)'_m)^2 \
  => quad bf(x)_i = bf(x)'_i quad forall i. $
]

#corollary(title: "1")[
  A finite set of nonzero pairwise orthogonal vectors is linearly independent.
]

#proof[
  Suppose the vectors $bf(x)_1, ..., bf(x)_m$ are pairwise orthogonal and nonzero. Then the sum of the spans $span{bf(x)_1}, ..., span{bf(x)_m}$ is an orthogonal sum and, if $alpha_1 bf(x)_1 + ... + alpha_m bf(x)_m = bf(0)$, then according to $(*)$
  $ 0 = norm(alpha_1 bf(x)_1 + ... + alpha_m bf(x)_m)^2 = abs(alpha_1)^2 norm(bf(x)_1)^2 + ... + abs(alpha_m)^2 norm(bf(x)_m)^2 \
  => quad alpha_1 = ... = alpha_m = 0. $
]

#corollary(title: "2")[
  If nonzero subspaces $L_1, ..., L_m$ are finite-dimensional and pairwise orthogonal, then
  $ dim(L_1 ⊕ ... ⊕ L_m) = dim(L_1) + ... + dim(L_m). $
]

#indent It suffices to recall that for a direct sum of finite-dimensional subspaces $L_i$, a basis is obtained as the union of bases for the subspaces $L_i$ (see Tyrtyshnikov, §12.4).

#sec("5.2", "Orthogonal and Orthonormal Bases")

#subsec("Orthogonal and Orthonormal Sets") // Tyrtyshnikov §25.4


A set $S = {bf(x)_1, ..., bf(x)_n}$ of nonzero vectors is called _orthogonal_ if
#eq($ bf(x)_i dot bf(x)_j = 0, quad i != j, $, $(*)$)
and _orthonormal_ if, in addition, $norm(bf(x)_1) = ... = norm(bf(x)_n) = 1$.#footnote[In MA1522 an orthogonal set may also contain the zero vector; here, as in the definition above, the vectors of an orthogonal set are nonzero.] Thus, the Gram matrix (see Section 5.3) for an orthogonal set is diagonal with positive diagonal entries, and for an orthonormal set it is the identity matrix.

Consider the space $bb(C)^n$ with the natural inner product $ip(bf(x), bf(y)) = bf(y)^* bf(x)$ (real case: $bb(R)^n$ with the dot product, and $bf(X)^T$ in place of $bf(X)^*$ below) and an orthonormal set of column vectors:
$ bf(x)_1 = mat(x_(1 1); dots.v; x_(n 1)), quad ..., quad bf(x)_n = mat(x_(1 n); dots.v; x_(n n)) in bb(C)^n. $
Let us form from them the $n times n$ matrix
$ bf(X) = mat(bf(x)_1, dots.c, bf(x)_n) = mat(
  x_(1 1), ..., x_(1 n);
  dots.h, dots.h, dots.h;
  x_(n 1), ..., x_(n n)
) $
and note that the relations $(*)$ (together with normalization) are equivalent to the matrix equality
$ bf(X)^* bf(X) = mat(
  ip(bf(x)_1, bf(x)_1), ..., ip(bf(x)_n, bf(x)_1);
  dots.h, dots.h, dots.h;
  ip(bf(x)_1, bf(x)_n), ..., ip(bf(x)_n, bf(x)_n)
) = bf(I). $

#indent A matrix $bf(X) in bb(C)^(n times n)$ with the property $bf(X)^* bf(X) = bf(I)$ is called _unitary_. Thus, any square matrix whose columns form an orthonormal set is unitary, and the columns of any unitary matrix form an orthonormal set. It is also clear that for a matrix to be unitary it is necessary and sufficient that its rows form an orthonormal set (prove this!).

A real unitary matrix is called _orthogonal_. In the next subsection we note that the set of all orthogonal matrices of order $n$ is a group under the operation of matrix multiplication. The same holds with respect to the set of all unitary matrices of order $n$.

#subsec("Orthogonal and Orthonormal Bases; Coordinates", added: true) // added for MA1522: orthogonal sets of nonzero vectors are independent; orthogonal/orthonormal bases; coordinates relative to them

By Corollary 1 in Section 5.1 (Orthogonal Sum of Subspaces), _an orthogonal set of nonzero vectors is linearly independent_. Here is a direct argument. Let $bf(u)_1, ..., bf(u)_k$ be nonzero and pairwise orthogonal, and let $c_1 bf(u)_1 + ... + c_k bf(u)_k = bf(0)$. Taking the dot product with $bf(u)_i$, we get
#eq($ 0 = bf(u)_i dot (c_1 bf(u)_1 + ... + c_k bf(u)_k) = c_i (bf(u)_i dot bf(u)_i) = c_i norm(bf(u)_i)^2, $, $(1)$)
so $c_i = 0$ for every $i$. In particular, _every orthonormal set is linearly independent_. (An orthogonal set that contains $bf(0)$ is, of course, linearly dependent.)

#definition[
  Let $V$ be a subspace of $bb(R)^n$. A set $S$ is an _orthogonal basis_ (an _orthonormal basis_) for $V$ if $S$ is a basis for $V$ and $S$ is an orthogonal (an orthonormal) set.
]

#indent Since linear independence is automatic, any orthogonal set of $k$ nonzero vectors in a subspace $V$ of dimension $k$ is an orthogonal basis for $V$ (by the Basis Extension Lemma of Section 3.7, as every basis for $V$ has $k$ vectors). For example, the standard basis $E = {bf(e)_1, ..., bf(e)_n}$ is an orthonormal basis for $bb(R)^n$. The coordinates of a vector relative to an orthogonal basis are found by dot products alone, without solving a linear system.

#theorem(title: "Coordinates Relative to an Orthogonal Basis")[
  Let $S = {bf(u)_1, ..., bf(u)_k}$ be an orthogonal basis for a subspace $V$ of $bb(R)^n$. Then for every $bf(v) in V$
  #eq($ bf(v) = (bf(v) dot bf(u)_1) / norm(bf(u)_1)^2 bf(u)_1 + (bf(v) dot bf(u)_2) / norm(bf(u)_2)^2 bf(u)_2 + ... + (bf(v) dot bf(u)_k) / norm(bf(u)_k)^2 bf(u)_k, $, $(2)$)
  that is, $[bf(v)]_S = ((bf(v) dot bf(u)_1) \/ norm(bf(u)_1)^2, ..., (bf(v) dot bf(u)_k) \/ norm(bf(u)_k)^2)^T$. If $S$ is an orthonormal basis, then
  #eq($ bf(v) = (bf(v) dot bf(u)_1) bf(u)_1 + (bf(v) dot bf(u)_2) bf(u)_2 + ... + (bf(v) dot bf(u)_k) bf(u)_k, quad [bf(v)]_S = mat(bf(v) dot bf(u)_1; dots.v; bf(v) dot bf(u)_k). $, $(3)$)
]

#proof[
  Write $bf(v) = c_1 bf(u)_1 + ... + c_k bf(u)_k$. Exactly as in $(1)$, $bf(v) dot bf(u)_i = c_i norm(bf(u)_i)^2$, whence $c_i = (bf(v) dot bf(u)_i) \/ norm(bf(u)_i)^2$. For an orthonormal basis, $norm(bf(u)_i) = 1$.
]

#indent For the standard basis, $bf(v) dot bf(e)_i = v_i$, and $(3)$ gives $[bf(v)]_E = bf(v)$. The formulas use the orthogonality of $S$ in an essential way: for the basis $S = {(1, 0)^T, (1, 1)^T}$ of $bb(R)^2$ (which is not orthogonal) and $bf(w) = (0, 1)^T$, the right-hand side of $(2)$ equals $0 (1, 0)^T + 1/2 (1, 1)^T = (1\/2, 1\/2)^T != bf(w)$.

#example[
  The vectors $bf(u)_1 = (1, 1, 1)^T$ and $bf(u)_2 = (1, -2, 1)^T$ are orthogonal, so $S = {bf(u)_1, bf(u)_2}$ is an orthogonal basis for $V = span(S)$, the plane $x = z$ in $bb(R)^3$. For $bf(v) = (4, -1, 4)^T in V$ we have $bf(v) dot bf(u)_1 = 7$, $norm(bf(u)_1)^2 = 3$, $bf(v) dot bf(u)_2 = 10$, $norm(bf(u)_2)^2 = 6$; hence
  $ bf(v) = 7/3 bf(u)_1 + 5/3 bf(u)_2, quad [bf(v)]_S = mat(7\/3; 5\/3). $
  For the orthonormal basis $T = {bf(u)_1 \/ sqrt(3), bf(u)_2 \/ sqrt(6)}$ of the same plane, $(3)$ gives $[bf(v)]_T = (7 \/ sqrt(3), 10 \/ sqrt(6))^T$.
]

#subsec("Cartesian Systems and Orthogonal Matrices") // Tyrtyshnikov §20.2


Let $bf(e)_1, bf(e)_2, bf(e)_3$ and $tilde(bf(e))_1, tilde(bf(e))_2, tilde(bf(e))_3$ be the basis vectors of two Cartesian coordinate systems with a common origin. Let us express the vectors of the second system as linear combinations of the vectors of the first system:
$ tilde(bf(e))_1 &= p_(1 1) bf(e)_1 + p_(2 1) bf(e)_2 + p_(3 1) bf(e)_3, \
  tilde(bf(e))_2 &= p_(1 2) bf(e)_1 + p_(2 2) bf(e)_2 + p_(3 2) bf(e)_3, \
  tilde(bf(e))_3 &= p_(1 3) bf(e)_1 + p_(2 3) bf(e)_2 + p_(3 3) bf(e)_3, $
and observe that
$ mat(
  p_(1 1), p_(2 1), p_(3 1);
  p_(1 2), p_(2 2), p_(3 2);
  p_(1 3), p_(2 3), p_(3 3)
) mat(
  p_(1 1), p_(1 2), p_(1 3);
  p_(2 1), p_(2 2), p_(2 3);
  p_(3 1), p_(3 2), p_(3 3)
) = \
= mat(
  tilde(bf(e))_1 dot tilde(bf(e))_1, tilde(bf(e))_1 dot tilde(bf(e))_2, tilde(bf(e))_1 dot tilde(bf(e))_3;
  tilde(bf(e))_2 dot tilde(bf(e))_1, tilde(bf(e))_2 dot tilde(bf(e))_2, tilde(bf(e))_2 dot tilde(bf(e))_3;
  tilde(bf(e))_3 dot tilde(bf(e))_1, tilde(bf(e))_3 dot tilde(bf(e))_2, tilde(bf(e))_3 dot tilde(bf(e))_3
) = mat(1, 0, 0; 0, 1, 0; 0, 0, 1). $
Thus, the transition matrix $bf(P)$ for the bases of two Cartesian coordinate systems satisfies the matrix equality
#eq(
  $ bf(P)^T bf(P) = bf(I). $,
  $(**)$
)
It is also clear that if a transition matrix possesses property $(**)$, then a Cartesian system passes into a Cartesian system.

#definition[
  A square real matrix $bf(P)$ satisfying equality $(**)$ is called _orthogonal_.
]

#indent Orthogonal matrices of order 2 effect the transition between bases of Cartesian systems in the plane. Such, in particular, are the transition matrices implementing a rotation (see Tyrtyshnikov, §19.3).

The definition we have given is also applicable to matrices of order greater than 3. According to $(**)$, for orthogonal matrices of arbitrary order, inversion reduces to transposition:
$ bf(P)^(-1) = bf(P)^T. $
Moreover, the product of two orthogonal matrices remains an orthogonal matrix: if $bf(P)^T bf(P) = bf(Q)^T bf(Q) = bf(I)$, then $(bf(P) bf(Q))^T (bf(P) bf(Q)) = bf(Q)^T (bf(P)^T bf(P)) bf(Q) = bf(Q)^T bf(I) bf(Q) = bf(Q)^T bf(Q) = bf(I)$. Obviously, the identity matrix $bf(I)$ is an orthogonal matrix. Consequently, _the set of all orthogonal matrices of a fixed order forms a group with respect to the operation of matrix multiplication_.

#proposition[
  Let $bf(y) = bf(P) bf(x)$, where $bf(P)$ is an arbitrary orthogonal matrix of order $n$ and $bf(x) in bb(R)^n$. Then the sum of the squares of the entries of the column vector $bf(y)$ equals the sum of the squares of the entries of the column vector $bf(x)$.
]

#proof[
  $y_1^2 + ... + y_n^2 = bf(y)^T bf(y) = (bf(P) bf(x))^T (bf(P) bf(x)) = bf(x)^T (bf(P)^T bf(P)) bf(x) = bf(x)^T bf(x) = x_1^2 + ... + x_n^2$.
]

#corollary[
  Let $bf(B) = bf(P) bf(A) bf(Q)$, where $bf(P), bf(Q)$ are arbitrary orthogonal matrices of order $n$ and $bf(A)$ is an arbitrary real
  matrix of order $n$. Then the sum of the squares of the entries of the matrix $bf(B)$ equals the sum of the squares of the entries of the matrix $bf(A)$.
]

#subsec("Orthogonal Matrices and Orthonormal Columns", added: true) // added for MA1522: Q^T Q and orthogonal/orthonormal columns; A^T = A^(-1); equivalent statements for orthogonal matrices

Let $S = {bf(u)_1, ..., bf(u)_k}$ be vectors in $bb(R)^n$ and $bf(Q) = mat(bf(u)_1, bf(u)_2, dots.c, bf(u)_k)$ the $n times k$ matrix with these columns. By block multiplication, the $(i, j)$-entry of the $k times k$ matrix $bf(Q)^T bf(Q)$ is $bf(u)_i^T bf(u)_j = bf(u)_i dot bf(u)_j$:
$ bf(Q)^T bf(Q) = mat(bf(u)_1^T; dots.v; bf(u)_k^T) mat(bf(u)_1, dots.c, bf(u)_k) = mat(
  bf(u)_1 dot bf(u)_1, dots.c, bf(u)_1 dot bf(u)_k;
  dots.v, dots.down, dots.v;
  bf(u)_k dot bf(u)_1, dots.c, bf(u)_k dot bf(u)_k
) $
(this is the Gram matrix of $bf(u)_1, ..., bf(u)_k$, see Section 5.3). Hence
$ S "is orthogonal" <=> bf(Q)^T bf(Q) "is diagonal", quad quad S "is orthonormal" <=> bf(Q)^T bf(Q) = bf(I)_k. $
In particular, if $k = n$, then $S$ is orthonormal if and only if $bf(Q)^T bf(Q) = bf(I)_n$, that is, $bf(Q)^T = bf(Q)^(-1)$. The course takes the latter equality as the definition.

#definition[
  A square matrix $bf(A)$ of order $n$ is _orthogonal_ if $bf(A)^T = bf(A)^(-1)$, equivalently, $bf(A)^T bf(A) = bf(I) = bf(A) bf(A)^T$.
]

#indent This agrees with the definition in the preceding subsection, which asks only for $bf(A)^T bf(A) = bf(I)$: for a square matrix this equality already implies $bf(A)^T = bf(A)^(-1)$. Indeed, $det(bf(A))^2 = det(bf(A)^T) det(bf(A)) = det(bf(I)) = 1$, so $bf(A)$ is invertible (Sections 2.6 and 2.10), and multiplying $bf(A)^T bf(A) = bf(I)$ on the right by $bf(A)^(-1)$ gives $bf(A)^T = bf(A)^(-1)$.

#theorem[
  For a square matrix $bf(A)$ of order $n$ the following statements are equivalent:
  #[
    #set enum(numbering: "(i)")
    + $bf(A)$ is an orthogonal matrix;
    + the columns of $bf(A)$ form an orthonormal basis for $bb(R)^n$;
    + the rows of $bf(A)$ form an orthonormal basis for $bb(R)^n$.
  ]
]

#proof[
  By the computation above (with $bf(Q) = bf(A)$ and $k = n$), the columns of $bf(A)$ form an orthonormal set if and only if $bf(A)^T bf(A) = bf(I)$, that is, if and only if $bf(A)$ is orthogonal; and $n$ orthonormal vectors in $bb(R)^n$ are linearly independent and therefore form a basis for $bb(R)^n$. This proves (i) $<=>$ (ii). The rows of $bf(A)$ are the columns of $bf(A)^T$, and $bf(A)$ is orthogonal if and only if $bf(A)^T$ is, since $(bf(A)^T)^T bf(A)^T = bf(A) bf(A)^T$. Applying (i) $<=>$ (ii) to $bf(A)^T$ gives (i) $<=>$ (iii).
]

#example[
  Consider the matrices
  $ bf(A) = 1/3 mat(1, 2, 2; 2, 1, -2; 2, -2, 1), quad bf(B) = mat(1, 2; 2, -1), quad bf(Q) = 1/3 mat(1, 2; 2, 1; 2, -2). $
  The columns of $bf(A)$ form the orthonormal set obtained in Section 5.1, so $bf(A)$ is orthogonal: $bf(A)^T bf(A) = bf(A) bf(A)^T = bf(I)_3$. The columns of $bf(B)$ are orthogonal, but $bf(B)^T bf(B) = 5 bf(I)_2$, so $bf(B)$ is not orthogonal; matrices whose columns are merely orthogonal are given no special name. The $3 times 2$ matrix $bf(Q)$ has orthonormal columns, $bf(Q)^T bf(Q) = bf(I)_2$, but it is not square, hence not an orthogonal matrix; indeed $bf(Q) bf(Q)^T != bf(I)_3$, since $rank(bf(Q) bf(Q)^T) <= 2$.
]

#remark[
  Some books call a square matrix with $bf(A)^T = bf(A)^(-1)$ an _orthonormal matrix_; the course, like most of the literature, calls it orthogonal.
]

#sec("5.3", "Orthogonal Projection")

#subsec("Gram Matrix") // Tyrtyshnikov §25.1


Suppose we are given vectors $bf(v)_1, ..., bf(v)_n$ in a space with an inner product $ip(dot, dot)$, and let
$ bf(x) = alpha_1 bf(v)_1 + ... + alpha_n bf(v)_n, quad bf(y) = beta_1 bf(v)_1 + ... + beta_n bf(v)_n. $
Then a direct calculation yields
#eq($ ip(bf(x), bf(y)) = sum_(i=1)^n overline(beta_i) (sum_(j=1)^n ip(bf(v)_j, bf(v)_i) alpha_j) = bf(b)^* bf(G) bf(a), $, $(*)$)
where
$ bf(G) = bf(G)(bf(v)_1, ..., bf(v)_n) = mat(
  ip(bf(v)_1, bf(v)_1), ..., ip(bf(v)_n, bf(v)_1);
  dots.h, dots.h, dots.h;
  ip(bf(v)_1, bf(v)_n), ..., ip(bf(v)_n, bf(v)_n)
), quad
bf(a) = mat(alpha_1; dots.v; alpha_n), quad
bf(b) = mat(beta_1; dots.v; beta_n). $
The matrix $bf(G)$ formed from the inner products of the vectors $bf(v)_1, ..., bf(v)_n$ is called their _Gram matrix_.#footnote[Note that the entry in position $i, j$ has the form $ip(bf(v)_j, bf(v)_i)$. Often $bf(G)^T$ is called the Gram matrix (in the real case, of course, $bf(G)^T = bf(G)$).] In the real case (in particular, in $bb(R)^n$ with the dot product), $(*)$ reads $bf(x) dot bf(y) = bf(b)^T bf(G) bf(a)$ with $bf(G) = (bf(v)_j dot bf(v)_i)$, and $bf(a)^*$ below becomes $bf(a)^T$.

#theorem(title: "Gram Matrix Theorem")[
  Vectors $bf(v)_1, ..., bf(v)_n$ are linearly dependent if and only if their Gram matrix is not invertible.
]

#proof[
  Let $bf(x) = alpha_1 bf(v)_1 + ... + alpha_n bf(v)_n$. Using $(*)$ for $bf(x) = bf(y)$, we find
  #eq($ ip(bf(x), bf(x)) = bf(a)^* bf(G) bf(a), quad bf(a) = (alpha_1, ..., alpha_n)^T. $, $(\#)$)
  If $bf(G)$ is not invertible, then there exists a column $bf(a) != bf(0)$ such that $bf(G) bf(a) = bf(0) => bf(x) = bf(0) =>$ the vectors $bf(v)_1, ..., bf(v)_n$ are linearly dependent.

  Conversely, if these vectors are linearly dependent, then $bf(x) = bf(0)$ for some $bf(a) != bf(0)$. It is easy to see that $bf(G) bf(a) = (ip(bf(x), bf(v)_1), ..., ip(bf(x), bf(v)_n))^T = bf(0)$
  is a nontrivial linear combination of the columns of the matrix $bf(G)$ that is equal to zero $=>$ the columns of $bf(G)$ are linearly dependent $=>$ $bf(G)$ is not invertible.
]

#problem(number: 1)[
  In a space with an inner product, two sets of vectors are given: $bf(u)_1, ..., bf(u)_m$ and $bf(v)_1, ..., bf(v)_m$. Suppose that $L^perp inter M = {bf(0)}$, where $L$ and $M$ are the spans of the vectors of the first and second sets. Prove that at least one of these sets is linearly dependent if and only if the $m times m$ matrix $bf(A)$ with entries $a_(i j) = ip(bf(v)_j, bf(u)_i)$ is not invertible.
]

#subsec("Orthogonal Projection and Best Approximation") // Tyrtyshnikov §25.3


Let $L$ be a subspace of $bb(R)^n$ of dimension $m$. We already know (see Tyrtyshnikov, §23.6) that for any $bf(x) in bb(R)^n$ there exists an element of best approximation $bf(z)_0 in L$—such that $norm(bf(x) - bf(z)_0) <= norm(bf(x) - bf(z))$ for all $bf(z) in L$. In this special case—for a norm induced by an inner product—uniqueness of $bf(z)_0$ holds, and there is a very simple way of obtaining it.

We proceed from the assumption that a basis ${bf(z)_1, ..., bf(z)_m}$ for $L$ is given. Then
$ bf(z)_0 = alpha_1 bf(z)_1 + ... + alpha_m bf(z)_m. $
Let us find the coefficients $alpha_1, ..., alpha_m$ from the condition
$ bf(x) - bf(z)_0 perp L quad <=> quad (bf(x) - bf(z)_0) dot bf(z)_1 = 0, ..., (bf(x) - bf(z)_0) dot bf(z)_m = 0 quad <=> \
<=> quad cases(
  alpha_1 (bf(z)_1 dot bf(z)_1) + ... + alpha_m (bf(z)_m dot bf(z)_1) = bf(x) dot bf(z)_1\,,
  alpha_1 (bf(z)_1 dot bf(z)_2) + ... + alpha_m (bf(z)_m dot bf(z)_2) = bf(x) dot bf(z)_2\,,
  dots.h.c,
  alpha_1 (bf(z)_1 dot bf(z)_m) + ... + alpha_m (bf(z)_m dot bf(z)_m) = bf(x) dot bf(z)_m.
) $
Obviously, we have a linear system whose coefficient matrix coincides with the Gram matrix $bf(G) = bf(G)(bf(z)_1, ..., bf(z)_m)$ of the vectors $bf(z)_1, ..., bf(z)_m$. By the Gram matrix theorem for linearly independent vectors, it is invertible $=>$ the linear system in $alpha_1, ..., alpha_m$ has a unique solution $=>$ the vector $bf(z)_0$ subject to the condition $bf(x) - bf(z)_0 perp L$ exists and is unique.

The vector $bf(x)_n equiv bf(x) - bf(z)_0$ in the case $bf(x)_n perp L$, $bf(z)_0 in L$ is called the _perpendicular_ dropped from $bf(x)$ onto $L$, and $bf(x)_p equiv bf(z)_0$ is called the _orthogonal projection_ (or just _projection_) of the vector $bf(x)$ onto $L$. Thus, $bf(x) = bf(x)_p + bf(x)_n$ with $bf(x)_p in L$ and $bf(x)_n perp L$.

#theorem(title: "Orthogonal Projection Theorem")[
  For any vector $bf(x)$ and any finite-dimensional subspace $L$, there exist a unique perpendicular $bf(x)_n perp L$ and a unique projection $bf(x)_p in L$ such that $bf(x) = bf(x)_p + bf(x)_n$. Moreover,
  $ norm(bf(x)_n) = norm(bf(x) - bf(x)_p) < norm(bf(x) - bf(z)) quad forall bf(z) in L, quad bf(z) != bf(x)_p. $
]

#proof[
  It remains to prove only that $bf(x)_p$ is the uniquely determined element of best approximation in $L$ for the vector $bf(x)$. Let $bf(z)$ be an arbitrary vector in $L$. Then $bf(x) - bf(z) = (bf(x) - bf(x)_p) + (bf(x)_p - bf(z))$, where $bf(x) - bf(x)_p perp L$ and $bf(x)_p - bf(z) in L$. From this it follows that $bf(x) - bf(x)_p$ and $bf(x)_p - bf(z)$ are the perpendicular and the orthogonal projection onto $L$ for the vector $bf(x) - bf(z)$. By the Pythagorean theorem,
  $ norm(bf(x) - bf(z))^2 = norm(bf(x) - bf(x)_p)^2 + norm(bf(x)_p - bf(z))^2 quad => quad norm(bf(x) - bf(x)_p) < norm(bf(x) - bf(z)) quad forall bf(z) != bf(x)_p. $
]

#corollary[
  If $L$ is a finite-dimensional subspace, then $L = (L^perp)^perp$.
]

#proof[
  We already know that $L subset (L^perp)^perp$ (see Section 5.1). Take $bf(x) in (L^perp)^perp$ and drop the perpendicular $bf(x)_n$ from it onto $L$. By the definition of the orthogonal complement, $bf(x)_n in L^perp$. At the same time, $bf(x)_n perp L^perp => bf(x)_n dot bf(x)_n = 0 => bf(x)_n = bf(0)$. Consequently, $bf(x) in L => (L^perp)^perp subset L$.
]

#problem(number: 2)[
  Let $L$ and $M$ be subspaces in a finite-dimensional space $V$ with an inner product. Are the equalities $L^perp inter M = {bf(0)}$ and $L inter M^perp = {bf(0)}$ equivalent?
]

#problem(number: 3)[
  In $bb(R)^n$, vectors $bf(a)_1, ..., bf(a)_(n + 1)$ are such that $bf(a)_i dot bf(a)_j < 0$ for $i != j$. Prove that any $n$ of them are linearly independent.
]

#problem(number: 4)[
  Prove that in $bb(R)^n$, any set of $n + 2$ vectors contains a pair of vectors whose inner product is nonnegative.
]

#problem(number: 5)[
  Let $P_n$ be the vector space of all real polynomials of degree at most $n$ with the inner product $ip(f, g) = integral_(-1)^1 f(t) g(t) dif t$. Prove that the distance from the polynomial $x^n$ to the subspace $P_(n - 1)$ does not exceed $sqrt(2) / 2^n$.
]

#subsec("Projection Formula for an Orthogonal Basis", added: true) // added for MA1522: orthogonal projection theorem with the explicit formula; best approximation theorem

In the notation of the course, the orthogonal projection theorem reads: _if $V$ is a subspace of $bb(R)^n$, then every $bf(w) in bb(R)^n$ can be written uniquely as $bf(w) = bf(w)_p + bf(w)_n$ with $bf(w)_p in V$ and $bf(w)_n perp V$_; the vector $bf(w)_p$ is the _orthogonal projection_ (or _projection_) of $bf(w)$ onto $V$. The second part of the theorem is the _best approximation theorem_: $bf(w)_p$ is the vector of $V$ closest to $bf(w)$,
#eq($ norm(bf(w) - bf(w)_p) <= norm(bf(w) - bf(v)) quad "for all" bf(v) in V, $, $(1)$)
with equality only for $bf(v) = bf(w)_p$. An orthogonal basis for $V$ makes the projection explicit: the Gram matrix of an orthogonal basis is diagonal, and the linear system for the coefficients of $bf(w)_p$ splits into separate equations.

#theorem(title: "Orthogonal Projection Formula")[
  Let $S = {bf(u)_1, ..., bf(u)_k}$ be an orthogonal basis for a subspace $V$ of $bb(R)^n$. Then for every $bf(w) in bb(R)^n$
  #eq($ bf(w)_p = (bf(w) dot bf(u)_1) / (bf(u)_1 dot bf(u)_1) bf(u)_1 + (bf(w) dot bf(u)_2) / (bf(u)_2 dot bf(u)_2) bf(u)_2 + ... + (bf(w) dot bf(u)_k) / (bf(u)_k dot bf(u)_k) bf(u)_k. $, $(2)$)
  If $S$ is orthonormal, then $bf(w)_p = (bf(w) dot bf(u)_1) bf(u)_1 + (bf(w) dot bf(u)_2) bf(u)_2 + ... + (bf(w) dot bf(u)_k) bf(u)_k$.
]

#proof[
  Denote the right-hand side of $(2)$ by $bf(z)$; clearly $bf(z) in V$. Since $bf(u)_i dot bf(u)_j = 0$ for $i != j$,
  $ (bf(w) - bf(z)) dot bf(u)_j = bf(w) dot bf(u)_j - (bf(w) dot bf(u)_j) / (bf(u)_j dot bf(u)_j) (bf(u)_j dot bf(u)_j) = 0, quad j = 1, ..., k, $
  so $bf(w) - bf(z) perp V$ by the orthogonality test of Section 5.1. By the uniqueness of the decomposition, $bf(z) = bf(w)_p$ (and $bf(w) - bf(z) = bf(w)_n$).
]

#indent Several facts follow at once. The right-hand side of $(2)$ does not depend on the choice of the orthogonal basis for $V$, because $bf(w)_p$ is unique. For $k = 1$, $(2)$ is the projection of $bf(w)$ onto the line spanned by a nonzero vector $bf(u)$, namely $bf(w)_p = (bf(w) dot bf(u)) \/ (bf(u) dot bf(u)) thin bf(u)$. If $bf(w) in V$, then $bf(w)_p = bf(w)$ and $bf(w)_n = bf(0)$, and $(2)$ turns into the coordinate formula of Section 5.2. The distance from $bf(w)$ to $V$ is $norm(bf(w)_n) = norm(bf(w) - bf(w)_p)$.

#example[
  Let $V$ be the plane $x = z$ in $bb(R)^3$ with the orthogonal basis $bf(u)_1 = (1, 1, 1)^T$, $bf(u)_2 = (1, -2, 1)^T$ (Section 5.2), and let $bf(w) = (1, 2, 5)^T$. Then $bf(w) dot bf(u)_1 = 8$ and $bf(w) dot bf(u)_2 = 2$, so
  $ bf(w)_p = 8/3 bf(u)_1 + 2/6 bf(u)_2 = mat(3; 2; 3), quad bf(w)_n = bf(w) - bf(w)_p = mat(-2; 0; 2). $
  Indeed, $bf(w)_n dot bf(u)_1 = bf(w)_n dot bf(u)_2 = 0$. The vector of $V$ closest to $bf(w)$ is $(3, 2, 3)^T$, and the distance from $bf(w)$ to $V$ is $norm(bf(w)_n) = 2 sqrt(2)$.
]

#subsec("Gram–Schmidt Process") // Tyrtyshnikov §25.5


From the orthogonal projection theorem it immediately follows that in any finite-dimensional space $V$ with an inner product (for example, in any subspace of $bb(R)^m$) there exists an orthonormal basis.

Indeed, let us take an arbitrary basis ${bf(v)_1, ..., bf(v)_n}$ for $V$ and assume that for the span $L_(n - 1) = span{bf(v)_1, ..., bf(v)_(n - 1)}$ an orthonormal basis ${bf(q)_1, ..., bf(q)_(n - 1)}$ has already been constructed (of course, $L_(n - 1) = span{bf(q)_1, ..., bf(q)_(n - 1)}$). Let $bf(h)_n$ be the perpendicular dropped from the vector $bf(v)_n$ onto $L_(n - 1)$. Clearly, $bf(h)_n != bf(0)$ (otherwise $bf(v)_n in L_(n - 1) =>$ the vectors $bf(v)_1, ..., bf(v)_n$ are linearly dependent). Set $bf(q)_n = bf(h)_n / norm(bf(h)_n)$. Then ${bf(q)_1, ..., bf(q)_n}$ will be the desired orthonormal basis for $V$.

Note that in the constructed basis, for any $k = 1, ..., n$, the first $k$ vectors $bf(q)_1, ..., bf(q)_k$ form an orthonormal basis for the span $L_k = span{bf(v)_1, ..., bf(v)_k}$. Thus,
$ span{bf(q)_1, ..., bf(q)_k} = span{bf(v)_1, ..., bf(v)_k}, quad k = 1, ..., n. $

#indent Actual computations begin with obtaining the vector $bf(q)_1 = bf(v)_1 / norm(bf(v)_1)$. Then from the vector $bf(v)_2$ the perpendicular $bf(h)_2$ is dropped onto $L_1$ and normalized: $bf(q)_2 = bf(h)_2 / norm(bf(h)_2)$. And so on. When dropping the perpendicular onto $L_k$, it is reasonable to seek the expansion of the corresponding projection not in terms of the original vectors $bf(v)_1, ..., bf(v)_k$, but in terms of the already constructed orthonormal set $bf(q)_1, ..., bf(q)_k$. The advantage is obvious: the Gram matrix for $bf(q)_1, ..., bf(q)_k$ is the identity matrix!

This algorithm is called the _Gram–Schmidt process_. Here is its formal description:
$ bf(h)_k = bf(v)_k - sum_(i=1)^(k - 1) (bf(v)_k dot bf(q)_i) bf(q)_i, quad bf(q)_k = bf(h)_k / norm(bf(h)_k), quad k = 1, ..., n. $

#problem(number: 6)[
  In the space of real polynomials, an inner product $ip(f, g)$ is defined in an arbitrary manner, but so that for any polynomials $f(x)$ and $g(x)$ the equality#footnote[Verify that it holds, for example, if the inner product is given by the formula $ip(f, g) = integral_(-1)^1 f(x) g(x) dif x$. In this case, the resulting orthogonal polynomials are called _Legendre polynomials_.]
  $ ip(x f(x), g(x)) = ip(f(x), x g(x)) $
  holds, and suppose that applying the Gram–Schmidt process to the polynomials $1, x, x^2, ..., x^n$ yields polynomials
  $L_0 (x), L_1 (x), ..., L_n (x)$. Prove that the three-term recurrence relations
  $ L_k (x) = a_k x L_(k - 1)(x) + b_k L_(k - 1)(x) + c_k L_(k - 2)(x), \
    2 <= k <= n, quad a_k, b_k, c_k in bb(R), $
  hold.
]

#subsec("Gram–Schmidt Process: Orthogonal Form", added: true) // added for MA1522: Gram–Schmidt algorithm in the course's form; dependent input

In the course, the Gram–Schmidt process first produces an orthogonal set and postpones normalization to the end, which avoids square roots in the intermediate steps. Let $S = {bf(u)_1, ..., bf(u)_k}$ be a linearly independent set in $bb(R)^n$.

#algorithm(title: "Gram–Schmidt process")[
  + Set $bf(v)_1 = bf(u)_1$.
  + For $j = 2, ..., k$ set
    #eq($ bf(v)_j = bf(u)_j - (bf(v)_1 dot bf(u)_j) / norm(bf(v)_1)^2 bf(v)_1 - (bf(v)_2 dot bf(u)_j) / norm(bf(v)_2)^2 bf(v)_2 - ... - (bf(v)_(j - 1) dot bf(u)_j) / norm(bf(v)_(j - 1))^2 bf(v)_(j - 1). $, $(3)$)
  + Normalize: $bf(q)_j = bf(v)_j \/ norm(bf(v)_j)$, $j = 1, ..., k$.
]

#theorem[
  The vectors $bf(v)_1, ..., bf(v)_k$ are nonzero and pairwise orthogonal, and
  $ span{bf(v)_1, ..., bf(v)_j} = span{bf(u)_1, ..., bf(u)_j}, quad j = 1, ..., k. $
  Hence ${bf(v)_1, ..., bf(v)_k}$ is an orthogonal basis and ${bf(q)_1, ..., bf(q)_k}$ is an orthonormal basis for $span(S)$.
]

#proof[
  We use induction on $j$; for $j = 1$ there is nothing to prove. Suppose $bf(v)_1, ..., bf(v)_(j - 1)$ are nonzero, pairwise orthogonal, and span $V_(j - 1) = span{bf(u)_1, ..., bf(u)_(j - 1)}$; then they form an orthogonal basis for $V_(j - 1)$. By $(2)$, the vector subtracted from $bf(u)_j$ in $(3)$ is the projection $bf(p)$ of $bf(u)_j$ onto $V_(j - 1)$, so $bf(v)_j = bf(u)_j - bf(p) perp V_(j - 1)$; in particular, $bf(v)_j$ is orthogonal to $bf(v)_1, ..., bf(v)_(j - 1)$. If $bf(v)_j = bf(0)$, then $bf(u)_j = bf(p) in V_(j - 1)$, which contradicts the linear independence of $S$. Finally, $bf(v)_j in span{bf(u)_j, bf(v)_1, ..., bf(v)_(j - 1)} = span{bf(u)_1, ..., bf(u)_j}$ and $bf(u)_j = bf(v)_j + bf(p) in span{bf(v)_1, ..., bf(v)_j}$, which gives the equality of the spans.
]

#indent This is the process of the preceding subsection written differently: if the vectors denoted there by $bf(v)_1, bf(v)_2, ...$ (the input) are our $bf(u)_1, bf(u)_2, ...$, then our $bf(v)_j$ are exactly the perpendiculars $bf(h)_j$, since $(bf(v)_i dot bf(u)_j) \/ norm(bf(v)_i)^2 thin bf(v)_i = (bf(u)_j dot bf(q)_i) bf(q)_i$ with $bf(q)_i = bf(v)_i \/ norm(bf(v)_i)$, and the $bf(q)_j$ are the same orthonormal vectors. In hand computations one may replace any $bf(v)_j$ by a positive multiple (for instance, to clear fractions) before continuing: the terms of $(3)$ in the later steps and the vectors $bf(q)_j$ do not change.

If the process is applied to a set $S$ that is not known to be linearly independent, the same argument shows that $bf(v)_j = bf(0)$ exactly when $bf(u)_j in span{bf(u)_1, ..., bf(u)_(j - 1)}$. Such zero vectors are discarded (they must not enter $(3)$ in the later steps), and the remaining nonzero $bf(v)_j$ form an orthogonal basis for $span(S)$. For instance, $bf(v)_4 = bf(0)$ means that $bf(u)_4$ is a linear combination of $bf(u)_1, bf(u)_2, bf(u)_3$, so that $S$ is linearly dependent.

#example[
  Apply the process to $bf(u)_1 = (1, 2, 2)^T$, $bf(u)_2 = (1, 0, 1)^T$, $bf(u)_3 = (0, 0, 1)^T$:
  $ bf(v)_1 &= (1, 2, 2)^T, \
    bf(v)_2 &= bf(u)_2 - 3/9 bf(v)_1 = (2\/3, -2\/3, 1\/3)^T, \
    bf(v)_3 &= bf(u)_3 - 2/9 bf(v)_1 - (1\/3)/1 bf(v)_2 = (-4\/9, -2\/9, 4\/9)^T. $
  Since $norm(bf(v)_1) = 3$, $norm(bf(v)_2) = 1$ and $norm(bf(v)_3) = 2\/3$, the resulting orthonormal basis for $bb(R)^3$ is
  $ bf(q)_1 = 1/3 mat(1; 2; 2), quad bf(q)_2 = 1/3 mat(2; -2; 1), quad bf(q)_3 = 1/3 mat(-2; -1; 2). $
]

#subsec("Completion to an Orthogonal Basis") // Tyrtyshnikov §25.6


Let $V$ be a space of dimension $n$ with an inner product (for example, $V = bb(R)^n$ with the dot product).

#lemma(title: "Completion to an Orthogonal Basis")[
  Any orthogonal (orthonormal) set of vectors $bf(v)_1, ..., bf(v)_k in V$ can be completed by some vectors from $V$ to an orthogonal (orthonormal) basis for $V$.
]

#proof[
  Complete $bf(v)_1, ..., bf(v)_k$ by some vectors to a basis for $V$, and then apply the Gram–Schmidt process to the resulting basis.
]

#corollary[
  If $L_k$ is a subspace of dimension $k$, then $dim(L_k^perp) = n - k$. Moreover,
  $ V = L_k ⊕ L_k^perp. $
]

#proof[
  In $V$ there exists an orthonormal basis ${bf(q)_1, ..., bf(q)_n}$ such that $L_k = span{bf(q)_1, ..., bf(q)_k}$. It is then obvious that any vector orthogonal to $L_k$ is a linear combination of the vectors $bf(q)_(k + 1), ..., bf(q)_n$.
]

#sec("5.4", "QR Factorization")

#subsec([QR Factorization of a Matrix]) // Tyrtyshnikov §25.8


Suppose $bf(A) in bb(C)^(n times m)$ has linearly independent columns $bf(a)_1, ..., bf(a)_m in bb(C)^n$, and the Gram–Schmidt process is applied to them using the natural inner product (real case: $bf(A) in bb(R)^(n times m)$ and the dot product in $bb(R)^n$). Suppose that as a result we obtain orthonormal vectors $bf(q)_1, ..., bf(q)_m in bb(C)^n$.

The relations $bf(a)_k in span{bf(q)_1, ..., bf(q)_k}$ hold for $k = 1, ..., m$ and mean that for some numbers $r_(i k)$ we have the equalities
$ bf(a)_k = sum_(i=1)^k r_(i k) bf(q)_i, quad k = 1, ..., m, $
or, in matrix form,
$ bf(A) = bf(Q) bf(R), quad bf(Q) = mat(bf(q)_1, dots.c, bf(q)_m), quad bf(R) = mat(
  r_(1 1), r_(1 2), ..., r_(1 m);
  , r_(2 2), ..., r_(2 m);
  , , dots.down, dots.v;
  0, , , r_(m m)
). $

#definition[
  A factorization $bf(A) = bf(Q) bf(R)$, where $bf(Q)$ has orthonormal columns and $bf(R)$ is an upper triangular matrix, is called a _QR factorization_ of the matrix $bf(A)$.#footnote[MA1522 defines the QR factorization only for a matrix with linearly independent columns, and requires in addition that $bf(R)$ be invertible with positive diagonal entries; the definition here is broader.]
]

#indent Thus, we have just proved that _for any rectangular matrix with linearly independent columns there exists a QR factorization_. In particular, it exists for any invertible matrix. In fact, a more general result holds.

#theorem[
  Any rectangular matrix in which the number of rows is not less than the number of columns possesses a QR factorization with a matrix $bf(R)$ in row-echelon form.
]

#proof[
  Let $bf(a)_(i_1)$ be the first nonzero column of the matrix $bf(A)$, $bf(a)_(i_2)$ be the first column such that $bf(a)_(i_2) notin span{bf(a)_(i_1)}$, $bf(a)_(i_3)$ be the first column such that $bf(a)_(i_3) notin span{bf(a)_(i_1), bf(a)_(i_2)}$, and so on. As a result, we obtain in $bf(A)$ columns
  $ bf(a)_(i_1), ..., bf(a)_(i_r), quad i_1 < i_2 < ... < i_r, $
  forming a basis for $Col(bf(A))$ and possessing the following properties:
  $ bf(a)_j &= bf(0) && "for " j < i_1; \
    bf(a)_j &in span{bf(a)_(i_1), ..., bf(a)_(i_l)} && "for " i_l < j < i_(l + 1), quad l = 1, ..., r - 1; \
    bf(a)_j &in span{bf(a)_(i_1), ..., bf(a)_(i_r)} && "for " i_r < j. $
  Let us find the QR factorization:
  $ mat(bf(a)_(i_1), dots.c, bf(a)_(i_r)) = mat(bf(q)_(i_1), dots.c, bf(q)_(i_r)) bf(R)_r. $
  Let us complete the columns $bf(q)_(i_1), ..., bf(q)_(i_r)$ to an orthonormal basis for the $n$-dimensional space of columns, and from the resulting columns form the matrix $bf(Q)$, keeping the initial columns in positions $i_1, ..., i_r$.

  Writing $bf(A) = bf(Q) bf(R)$, we see that in the matrix $bf(R)$ the first $r$ entries of the $i_l$-th column are the same as in the $l$-th column of the matrix $bf(R)_r$. At the same time, the $j$-th column for $i_l < j < i_(l + 1)$ has zeros in positions below the $i_l$-th.
]

#problem(number: 1)[
  Suppose $bf(A) in bb(C)^(n times n)$ has columns $bf(a)_1, ..., bf(a)_n in bb(C)^n$. Prove the inequality
  $ abs(det(bf(A))) <= product_(j=1)^n norm(bf(a)_j). $
]

#problem(number: 2)[
  Let $bf(A)$ be a matrix of order $n$ with entries $a_(i j) = plus.minus 1$. Prove that if $abs(det(bf(A))) = n^(n / 2)$ (such matrices are called _Hadamard matrices_) and $n >= 3$, then $n$ is divisible by $4$.
]

#subsec("Computing a QR Factorization", added: true) // added for MA1522: QR theorem in the course's form; R = Q^T A; QR algorithm; A^T A invertible and left inverse

In the course, the QR factorization is considered for matrices with linearly independent columns and is normalized as follows.

#theorem(title: "QR Factorization")[
  Let $bf(A)$ be an $m times n$ matrix with linearly independent columns, that is, $rank(bf(A)) = n$. Then
  $ bf(A) = bf(Q) bf(R), $
  where $bf(Q)$ is an $m times n$ matrix with $bf(Q)^T bf(Q) = bf(I)_n$ (its columns are orthonormal) and $bf(R)$ is an invertible upper triangular matrix of order $n$ with positive diagonal entries. Such a decomposition is called a _QR factorization_ of $bf(A)$.
]

#proof[
  Let $bf(A) = mat(bf(a)_1, bf(a)_2, dots.c, bf(a)_n)$, let $bf(v)_1, ..., bf(v)_n$ and $bf(q)_1, ..., bf(q)_n$ be the vectors produced from $bf(a)_1, ..., bf(a)_n$ by the Gram–Schmidt process (Section 5.3), and let $bf(Q) = mat(bf(q)_1, bf(q)_2, dots.c, bf(q)_n)$; then $bf(Q)^T bf(Q) = bf(I)_n$ (Section 5.2). Since $(bf(v)_i dot bf(a)_j) \/ norm(bf(v)_i)^2 thin bf(v)_i = (bf(q)_i dot bf(a)_j) bf(q)_i$ and $bf(v)_j = norm(bf(v)_j) bf(q)_j$, the Gram–Schmidt formula can be rewritten as
  $ bf(a)_j = (bf(q)_1 dot bf(a)_j) bf(q)_1 + ... + (bf(q)_(j - 1) dot bf(a)_j) bf(q)_(j - 1) + norm(bf(v)_j) bf(q)_j, quad j = 1, ..., n. $
  Thus $bf(A) = bf(Q) bf(R)$, where $bf(R) = (r_(i j))$ is upper triangular with $r_(i j) = bf(q)_i dot bf(a)_j$ for $i < j$ and $r_(j j) = norm(bf(v)_j) > 0$. Finally, $bf(R)$ is invertible: if $bf(R) bf(x) = bf(0)$, then $bf(A) bf(x) = bf(Q) bf(R) bf(x) = bf(0)$, whence $bf(x) = bf(0)$ because the columns of $bf(A)$ are linearly independent; so the columns of the square matrix $bf(R)$ are linearly independent, and $bf(R)$ is invertible (Section 2.6).
]

#indent Since $bf(Q)^T bf(Q) = bf(I)_n$, multiplying $bf(A) = bf(Q) bf(R)$ on the left by $bf(Q)^T$ gives
$ bf(R) = bf(Q)^T bf(A), $
in agreement with $r_(i j) = bf(q)_i dot bf(a)_j$. (The entries $bf(q)_i dot bf(a)_j$ with $i > j$ vanish, since $bf(a)_j in span{bf(q)_1, ..., bf(q)_j}$.) This gives a practical procedure for an $m times n$ matrix $bf(A)$ with linearly independent columns.

#algorithm(title: "QR factorization")[
  + Apply the Gram–Schmidt process to the columns $bf(a)_1, ..., bf(a)_n$ of $bf(A)$ to obtain an orthonormal set ${bf(q)_1, ..., bf(q)_n}$.
  + Set $bf(Q) = mat(bf(q)_1, bf(q)_2, dots.c, bf(q)_n)$.
  + Compute $bf(R) = bf(Q)^T bf(A)$. Then $bf(A) = bf(Q) bf(R)$.
]

#example[
  Let
  $ bf(A) = mat(1, 3, 0; 1, 1, 2; 1, 3, 2; 1, 1, 0). $
  The Gram–Schmidt process applied to the columns of $bf(A)$ gives
  $ bf(v)_1 = mat(1; 1; 1; 1), quad bf(v)_2 = bf(a)_2 - 8/4 bf(v)_1 = mat(1; -1; 1; -1), quad bf(v)_3 = bf(a)_3 - 4/4 bf(v)_1 - 0/4 bf(v)_2 = mat(-1; 1; 1; -1). $
  All three vectors have norm $2$, so
  $ bf(Q) = 1/2 mat(1, 1, -1; 1, -1, 1; 1, 1, 1; 1, -1, -1), quad bf(R) = bf(Q)^T bf(A) = mat(2, 4, 2; 0, 2, 0; 0, 0, 2), $
  and one checks directly that $bf(Q) bf(R) = bf(A)$.
]

#corollary[
  Let $bf(A)$ be an $m times n$ matrix with linearly independent columns. Then $bf(A)^T bf(A)$ is invertible, and $bf(A)$ has a left inverse: there is an $n times m$ matrix $bf(B)$ such that $bf(B) bf(A) = bf(I)_n$.
]

#proof[
  Let $bf(A) = bf(Q) bf(R)$ be a QR factorization. Then $bf(A)^T bf(A) = bf(R)^T bf(Q)^T bf(Q) bf(R) = bf(R)^T bf(R)$ is a product of invertible matrices and hence invertible (Section 2.4). As $bf(B)$ one can take $bf(R)^(-1) bf(Q)^T$, since $bf(R)^(-1) bf(Q)^T bf(Q) bf(R) = bf(R)^(-1) bf(R) = bf(I)_n$; this matrix coincides with $(bf(A)^T bf(A))^(-1) bf(A)^T = (bf(R)^T bf(R))^(-1) bf(R)^T bf(Q)^T$.
]

#remark[
  The invertibility of $bf(A)^T bf(A)$ can also be seen without the QR factorization. If $bf(A)^T bf(A) bf(x) = bf(0)$, then $norm(bf(A) bf(x))^2 = bf(x)^T bf(A)^T bf(A) bf(x) = 0$, so $bf(A) bf(x) = bf(0)$. Hence $Null(bf(A)^T bf(A)) = Null(bf(A))$ for every matrix $bf(A)$, and the square matrix $bf(A)^T bf(A)$ is invertible if and only if the columns of $bf(A)$ are linearly independent.
]

#sec("5.5", "Least Squares Approximation")

#subsec("Method of Least Squares") // Tyrtyshnikov §35.5


If a linear system $bf(A) bf(x) = bf(b)$ is inconsistent, then the equality $bf(A) bf(x) = bf(b)$ does not hold for any vector $bf(x)$. In this case, nevertheless, one tries to consider those $bf(x)$ for which the vector $bf(b) - bf(A) bf(x)$ (it is called the _residual_ for $bf(x)$) has the minimum possible norm. A vector $bf(x)$ is called a _least squares solution_ of the system $bf(A) bf(x) = bf(b)$ if
$ norm(bf(b) - bf(A) bf(x)) = min_(bf(z)) norm(bf(b) - bf(A) bf(z)). $

#indent In this method of defining a "generalized solution," in the real case one is indeed dealing with the minimum value of the sum of squares (whence the name of the method)
$ norm(bf(b) - bf(A) bf(x))^2 = sum_(i=1)^m (b_i - a_(i 1) x_1 - ... - a_(i n) x_n)^2. $

#indent Below, the formulas are written for the real case; for a complex matrix $bf(A)$, every transpose ($bf(A)^T$, $bf(V)^T$, $bf(u)_k^T$) is to be replaced by the conjugate transpose ($bf(A)^*$, $bf(V)^*$, $bf(u)_k^*$).

#proposition[
  Let $bf(A)$ be an $m times n$ matrix of rank $r$. The set of least squares solutions of the system $bf(A) bf(x) = bf(b)$ is an affine set of dimension $n - r$, that is, a translate $bf(x)_0 + W$ of a subspace $W$ of dimension $n - r$.
]

#proof[
  Let $bf(b)_n$ be the perpendicular dropped from the vector $bf(b)$ onto the subspace $Col(bf(A))$, and let $bf(b)_p in Col(bf(A))$ be the corresponding orthogonal projection. Then the system $bf(A) bf(z) = bf(b)_p$ is consistent, and if $bf(z)$ is an arbitrary solution of it, then $norm(bf(b)_n) = norm(bf(b) - bf(A) bf(z)) < norm(bf(b) - bf(A) bf(x))$ for all $bf(x)$ such that $bf(A) bf(x) != bf(b)_p$. Hence, the set of least squares solutions coincides with the set of solutions of the consistent system $bf(A) bf(z) = bf(b)_p$.
]

#corollary[
  The set of least squares solutions of the system $bf(A) bf(x) = bf(b)$ coincides with the set of solutions of the system $bf(A)^T bf(A) bf(x) = bf(A)^T bf(b)$ (the _normal equation_).
]

#proof[
  $bf(b) - bf(A) bf(z) perp Col(bf(A)) <=> bf(A)^T (bf(b) - bf(A) bf(z)) = bf(0)$.
]

#indent Among all least squares solutions, the one of minimal norm, $hat(bf(x))$, stands out—it is called the _least squares solution of minimum norm_. Geometrically, it is clear that $hat(bf(x))$ is the perpendicular dropped onto $Null(bf(A))$ from any particular solution $bf(z)$ of the consistent system $bf(A) bf(z) = bf(b)_p$ (the vector $bf(b)_p$ is the orthogonal projection of the vector $bf(b)$ onto $Col(bf(A))$). Thus, _the least squares solution of minimum norm exists and is unique._

The singular value decomposition (see Section 6.5) makes it possible to give an explicit form of the least squares solution of minimum norm. Let $bf(A) = bf(U) bf(Sigma) bf(V)^T$ be a singular value decomposition, where $sigma_1 >= ... >= sigma_r > 0$ are the nonzero singular values of $bf(A)$, and $bf(u)_k$ and $bf(v)_k$ are the columns of $bf(U)$ and $bf(V)$ (the left and right singular vectors). Then
#eq($ hat(bf(x)) = sum_(k=1)^r (bf(u)_k^T bf(b)) / sigma_k bf(v)_k. $, $(*)$)
For the proof it suffices to verify that $bf(b) - bf(A) hat(bf(x)) perp Col(bf(A))$ and $hat(bf(x)) perp Null(bf(A))$.

The simplicity of the formula should not create the impression that there are no problems in computing $hat(bf(x))$. The main problem, properly speaking, is that in the case $r < min(m, n)$ the rank $r$ can be increased by an arbitrarily small perturbation of the entries of the matrix, which means that the least squares solution of minimum norm, despite the fact of its existence and uniqueness, is not a continuous function of the entries of the matrix $bf(A)$. For example, let $m = n = 1$ and consider the system $0 dot.c x = 1$. Its least squares solution of minimum norm is obviously $hat(x) = 0$, whereas the least squares solution of minimum norm of the perturbed system $epsilon dot.c x = 1$ is $hat(x)(epsilon) = 1 / epsilon$. As we see, $hat(x)(epsilon)$ does not tend to $hat(x)$ as $epsilon -> 0$. The very problem of computing such an unstable object does not seem terribly meaningful.

At the same time, problems of this kind constantly arise in applications, and some methods for solving them are required of us. When constructing such methods, one should bear in mind that they must be, above all, _methods for modifying the very formulation_
_of the problem_. Such questions are connected with the so-called _regularization methods_.#footnote[The general theory of regularization methods was created by the founder of the Faculty of Computational Mathematics and Cybernetics at Moscow State University, Academician Andrei Nikolaevich Tikhonov.]

#problem(number: 1)[
  Find the least squares solution of minimum norm of the inconsistent system
  $ x_1 + x_2 + ... + x_n = 1, $
  $ x_1 + x_2 + ... + x_n = 0. $
]

#subsec("Computing Least Squares Solutions", added: true) // added for MA1522: LS solution <=> Au = projection of b <=> normal equation; uniqueness; LS via QR; projection A (A^T A)^(-1) A^T w

Let $bf(A)$ be an $m times n$ matrix and $bf(b) in bb(R)^m$. Recall that $Col(bf(A)) = {bf(A) bf(u) : bf(u) in bb(R)^n}$ is precisely the set of vectors $bf(b)$ for which $bf(A) bf(x) = bf(b)$ is consistent (Sections 2.3 and 4.1). If $bf(b) in.not Col(bf(A))$, one looks for $bf(u)$ such that $bf(A) bf(u)$ is as close to $bf(b)$ as possible: in the form used in the course, $bf(u) in bb(R)^n$ is a _least squares solution_ of $bf(A) bf(x) = bf(b)$ if
$ norm(bf(A) bf(u) - bf(b)) <= norm(bf(A) bf(v) - bf(b)) quad "for every" bf(v) in bb(R)^n, $
which is the definition given above.

#theorem[
  For a vector $bf(u) in bb(R)^n$ the following statements are equivalent:
  #[
    #set enum(numbering: "(i)")
    + $bf(u)$ is a least squares solution of $bf(A) bf(x) = bf(b)$;
    + $bf(A) bf(u)$ is the orthogonal projection of $bf(b)$ onto $Col(bf(A))$;
    + $bf(u)$ is a solution of the normal equation $bf(A)^T bf(A) bf(x) = bf(A)^T bf(b)$.
  ]
]

#proof[
  (i) $<=>$ (ii). As $bf(v)$ runs over $bb(R)^n$, the vector $bf(A) bf(v)$ runs over $Col(bf(A))$. By the best approximation theorem (Section 5.3), the projection $bf(b)_p$ of $bf(b)$ onto $Col(bf(A))$ is the unique vector of $Col(bf(A))$ closest to $bf(b)$; so $bf(u)$ minimizes $norm(bf(A) bf(u) - bf(b))$ if and only if $bf(A) bf(u) = bf(b)_p$. (This is the argument in the proof of the proposition above.)

  (ii) $<=>$ (iii). Since $bf(A) bf(u) in Col(bf(A))$, we have $bf(A) bf(u) = bf(b)_p$ if and only if $bf(b) - bf(A) bf(u) perp Col(bf(A))$, that is, since $Col(bf(A))^perp = Null(bf(A)^T)$ (Section 5.1), if and only if $bf(A)^T (bf(b) - bf(A) bf(u)) = bf(0)$, which is $bf(A)^T bf(A) bf(u) = bf(A)^T bf(b)$.
]

#indent Consequently, least squares solutions always exist, because the normal equation is always consistent, and the vector $bf(A) bf(u) = bf(b)_p$ is the same for all least squares solutions $bf(u)$. The least squares solution itself need not be unique: if $bf(u)_0$ is one of them, all of them form the set $bf(u)_0 + Null(bf(A))$ (Section 4.2), in agreement with the proposition above. If the system $bf(A) bf(x) = bf(b)$ is consistent, then $bf(b) in Col(bf(A))$, $bf(b)_p = bf(b)$, and its least squares solutions are exactly its solutions.

#theorem[
  If the columns of $bf(A)$ are linearly independent, that is, $rank(bf(A)) = n$, then $bf(A) bf(x) = bf(b)$ has a unique least squares solution
  $ bf(u) = (bf(A)^T bf(A))^(-1) bf(A)^T bf(b). $
  If, moreover, $bf(A) = bf(Q) bf(R)$ is a QR factorization, then $bf(u) = bf(R)^(-1) bf(Q)^T bf(b)$; that is, $bf(u)$ is the solution of the upper triangular system $bf(R) bf(x) = bf(Q)^T bf(b)$, which is found by back substitution.
]

#proof[
  By the corollary in Section 5.4, $bf(A)^T bf(A)$ is invertible, so the normal equation has the unique solution $(bf(A)^T bf(A))^(-1) bf(A)^T bf(b)$. If $bf(A) = bf(Q) bf(R)$, then $bf(A)^T bf(A) = bf(R)^T bf(R)$ and $bf(A)^T bf(b) = bf(R)^T bf(Q)^T bf(b)$, and multiplying $bf(R)^T bf(R) bf(u) = bf(R)^T bf(Q)^T bf(b)$ on the left by $(bf(R)^T)^(-1)$ gives $bf(R) bf(u) = bf(Q)^T bf(b)$.
]

#example(title: "Non-Unique Least Squares Solutions")[
  Let
  $ bf(A) = mat(1, 1, 2; 1, -1, 0; 1, 1, 2; 1, -1, 0), quad bf(b) = mat(2; 0; 4; 2). $
  The system $bf(A) bf(x) = bf(b)$ is inconsistent: its first and third equations have the same left-hand side but different right-hand sides. For the normal equation,
  $ (bf(A)^T bf(A) | bf(A)^T bf(b)) = mat(4, 0, 4, 8; 0, 4, 4, 4; 4, 4, 8, 12; augment: #3) stretch(->)^"RREF" mat(1, 0, 1, 2; 0, 1, 1, 1; 0, 0, 0, 0; augment: #3), $
  so the least squares solutions are $bf(u) = (2, 1, 0)^T + t (-1, -1, 1)^T$, $t in bb(R)$; there are infinitely many of them, as $rank(bf(A)) = 2 < 3$. For every one of them $bf(A) bf(u) = (3, 1, 3, 1)^T = bf(b)_p$, and the least possible value of $norm(bf(A) bf(u) - bf(b))$ is $norm((1, 1, -1, -1)^T) = 2$.
]

#example(title: "A Unique Least Squares Solution")[
  The matrix $bf(A)$ of the example in Section 5.4 has linearly independent columns. For $bf(b) = (1, 2, 3, 4)^T$, the QR factorization found there gives $bf(Q)^T bf(b) = (5, -1, 0)^T$, and back substitution in
  $ bf(R) bf(x) = mat(2, 4, 2; 0, 2, 0; 0, 0, 2) mat(x_1; x_2; x_3) = mat(5; -1; 0) $
  yields $x_3 = 0$, $x_2 = -1\/2$, $x_1 = 7\/2$. Thus $bf(u) = (7\/2, -1\/2, 0)^T$ is the unique least squares solution, and $bf(b)_p = bf(A) bf(u) = (2, 3, 2, 3)^T$. The same $bf(u)$ is obtained from the normal equation $bf(A)^T bf(A) bf(x) = bf(A)^T bf(b)$, where
  $ bf(A)^T bf(A) = mat(4, 8, 4; 8, 20, 8; 4, 8, 8), quad bf(A)^T bf(b) = mat(10; 18; 10). $
]

#indent Least squares also give the orthogonal projection onto a subspace for which only an arbitrary (not necessarily orthogonal) basis is known.

#theorem[
  Let $V$ be a subspace of $bb(R)^n$ with a basis ${bf(u)_1, ..., bf(u)_k}$, and let $bf(A) = mat(bf(u)_1, bf(u)_2, dots.c, bf(u)_k)$. Then the orthogonal projection of a vector $bf(w) in bb(R)^n$ onto $V$ is
  $ bf(w)_p = bf(A) (bf(A)^T bf(A))^(-1) bf(A)^T bf(w). $
  If the basis is orthonormal, then $bf(A)^T bf(A) = bf(I)_k$ and $bf(w)_p = bf(A) bf(A)^T bf(w)$.
]

#proof[
  Here $Col(bf(A)) = V$, and the columns of $bf(A)$ are linearly independent. By the preceding theorem, $bf(u) = (bf(A)^T bf(A))^(-1) bf(A)^T bf(w)$ is the least squares solution of $bf(A) bf(x) = bf(w)$, and by the first theorem of this subsection, $bf(A) bf(u)$ is the projection of $bf(w)$ onto $Col(bf(A)) = V$. For an orthonormal basis, $bf(A)^T bf(A) = bf(I)_k$ (Section 5.2).
]

#example[
  The vectors $(1, 1, 1)^T$ and $(2, 0, 2)^T$ form a (non-orthogonal) basis for the plane $x = z$ in $bb(R)^3$ considered in Section 5.3. With
  $ bf(A) = mat(1, 2; 1, 0; 1, 2), quad bf(A)^T bf(A) = mat(3, 4; 4, 8), quad bf(A) (bf(A)^T bf(A))^(-1) bf(A)^T = 1/2 mat(1, 0, 1; 0, 2, 0; 1, 0, 1), $
  the projection of $bf(w) = (w_1, w_2, w_3)^T$ onto the plane is
  $ bf(w)_p = 1/2 mat(w_1 + w_3; 2 w_2; w_1 + w_3). $
  For $bf(w) = (1, 2, 5)^T$ this is $(3, 2, 3)^T$, as found in Section 5.3 with an orthogonal basis.
]

#subsec("Pseudoinverse Matrix", beyond: true) // Tyrtyshnikov §35.6


Formula $(*)$ for the least squares solution of minimum norm can also be written in the form
$ hat(bf(x)) = bf(M) bf(b), quad bf(M) = bf(V) mat(1/sigma_1, , , ; , dots.down, , ; , , 1/sigma_r, ; , , , 0) bf(U)^T. $
The matrix $bf(M)$ is called the _pseudoinverse_ (or _Moore–Penrose pseudoinverse_) of the matrix $bf(A)$. By virtue of the uniqueness of the least squares solution of minimum norm, the pseudoinverse matrix is uniquely determined by the matrix $bf(A)$. Notation: $bf(M) = bf(A)^+$.

#problem(number: 2)[
  Let $bf(A)$ be an arbitrary rectangular matrix and $bf(A)^+$ its pseudoinverse matrix. Prove that the following relations hold:
  $ (bf(A) bf(A)^+)^T = bf(A) bf(A)^+, quad (bf(A)^+ bf(A))^T = bf(A)^+ bf(A), quad bf(A) bf(A)^+ bf(A) = bf(A), quad bf(A)^+ bf(A) bf(A)^+ = bf(A)^+. $
  Prove also that $bf(A)^+$ is the unique matrix satisfying this system of equations.
]
