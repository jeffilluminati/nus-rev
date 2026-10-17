#import "common.typ": *

#chapter("Chapter 6. Eigenanalysis")

#sec("6.1", "Eigenvalues and Eigenvectors")

#subsec("Eigenvalues and Eigenvectors") // Tyrtyshnikov §29.2


Let $bf(A)$ be a matrix of order $n$ and let $bf(P)$ be an invertible matrix with columns $bf(p)_1, ..., bf(p)_n$. It is easy to see that the equality $bf(A) bf(P) = bf(P) bf(D)$, where $bf(D) = diag(lambda_1, ..., lambda_n)$, is equivalent to the system of equalities
$ bf(A) bf(p)_j = lambda_j bf(p)_j, quad j = 1, ..., n. $
These equalities lead us to the important concepts of an eigenvalue of a matrix and an eigenvector.

#definition[
  Let $bf(A)$ be a matrix of order $n$. A scalar $lambda in bb(C)$ and a nonzero vector $bf(v) in bb(C)^n$ related by $bf(A) bf(v) = lambda bf(v)$ are called an _eigenvalue_ and an _eigenvector_ of the matrix $bf(A)$ (an eigenvector _associated to_ $lambda$). The pair $lambda, bf(v)$ is sometimes called an _eigenpair_ of the matrix $bf(A)$.
]

#indent In MA1522 the matrix $bf(A)$ is real, and only real eigenvalues $lambda in bb(R)$, with eigenvectors $bf(v) in bb(R)^n$, are considered.

#theorem[
  A matrix $bf(A)$ of order $n$ is diagonalizable (see Section 6.2) if and only if it has $n$ linearly independent eigenvectors.
]

#proof[
  Let $bf(p)_1, ..., bf(p)_n$ be linearly independent eigenvectors of the matrix $bf(A)$ associated to eigenvalues $lambda_1, ..., lambda_n$:
  $ bf(A) bf(p)_j = lambda_j bf(p)_j, quad j = 1, ..., n quad <=> quad bf(A) bf(P) = bf(P) mat(lambda_1, , ; , dots.down, ; , , lambda_n), quad bf(P) = mat(bf(p)_1, dots.c, bf(p)_n). $
  The matrix $bf(P)$ is invertible—as a matrix with linearly independent columns.
]

#indent An example of a non-diagonalizable matrix: $bf(A) = mat(0, 1; 0, 0)$. Suppose that
$ mat(p_(1 1), p_(1 2); p_(2 1), p_(2 2))^(-1) mat(0, 1; 0, 0) mat(p_(1 1), p_(1 2); p_(2 1), p_(2 2)) = mat(lambda_1, 0; 0, lambda_2) quad => $
$ => quad mat(0, 1; 0, 0) mat(p_(1 1), p_(1 2); p_(2 1), p_(2 2)) = mat(p_(1 1), p_(1 2); p_(2 1), p_(2 2)) mat(lambda_1, 0; 0, lambda_2). $
From this,
$ mat(p_(2 1), p_(2 2); 0, 0) = mat(p_(1 1) lambda_1, p_(1 2) lambda_2; p_(2 1) lambda_1, p_(2 2) lambda_2). $
At least one of the numbers $lambda_1, lambda_2$ must be nonzero. Suppose for definiteness that $lambda_1 != 0 => p_(2 1) = 0 => p_(1 1) = 0$. We obtain a contradiction, since a matrix with a zero column cannot be invertible. $square.stroked$

#subsec("The Characteristic Equation") // Tyrtyshnikov §29.4


Let $lambda$ be an arbitrary eigenvalue of a matrix $bf(A)$. For a fixed $lambda$, all eigenvectors $bf(v)$ associated to it satisfy the homogeneous linear system
$ (lambda bf(I) - bf(A)) bf(v) = bf(0). $
A scalar $lambda$ is an eigenvalue of the matrix $bf(A)$ $<=>$ this system has a nontrivial solution $<=>$ $det(lambda bf(I) - bf(A)) = 0$.

#definition[
  The equation $det(x bf(I) - bf(A)) = 0$ in $x$ is called the _characteristic equation_ of the matrix $bf(A)$. The left-hand side of this equation is a polynomial of degree $n$ in $x$, called the _characteristic polynomial_ of the matrix $bf(A)$ and denoted $char(bf(A)) = det(x bf(I) - bf(A))$.
]

#indent The full textbook uses $det(bf(A) - lambda bf(I))$ instead; the two polynomials differ by the factor $(-1)^n$ and have the same roots.

#proposition[
  The characteristic polynomial of a matrix $bf(A)$ has the form
  $ char(bf(A)) = x^n - s_(n - 1) x^(n - 1) + s_(n - 2) x^(n - 2) - ... + (-1)^n s_0, $
  where $s_k$ is the sum of all $(n - k) times (n - k)$ minors of the matrix $bf(A)$ (determinants of $(n - k) times (n - k)$ submatrices) located at the intersection of columns and rows with identical indices.
]

#proof[
  To obtain the coefficient of $x^k$, one must select among the $n!$ terms of the determinant
  $ det(x bf(I) - bf(A)) = sum_(sigma in S_n) d_sigma $
  those and only those terms $d_sigma$ that contain a product of exactly $k$ diagonal entries of the form $x - a_(i i)$ (they and only they are polynomials of degree $k$ in $x$), extract in each of them the leading-degree term of the form $x^k c_sigma$, and sum the resulting coefficients $c_sigma$. Obviously, the sum of all $c_sigma$ corresponding to $k$ diagonal entries in fixed positions $i_1 < ... < i_k$ is equal to the determinant of the submatrix of $-bf(A)$ located in the rows and columns complementary to the rows and columns with indices $i_1, ..., i_k$, that is, to $(-1)^(n - k)$ times the corresponding $(n - k) times (n - k)$ minor of $bf(A)$. Hence the coefficient of $x^k$ is $(-1)^(n - k) s_k$.
]

#indent In particular, $s_(n - 1) = a_(1 1) + ... + a_(n n)$ is the quantity called the _trace_ of the matrix $bf(A)$. Notation: $tr(bf(A))$. By Vieta's formulas, the trace equals the sum of all eigenvalues counting multiplicities. Note also that $s_0 = det(bf(A))$.

For $n <= 4$, the eigenvalues (as roots of a polynomial of degree $n <= 4$) can be expressed in radicals in terms of the coefficients of the characteristic polynomial and, consequently, in terms of the entries of the matrix. For $n >= 5$, such formulas no longer exist (the celebrated result of Abel, Ruffini, and Galois).

#subsec("Algebraic Multiplicity of an Eigenvalue") // Tyrtyshnikov §29.5


The multiplicity of an eigenvalue $lambda$ as a root of the characteristic polynomial is called its _algebraic multiplicity_ and is denoted $r_lambda$: it is the largest integer $r_lambda$ such that $char(bf(A)) = (x - lambda)^(r_lambda) p(x)$ for some polynomial $p(x)$.

From the fundamental theorem of algebra we immediately obtain the following theorem.

#theorem[
  Every complex matrix $bf(A)$ of order $n$ has $n$ complex eigenvalues counting algebraic multiplicities.
]

#subsec("Characteristic Polynomial and Similarity") // Tyrtyshnikov §29.6


#theorem[
  The characteristic polynomials of similar matrices coincide.
]

#proof[
  Let $bf(B) = bf(P)^(-1) bf(A) bf(P)$, where $bf(P)$ is an invertible matrix. Then
  $ det(x bf(I) - bf(B)) &= det(x bf(P)^(-1) bf(P) - bf(P)^(-1) bf(A) bf(P)) = det(bf(P)^(-1) (x bf(I) - bf(A)) bf(P)) = \
  &= det(bf(P)^(-1)) det(bf(P)) det(x bf(I) - bf(A)) = det(bf(P)^(-1) bf(P)) det(x bf(I) - bf(A)) = \
  &= det(x bf(I) - bf(A)). $
]

#corollary[
  The eigenvalues and their algebraic multiplicities for similar matrices coincide.
]

#problem(number: 1)[
  Find the characteristic polynomial of the matrix
  $ bf(A) = mat(
    0, 1, , ;
    , dots.down, dots.down, ;
    , , dots.down, 1;
    1, , , 0
  )_(n times n). $
]

#problem(number: 2)[
  Let $bf(A)$ and $bf(B)$ be square matrices of the same order. Prove that $bf(A) bf(B)$ and $bf(B) bf(A)$ have the same characteristic polynomials.
]

#subsec("Geometric Multiplicity of an Eigenvalue") // Tyrtyshnikov §30.2


Fix an eigenvalue $lambda$ of a linear transformation $T: V -> V$ (that is, $T(bf(v)) = lambda bf(v)$ for some $bf(v) != bf(0)$) and consider the set $E_lambda$ of all vectors $bf(v) in V$ such that $T(bf(v)) = lambda bf(v)$.

