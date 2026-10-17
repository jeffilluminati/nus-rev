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

#subsec("Orthogonal Sum of Subspaces") // Tyrtyshnikov §24.8


Recall that the _sum of subspaces_ $L_1, L_2, ..., L_m$ is the set $L$ of all vectors of the form $bf(x) = bf(x)_1 + bf(x)_2 + ... + bf(x)_m$, where $bf(x)_i in L_i$ for all $i$ (see Section 3.4). It is elementary to verify that $L$ is a subspace. Notation: $L = L_1 + ... + L_m$.

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

#subsec("Pseudoinverse Matrix", beyond: true) // Tyrtyshnikov §35.6


Formula $(*)$ for the least squares solution of minimum norm can also be written in the form
$ hat(bf(x)) = bf(M) bf(b), quad bf(M) = bf(V) mat(1/sigma_1, , , ; , dots.down, , ; , , 1/sigma_r, ; , , , 0) bf(U)^T. $
The matrix $bf(M)$ is called the _pseudoinverse_ (or _Moore–Penrose pseudoinverse_) of the matrix $bf(A)$. By virtue of the uniqueness of the least squares solution of minimum norm, the pseudoinverse matrix is uniquely determined by the matrix $bf(A)$. Notation: $bf(M) = bf(A)^+$.

#problem(number: 2)[
  Let $bf(A)$ be an arbitrary rectangular matrix and $bf(A)^+$ its pseudoinverse matrix. Prove that the following relations hold:
  $ (bf(A) bf(A)^+)^T = bf(A) bf(A)^+, quad (bf(A)^+ bf(A))^T = bf(A)^+ bf(A), quad bf(A) bf(A)^+ bf(A) = bf(A), quad bf(A)^+ bf(A) bf(A)^+ = bf(A)^+. $
  Prove also that $bf(A)^+$ is the unique matrix satisfying this system of equations.
]