#proposition[
  The set $E_lambda$ is a subspace invariant under $T$.
]

#proof[
  Let $bf(u), bf(v) in E_lambda => T(bf(u)) = lambda bf(u), T(bf(v)) = lambda bf(v) => T(alpha bf(u) + beta bf(v)) = lambda (alpha bf(u) + beta bf(v)) => alpha bf(u) + beta bf(v) in E_lambda$. The invariance of $E_lambda$ is obvious: if $bf(v) in E_lambda$, then $T(bf(v)) = lambda bf(v) in E_lambda$.
]

#definition[
  The subspace $E_lambda$ is called the _eigenspace_ associated to $lambda$, and its dimension $dim(E_lambda)$ is called the _geometric multiplicity_ of the eigenvalue $lambda$.
]

#indent For a square matrix $bf(A)$ of order $n$, regarded as the linear transformation $T(bf(u)) = bf(A) bf(u)$ of $bb(R)^n$, the eigenspace is $E_lambda = {bf(v) in bb(R)^n | bf(A) bf(v) = lambda bf(v)} = Null(lambda bf(I) - bf(A))$, and the geometric multiplicity of $lambda$ is $dim(E_lambda) = nullity(lambda bf(I) - bf(A))$.

#sec("6.2", "Diagonalization")

#subsec("Similarity Transformation") // Tyrtyshnikov §28.4


Let $T: V -> V$ be a linear transformation of an $n$-dimensional vector space $V$ and let $bf(A)$ be its matrix when one and the same basis of $V$ is chosen for the images and the preimages. In this case, the study of the transformation $T$ reduces completely to the study of its matrix $bf(A)$.

It is natural to try to choose a basis in such a way that the matrix $bf(A)$ acquires the "simplest possible" form. If a linear transformation $T$ is given by its matrix $bf(A)$ in some basis, then choosing a new basis gives for the same transformation another matrix $bf(B)$, which will be similar to the given matrix (see Section 7.1). The transition from $bf(A)$ to a matrix $bf(B) = bf(P)^(-1) bf(A) bf(P)$ similar to it is called a _similarity transformation_.

The following question arises: to what "simplest possible" form can a given matrix be reduced by means of a similarity transformation? In effect, we are now beginning a not-so-simple journey toward a complete answer to this question.

#subsec("Diagonalizable Matrices") // Tyrtyshnikov §29.1


Matrices similar to diagonal matrices are called _diagonalizable_ (the full textbook also calls them _matrices of simple structure_). Thus a square matrix $bf(A)$ is diagonalizable if there exists an invertible matrix $bf(P)$ such that $bf(P)^(-1) bf(A) bf(P) = bf(D)$ is a diagonal matrix, or, equivalently, $bf(A) = bf(P) bf(D) bf(P)^(-1)$.

Consider the problem of diagonalizing a $(3 times 3)$-matrix:
$ bf(A) bf(P) = bf(P) bf(D) quad <=> quad mat(a_(1 1), a_(1 2), a_(1 3); a_(2 1), a_(2 2), a_(2 3); a_(3 1), a_(3 2), a_(3 3)) mat(p_(1 1), p_(1 2), p_(1 3); p_(2 1), p_(2 2), p_(2 3); p_(3 1), p_(3 2), p_(3 3)) = \
= mat(p_(1 1), p_(1 2), p_(1 3); p_(2 1), p_(2 2), p_(2 3); p_(3 1), p_(3 2), p_(3 3)) mat(lambda_1, , ; , lambda_2, ; , , lambda_3). $
This equality is equivalent to the three equalities:
$ mat(a_(1 1), a_(1 2), a_(1 3); a_(2 1), a_(2 2), a_(2 3); a_(3 1), a_(3 2), a_(3 3)) mat(p_(1 j); p_(2 j); p_(3 j)) = lambda_j mat(p_(1 j); p_(2 j); p_(3 j)), quad j = 1, 2, 3. $
Suppose that the value $lambda_j$ is known. Then the entries of the $j$-th column of the matrix $bf(P)$ satisfy the homogeneous system
#eq(
  $ mat(lambda_j - a_(1 1), -a_(1 2), -a_(1 3); -a_(2 1), lambda_j - a_(2 2), -a_(2 3); -a_(3 1), -a_(3 2), lambda_j - a_(3 3)) mat(p_(1 j); p_(2 j); p_(3 j)) = mat(0; 0; 0). $,
  $(*)$
)
This system must have a nontrivial solution $<=>$ the determinant of the coefficient matrix is equal to zero. Thus, $lambda_j$ satisfies the following equation in $x$:
#eq(
  $ det mat(x - a_(1 1), -a_(1 2), -a_(1 3); -a_(2 1), x - a_(2 2), -a_(2 3); -a_(3 1), -a_(3 2), x - a_(3 3)) = 0. $,
  $(\#)$
)
This is a cubic equation of the form $x^3 - s_2 x^2 + s_1 x - s_0 = 0$, where, as is easy to see,
$ s_2 = a_(1 1) + a_(2 2) + a_(3 3), $
$ s_1 = det mat(a_(1 1), a_(1 2); a_(2 1), a_(2 2)) + det mat(a_(1 1), a_(1 3); a_(3 1), a_(3 3)) + det mat(a_(2 2), a_(2 3); a_(3 2), a_(3 3)), $
$ s_0 = det mat(a_(1 1), a_(1 2), a_(1 3); a_(2 1), a_(2 2), a_(2 3); a_(3 1), a_(3 2), a_(3 3)). $

#indent The question of diagonalizing matrices of order $3$ also arises when studying quadric surfaces (see Section 6.3)—when searching for a coordinate system in which the matrix of the quadratic part (a real symmetric matrix of order $3$) becomes diagonal.#footnote[In Section 6.3 it is proved that _every real symmetric matrix $bf(A)$ is orthogonally similar to a diagonal matrix $bf(D)$_—this means that $bf(A) = bf(P) bf(D) bf(P)^(-1) = bf(P) bf(D) bf(P)^T$, where $bf(P)$ is an orthogonal matrix, that is, $bf(A)$ is orthogonally diagonalizable. This same statement will soon appear as a consequence of more general results.]

#subsec("Eigenvectors for Distinct Eigenvalues") // Tyrtyshnikov §29.3


#theorem[
  Eigenvectors associated to pairwise distinct eigenvalues of a matrix are linearly independent.
]

#proof[
  Let $bf(v)_1, ..., bf(v)_m$ be eigenvectors for pairwise distinct eigenvalues $lambda_1, ..., lambda_m$ of a matrix $bf(A)$. Suppose $alpha_1 bf(v)_1 + ... + alpha_m bf(v)_m = bf(0)$. Multiply both sides on the left by the matrix $bf(A)$:
  $ alpha_1 lambda_1 bf(v)_1 + ... + alpha_m lambda_m bf(v)_m = bf(0). $
  From this equality subtract the preceding one multiplied by $lambda_m$:
  $ alpha_1 (lambda_1 - lambda_m) bf(v)_1 + ... + alpha_(m - 1) (lambda_(m - 1) - lambda_m) bf(v)_(m - 1) = bf(0). $
  From this it is clear that the linear independence of the vectors $bf(v)_1, ..., bf(v)_(m - 1)$ would imply the linear independence of the vectors $bf(v)_1, ..., bf(v)_m$. The proof is completed by applying induction.
]

#corollary[
  If a matrix of order $n$ has $n$ distinct eigenvalues, then it is diagonalizable.
]

#sec("6.3", "Orthogonally Diagonalizable Matrices")

#subsec("The Method of Rotations", beyond: true) // Tyrtyshnikov §20.3


Let us try to simplify the quadratic part $f_2 (x, y, z)$ (see Tyrtyshnikov, §20.1) using the same idea of rotating the coordinate system as in the planar case (see Tyrtyshnikov, §19.3). However, we now have three coordinate planes generated by the three pairs of coordinate axes. The goal of a rotation is to obtain zero in place of some single pair of entries $a_(i j) = a_(j i)$ for $i != j$. Consider the three possibilities:
#eq(
  $ mat(cos phi, sin phi, 0; -sin phi, cos phi, 0; 0, 0, 1) mat(a_(1 1), a_(1 2), a_(1 3); a_(1 2), a_(2 2), a_(2 3); a_(1 3), a_(2 3), a_(3 3)) mat(cos phi, -sin phi, 0; sin phi, cos phi, 0; 0, 0, 1) = \
  = mat(tilde(a)_(1 1), 0, tilde(a)_(1 3); 0, tilde(a)_(2 2), tilde(a)_(2 3); tilde(a)_(1 3), tilde(a)_(2 3), tilde(a)_(3 3)), $,
  $(1)$
)
#eq(
  $ mat(cos phi, 0, sin phi; 0, 1, 0; -sin phi, 0, cos phi) mat(a_(1 1), a_(1 2), a_(1 3); a_(1 2), a_(2 2), a_(2 3); a_(1 3), a_(2 3), a_(3 3)) mat(cos phi, 0, -sin phi; 0, 1, 0; sin phi, 0, cos phi) = \
  = mat(tilde(a)_(1 1), tilde(a)_(1 2), 0; tilde(a)_(1 2), tilde(a)_(2 2), tilde(a)_(2 3); 0, tilde(a)_(2 3), tilde(a)_(3 3)), $,
  $(2)$
)
#eq(
  $ mat(1, 0, 0; 0, cos phi, sin phi; 0, -sin phi, cos phi) mat(a_(1 1), a_(1 2), a_(1 3); a_(1 2), a_(2 2), a_(2 3); a_(1 3), a_(2 3), a_(3 3)) mat(1, 0, 0; 0, cos phi, -sin phi; 0, sin phi, cos phi) = \
  = mat(tilde(a)_(1 1), tilde(a)_(1 2), tilde(a)_(1 3); tilde(a)_(1 2), tilde(a)_(2 2), 0; tilde(a)_(1 3), 0, tilde(a)_(3 3)). $,
  $(3)$
)

#indent Denote by $d_0, h_0$ and $d_1, h_1$ the sums of the squares of the diagonal and off-diagonal entries of the original and new matrices in each of the three cases:
$ d_0 = a_(1 1)^2 + a_(2 2)^2 + a_(3 3)^2, quad h_0 = 2 a_(1 2)^2 + 2 a_(1 3)^2 + 2 a_(2 3)^2, $
$ d_1 = tilde(a)_(1 1)^2 + tilde(a)_(2 2)^2 + tilde(a)_(3 3)^2, quad h_1 = 2 tilde(a)_(1 2)^2 + 2 tilde(a)_(1 3)^2 + 2 tilde(a)_(2 3)^2. $

#indent According to the properties of orthogonal matrices (see Section 5.2),
$ d_1 + h_1 = d_0 + h_0 quad => quad h_1 = h_0 - (d_1 - d_0). $
For the same reason, in case $(1)$ we have: $a_(1 1)^2 + a_(2 2)^2 + 2 a_(1 2)^2 = tilde(a)_(1 1)^2 + tilde(a)_(2 2)^2$, and since $a_(3 3) = tilde(a)_(3 3)$, we get $d_1 - d_0 = 2 a_(1 2)^2$. In case $(2)$, $d_1 - d_0 = 2 a_(1 3)^2$, and in case $(3)$, $d_1 - d_0 = 2 a_(2 3)^2$.

Let the indices $i, j$ determine the coordinate plane in which the rotation is performed (and indicate which of the relations $(1)$, $(2)$, or $(3)$ holds). Choose them in such a way that the eliminated entry $a_(i j)$ is maximal in modulus. Then, obviously,
$ d_1 - d_0 = 2 a_(i j)^2 >= 2 (h_0 / 6) = h_0 / 3 quad => quad h_1 <= 2/3 h_0. $

#indent Let $bf(A)_0 = (a_(i j))$ and $bf(A)_1 = (tilde(a)_(i j))$. Regarding $bf(A)_1$ as a new initial matrix, we choose in it the off-diagonal entry of maximal modulus and, annihilating it by means of a rotation, obtain a matrix $bf(A)_2$. Continuing to act in the same way, we construct a sequence of matrices $bf(A)_k = (a_(i j)^((k)))$, $k = 0, 1, ...$

Let $h_k$ denote the sum of the squares of the off-diagonal entries of the matrix $bf(A)_k$. Then
$ h_k <= (2/3)^k h_0 -> 0 quad "as" k -> infinity. $
Consequently, for any fixed $i != j$, the sequence of off-diagonal entries $a_(i j)^((k))$ converges to zero as $k -> infinity$.

#subsec("Nested Subsequences", beyond: true) // Tyrtyshnikov §20.4


#lemma(title: "on bounded sequences")[
  Suppose we are given a finite number of bounded sequences ${s_1^((k))}, ..., {s_m^((k))}$, $k = 1, 2, ...$ Then one can choose a sequence of indices $k_1 < k_2 < ...$ in such a way that each of the subsequences ${s_1^((k_l))}, ..., {s_m^((k_l))}$, $l = 1, 2, ...$, is convergent.
]

#proof[
  From the bounded sequence ${s_1^((k))}$ we select a convergent subsequence ${s_1^((k_l))}$ and instead of the original sequences consider the subsequences ${s_1^((k_l))}, ..., {s_m^((k_l))}$, $l = 1, 2, ...$ They remain bounded, of course, and at the same time the first of them will be
  convergent. Next, from the bounded sequence ${s_2^((k_l))}$ we select a convergent subsequence (a subsequence of a subsequence with respect to the original sequence) and pass to the subsequences ${s_1^((k_(l_i)))}, ..., {s_m^((k_(l_i)))}$, $i = 1, 2, ...$ The resulting nested subsequences will still be bounded, while the first two are now convergent. And so on.
]

#subsec("Diagonalization in the Limit", beyond: true) // Tyrtyshnikov §20.5


Let us return to the method of rotations. Whether the sequences of diagonal entries $a_(i i)^((k))$ converge to finite limits is not very important for our immediate goal. Each of them is bounded and therefore possesses a convergent subsequence. Moreover, by the lemma on bounded sequences, there is a subsequence of matrices $bf(A)_k$ in which each of the sequences of diagonal entries converges to some limit.

In order not to clutter the notation, let us assume that $bf(A)_k$ is that very subsequence for which all the sequences $a_(i j)^((k))$ are convergent (as we know, to zero when $i != j$). Let
$ lim_(k -> infinity) a_(i i)^((k)) = lambda_i, quad i = 1, 2, 3. $

#indent It is clear that
#eq(
  $ bf(A)_k = bf(P)_k^T bf(A)_0 bf(P)_k, quad k = 1, 2, ..., $,
  $(\#)$
)
where the matrices $bf(P)_k = (p_(i j)^((k)))$ are products of the rotation matrices used (from relations $(1)$, $(2)$, or $(3)$). Therefore, for every $k$, the matrix $bf(P)_k$ is orthogonal (as a product of orthogonal matrices). Consequently, the sum of the squares of all entries of the matrix $bf(P)_k$ is the same for every $k$ (and equal to 3). Hence each sequence $p_(i j)^((k))$ is bounded as $k -> infinity$ and therefore possesses a convergent subsequence.

By the lemma on bounded sequences, there exists a subsequence of matrices $bf(P)_k$ in which each sequence $p_(i j)^((k))$ is convergent. To simplify the notation, let us assume that $bf(P)_k$ is precisely such a
subsequence. Let
$ lim_(k -> infinity) p_(i j)^((k)) = p_(i j), quad i, j = 1, 2, 3. $
For each $k$, equality $(\#)$ holds. Passing to the limit in the corresponding entrywise equalities, we obtain
$ bf(D) equiv mat(lambda_1, 0, 0; 0, lambda_2, 0; 0, 0, lambda_3) = bf(P)^T bf(A)_0 bf(P). $
Moreover, for each $k$ we have: $bf(P)_k^T bf(P)_k = bf(I) => bf(P)^T bf(P) = bf(I)$. As a result, we have proved the following important theorem:

#theorem[
  For any real symmetric matrix $bf(A)$ of order 3, there exist an orthogonal matrix $bf(P)$ and a diagonal matrix $bf(D)$ such that
  $ bf(D) = bf(P)^T bf(A) bf(P), quad "that is," quad bf(A) = bf(P) bf(D) bf(P)^T. $
]

#corollary[
  There exists a Cartesian coordinate system in which the equation of a quadric surface has the form
  $ f(tilde(x), tilde(y), tilde(z)) = lambda_1 tilde(x)^2 + lambda_2 tilde(y)^2 + lambda_3 tilde(z)^2 + 2 b_1 tilde(x) + 2 b_2 tilde(y) + 2 b_3 tilde(z) + a = 0. $
]

#remark[
  By the orthogonality of the matrix $bf(P)$, the equality $bf(D) = bf(P)^T bf(A) bf(P)$ holds if and only if $bf(A) bf(P) = bf(P) bf(D)$. The latter means that the $j$-th column $bf(p)_j$ of the matrix $bf(P)$ satisfies the equation $bf(A) bf(p)_j = lambda_j bf(p)_j <=> (lambda_j bf(I) - bf(A)) bf(p)_j = bf(0)$. Taking into account that $bf(p)_j != bf(0)$, we find: $det(lambda_j bf(I) - bf(A)) = 0$. Thus, the numbers $lambda_1, lambda_2, lambda_3$ are the roots of the cubic polynomial $char(bf(A)) = det(x bf(I) - bf(A))$. Once they have been found, the column $bf(p)_j$ can be obtained as a solution of the homogeneous linear system $(lambda_j bf(I) - bf(A)) bf(p)_j = bf(0)$.
]

#subsec("Orthogonal Diagonalization of Real Symmetric Matrices") // Tyrtyshnikov §20.6


In fact, the very same method of rotations allows us to obtain a more general theorem.

#theorem(title: "on the diagonalization of real symmetric matrices")[
  A real symmetric matrix $bf(A)$ of arbitrary order $n$ can be reduced to a diagonal matrix $bf(D)$ by means of some orthogonal matrix $bf(P)$:
  $ bf(D) = bf(P)^T bf(A) bf(P), quad "that is," quad bf(A) = bf(P) bf(D) bf(P)^T. $
  In other words, every real symmetric matrix is orthogonally diagonalizable.
]

#proof[
  Starting with $bf(A)_0 = bf(A)$, let us construct a sequence of matrices $bf(A)_k = (a_(i j)^((k)))$, $k = 0, 1, ...$, in which $bf(A)_k$ is obtained from $bf(A)_(k - 1)$ by multiplying on the left and on the right by rotation matrices:
  #eq(
    $ bf(A)_k = bf(R)_k^T bf(A)_(k - 1) bf(R)_k, $,
    $(*)$
  )
  where $bf(R)_k$ differs from the identity matrix $bf(I)$ only in the four entries of the $(2 times 2)$-submatrix located at the intersection of the rows and columns with indices $i < j$ and equal to
  $ mat(cos phi, -sin phi; sin phi, cos phi). $
  The matrix $bf(R)_k$ effects a rotation through the angle $phi$ in the coordinate plane determined by the indices $i != j$. Every rotation matrix of this form is obviously orthogonal.

  Clearly, the symmetry of the matrix $bf(A)_0 = bf(A)$ is inherited by all the matrices $bf(A)_k$. From our previous investigations we already know that $phi$ can be chosen in such a way that $a_(i j)^((k)) = a_(j i)^((k)) = 0$. Denote by $d_k$ and $h_k$ the sums of the squares of the diagonal and off-diagonal entries of the matrix $bf(A)_k$. Then
  $ (a_(i i)^((k)))^2 + (a_(j j)^((k)))^2 = (a_(i i)^((k - 1)))^2 + (a_(j j)^((k - 1)))^2 + 2 (a_(i j)^((k - 1)))^2 quad => \
  => quad d_k - d_(k - 1) = 2 (a_(i j)^((k - 1)))^2. $
  For each $k$, we shall choose the plane of rotation (the indices $i < j$) in such a way that the eliminated entry $a_(i j)^((k - 1))$ is maximal in modulus among all off-diagonal entries of the matrix $bf(A)_(k - 1)$. The total number of off-diagonal entries is $n^2 - n$. Therefore
  $ (a_(i j)^((k - 1)))^2 >= h_(k - 1) / (n^2 - n). $
  Hence, taking into account the equality $d_k + h_k = d_(k - 1) + h_(k - 1)$, we obtain
  $ h_k <= h_(k - 1) - 2 / (n^2 - n) h_(k - 1) <= (1 - 2 / (n^2 - n))^k h_0 -> 0 quad "as" k -> infinity. $

  #indent From relations $(*)$ it follows that
  $ bf(A)_k = bf(P)_k^T bf(A) bf(P)_k, quad k = 1, 2, ..., $
  where for all $k$ the matrices $bf(P)_k = (p_(i j)^((k)))$ are orthogonal (as products of orthogonal matrices).

  For any fixed $i, j$, the sequences $a_(i j)^((k)), p_(i j)^((k))$ are bounded. By the lemma on bounded sequences, there exists a sequence of indices $k_1 < k_2 < ...$ such that each of the subsequences $a_(i j)^((k_l)), p_(i j)^((k_l))$ is convergent. Note that $a_(i j)^((k_l)) -> 0$ for $i != j$. Let
  $ lim_(l -> infinity) a_(i i)^((k_l)) = lambda_i, quad i = 1, ..., n, quad lim_(l -> infinity) p_(i j)^((k_l)) = p_(i j), quad i, j = 1, ..., n. $
  Introduce the matrices
  $ bf(D) = mat(lambda_1, , ; , dots.down, ; , , lambda_n), quad bf(P) = (p_(i j)). $
  For all $l = 1, 2, ...$ we have: $bf(A)_(k_l) = bf(P)_(k_l)^T bf(A) bf(P)_(k_l)$. Passing to the limit in the entrywise equalities, we obtain
  $ bf(D) = bf(P)^T bf(A) bf(P). $
  From the orthogonality conditions $bf(P)_(k_l)^T bf(P)_(k_l) = bf(I)$ it follows that in the limit $bf(P)^T bf(P) = bf(I)$. Hence the matrix $bf(P)$ is orthogonal.
]

#indent We have just obtained one of the most important results—both for matrix theory itself and for its numerous applications. In our course we shall return to discussing it in connection with a number of fundamental concepts of linear algebra. Our proof is remarkable for its constructiveness: it simultaneously provides a method for the approximate computation of the matrices $bf(D)$ and $bf(P)$. This is one of the earliest practical methods of computational algebra, proposed by C. Jacobi in 1846.#footnote[The latest results in the study of the method of rotations belong to the very recent past: in the 1990s its special capabilities associated with the high-accuracy computation of entries of the matrix $bf(D)$ that are small in modulus were discovered.]

#problem(number: 1)[
  Given a symmetric matrix $bf(A) in bb(R)^(n times n)$ with a nonzero sum of the entries on the main diagonal, prove the existence of an orthogonal matrix $bf(Q) in bb(R)^(n times n)$ such that in the matrix $bf(Q)^T bf(A) bf(Q)$ all entries on the main diagonal are equal.
]

#subsec("Schur's Theorem", beyond: true) // Tyrtyshnikov §30.8


Let $lambda_1, ..., lambda_n$ be a complete set of $n$ eigenvalues of a matrix $bf(A) in bb(C)^(n times n)$ counting multiplicities. Suppose an arbitrary numbering of the eigenvalues is fixed.

#theorem(title: "Schur")[
  For any matrix $bf(A) in bb(C)^(n times n)$ with an arbitrary prescribed numbering of its eigenvalues $lambda_1, ..., lambda_n$, there exists a unitary matrix $bf(X) in bb(C)^(n times n)$ such that $bf(B) = (b_(i j)) = bf(X)^* bf(A) bf(X)$ is an upper triangular matrix with diagonal entries $b_(i i) = lambda_i$, $i = 1, ..., n$.
]

#proof[
  Let $bf(A) bf(x)_1 = lambda_1 bf(x)_1$, $norm(bf(x)_1) = 1$ (the length is defined by the standard inner product). Construct an orthonormal basis $bf(x)_1, ..., bf(x)_n$ starting with the vector $bf(x)_1$, and let $bf(X) = mat(bf(x)_1, dots.c, bf(x)_n)$. It is easy to verify that
  $ bf(A) bf(X) = bf(X) mat(lambda_1, bf(u)^T; bf(0), bf(B)), quad bf(B) in bb(C)^((n - 1) times (n - 1)), quad bf(u) in bb(C)^(n - 1). $
  Note that $char(bf(A)) = det(x bf(I) - bf(A)) = (x - lambda_1)(x - lambda_2) dot ... dot (x - lambda_n) = (x - lambda_1) det(x bf(I)_(n - 1) - bf(B))$. Hence, $bf(B)$ has the eigenvalues $lambda_2, ..., lambda_n$.

  Arguing by induction, suppose that $bf(Y)^* bf(B) bf(Y) = bf(T)$, where $bf(Y)$ is a unitary matrix of order $n - 1$ and $bf(T)$ is an upper triangular matrix of order $n - 1$ with diagonal entries $lambda_2, ..., lambda_n$. As a result,
  $ (tilde(bf(Y))^* bf(X)^*) bf(A) (bf(X) tilde(bf(Y))) = mat(lambda_1, bf(u)^T bf(Y); bf(0), bf(T)), quad tilde(bf(Y)) = mat(1, bf(0); bf(0), bf(Y)). $
  From the unitarity of the matrix $bf(Y)$ it follows that $tilde(bf(Y))$ is a unitary matrix. The matrix $bf(X) tilde(bf(Y))$ is unitary as a product of unitary matrices.
]

#indent The theorem on the triangular form of a matrix (see Tyrtyshnikov, §30.6) is, of course, a corollary of Schur's theorem. Moreover, Schur's theorem asserts more: a triangular form with a prescribed ordering of the eigenvalues on the diagonal is achieved by a similarity transformation using a unitary matrix.

Let us note the constructive character of the proof of Schur's theorem given above. Once an eigenvalue $lambda_1$ and an associated eigenvector $bf(x)_1$ have been found, the problem of determining the remaining eigenvalues reduces to a similar
problem of order $n - 1$.#footnote[It does not follow from anywhere, however, that an eigenvector of the matrix $bf(B)$ automatically corresponds to some eigenvector of the matrix $bf(A)$.] This kind of dimension-reduction device is sometimes called _deflation_.

#problem(number: 2)[
  Prove that for any complex matrix $bf(A)$ of order $3$ there exists a unitary matrix $bf(Q)$ such that the matrix $bf(B) = bf(Q)^* bf(A) bf(Q)$ is _tridiagonal_. (A matrix $bf(B)$ is called tridiagonal if $b_(i j) = 0$ for $abs(i - j) > 1$.)#footnote[It was proved recently that the same holds for any complex matrix of order $4$ (V. Pati, 2001) and that there exist matrices of order $5$ that cannot be reduced to tridiagonal form by a similarity transformation using a unitary matrix.]
]

#subsec("Normal Matrices", beyond: true) // Tyrtyshnikov §33.1


The foundation of matrix techniques consists of transformations and decompositions of general matrices obtained with the help of special classes of matrices.

A square complex matrix $bf(A)$ is called _normal_ if $bf(A)^* bf(A) = bf(A) bf(A)^*$.

#theorem[
  A matrix $bf(A) in bb(C)^(n times n)$ is normal if and only if for some unitary matrix $bf(Q) in bb(C)^(n times n)$ the matrix $bf(Q)^* bf(A) bf(Q)$ is diagonal.
]

#proof[
  By Schur's theorem, there exists a unitary matrix $bf(Q)$ reducing $bf(A)$ to upper triangular form $bf(B) = bf(Q)^* bf(A) bf(Q)$. The equality $bf(A)^* bf(A) = bf(A) bf(A)^*$ is equivalent to the equality $bf(B)^* bf(B) = bf(B) bf(B)^*$. It remains to see what this means in the case of an upper triangular matrix $bf(B)$:
  $ mat(
      overline(b)_(1 1), , , ;
      overline(b)_(1 2), overline(b)_(2 2), , ;
      dots.v, dots.v, dots.down, ;
      overline(b)_(1 n), overline(b)_(2 n), ..., overline(b)_(n n)
    )
    mat(
      b_(1 1), b_(1 2), ..., b_(1 n);
      , b_(2 2), ..., b_(2 n);
      , , dots.down, dots.v;
      , , , b_(n n)
    ) = \
    = mat(
      b_(1 1), b_(1 2), ..., b_(1 n);
      , b_(2 2), ..., b_(2 n);
      , , dots.down, dots.v;
      , , , b_(n n)
    )
    mat(
      overline(b)_(1 1), , , ;
      overline(b)_(1 2), overline(b)_(2 2), , ;
      dots.v, dots.v, dots.down, ;
      overline(b)_(1 n), overline(b)_(2 n), ..., overline(b)_(n n)
    ). $
  Equating the entries in position $(1, 1)$, we obtain
  $ abs(b_(1 1))^2 = abs(b_(1 1))^2 + abs(b_(1 2))^2 + ... + abs(b_(1 n))^2 => b_(1 2) = ... = b_(1 n) = 0. $
  Taking this into account, we equate the entries in position $(2, 2)$:
  $ abs(b_(2 2))^2 = abs(b_(2 2))^2 + abs(b_(2 3))^2 + ... + abs(b_(2 n))^2 => b_(2 3) = ... = b_(2 n) = 0. $
  And so on. Conclusion: an upper triangular matrix is normal if and only if it is diagonal. Hence, the equality
  $bf(A)^* bf(A) = bf(A) bf(A)^*$ holds if and only if $bf(B)$ is a diagonal matrix.
]

#corollary[
  A matrix is normal if and only if it possesses an orthonormal basis of eigenvectors.
]

#proof[
  Let $bf(D) = bf(Q)^* bf(A) bf(Q)$ be a diagonal matrix. The columns of the unitary matrix $bf(Q)$ form an orthonormal basis and, by virtue of the equality $bf(A) bf(Q) = bf(Q) bf(D)$, are eigenvectors of the matrix $bf(A)$.
]

#indent As we see, any normal matrix is similar to a diagonal one, and the similarity transformation is realized by means of a unitary matrix. In such cases one speaks of _unitary similarity_.

If $bf(A)^* = f(bf(A))$ for some polynomial $f(lambda)$, then the matrix $bf(A)$ is obviously normal. The converse is also true. Suppose that $bf(A)$ has $m$ pairwise distinct eigenvalues $lambda_1, ..., lambda_m$, and take as $f(lambda)$ a polynomial of degree at most $m - 1$ that takes the value $overline(lambda)_i$ at $lambda_i$. Then
$ bf(D)^* = f(bf(D)) => bf(A)^* = bf(Q) bf(D)^* bf(Q)^* = bf(Q) f(bf(D)) bf(Q)^* = f(bf(A)). $

#problem(number: 3)[
  Prove that the spectral radius (the maximum modulus of the eigenvalues) of a normal matrix $bf(A)$ admits the representation $rho(bf(A)) = max_(bf(x) != bf(0)) abs(bf(x)^* bf(A) bf(x)) / abs(bf(x)^* bf(x))$.
]

#subsec("Hermitian Matrices") // Tyrtyshnikov §33.4


Recall that a matrix $bf(A)$ is called Hermitian if $bf(A)^* = bf(A)$ (see Tyrtyshnikov, §25.2). Obviously, any Hermitian matrix is normal.

#proposition[
  A normal matrix is Hermitian if and only if all of its eigenvalues are real.
]

#proof[
  $bf(A)^* = bf(A) <=> bf(D)^* = bf(D) <=> overline(lambda)_i = lambda_i$, $1 <= i <= n$.
]

#remark[
  For a real matrix $bf(A)$ we have $bf(A)^* = bf(A)^T$, so the real Hermitian matrices are exactly the real symmetric matrices, $bf(A)^T = bf(A)$; by the proposition, their eigenvalues are real. The real symmetric case is the _spectral theorem_ of MA1522: a real square matrix $bf(A)$ is orthogonally diagonalizable, $bf(A) = bf(P) bf(D) bf(P)^T$ with $bf(P)$ orthogonal and $bf(D)$ diagonal, if and only if $bf(A)$ is symmetric. One direction is the theorem on the diagonalization of real symmetric matrices proved above; conversely, $bf(A) = bf(P) bf(D) bf(P)^T$ implies $bf(A)^T = bf(P) bf(D)^T bf(P)^T = bf(P) bf(D) bf(P)^T = bf(A)$.
]

#problem(number: 4)[
  It is known that $bf(A)^2 = bf(A)$ and $Null(bf(A)) perp Col(bf(A))$ (orthogonality with respect to the standard inner product). Prove that $bf(A) = bf(A)^*$.
]

#problem(number: 5)[
  Given a subspace $V subset bb(C)^n$. Prove that among all matrices $bf(A)$ such that $Col(bf(A)) = V$ and $bf(A)^2 = bf(A)$, the smallest value of the 2-norm is attained for some Hermitian matrix $bf(A)$, and moreover for only one.
]

#problem(number: 6)[
  Prove that for any Hermitian matrix $bf(H)$ the matrix $bf(Q) = (bf(I) - i bf(H))^(-1) (bf(I) + i bf(H))$ is unitary. Can every unitary matrix be represented in this way?
]

#problem(number: 7)[
  Hermitian matrices $bf(A), bf(B) in bb(C)^(n times n)$ are such that $bf(A)^2 = bf(A)$ and $bf(B)^2 = bf(B)$. Prove that if $norm(bf(A) - bf(B))_2 < 1$, then $rank(bf(A)) = rank(bf(B))$.
]

#sec("6.4", "Application of Diagonalization: Markov Chains")

#subsec("Spectral Radius", beyond: true) // Tyrtyshnikov §30.7


The set of eigenvalues of a matrix is often also called its _spectrum_. The largest modulus of the eigenvalues of a matrix $bf(A)$ is called its _spectral radius_. Notation: $rho(bf(A))$.

#proposition[
  For the spectral radius, the estimate $rho(bf(A)) <= norm(bf(A))$ holds, where $norm(dot.c)$ is an arbitrary matrix norm.
]

#proof[
  Let $bf(A) bf(x) = lambda bf(x)$, $bf(x) != bf(0)$. Then $norm(lambda bf(x)) = abs(lambda) norm(bf(x)) = norm(bf(A) bf(x)) <= norm(bf(A)) norm(bf(x)) => abs(lambda) <= norm(bf(A))$.
]

#problem(number: 1)[
  Prove that the spectral radius is obtained as the limit $rho(bf(A)) = lim_(k -> infinity) norm(bf(A)^k)^(1 \/ k)$, where $norm(dot.c)$ is an arbitrary fixed matrix norm. (By the theorem on upper triangular form (see Tyrtyshnikov, §30.6), it suffices to consider the case of an upper triangular matrix $bf(A)$.)
]

#problem(number: 2)[
  Prove that $rho(bf(A)) = inf norm(bf(X)^(-1) bf(A) bf(X))_p$, where the infimum is taken over all invertible matrices $bf(X)$, and $norm(dot.c)_p$ is the operator norm induced by the vector $p$-norm.
]

#problem(number: 3)[
  For the entries of square matrices $bf(A)$ and $bf(B)$, the inequalities $0 <= a_(i j) <= b_(i j)$, $1 <= i, j <= n$, hold. Prove that $rho(bf(A)) <= rho(bf(B))$.
]

#problem(number: 4)[
  All entries of a square matrix $bf(A)$ are nonnegative, and the sums of the entries in each row are equal to the same number $lambda$. Prove that $lambda$ is the eigenvalue of $bf(A)$ of largest modulus.
]

#remark[
  In the general case, a matrix may have no nonnegative eigenvalues, so $rho(bf(A))$ need not be an eigenvalue of the matrix $bf(A)$. However, for any _nonnegative matrix_—a matrix all of whose entries are nonnegative—it is known that the spectral radius is necessarily also an eigenvalue of it, and as an associated eigenvector one can choose a vector with nonnegative entries (this is the fundamental result of the theory of nonnegative matrices, known as the _Perron–Frobenius theorem_). A possible outline of the proof in the case of a _positive matrix_—a matrix all of whose entries are positive—is, for instance, the following: (1) the minimum value of the norm $norm(bf(D)^(-1) bf(A) bf(D))_infinity$ on the set of all diagonal matrices $bf(D)$ with positive diagonal is _attained_ at some diagonal matrix $hat(bf(D))$ (why?); (2) in the matrix $hat(bf(A)) equiv hat(bf(D))^(-1) bf(A) hat(bf(D))$, the sums of the moduli of the entries in each row are identical and consequently equal to $rho(bf(A))$ (if there are rows with different sums, then one can find a diagonal matrix $bf(D)$ for which $norm(bf(D)^(-1) hat(bf(A)) bf(D))_infinity < norm(hat(bf(A)))_infinity$); (3) the vector formed from the diagonal entries of $hat(bf(D))$ is an eigenvector of $bf(A)$ associated to the eigenvalue $rho(bf(A))$.
]

#indent A stochastic matrix $bf(P)$ of a Markov chain (a square matrix whose columns are probability vectors) is a nonnegative matrix whose columns, rather than rows, sum to $1$; Problem 4 therefore applies to its transpose $bf(P)^T$, with $lambda = 1$.

#sec("6.5", "Singular Value Decomposition")

#subsec("The Operator Norm", beyond: true) // Tyrtyshnikov §27.3


#proposition(title: "1")[
  The set $cal(L)(V, W)$ of all bounded linear transformations from $V$ to $W$ is a vector space (over the field common to $V$ and $W$).
]

#proof[
  Let $norm(T(bf(x)))_W <= c_1 norm(bf(x))_V$ and $norm(S(bf(x)))_W <= c_2 norm(bf(x))_V$. Then for any scalars $alpha$ and $beta$,
  $ norm((alpha T + beta S)(bf(x)))_W <= c norm(bf(x))_V, quad c = abs(alpha) c_1 + abs(beta) c_2. $
]

#proposition(title: "2")[
  The quantity
  #eq($ norm(T) equiv sup_(norm(bf(x))_V = 1) norm(T(bf(x)))_W, quad T in cal(L)(V, W), $, $(1)$)
  is a norm on the vector space $cal(L)(V, W)$.
]

#proof[
  Obviously, the quantity $norm(T)$ has a finite value and is, of course, nonnegative. If $norm(T) = 0$, then $norm(T(bf(x)))_W = 0$ on the unit sphere $norm(bf(x))_V = 1$. Hence $norm(T(bf(x)))_W = 0$ $forall bf(x) in V => T(bf(x)) = bf(0) quad forall bf(x) in V => T = 0$. Positive homogeneity follows from the equality
  $ norm(alpha T(bf(x)))_W = abs(alpha) norm(T(bf(x)))_W, $
  and the triangle inequality follows from the inequality
  $ norm((alpha T + beta S)(bf(x)))_W <= abs(alpha) norm(T(bf(x)))_W + abs(beta) norm(S(bf(x)))_W. $
]

#definition[
  The norm $(1)$ for linear transformations $T in cal(L)(V, W)$ is called the _operator norm_ or the norm _subordinate_ to the vector norms $norm(dot.c)_V, norm(dot.c)_W$.
]

#proposition(title: "3")[
  If $V$ is a finite-dimensional space, then every linear transformation $T : V -> W$ is bounded and $norm(T) = norm(T(bf(x)_0))_W$ for some vector $bf(x)_0 in V$ (depending on $T$) with norm $norm(bf(x)_0)_V = 1$.
]

#proof[
  Let ${bf(e)_1, ..., bf(e)_n}$ be a basis for $V$ and $bf(x) = sum_(i=1)^n alpha_i bf(e)_i$. Then $norm(bf(x))_((e)) equiv sum_(i=1)^n abs(alpha_i)$ is a norm on $V$, equivalent to any other norm, including the norm $norm(bf(x))_V$. Therefore, for some $c > 0$,
  $ norm(bf(x))_((e)) <= c norm(bf(x))_V quad forall bf(x) in V. $
  Consequently,
  $ norm(T(bf(x)))_W &<= sum_(i=1)^n abs(alpha_i) max_(1 <= i <= n) norm(T(bf(e)_i))_W = norm(bf(x))_((e)) max_(1 <= i <= n) norm(T(bf(e)_i))_W <= \
  &<= (c max_(1 <= i <= n) norm(T(bf(e)_i))_W) norm(bf(x))_V quad forall bf(x) in V. $
  To prove the existence of $bf(x)_0$, it suffices to take into account the compactness of the unit sphere in a finite-dimensional space, the continuity of the function $norm(T(bf(x)))_W$ on it, and Weierstrass's theorem.
]

#indent If $1 <= p <= infinity$ is fixed and the Hölder $p$-norm is chosen as the norm in the space $bb(C)^n$, then the corresponding operator norm of a matrix $bf(A)$ (regarded as the linear transformation $bf(x) |-> bf(A) bf(x)$) is customarily denoted by $norm(bf(A))_p$.

#problem(number: 1)[
  Let $bf(A) = (a_(i j))_(m times n)$. Prove that
  $ norm(bf(A))_infinity = max_(1 <= i <= m) sum_(j=1)^n abs(a_(i j)), quad norm(bf(A))_1 = max_(1 <= j <= n) sum_(i=1)^m abs(a_(i j)). $
]

#problem(number: 2)[
  Let $bf(u), bf(v) in bb(C)^n$. Prove that $norm(bf(u) bf(v)^T)_2 = norm(bf(u)) norm(bf(v))$.
]

#subsec("Singular Value Decomposition of a Matrix") // Tyrtyshnikov §27.8


In the 1870s, independently and almost simultaneously, Beltrami (1873) and Jordan (1874) discovered that any square matrix can be reduced to diagonal form by multiplying on the left and on the right by unitary matrices. Various questions connected with this discovery, including its generalizations, subsequently became the subject of a whole series of investigations. It would not be a great exaggeration to say that this fact turned out to be tremendously useful and one of the most sought-after results in matrix theory and applications of linear algebra.

In reality, the same holds for a rectangular matrix as well. By multiplication by unitary matrices, it is reduced to a rectangular matrix of the same dimensions having zeros everywhere except at the entries with indices $i = j$. We shall call such matrices _diagonal rectangular_ matrices.

Thus, we are dealing with a decomposition of the form
#eq($ bf(A) = bf(U) bf(Sigma) bf(V)^*, $, $(2)$)
where $bf(A)$ is a given $(m times n)$-matrix, $bf(U)$ and $bf(V)$ are unitary matrices of orders $m$ and $n$ respectively,#footnote[The full textbook writes this decomposition as $bf(A) = bf(V) bf(Sigma) bf(U)^*$, with the letters $bf(U)$ and $bf(V)$, and the singular vectors $bf(u)_i$ and $bf(v)_i$, interchanged; this edition follows MA1522, where a real matrix has $bf(A) = bf(U) bf(Sigma) bf(V)^T$. (With the textbook's lettering, the Russian original inadvertently gives the orders of $bf(U)$ and $bf(V)$ as $m$ and $n$.)] and $bf(Sigma)$ is a diagonal rectangular $(m times n)$-matrix having in the positions $(1, 1), (2, 2), ...$ the nonnegative numbers
$ sigma_1 >= sigma_2 >= ... >= sigma_(min(m, n)). $
The decomposition $(2)$ is called the _singular value decomposition_ of the matrix $bf(A)$. The numbers $sigma_i$ are called the _singular values_ of the matrix $bf(A)$.

#theorem[
  A singular value decomposition $bf(A) = bf(U) bf(Sigma) bf(V)^*$ exists for any complex rectangular matrix $bf(A)$. If $bf(A)$ is
  real, then the matrices $bf(U)$ and $bf(V)$ can be chosen to be real (that is, orthogonal), and then $bf(A) = bf(U) bf(Sigma) bf(V)^T$.
]

#proof[
  The case $bf(A) = bf(0)$ is trivial, so we shall assume that $bf(A) != bf(0)$. Set $sigma_1 = norm(bf(A))_2 = sup_(bf(x) != bf(0)) norm(bf(A) bf(x)) \/ norm(bf(x))$. By the compactness of the unit sphere in $bb(C)^n$, the continuity of the norm, and Weierstrass's theorem, there exists a vector $bf(x)_1$ such that $norm(bf(A) bf(x)_1) = norm(bf(A))_2$ and $norm(bf(x)_1) = 1$. Let $bf(y)_1 = bf(A) bf(x)_1 \/ norm(bf(A) bf(x)_1)$. Thus,
  #eq($ bf(A) bf(x)_1 = sigma_1 bf(y)_1, quad norm(bf(x)_1) = norm(bf(y)_1). $, $(3)$)
  Let us complete $bf(x)_1$ and $bf(y)_1$ to orthonormal bases and form the unitary matrices
  $ bf(U)_1 = mat(bf(y)_1, bf(y)_2, dots.c, bf(y)_m), quad bf(V)_1 = mat(bf(x)_1, bf(x)_2, dots.c, bf(x)_n). $
  According to $(3)$, the matrix $bf(A)_1 equiv bf(U)_1^* bf(A) bf(V)_1$ has only one nonzero entry in the first column, equal to $sigma_1$:
  $ bf(A)_1 = bf(U)_1^* bf(A) bf(V)_1 = mat(sigma_1, bf(z)^*; bf(0), bf(A)_2). $
  By the unitary invariance of the spectral norm (see Tyrtyshnikov, §27.7), $norm(bf(A)_1)_2 = sigma_1$. Therefore,
  $ sigma_1 norm(mat(sigma_1; bf(z))) >= norm(bf(A)_1 mat(sigma_1; bf(z))) >= sigma_1^2 + norm(bf(z))^2 quad => quad sigma_1^2 >= sigma_1^2 + norm(bf(z))^2 quad => $
  $ => quad bf(z) = bf(0) quad => quad bf(A)_1 = mat(sigma_1, bf(0); bf(0), bf(A)_2). $
  Next we argue by induction. If a singular value decomposition $bf(A)_2 = bf(U)_2 bf(Sigma)_2 bf(V)_2^*$ is already available for $bf(A)_2$, then a singular value decomposition for $bf(A)$ is easily found. For this it suffices to take
  $ bf(U) = bf(U)_1 mat(1, bf(0); bf(0), bf(U)_2), quad bf(V) = bf(V)_1 mat(1, bf(0); bf(0), bf(V)_2), $
  note that the matrices $bf(U)$ and $bf(V)$ are unitary (as products of unitary matrices), and verify that the equality
  $ bf(U)^* bf(A) bf(V) = mat(sigma_1, bf(0); bf(0), bf(Sigma)_2) $
  holds.

  It remains to note that the induction begins with constructing the singular value decomposition for matrices consisting of a single column or a single row.

  Let $bf(A) = mat(bf(a)) in bb(C)^(m times 1)$ be a column matrix. In this case we find in $bb(C)^m$ an orthonormal basis $bf(u)_1, ..., bf(u)_m$ starting with $bf(u)_1 = bf(a) \/ norm(bf(a))$. Then
  $ bf(A) = bf(U) bf(Sigma) bf(V)^*, quad bf(U) = mat(bf(u)_1, dots.c, bf(u)_m), quad bf(Sigma) = (norm(bf(a)), 0, ..., 0)^T, quad bf(V) = mat(1) in bb(C)^(1 times 1). $
  For a row matrix, the singular value decomposition is obtained by transposition.
]

#corollary(title: "1")[
  The spectral norm of a matrix is equal to its largest singular value.
]

#corollary(title: "2")[
  Let the matrix $bf(A)$ be invertible and let $sigma_n$ be its smallest singular value. Then $norm(bf(A)^(-1))_2 = 1 \/ sigma_n$.
]

#indent Now it is clear that the largest singular value of a matrix and the smallest singular value of an invertible matrix are uniquely determined. The same holds for the entire set of singular values, but we shall prove this later. The singular value decomposition and its important consequences deserve a more thorough discussion, to which we shall return later in this section.

#problem(number: 3)[
  Prove the inequality $norm(bf(A))_F <= sqrt(rank(bf(A))) norm(bf(A))_2$.
]

#problem(number: 4)[
  Prove that
  $ max_(bf(A) in bb(C)^(n times n), bf(A) != bf(0)) norm(bf(A))_2 / norm(bf(A))_1 = sqrt(n). $
]

#problem(number: 5)[
  Let $bf(A) = (a_(i j))$ and $bf(D) = (d_(i j))$ be complex matrices of order $n$, where $bf(D)$ is a diagonal matrix with entries $d_(i i) = a_(i i)$ for $1 <= i <= n$. Prove that if $norm(bf(A))_2 = norm(bf(D))_2$, then the number of zero entries in the matrix $bf(A)$ is at least $2 n - 2$.
]

#problem(number: 6)[
  Let $bf(L)$ be the lower triangular matrix with lower triangular part taken from a matrix $bf(A) in bb(C)^(n times n)$. Prove that
  $ norm(bf(L))_2 <= log_2 (2 n) norm(bf(A))_2. $
]

#subsec("Singular Values and Singular Vectors") // Tyrtyshnikov §35.1


Let $bf(A) in bb(C)^(m times n)$. Then $bf(A)^* bf(A) in bb(C)^(n times n)$ is a Hermitian nonnegative definite matrix:
$ (bf(A)^* bf(A))^* = bf(A)^* (bf(A)^*)^* = bf(A)^* bf(A); $
$ bf(x)^* bf(A)^* bf(A) bf(x) = ip(bf(A) bf(x), bf(A) bf(x)) = norm(bf(A) bf(x))^2 >= 0 quad forall bf(x) in bb(C)^n. $
Therefore, all of its eigenvalues are nonnegative.

The nonnegative square roots of the eigenvalues of the matrix $bf(A)^* bf(A)$ are called the _singular values_ of the matrix $bf(A)$. It is customary to number the singular values $sigma_i = sigma_i (bf(A))$ in nonincreasing order:
$ sigma_1 >= sigma_2 >= ... >= sigma_r > sigma_(r + 1) = ... = sigma_n = 0. $
We shall assume that $bf(A)$ has $r$ nonzero singular values.

Let $bf(v)_1, ..., bf(v)_n$ be an orthonormal basis of eigenvectors of the matrix $bf(A)^* bf(A)$ such that
$ bf(A)^* bf(A) bf(v)_i = cases(sigma_i^2 bf(v)_i\, & quad 1 <= i <= r\,, bf(0)\, & quad r + 1 <= i <= n.) $
Set $bf(u)_i = 1/sigma_i bf(A) bf(v)_i$, $1 <= i <= r$. Then $ip(bf(u)_i, bf(u)_j) = 0$ for $i != j$ and $ip(bf(u)_i, bf(u)_i) = 1$. Let us extend the set $bf(u)_1, ..., bf(u)_r$ by vectors $bf(u)_(r + 1), ..., bf(u)_m$ to an orthonormal basis in $bb(C)^m$. Note also that for $j >= r + 1$,
$ bf(A)^* bf(A) bf(v)_j = bf(0) => bf(v)_j^* bf(A)^* bf(A) bf(v)_j = 0 => (bf(A) bf(v)_j)^* (bf(A) bf(v)_j) = 0 => norm(bf(A) bf(v)_j) = 0 => bf(A) bf(v)_j = bf(0). $
As a result, we obtain
$ bf(A) mat(bf(v)_1, dots.c, bf(v)_n) = mat(bf(u)_1, dots.c, bf(u)_m) mat(sigma_1, , , 0; , dots.down, , ; , , sigma_r, ; 0, , , 0) => bf(A) bf(V) = bf(U) bf(Sigma), $
where $bf(V) = mat(bf(v)_1, dots.c, bf(v)_n)$ and $bf(U) = mat(bf(u)_1, dots.c, bf(u)_m)$ are unitary matrices, and $bf(Sigma)$ is a diagonal rectangular matrix of the same dimensions as the matrix $bf(A)$.

The columns of the matrices $bf(U)$ and $bf(V)$ form _singular bases_ of the matrix $bf(A)$. The columns of $bf(V)$ are called _right singular vectors_, and the columns of $bf(U)$ are called _left singular vectors_ of the matrix $bf(A)$. The relationship between the singular vectors and the nonzero singular values is established by the relations
$ bf(A) bf(v)_i = sigma_i bf(u)_i, quad bf(A)^* bf(u)_i = sigma_i bf(v)_i, quad 1 <= i <= r. $
Moreover,
$ bf(A) bf(v)_i = bf(0), quad r + 1 <= i <= n, quad bf(A)^* bf(u)_i = bf(0), quad r + 1 <= i <= m. $

#indent Thus, we have proved that _for any matrix_ $bf(A) in bb(C)^(m times n)$ _there holds the equality_
#eq($ bf(A) bf(V) = bf(U) bf(Sigma) $, $(4)$)
_for some unitary matrices_ $bf(V) in bb(C)^(n times n)$, $bf(U) in bb(C)^(m times m)$ _and a diagonal rectangular matrix of dimensions_ $m times n$ _with numbers_ $sigma_i >= 0$ _for_ $i = j$. Writing $(4)$ in the form
#eq($ bf(A) = bf(U) bf(Sigma) bf(V)^*, $, $(5)$)
we obtain a representation of the matrix called its _singular value decomposition_.#footnote[It was obtained by an altogether different method earlier in this section, in the subsection "Singular Value Decomposition of a Matrix".]

If a decomposition $(5)$ with unitary matrices $bf(U)$ and $bf(V)$ has been obtained in some way, then $bf(A)^* bf(A) = bf(V) (bf(Sigma)^* bf(Sigma)) bf(V)^*$. Therefore, if $bf(Sigma)$ is a diagonal rectangular matrix with nonnegative entries, then its nonzero entries are uniquely determined.

For a real matrix $bf(A)$ we have $bf(A)^* bf(A) = bf(A)^T bf(A)$, all the vectors above can be chosen real, and $(5)$ becomes the decomposition $bf(A) = bf(U) bf(Sigma) bf(V)^T$ with orthogonal $bf(U)$ and $bf(V)$; this is the construction of the singular value decomposition used in MA1522.

#problem(number: 7)[
  Find the singular value decomposition of the $(2 times n)$-matrix $bf(A) = mat(1, 1, ..., 1; 1, 1, ..., 1)$.
]

#subsec("Consequences of the Singular Value Decomposition") // Tyrtyshnikov §35.3


1) _The number of nonzero singular values_ $r$ _equals the rank of the matrix_ $bf(A)$.

2) _The singular value decomposition of the conjugate transpose matrix has the form_
$ bf(A)^* = bf(V) bf(Sigma)^T bf(U)^*. $

#indent 3) $Col(bf(A)) = span{bf(u)_1, ..., bf(u)_r}$, $Null(bf(A)) = span{bf(v)_(r + 1), ..., bf(v)_n}$.

4) $Col(bf(A)^*) = span{bf(v)_1, ..., bf(v)_r}$, $Null(bf(A)^*) = span{bf(u)_(r + 1), ..., bf(u)_m}$.

As a corollary, one can obtain representations of the spaces as orthogonal sums:
$ bb(C)^n = Null(bf(A)) plus.o Col(bf(A)^*), quad bb(C)^m = Null(bf(A)^*) plus.o Col(bf(A)). $

#indent 5) $bf(A) = sum_(k=1)^r sigma_k bf(u)_k bf(v)_k^*$, $bf(A)^* = sum_(k=1)^r sigma_k bf(v)_k bf(u)_k^*$.

6) _If_ $m = n = r$ (_the matrix_ $bf(A)$ _is invertible_), _then_
$ bf(A) = sum_(k=1)^n sigma_k bf(u)_k bf(v)_k^*, quad bf(A)^(-1) = sum_(k=1)^n 1/sigma_k bf(v)_k bf(u)_k^*. $

#indent 7) _Let_ $sigma_1 >= ... >= sigma_n$ _be the singular values of an invertible matrix_ $bf(A)$. _Then_ $sigma_n^(-1) >= ... >= sigma_1^(-1)$ _are the singular values of the matrix_ $bf(A)^(-1)$.

8) $norm(bf(A))_2 = sigma_1$, $norm(bf(A))_F = sqrt(sigma_1^2 + ... + sigma_r^2)$.

#proof[
  The spectral and Frobenius norms are unitarily invariant. Therefore $norm(bf(A))_2 = norm(bf(Sigma))_2$ and $norm(bf(A))_F = norm(bf(Sigma))_F$. Obviously, $norm(bf(Sigma) bf(x)) <= sigma_1 norm(bf(x))$; equality is attained if $bf(x)$ has 1 in the first position and 0 in the remaining ones.

  It is also clear that $norm(bf(Sigma))_F = sqrt(sigma_1^2 + ... + sigma_r^2)$.
]

#problem(number: 8)[
  Given a square matrix with norm $norm(bf(A))_2 <= 1$. Prove that there exist square matrices $bf(B), bf(C), bf(D)$ such that the matrix $mat(bf(A), bf(B); bf(C), bf(D))$ is unitary.
]

#problem(number: 9)[
  Let $bf(A) = bf(A)^T in bb(C)^(n times n)$. Prove that the matrix $bf(A)$ possesses a singular value decomposition $bf(A) = bf(U) bf(Sigma) bf(V)^*$ with the additional condition $bf(V)^* = bf(U)^T$.
]

#subsec("Best Low-Rank Approximations", beyond: true) // Tyrtyshnikov §35.7


In each matrix $sigma_k bf(u)_k bf(v)_k^*$, the entry in position $(i, j)$ may be regarded as a function of $i$ and $j$ with separated discrete variables $i$ and $j$: $f(i, j) = f_1(i) f_2(j)$. Thus, writing $bf(A)$ in the form $bf(A) = sum_(i=1)^r sigma_i bf(u)_i bf(v)_i^*$ describes a certain special way of separating variables in each term of the sum or, in matrix terminology, a skeleton decomposition of the matrix $bf(A)$—moreover, with the important additional property of orthonormality of the sets ${bf(u)_1, ..., bf(u)_r}$ and ${bf(v)_1, ..., bf(v)_r}$.

The special value and breadth of applications of the singular value decomposition are due above all to the fact that it provides a simple and reliable mechanism for eliminating the "least significant information" from a matrix—by approximating it with a sum of a _smaller number of summands_ with separated variables $i$ and $j$. What is at issue is finding an element of best approximation for a given matrix $bf(A)$ on a rather complicated set—the set of matrices whose rank is bounded by a given number.

#theorem(title: "Best Low-Rank Approximations")[
  Let a matrix $bf(A) in bb(C)^(m times n)$ be given by a singular value decomposition of the form
  $ bf(A) = sum_(l=1)^r sigma_l bf(u)_l bf(v)_l^*, $
  and let us agree to set $sigma_(r + 1) = 0$. Let an integer $1 <= k <= r$ be given. Then
  $ min_(rank(bf(B)) <= k \ bf(B) in bb(C)^(m times n)) norm(bf(A) - bf(B))_2 = sigma_(k + 1) = norm(bf(A) - bf(A)_k)_2, $
  where $bf(A)_k = sum_(l=1)^k sigma_l bf(u)_l bf(v)_l^*$.
]

#proof[
  Let $rank(bf(B)) <= k$. Then $dim(Null(bf(B))) >= n - k$. Consider the subspace $W = span{bf(v)_1, ..., bf(v)_(k + 1)}$ spanned by the leading singular vectors. By Grassmann's theorem,
  $ dim(Null(bf(B)) sect W) = dim(Null(bf(B))) + dim(W) - dim(Null(bf(B)) + W) >= \
    >= (n - k) + (k + 1) - n = 1. $
  Therefore, there exists a nonzero vector $bf(z) in Null(bf(B)) sect W$. We may assume that $norm(bf(z)) = 1$. Taking into account that
  $ bf(z) = sum_(l=1)^(k + 1) alpha_l bf(v)_l, quad sum_(l=1)^(k + 1) abs(alpha_l)^2 = 1, $
  we find
  $ norm(bf(A) - bf(B))_2 >= norm((bf(A) - bf(B)) bf(z)) = norm(bf(A) bf(z)) = sqrt(sum_(l=1)^(k + 1) abs(alpha_l)^2 sigma_l^2) >= sigma_(k + 1). $
  At the same time,
  $ bf(A) - bf(A)_k = sum_(l=k+1)^r sigma_l bf(u)_l bf(v)_l^* => norm(bf(A) - bf(A)_k)_2 = sigma_(k + 1). $
]
