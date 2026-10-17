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

#subsec("Finding Eigenvalues; the Eigenvalue Zero", added: true) // added for MA1522: geometric meaning of eigenvectors, finding eigenvalues via char(A), 0 is an eigenvalue iff A is singular, equivalent statements for invertibility

A square matrix $bf(A)$ of order $n$ moves the vectors of $bb(R)^n$ by the rule $bf(u) |-> bf(A) bf(u)$. Its eigenvectors are the nonzero vectors that are merely stretched, shrunk or reversed by this map, and the eigenvalue is the factor by which such a vector is scaled. The condition $bf(v) != bf(0)$ in the definition cannot be dropped: $bf(A) bf(0) = lambda bf(0)$ holds for every $lambda$, so admitting the zero vector would make every real number an eigenvalue.

By the criterion above, the eigenvalues of $bf(A)$ are the real roots of $char(bf(A))$, and the eigenvectors associated to an eigenvalue $lambda$ are the nontrivial solutions of the homogeneous system $(lambda bf(I) - bf(A)) bf(x) = bf(0)$.

#example[
  For the matrix
  $ bf(A) = mat(1, 2; 2, 1) $
  we find
  $ char(bf(A)) = detmat(x - 1, -2; -2, x - 1) = (x - 1)^2 - 4 = (x - 3)(x + 1), $
  so the eigenvalues are $3$ and $-1$. Indeed, $bf(A) (1, 1)^T = 3 (1, 1)^T$ and $bf(A) (1, -1)^T = -(1, -1)^T$: the matrix stretches the line $y = x$ by the factor $3$ and reverses the line $y = -x$.
]

#theorem[
  A square matrix $bf(A)$ is invertible if and only if $0$ is not an eigenvalue of $bf(A)$.
]

#proof[
  The number $0$ is an eigenvalue of $bf(A)$ if and only if $bf(A) bf(v) = 0 bf(v) = bf(0)$ for some $bf(v) != bf(0)$, that is, if and only if $det(0 bf(I) - bf(A)) = (-1)^n det(bf(A)) = 0$. By Section 2.6, $det(bf(A)) = 0$ means exactly that $bf(A)$ is not invertible.
]

#indent This adds one more item to the list of equivalent statements for invertibility assembled in Sections 2.6, 2.10, 3.6 and 4.2.

#theorem(title: "equivalent statements for invertibility")[
  For a square matrix $bf(A)$ of order $n$ the following statements are equivalent.
  #set enum(numbering: "(i)")
  + $bf(A)$ is invertible.
  + $bf(A)^T$ is invertible.
  + $bf(A)$ has a left inverse: $bf(B) bf(A) = bf(I)$ for some matrix $bf(B)$.
  + $bf(A)$ has a right inverse: $bf(A) bf(B) = bf(I)$ for some matrix $bf(B)$.
  + The reduced row-echelon form of $bf(A)$ is $bf(I)_n$.
  + $bf(A)$ is a product of elementary matrices.
  + The homogeneous system $bf(A) bf(x) = bf(0)$ has only the trivial solution.
  + For every $bf(b) in bb(R)^n$ the system $bf(A) bf(x) = bf(b)$ has exactly one solution.
  + $det(bf(A)) != 0$.
  + The columns of $bf(A)$ are linearly independent; equivalently, the rows of $bf(A)$ are linearly independent.
  + The columns of $bf(A)$ span $bb(R)^n$; equivalently, the rows of $bf(A)$ span $bb(R)^n$.
  + $rank(bf(A)) = n$, that is, $bf(A)$ has full rank.
  + $nullity(bf(A)) = 0$.
  + $0$ is not an eigenvalue of $bf(A)$.
]

#proof[
  The equivalence of (i)--(xiii) was established in Sections 2.6, 2.10, 3.6 and 4.2, and (i) $<=>$ (xiv) is the preceding theorem.
]

#subsec("Algebraic Multiplicity of an Eigenvalue") // Tyrtyshnikov §29.5


The multiplicity of an eigenvalue $lambda$ as a root of the characteristic polynomial is called its _algebraic multiplicity_ and is denoted $r_lambda$: it is the largest integer $r_lambda$ such that $char(bf(A)) = (x - lambda)^(r_lambda) p(x)$ for some polynomial $p(x)$.

From the fundamental theorem of algebra we immediately obtain the following theorem.

#theorem[
  Every complex matrix $bf(A)$ of order $n$ has $n$ complex eigenvalues counting algebraic multiplicities.
]

#subsec("Real Eigenvalues and Triangular Matrices", added: true) // added for MA1522: factorization of char(A) and the sum of algebraic multiplicities over R, eigenvalues of triangular matrices

Over $bb(R)$ the characteristic polynomial need not split into linear factors. If it does,
$ char(bf(A)) = (x - lambda_1)^(r_1) (x - lambda_2)^(r_2) dots.c (x - lambda_k)^(r_k), quad r_1 + r_2 + dots.c + r_k = n, $
with distinct real numbers $lambda_1, ..., lambda_k$, then these are the eigenvalues of $bf(A)$, the algebraic multiplicity of $lambda_i$ is $r_(lambda_i) = r_i$, and the algebraic multiplicities add up to $n$. In general $char(bf(A)) = (x - lambda_1)^(r_1) dots.c (x - lambda_k)^(r_k) q(x)$, where the polynomial $q(x)$ has no real roots; then $r_1 + dots.c + r_k <= n$, with equality exactly when $char(bf(A))$ splits into linear factors.

#example[
  The zero matrix $bf(0)$ of order $n$ has $char(bf(0)) = det(x bf(I)) = x^n$; its only eigenvalue is $0$, with $r_0 = n$. For the matrices
  $ bf(B) = mat(0, -1; 1, 0), quad bf(C) = mat(2, 0, 0; 0, 0, -1; 0, 1, 0) $
  we get $char(bf(B)) = x^2 + 1$ and $char(bf(C)) = (x - 2)(x^2 + 1)$. The matrix $bf(B)$ is the matrix of the rotation through the angle $pi \/ 2$; $char(bf(B))$ has no real roots, and indeed no nonzero vector of $bb(R)^2$ keeps its direction under a quarter-turn, so $bf(B)$ has no eigenvalues at all. The only eigenvalue of $bf(C)$ is $2$, with $r_2 = 1 < 3$.
]

#theorem[
  The eigenvalues of a triangular matrix are its diagonal entries, and the algebraic multiplicity of each eigenvalue is the number of times it occurs on the diagonal.
]

#proof[
  If $bf(A) = (a_(i j))_(n times n)$ is upper (lower) triangular, then so is $x bf(I) - bf(A)$, with diagonal entries $x - a_(1 1), ..., x - a_(n n)$. The determinant of a triangular matrix is the product of its diagonal entries: expand it along the first column (for a lower triangular matrix, along the first row), whose only possibly nonzero entry is the diagonal one, and repeat with the remaining triangular submatrix. Hence
  $ char(bf(A)) = (x - a_(1 1))(x - a_(2 2)) dots.c (x - a_(n n)). $
]

#indent For example, the matrix
$ mat(2, 5, -1; 0, 3, 4; 0, 0, 2) $
has the eigenvalues $2$ and $3$, with $r_2 = 2$ and $r_3 = 1$.

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

#subsec("Computing Eigenspaces", added: true) // added for MA1522: bases for eigenspaces via RREF, eigenvalues and multiplicities of the transpose

To find the eigenspace $E_lambda = Null(lambda bf(I) - bf(A))$, reduce $lambda bf(I) - bf(A)$ to reduced row-echelon form and read off a basis for the solution space of $(lambda bf(I) - bf(A)) bf(x) = bf(0)$; the geometric multiplicity $dim(E_lambda)$ is the number of non-pivot columns. Since $lambda$ is an eigenvalue, $dim(E_lambda) >= 1$.

#example[
  Let
  $ bf(A) = mat(3, 0, 0; 0, 1, 2; 2, 2, 1). $
  Expanding along the first row,
  $ char(bf(A)) = detmat(x - 3, 0, 0; 0, x - 1, -2; -2, -2, x - 1) = (x - 3)((x - 1)^2 - 4) = (x - 3)^2 (x + 1), $
  so the eigenvalues are $3$ and $-1$, with $r_3 = 2$ and $r_(-1) = 1$. Next,
  $ 3 bf(I) - bf(A) = mat(0, 0, 0; 0, 2, -2; -2, -2, 2) stretch(->)^"RREF" mat(1, 0, 0; 0, 1, -1; 0, 0, 0), $
  $ -bf(I) - bf(A) = mat(-4, 0, 0; 0, -2, -2; -2, -2, -2) stretch(->)^"RREF" mat(1, 0, 0; 0, 1, 1; 0, 0, 0), $
  hence $E_3 = span{(0, 1, 1)^T}$ and $E_(-1) = span{(0, -1, 1)^T}$. Both eigenspaces are lines: $dim(E_3) = 1 < r_3 = 2$ and $dim(E_(-1)) = 1 = r_(-1)$.
]

#proposition[
  A square matrix $bf(A)$ and its transpose $bf(A)^T$ have the same characteristic polynomial, and hence the same eigenvalues with the same algebraic multiplicities. Moreover, every eigenvalue $lambda$ has the same geometric multiplicity for $bf(A)$ as for $bf(A)^T$.
]

#proof[
  Since $x bf(I) - bf(A)^T = (x bf(I) - bf(A))^T$ and a matrix and its transpose have equal determinants (Section 2.10), $char(bf(A)^T) = char(bf(A))$. Since a matrix and its transpose have equal ranks (Section 4.2), $rank(lambda bf(I) - bf(A)^T) = rank((lambda bf(I) - bf(A))^T) = rank(lambda bf(I) - bf(A))$, and therefore $nullity(lambda bf(I) - bf(A)^T) = nullity(lambda bf(I) - bf(A))$, since rank and nullity add up to $n$ (Section 4.2).
]

#indent The eigenvectors of $bf(A)$ and $bf(A)^T$, however, are in general different.

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

#indent The question of diagonalizing matrices of order $3$ also arises when studying quadric surfaces (see Tyrtyshnikov, §§20.1–20.5)—when searching for a coordinate system in which the matrix of the quadratic part (a real symmetric matrix of order $3$) becomes diagonal.#footnote[In Section 6.3 it is proved that _every real symmetric matrix $bf(A)$ is orthogonally similar to a diagonal matrix $bf(D)$_—this means that $bf(A) = bf(P) bf(D) bf(P)^(-1) = bf(P) bf(D) bf(P)^T$, where $bf(P)$ is an orthogonal matrix, that is, $bf(A)$ is orthogonally diagonalizable. This same statement will soon appear as a consequence of more general results.]

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

#subsec("Independence of Eigenspaces and the Two Multiplicities", added: true) // added for MA1522: eigenspaces are linearly independent; geometric multiplicity is at most algebraic multiplicity (appendix)

#theorem[
  Let $lambda_1, ..., lambda_p$ be distinct eigenvalues of a square matrix $bf(A)$, and for each $i$ let $S_i$ be a linearly independent subset of the eigenspace $E_(lambda_i)$. Then the union $S_1 union S_2 union dots.c union S_p$ is linearly independent.
]

#proof[
  Take a linear combination of the vectors of the union that equals $bf(0)$, and group its terms by eigenspace: $bf(w)_1 + bf(w)_2 + dots.c + bf(w)_p = bf(0)$, where $bf(w)_i in E_(lambda_i)$ is the part of the combination formed from the vectors of $S_i$. The nonzero vectors among $bf(w)_1, ..., bf(w)_p$ are eigenvectors associated to pairwise distinct eigenvalues, so by the theorem of the preceding subsection they are linearly independent, and their sum cannot be $bf(0)$ unless there are none of them. Hence $bf(w)_i = bf(0)$ for every $i$, and since $S_i$ is linearly independent, all the coefficients of the vectors of $S_i$ vanish.
]

#indent In particular, the union of bases for $E_(lambda_1), ..., E_(lambda_p)$ is a linearly independent set of $dim(E_(lambda_1)) + dots.c + dim(E_(lambda_p))$ eigenvectors, so this sum never exceeds $n$.

#theorem[
  The geometric multiplicity of an eigenvalue $lambda$ of a square matrix $bf(A)$ does not exceed its algebraic multiplicity: $1 <= dim(E_lambda) <= r_lambda$.
]

#proof[
  Let $k = dim(E_lambda)$; then $k >= 1$, since an eigenvalue has an eigenvector. Let ${bf(u)_1, ..., bf(u)_k}$ be a basis for $E_lambda$, extend it to a basis ${bf(u)_1, ..., bf(u)_n}$ for $bb(R)^n$ (Section 3.7), and let $bf(Q) = mat(bf(u)_1, dots.c, bf(u)_n)$. This matrix is invertible, and $bf(Q)^(-1) bf(u)_j = bf(e)_j$ because $bf(Q) bf(e)_j = bf(u)_j$. For $j <= k$ we get $bf(Q)^(-1) bf(A) bf(u)_j = lambda bf(Q)^(-1) bf(u)_j = lambda bf(e)_j$, so the first $k$ columns of $bf(B) = bf(Q)^(-1) bf(A) bf(Q)$ are $lambda bf(e)_1, ..., lambda bf(e)_k$:
  $ bf(B) = mat(lambda bf(I)_k, bf(C); bf(0), bf(F)) $
  for some blocks $bf(C)$ and $bf(F)$, with $bf(F)$ square of order $n - k$. Expanding $det(x bf(I) - bf(B))$ successively along its first $k$ columns gives $char(bf(B)) = (x - lambda)^k char(bf(F))$. Similar matrices have the same characteristic polynomial (Section 6.1), so $char(bf(A)) = (x - lambda)^k char(bf(F))$, and therefore $r_lambda >= k$.
]

#subsec("Equivalent Statements for Diagonalizability", added: true) // added for MA1522: equivalent statements for diagonalizability, how to show that a matrix is not diagonalizable

#theorem[
  Let $bf(A)$ be a square matrix of order $n$ with distinct eigenvalues $lambda_1, ..., lambda_k$. The following statements are equivalent.
  #set enum(numbering: "(i)")
  + $bf(A)$ is diagonalizable.
  + There is a basis ${bf(u)_1, ..., bf(u)_n}$ for $bb(R)^n$ consisting of eigenvectors of $bf(A)$.
  + $char(bf(A))$ splits into linear factors, and the geometric multiplicity of each eigenvalue equals its algebraic multiplicity: $dim(E_(lambda_i)) = r_(lambda_i)$, $i = 1, ..., k$.
  + $dim(E_(lambda_1)) + dim(E_(lambda_2)) + dots.c + dim(E_(lambda_k)) = n$.
]

#proof[
  (i) $<=>$ (ii) is the theorem of Section 6.1: $bf(A) bf(P) = bf(P) bf(D)$ with $bf(P) = mat(bf(u)_1, dots.c, bf(u)_n)$ and $bf(D) = diag(mu_1, ..., mu_n)$ means exactly that $bf(A) bf(u)_j = mu_j bf(u)_j$ for all $j$, and $bf(P)$ is invertible exactly when its columns form a basis for $bb(R)^n$. Next, by the preceding theorem,
  $ dim(E_(lambda_1)) + dots.c + dim(E_(lambda_k)) <= r_(lambda_1) + dots.c + r_(lambda_k) <= n, $
  where the first inequality holds term by term, and the second is an equality exactly when $char(bf(A))$ splits into linear factors (Section 6.1). The sum on the left equals $n$ if and only if both inequalities are equalities, which proves (iii) $<=>$ (iv). If (iv) holds, the union of bases for the eigenspaces is a linearly independent set of $n$ eigenvectors (by the theorem on independence of eigenspaces), that is, a basis for $bb(R)^n$; this is (ii). Conversely, if (ii) holds, the vectors of the basis associated to $lambda_i$ form a linearly independent subset of $E_(lambda_i)$, so there are at most $dim(E_(lambda_i))$ of them; hence the sum in (iv) is at least $n$, and so equals $n$.
]

#indent Consequently, to show that a square matrix $bf(A)$ is _not_ diagonalizable, it suffices to show that $char(bf(A))$ does not split into linear factors over $bb(R)$, or that some eigenvalue has $dim(E_lambda) < r_lambda$. For example, the matrix $bf(C)$ with $char(bf(C)) = (x - 2)(x^2 + 1)$ considered in Section 6.1 is not diagonalizable, and neither is the matrix $bf(A)$ of the example in the subsection "Computing Eigenspaces" of Section 6.1, for which $dim(E_3) = 1 < 2 = r_3$. The corollary on $n$ distinct eigenvalues is a special case of the theorem: then $1 <= dim(E_(lambda_i)) <= r_(lambda_i) = 1$ for each of the $n$ eigenvalues, and the sum in (iv) equals $n$.

#remark[
  If a matrix $bf(A)$ of order $n$ has only one eigenvalue $lambda$, then $bf(A)$ is diagonalizable if and only if $bf(A) = lambda bf(I)_n$. Indeed, if $bf(A) = bf(P) bf(D) bf(P)^(-1)$, the diagonal entries of $bf(D)$ are eigenvalues of $bf(A)$, so $bf(D) = lambda bf(I)$ and $bf(A) = bf(P) (lambda bf(I)) bf(P)^(-1) = lambda bf(I)$. Thus a triangular matrix whose diagonal entries are all equal is diagonalizable only if it is diagonal; for instance,
  $ mat(1, 2; 0, 1) $
  is not diagonalizable.
]

#subsec("Algorithm for Diagonalization", added: true) // added for MA1522: the algorithm for diagonalization

#algorithm(title: "diagonalization")[
  Let $bf(A)$ be a square matrix of order $n$.
  + Compute and factorize $char(bf(A))$. If it does not split into linear factors, then $bf(A)$ is not diagonalizable. Otherwise
    $ char(bf(A)) = (x - lambda_1)^(r_(lambda_1)) dots.c (x - lambda_k)^(r_(lambda_k)) $
    with distinct $lambda_1, ..., lambda_k$.
  + For each $i$, find a basis $S_(lambda_i)$ for $E_(lambda_i)$, the solution space of $(lambda_i bf(I) - bf(A)) bf(x) = bf(0)$. If $dim(E_(lambda_i)) < r_(lambda_i)$ for some $i$, then $bf(A)$ is not diagonalizable. (Eigenvalues with $r_lambda = 1$ always pass this test, so it pays to treat first those with $r_lambda > 1$.)
  + Otherwise $S = S_(lambda_1) union dots.c union S_(lambda_k) = {bf(u)_1, ..., bf(u)_n}$ is a basis for $bb(R)^n$ consisting of eigenvectors of $bf(A)$.
  + Set $bf(P) = mat(bf(u)_1, dots.c, bf(u)_n)$ and $bf(D) = diag(mu_1, ..., mu_n)$, where $mu_j$ is the eigenvalue associated to $bf(u)_j$. Then $bf(A) = bf(P) bf(D) bf(P)^(-1)$.
]

#example[
  Let
  $ bf(A) = mat(3, 1, 0; -2, 0, 0; 4, 4, 2). $
  Expanding along the third column,
  $ char(bf(A)) = (x - 2) detmat(x - 3, -1; 2, x) = (x - 2)(x^2 - 3 x + 2) = (x - 1)(x - 2)^2. $
  For the double eigenvalue $2$,
  $ 2 bf(I) - bf(A) = mat(-1, -1, 0; 2, 2, 0; -4, -4, 0) stretch(->)^"RREF" mat(1, 1, 0; 0, 0, 0; 0, 0, 0), quad E_2 = span{mat(-1; 1; 0), mat(0; 0; 1)}, $
  so $dim(E_2) = 2 = r_2$. For the simple eigenvalue $1$,
  $ bf(I) - bf(A) = mat(-2, -1, 0; 2, 1, 0; -4, -4, -1) stretch(->)^"RREF" mat(1, 0, -1/4; 0, 1, 1/2; 0, 0, 0), quad E_1 = span{mat(1; -2; 4)}. $
  Hence $bf(A)$ is diagonalizable, $bf(A) = bf(P) bf(D) bf(P)^(-1)$ with
  $ bf(P) = mat(-1, 0, 1; 1, 0, -2; 0, 1, 4), quad bf(D) = mat(2, 0, 0; 0, 2, 0; 0, 0, 1), quad bf(P)^(-1) = mat(-2, -1, 0; 4, 4, 1; -1, -1, 0). $
]

#indent The matrices $bf(P)$ and $bf(D)$ are not unique: the eigenvectors may be listed in another order (which permutes the diagonal entries of $bf(D)$ in the same way), and each $S_(lambda_i)$ may be replaced by any other basis for $E_(lambda_i)$. For a given $bf(P)$, however, $bf(D) = bf(P)^(-1) bf(A) bf(P)$ is determined.

#sec("6.3", "Orthogonally Diagonalizable Matrices")

#subsec("Orthogonally Diagonalizable Matrices", added: true) // added for MA1522: definition of orthogonal diagonalizability, spectral theorem with equivalent statements, eigenspaces of a symmetric matrix are orthogonal

Recall that a square matrix $bf(P)$ is orthogonal if $bf(P)^T = bf(P)^(-1)$, that is, if its columns form an orthonormal basis for $bb(R)^n$ (Section 5.2).

#definition[
  A square matrix $bf(A)$ is _orthogonally diagonalizable_ if $bf(A) = bf(P) bf(D) bf(P)^T$ for some orthogonal matrix $bf(P)$ and some diagonal matrix $bf(D)$.
]

#indent Since $bf(P)^T = bf(P)^(-1)$, an orthogonally diagonalizable matrix is diagonalizable, $bf(A) = bf(P) bf(D) bf(P)^(-1)$; what is required in addition is that the invertible matrix $bf(P)$ be orthogonal.

#theorem(title: "spectral theorem")[
  For a square matrix $bf(A)$ of order $n$ the following statements are equivalent.
  #set enum(numbering: "(i)")
  + $bf(A)$ is orthogonally diagonalizable.
  + There is an orthonormal basis ${bf(u)_1, ..., bf(u)_n}$ for $bb(R)^n$ consisting of eigenvectors of $bf(A)$.
  + $bf(A)$ is symmetric, $bf(A)^T = bf(A)$.
]

#proof[
  (i) $<=>$ (ii): as in the diagonalization theorem (Section 6.2), $bf(A) = bf(P) bf(D) bf(P)^(-1)$ with $bf(D)$ diagonal means that the columns of $bf(P)$ are eigenvectors of $bf(A)$ forming a basis for $bb(R)^n$, and $bf(P)$ is orthogonal exactly when this basis is orthonormal. (i) $=>$ (iii): $bf(A)^T = (bf(P) bf(D) bf(P)^T)^T = bf(P) bf(D)^T bf(P)^T = bf(P) bf(D) bf(P)^T = bf(A)$, since a diagonal matrix is symmetric. (iii) $=>$ (i) is the theorem on the diagonalization of real symmetric matrices, proved below in this section.
]

#theorem[
  Eigenvectors of a symmetric matrix associated to distinct eigenvalues are orthogonal. Thus the eigenspaces of a symmetric matrix associated to distinct eigenvalues are orthogonal to each other.
]

#proof[
  Let $bf(A)^T = bf(A)$, $bf(A) bf(v)_1 = lambda_1 bf(v)_1$ and $bf(A) bf(v)_2 = lambda_2 bf(v)_2$ with $lambda_1 != lambda_2$. Then
  $ lambda_1 (bf(v)_1 dot bf(v)_2) = (bf(A) bf(v)_1)^T bf(v)_2 = bf(v)_1^T bf(A)^T bf(v)_2 = bf(v)_1^T bf(A) bf(v)_2 = lambda_2 (bf(v)_1 dot bf(v)_2), $
  so $(lambda_1 - lambda_2)(bf(v)_1 dot bf(v)_2) = 0$, and $bf(v)_1 dot bf(v)_2 = 0$.
]

#indent Consequently, to build an orthonormal basis of eigenvectors one need not orthogonalize all $n$ eigenvectors together: vectors from different eigenspaces are orthogonal already, and the Gram–Schmidt process has to be applied only within each eigenspace (see the algorithm at the end of this section).

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


The following theorem is proved by the _method of rotations_ (Jacobi's method): one annihilates off-diagonal entries one at a time by rotating the coordinate system in coordinate planes. (For matrices of order $3$ the method is worked out in detail in Tyrtyshnikov, §§20.3–20.5.)

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

  Clearly, the symmetry of the matrix $bf(A)_0 = bf(A)$ is inherited by all the matrices $bf(A)_k$. Only the rows and columns with indices $i$ and $j$ change, and the $(2 times 2)$-submatrix of $bf(A)_k$ in these rows and columns is obtained from the corresponding submatrix of $bf(A)_(k - 1)$ by the same rotation; its off-diagonal entry equals $a_(i j)^((k - 1)) cos 2 phi - frac(1, 2) (a_(i i)^((k - 1)) - a_(j j)^((k - 1))) sin 2 phi$. Hence $phi$ can be chosen in such a way that $a_(i j)^((k)) = a_(j i)^((k)) = 0$ (if $a_(i j)^((k - 1)) != 0$, take $phi$ with $cot 2 phi = (a_(i i)^((k - 1)) - a_(j j)^((k - 1))) \/ (2 a_(i j)^((k - 1)))$). Denote by $d_k$ and $h_k$ the sums of the squares of the diagonal and off-diagonal entries of the matrix $bf(A)_k$. An orthogonal transformation preserves the sum of the squares of the entries of a matrix (Section 5.2); applying this to the whole matrix and to the $(2 times 2)$-submatrix (which becomes diagonal), and noting that the other diagonal entries do not change, we get $d_k + h_k = d_(k - 1) + h_(k - 1)$ and
  $ (a_(i i)^((k)))^2 + (a_(j j)^((k)))^2 = (a_(i i)^((k - 1)))^2 + (a_(j j)^((k - 1)))^2 + 2 (a_(i j)^((k - 1)))^2 quad => \
  => quad d_k - d_(k - 1) = 2 (a_(i j)^((k - 1)))^2. $
  For each $k$, we shall choose the plane of rotation (the indices $i < j$) in such a way that the eliminated entry $a_(i j)^((k - 1))$ is maximal in modulus among all off-diagonal entries of the matrix $bf(A)_(k - 1)$. The total number of off-diagonal entries is $n^2 - n$. Therefore
  $ (a_(i j)^((k - 1)))^2 >= h_(k - 1) / (n^2 - n). $
  Hence, taking into account the equality $d_k + h_k = d_(k - 1) + h_(k - 1)$, we obtain
  $ h_k <= h_(k - 1) - 2 / (n^2 - n) h_(k - 1) <= (1 - 2 / (n^2 - n))^k h_0 -> 0 quad "as" k -> infinity. $

  #indent From relations $(*)$ it follows that
  $ bf(A)_k = bf(P)_k^T bf(A) bf(P)_k, quad k = 1, 2, ..., $
  where for all $k$ the matrices $bf(P)_k = (p_(i j)^((k)))$ are orthogonal (as products of orthogonal matrices).

  For any fixed $i, j$, the sequences $a_(i j)^((k)), p_(i j)^((k))$ are bounded. By the lemma on bounded sequences (from finitely many bounded sequences of numbers one can extract convergent subsequences with one and the same sequence of indices; this follows by applying the Bolzano–Weierstrass theorem to the sequences one after another, see Tyrtyshnikov, §20.4), there exists a sequence of indices $k_1 < k_2 < ...$ such that each of the subsequences $a_(i j)^((k_l)), p_(i j)^((k_l))$ is convergent. Note that $a_(i j)^((k_l)) -> 0$ for $i != j$. Let
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


Recall that a matrix $bf(A)$ is called Hermitian if $bf(A)^* = bf(A)$ (see Tyrtyshnikov, §25.2). A square complex matrix $bf(A)$ is called _normal_ if $bf(A)^* bf(A) = bf(A) bf(A)^*$; obviously, any Hermitian matrix is normal. A matrix is normal if and only if $bf(A) = bf(Q) bf(D) bf(Q)^*$ for some unitary matrix $bf(Q)$ and some diagonal matrix $bf(D) = diag(lambda_1, ..., lambda_n)$, whose diagonal entries are then the eigenvalues of $bf(A)$ (this is proved in Tyrtyshnikov, §33.1, by means of Schur's theorem, §30.8).

#proposition[
  A normal matrix is Hermitian if and only if all of its eigenvalues are real.
]

#proof[
  Let $bf(A) = bf(Q) bf(D) bf(Q)^*$ as above. Then $bf(A)^* = bf(Q) bf(D)^* bf(Q)^*$, so $bf(A)^* = bf(A) <=> bf(D)^* = bf(D) <=> overline(lambda)_i = lambda_i$, $1 <= i <= n$.
]

#remark[
  For a real matrix $bf(A)$ we have $bf(A)^* = bf(A)^T$, so the real Hermitian matrices are exactly the real symmetric matrices, $bf(A)^T = bf(A)$; by the proposition, their eigenvalues are real. The real symmetric case is the _spectral theorem_ of MA1522 (stated at the beginning of this section): a real square matrix $bf(A)$ is orthogonally diagonalizable, $bf(A) = bf(P) bf(D) bf(P)^T$ with $bf(P)$ orthogonal and $bf(D)$ diagonal, if and only if $bf(A)$ is symmetric. One direction is the theorem on the diagonalization of real symmetric matrices proved above; conversely, $bf(A) = bf(P) bf(D) bf(P)^T$ implies $bf(A)^T = bf(P) bf(D)^T bf(P)^T = bf(P) bf(D) bf(P)^T = bf(A)$.
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

#subsec("Algorithm for Orthogonal Diagonalization", added: true) // added for MA1522: the algorithm for orthogonal diagonalization (Gram–Schmidt within eigenspaces)

#algorithm(title: "orthogonal diagonalization")[
  Let $bf(A)$ be a symmetric matrix of order $n$.
  + Compute and factorize the characteristic polynomial,
    $ char(bf(A)) = (x - lambda_1)^(r_(lambda_1)) dots.c (x - lambda_k)^(r_(lambda_k)), $
    with distinct $lambda_1, ..., lambda_k$.
  + For each $i$, find a basis $S_(lambda_i)$ for the eigenspace $E_(lambda_i)$, the solution space of $(lambda_i bf(I) - bf(A)) bf(x) = bf(0)$.
  + Apply the Gram–Schmidt process (Section 5.3) to each $S_(lambda_i)$, obtaining an orthonormal basis $T_(lambda_i)$ for $E_(lambda_i)$. Then $T = T_(lambda_1) union dots.c union T_(lambda_k) = {bf(u)_1, ..., bf(u)_n}$ is an orthonormal basis for $bb(R)^n$.
  + Set $bf(P) = mat(bf(u)_1, dots.c, bf(u)_n)$ and $bf(D) = diag(mu_1, ..., mu_n)$, where $mu_j$ is the eigenvalue associated to $bf(u)_j$. Then $bf(P)$ is orthogonal and $bf(A) = bf(P) bf(D) bf(P)^T$.
]

#indent The algorithm always succeeds. By the spectral theorem, $bf(A)$ is diagonalizable, so by Section 6.2 its characteristic polynomial splits into linear factors and $dim(E_(lambda_1)) + dots.c + dim(E_(lambda_k)) = n$; hence $T$ consists of $n$ unit vectors. Vectors of $T$ taken from the same $T_(lambda_i)$ are orthogonal by construction, and vectors from different eigenspaces are orthogonal by the theorem at the beginning of this section. An orthonormal set of $n$ vectors in $bb(R)^n$ is a basis.

#example[
  Let
  $ bf(A) = mat(0, -2, -1; -2, 3, 2; -1, 2, 0). $
  A direct computation gives $char(bf(A)) = x^3 - 3 x^2 - 9 x - 5 = (x + 1)^2 (x - 5)$, and
  $ -bf(I) - bf(A) = mat(-1, 2, 1; 2, -4, -2; 1, -2, -1) stretch(->)^"RREF" mat(1, -2, -1; 0, 0, 0; 0, 0, 0), \
  E_(-1) = span{mat(2; 1; 0), mat(1; 0; 1)}, $
  $ 5 bf(I) - bf(A) = mat(5, 2, 1; 2, 2, -2; 1, -2, 5) stretch(->)^"RREF" mat(1, 0, 1; 0, 1, -2; 0, 0, 0), quad E_5 = span{mat(-1; 2; 1)}. $
  As the theorem predicts, $(-1, 2, 1)^T$ is orthogonal to both basis vectors $bf(s)_1 = (2, 1, 0)^T$ and $bf(s)_2 = (1, 0, 1)^T$ of $E_(-1)$, while these two are not orthogonal to each other. The Gram–Schmidt process in $E_(-1)$ gives $bf(w)_1 = bf(s)_1$ and
  $ bf(w)_2 = bf(s)_2 - (bf(s)_2 dot bf(w)_1) / norm(bf(w)_1)^2 bf(w)_1 = mat(1; 0; 1) - 2/5 mat(2; 1; 0) = 1/5 mat(1; -2; 5). $
  Normalizing $bf(w)_1$, $bf(w)_2$ and the eigenvector $(-1, 2, 1)^T$, we obtain $bf(A) = bf(P) bf(D) bf(P)^T$ with
  $ bf(P) = mat(2 \/ sqrt(5), 1 \/ sqrt(30), -1 \/ sqrt(6); 1 \/ sqrt(5), -2 \/ sqrt(30), 2 \/ sqrt(6); 0, 5 \/ sqrt(30), 1 \/ sqrt(6)), quad bf(D) = mat(-1, 0, 0; 0, -1, 0; 0, 0, 5). $
]

#sec("6.4", "Application of Diagonalization: Markov Chains")

#subsec("Powers of Diagonalizable Matrices", added: true) // added for MA1522: A^k = P D^k P^(-1), powers of diagonal matrices, eigenvalues of powers (appendix lemma)

#theorem[
  If $bf(A) = bf(P) bf(B) bf(P)^(-1)$ with an invertible matrix $bf(P)$, then $bf(A)^k = bf(P) bf(B)^k bf(P)^(-1)$ for every positive integer $k$. If, moreover, $bf(A)$ is invertible, this holds for every integer $k$ (with $bf(A)^0 = bf(I)$ and $bf(A)^(-k) = (bf(A)^(-1))^k$).
]

#proof[
  By induction on $k$: $bf(A)^(k + 1) = bf(A)^k bf(A) = bf(P) bf(B)^k bf(P)^(-1) bf(P) bf(B) bf(P)^(-1) = bf(P) bf(B)^(k + 1) bf(P)^(-1)$. If $bf(A)$ is invertible, then so is $bf(B) = bf(P)^(-1) bf(A) bf(P)$, and $bf(A)^(-1) = bf(P) bf(B)^(-1) bf(P)^(-1)$; applying the first part to $bf(A)^(-1)$ gives the negative powers, and $k = 0$ is trivial.
]

#indent The matrix $bf(B)$ need not be diagonal here. When it is, its powers are easy to compute: the product of two diagonal matrices is the diagonal matrix of the products of their diagonal entries, so by induction
$ diag(d_1, ..., d_n)^k = diag(d_1^k, ..., d_n^k) $
for every positive integer $k$, and for every integer $k$ if all $d_i != 0$.

#corollary[
  If $bf(A) = bf(P) diag(mu_1, ..., mu_n) bf(P)^(-1)$, then
  $ bf(A)^k = bf(P) diag(mu_1^k, ..., mu_n^k) bf(P)^(-1) $
  for every positive integer $k$, and for every integer $k$ if $bf(A)$ is invertible.
]

#indent (If $bf(A)$ is invertible, all $mu_i != 0$, since $0$ is not an eigenvalue of $bf(A)$.) Thus once a matrix has been diagonalized, its powers cost no more than the powers of $n$ numbers. In the same spirit:

#proposition[
  If $bf(A) bf(v) = lambda bf(v)$, then $bf(A)^k bf(v) = lambda^k bf(v)$ for every positive integer $k$: an eigenvector of $bf(A)$ associated to $lambda$ is an eigenvector of $bf(A)^k$ associated to $lambda^k$.
]

#proof[
  By induction: $bf(A)^(k + 1) bf(v) = bf(A) (bf(A)^k bf(v)) = lambda^k bf(A) bf(v) = lambda^(k + 1) bf(v)$.
]

#subsec("Stochastic Matrices and Markov Chains", added: true) // added for MA1522: probability vectors, stochastic matrices, Markov chains, state vectors; long-run behaviour via diagonalization

#definition[
  A vector $bf(v) = (v_1, ..., v_n)^T in bb(R)^n$ is a _probability vector_ if $v_i >= 0$ for all $i$ and $v_1 + v_2 + dots.c + v_n = 1$. A _stochastic matrix_ is a square matrix whose columns are probability vectors. A _Markov chain_ is a sequence of probability vectors $bf(x)_0, bf(x)_1, bf(x)_2, ...$ together with a stochastic matrix $bf(P)$ such that
  $ bf(x)_(k + 1) = bf(P) bf(x)_k, quad k = 0, 1, 2, ... $
]

#indent In applications, a Markov chain describes a system that at each step is in one of $n$ states. The $i$-th entry of the _state vector_ $bf(x)_k$ is the probability that after $k$ steps the system is in state $i$, and the entry $p_(i j)$ of $bf(P)$ is the probability of passing in one step from state $j$ to state $i$. Clearly, $bf(x)_k = bf(P)^k bf(x)_0$.

Let $bf(1) = (1, 1, ..., 1)^T in bb(R)^n$. The sum of the entries of a vector $bf(v)$ is $bf(1)^T bf(v)$, so a square matrix $bf(P)$ with nonnegative entries is stochastic if and only if $bf(1)^T bf(P) = bf(1)^T$, that is, $bf(P)^T bf(1) = bf(1)$.

#proposition[
  If $bf(P)$ is a stochastic matrix and $bf(v)$ is a probability vector, then $bf(P) bf(v)$ is a probability vector. A product of stochastic matrices of the same order is stochastic; in particular, every power $bf(P)^k$ of a stochastic matrix is stochastic.
]

#proof[
  The entries of $bf(P) bf(v)$ are sums of products of nonnegative numbers, and $bf(1)^T (bf(P) bf(v)) = (bf(1)^T bf(P)) bf(v) = bf(1)^T bf(v) = 1$. The $j$-th column of a product $bf(P) bf(Q)$ is $bf(P)$ times the $j$-th column of $bf(Q)$.
]

#indent Thus a stochastic matrix $bf(P)$ and any probability vector $bf(x)_0$ generate a Markov chain. Its long-run behaviour can often be found by diagonalizing $bf(P)$.

#example[
  Every working day a commuter travels either by bus (state 1) or by train (state 2). After a day on the bus she takes the bus again the next day with probability $0.9$ and the train with probability $0.1$; after a day on the train she switches to the bus with probability $0.2$ and stays with the train with probability $0.8$. The stochastic matrix of this Markov chain is
  $ bf(P) = mat(0.9, 0.2; 0.1, 0.8). $
  Its characteristic polynomial is $char(bf(P)) = x^2 - 1.7 x + 0.7 = (x - 1)(x - 0.7)$; the eigenspaces are $E_1 = span{(2, 1)^T}$ and $E_(0.7) = span{(-1, 1)^T}$, so that
  $ bf(P) = bf(Q) mat(1, 0; 0, 0.7) bf(Q)^(-1), quad bf(Q) = mat(2, -1; 1, 1), quad bf(Q)^(-1) = 1/3 mat(1, 1; -1, 2), $
  and by the corollary of the preceding subsection
  $ bf(P)^k = bf(Q) mat(1, 0; 0, 0.7^k) bf(Q)^(-1) = 1/3 mat(2 + 0.7^k, 2 - 2 dot 0.7^k; 1 - 0.7^k, 1 + 2 dot 0.7^k). $
  If she takes the train today, $bf(x)_0 = bf(e)_2$, then three days later
  $ bf(x)_3 = bf(P)^3 bf(e)_2 = 1/3 mat(2 - 2 dot 0.343; 1 + 2 dot 0.343) = mat(0.438; 0.562). $
  Since $0.7^k -> 0$ as $k -> infinity$, for every probability vector $bf(x)_0 = (a, b)^T$ we get
  $ bf(P)^k bf(x)_0 -> 1/3 mat(2, 2; 1, 1) mat(a; b) = mat(2 \/ 3; 1 \/ 3) $
  (because $a + b = 1$): in the long run she takes the bus on two days out of three, whatever she does today. The limit is the probability vector in $E_1$.
]

#subsec("Equilibrium Vectors", added: true) // added for MA1522: equilibrium (steady-state) vectors, 1 is an eigenvalue of every stochastic matrix, limits of Markov chains, algorithm for computing an equilibrium vector

#definition[
  An _equilibrium vector_ (or _steady-state vector_) of a stochastic matrix $bf(P)$ is a probability vector $bf(v)$ with $bf(P) bf(v) = bf(v)$, that is, a probability vector that is an eigenvector of $bf(P)$ associated to the eigenvalue $1$.
]

#proposition[
  The number $1$ is an eigenvalue of every stochastic matrix $bf(P)$.
]

#proof[
  Since $bf(P)^T bf(1) = bf(1)$, the number $1$ is an eigenvalue of $bf(P)^T$, and $bf(P)$ and $bf(P)^T$ have the same eigenvalues (Section 6.1).
]

#theorem[
  Let $bf(P)$ be a stochastic matrix and let $bf(x)_(k + 1) = bf(P) bf(x)_k$ be a Markov chain. If the state vectors $bf(x)_k$ converge (entrywise) to a vector $bf(v)$ as $k -> infinity$, then $bf(v)$ is an equilibrium vector of $bf(P)$.
]

#proof[
  As limits of nonnegative numbers, the entries of $bf(v)$ are nonnegative, and their sum is the limit of the sums of the entries of $bf(x)_k$, which all equal $1$. Each entry of $bf(P) bf(x)_k$ is a fixed linear combination of the entries of $bf(x)_k$, so $bf(P) bf(v) = lim_(k -> infinity) bf(P) bf(x)_k = lim_(k -> infinity) bf(x)_(k + 1) = bf(v)$.
]

#proposition[
  Every stochastic matrix has an equilibrium vector.
]

#proof[
  Take any probability vector $bf(x)_0$ and let $bf(y)_m = frac(1, m) (bf(x)_0 + bf(P) bf(x)_0 + dots.c + bf(P)^(m - 1) bf(x)_0)$, $m = 1, 2, ...$ Each $bf(y)_m$ is a probability vector, and
  $ bf(P) bf(y)_m - bf(y)_m = frac(1, m) (bf(P)^m bf(x)_0 - bf(x)_0) $
  has all its entries between $-1 \/ m$ and $1 \/ m$. The entries of the vectors $bf(y)_m$ lie in $[0, 1]$; by the Bolzano–Weierstrass theorem, applied to the $n$ coordinates one after another, some subsequence $bf(y)_(m_1), bf(y)_(m_2), ...$ converges to a vector $bf(v)$. As in the preceding proof, $bf(v)$ is a probability vector, and $bf(P) bf(v) - bf(v) = lim_(l -> infinity) (bf(P) bf(y)_(m_l) - bf(y)_(m_l)) = bf(0)$.
]

#indent An equilibrium vector is therefore found by solving a homogeneous linear system and rescaling.

#algorithm(title: "equilibrium vector")[
  Let $bf(P)$ be a stochastic matrix of order $n$.
  + Find a nonzero solution $bf(u) = (u_1, ..., u_n)^T$ of $(bf(I) - bf(P)) bf(x) = bf(0)$ with nonnegative entries, that is, such an eigenvector of $bf(P)$ associated to $1$. If $dim(E_1) = 1$ (as for every regular stochastic matrix, see the next subsection), any nonzero solution will do, after a change of sign if necessary.
  + Set $bf(v) = (u_1 + dots.c + u_n)^(-1) bf(u)$. Then $bf(v)$ is an equilibrium vector of $bf(P)$.
]

#indent Indeed, $bf(v) in E_1$ has nonnegative entries, and they add up to $(u_1 + dots.c + u_n) \/ (u_1 + dots.c + u_n) = 1$. When $dim(E_1) = 1$, the line $E_1$ is spanned by an equilibrium vector (one exists by the proposition above), so every nonzero $bf(u) in E_1$ is a nonzero multiple of it and has all its entries $>= 0$ or all $<= 0$; in this case the equilibrium vector is unique, since two probability vectors on one line through $bf(0)$ coincide. Equivalently, an equilibrium vector is a solution with nonnegative entries of the $(n + 1) times n$ linear system
$ mat(bf(P) - bf(I)_n; bf(1)^T) bf(x) = mat(bf(0); 1), $
which has exactly one solution when $dim(E_1) = 1$.

#subsec("Regular Stochastic Matrices", added: true) // added for MA1522: regular stochastic matrices; dim(E_1) = 1 for positive stochastic matrices; uniqueness of the equilibrium vector and convergence of Markov chains (appendix)

#definition[
  A stochastic matrix $bf(P)$ is _regular_ if some power $bf(P)^k$, $k >= 1$, has all its entries positive.
]

#indent For example, the matrix $bf(P)$ of the commuter example above is regular: already $bf(P)^1$ has positive entries.

#lemma[
  If all the entries of a stochastic matrix $bf(A) = (a_(i j))_(n times n)$ are positive, then the eigenvalue $1$ of $bf(A)$ has geometric multiplicity $dim(E_1) = 1$.
]

#proof[
  By Section 6.1 it suffices to prove this for $bf(A)^T$. Let $bf(A)^T bf(x) = bf(x)$, $bf(x) = (x_1, ..., x_n)^T$, and choose an index $m$ with $x_m = max_i x_i$. The $m$-th entry of the equality $bf(A)^T bf(x) = bf(x)$ reads $a_(1 m) x_1 + dots.c + a_(n m) x_n = x_m$; since $a_(1 m) + dots.c + a_(n m) = 1$, this means
  $ a_(1 m) (x_m - x_1) + a_(2 m) (x_m - x_2) + dots.c + a_(n m) (x_m - x_n) = 0. $
  All the terms are nonnegative and all $a_(i m) > 0$, so $x_i = x_m$ for every $i$. Hence the eigenspace of $bf(A)^T$ associated to $1$ is $span{bf(1)}$, of dimension $1$.
]

#theorem[
  A regular stochastic matrix $bf(P)$ has a unique equilibrium vector $bf(v)$, and for every probability vector $bf(x)_0$ the Markov chain $bf(x)_(k + 1) = bf(P) bf(x)_k$ converges to $bf(v)$.
]

#proof[
  Let $bf(B) = bf(P)^k$ have positive entries. The matrix $bf(B)$ is stochastic as a power of a stochastic matrix, so by the lemma its eigenspace associated to $1$ is a line. Every eigenvector of $bf(P)$ associated to $1$ is an eigenvector of $bf(B)$ associated to $1^k = 1$ (see the subsection on powers of matrices), so for $bf(P)$ we get $1 <= dim(E_1) <= 1$. By the preceding subsection, $bf(P)$ has exactly one equilibrium vector $bf(v)$.

  To prove convergence, use the norm $norm(bf(y))_1 = abs(y_1) + dots.c + abs(y_n)$ on $bb(R)^n$. For a stochastic matrix $bf(Q) = (q_(i j))$ and any $bf(y) in bb(R)^n$,
  $ norm(bf(Q) bf(y))_1 = sum_(i=1)^n abs(sum_(j=1)^n q_(i j) y_j) <= sum_(j=1)^n (sum_(i=1)^n q_(i j)) abs(y_j) = norm(bf(y))_1, $
  and $bf(1)^T bf(Q) bf(y) = bf(1)^T bf(y)$, so $bf(Q)$ maps vectors with entry sum $0$ to vectors with entry sum $0$. Let $delta > 0$ be the smallest entry of $bf(B) = (b_(i j))$; since the columns of $bf(B)$ add up to $1$, we have $n delta <= 1$. If $bf(1)^T bf(y) = 0$, then $(bf(B) bf(y))_i = sum_j (b_(i j) - delta) y_j$, where $b_(i j) - delta >= 0$ and $sum_i (b_(i j) - delta) = 1 - n delta$, and the same estimate gives
  $ norm(bf(B) bf(y))_1 <= (1 - n delta) norm(bf(y))_1. $
  Now let $bf(x)_0$ be a probability vector and $bf(y) = bf(x)_0 - bf(v)$; then $bf(1)^T bf(y) = 0$ and $bf(x)_m - bf(v) = bf(P)^m bf(x)_0 - bf(P)^m bf(v) = bf(P)^m bf(y)$. Writing $m = q k + s$ with $0 <= s < k$, we obtain
  $ norm(bf(x)_m - bf(v))_1 = norm(bf(B)^q bf(P)^s bf(y))_1 <= (1 - n delta)^q norm(bf(P)^s bf(y))_1 <= (1 - n delta)^q norm(bf(y))_1, $
  which tends to $0$ as $m -> infinity$, because $0 <= 1 - n delta < 1$. Hence $bf(x)_m -> bf(v)$.
]

#indent For the commuter example this explains the limit found there: $(2 \/ 3, 1 \/ 3)^T$ is the equilibrium vector of $bf(P)$, and every Markov chain with this matrix converges to it.

#subsec("Application: Ranking Web Pages", added: true) // added for MA1522: Google PageRank, adjacency matrix, probability transition matrix, ranking by the equilibrium vector

The PageRank algorithm, on which the Google search engine of L. Page and S. Brin (1996) was originally based, ranks a set of web sites by the entries of an equilibrium vector. Its premise is that important sites receive more links from other sites. For sites $s_1, ..., s_n$, the _adjacency matrix_ $bf(A) = (a_(i j))_(n times n)$ has $a_(i j) = 1$ if site $s_j$ has an outgoing link to site $s_i$, and $a_(i j) = 0$ otherwise. The sum of the $i$-th row of $bf(A)$ is the number of links into $s_i$, and the sum of the $j$-th column is the number of links out of $s_j$. Assume that every site links to some other site, and divide each entry of $bf(A)$ by the sum of its column; the result is the _probability transition matrix_
$ bf(P) = (p_(i j)), quad p_(i j) = a_(i j) / (a_(1 j) + a_(2 j) + dots.c + a_(n j)). $
It is a stochastic matrix: $p_(i j)$ is the probability that a surfer who clicks a random link on $s_j$ arrives at $s_i$, and $bf(P)^k bf(x)_0$ describes where a random surfer is after $k$ clicks. If $bf(P)$ is regular, these probabilities converge, from any starting distribution $bf(x)_0$, to the unique equilibrium vector of $bf(P)$, which may also be read as the share of all surfers visiting each site; the sites are ranked by its entries.

#example[
  Let $s_1$ link to $s_2$ and $s_3$; $s_2$ to $s_3$ and $s_4$; $s_3$ to $s_1$; and $s_4$ to $s_1$ and $s_3$. Then
  $ bf(A) = mat(0, 0, 1, 1; 1, 0, 0, 0; 1, 1, 0, 1; 0, 1, 0, 0), quad bf(P) = mat(0, 0, 1, 1/2; 1/2, 0, 0, 0; 1/2, 1/2, 0, 1/2; 0, 1/2, 0, 0). $
  A surfer starting at $s_4$ has the state vectors $bf(x)_1 = bf(P) bf(e)_4 = (1/2, 0, 1/2, 0)^T$ and $bf(x)_2 = bf(P) bf(x)_1 = (1/2, 1/4, 1/4, 0)^T$. One checks that all the entries of $bf(P)^5$ are positive, so $bf(P)$ is regular. Next,
  $ bf(I) - bf(P) = mat(1, 0, -1, -1/2; -1/2, 1, 0, 0; -1/2, -1/2, 1, -1/2; 0, -1/2, 0, 1) stretch(->)^"RREF" mat(1, 0, 0, -4; 0, 1, 0, -2; 0, 0, 1, -7/2; 0, 0, 0, 0), $
  so $E_1$ is spanned by $bf(u) = (8, 4, 7, 2)^T$, and the equilibrium vector is $bf(v) = frac(1, 21) (8, 4, 7, 2)^T$. The sites are ranked $s_1, s_3, s_2, s_4$. Note that $s_3$ receives the most links, yet $s_1$ comes first: the single link out of $s_3$ passes all of its weight to $s_1$.
]

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
  The case $bf(A) = bf(0)$ is trivial, so we shall assume that $bf(A) != bf(0)$. Set $sigma_1 = norm(bf(A))_2 = sup_(bf(x) != bf(0)) norm(bf(A) bf(x)) \/ norm(bf(x))$ (the matrix norm induced by the length of vectors, called the _spectral norm_; see Tyrtyshnikov, §27.3). By the compactness of the unit sphere in $bb(C)^n$, the continuity of the norm, and Weierstrass's theorem, there exists a vector $bf(x)_1$ such that $norm(bf(A) bf(x)_1) = norm(bf(A))_2$ and $norm(bf(x)_1) = 1$. Let $bf(y)_1 = bf(A) bf(x)_1 \/ norm(bf(A) bf(x)_1)$. Thus,
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
  Prove the inequality $norm(bf(A))_F <= sqrt(rank(bf(A))) norm(bf(A))_2$, where $norm(bf(A))_F = (sum_(i, j) abs(a_(i j))^2)^(1 \/ 2)$ is the _Frobenius norm_.
]

#problem(number: 4)[
  Prove that
  $ max_(bf(A) in bb(C)^(n times n), bf(A) != bf(0)) norm(bf(A))_2 / norm(bf(A))_1 = sqrt(n), $
  where $norm(bf(A))_1 = max_j sum_i abs(a_(i j))$ is the matrix norm induced by the vector norm $norm(bf(x))_1 = sum_i abs(x_i)$ (see Tyrtyshnikov, §27.3).
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

8) $norm(bf(A))_2 = sigma_1$, $norm(bf(A))_F = sqrt(sigma_1^2 + ... + sigma_r^2)$ (for the spectral and Frobenius norms, see the subsection "Singular Value Decomposition of a Matrix").

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

#subsec("Computing a Singular Value Decomposition", added: true) // added for MA1522: SVD in the course's block form, u_i = (1/sigma_i) A v_i is an orthonormal basis for Col(A) and rank(A) = r, the algorithm for an SVD

For a real $m times n$ matrix $bf(A)$ the singular value decomposition is written in MA1522 as $bf(A) = bf(U) bf(Sigma) bf(V)^T$, with $bf(U)$ an orthogonal matrix of order $m$, $bf(V)$ an orthogonal matrix of order $n$, and
$ bf(Sigma) = mat(bf(D), bf(0)_(r times (n - r)); bf(0)_((m - r) times r), bf(0)_((m - r) times (n - r))), \
  bf(D) = diag(sigma_1, ..., sigma_r), quad sigma_1 >= sigma_2 >= dots.c >= sigma_r > 0, $
where $sigma_1, ..., sigma_r$ are the nonzero singular values of $bf(A)$ and $r = rank(bf(A))$. The construction in the subsection "Singular Values and Singular Vectors" produces exactly such a decomposition. We restate its key step for real matrices, with a proof.

#lemma[
  Let ${bf(v)_1, ..., bf(v)_n}$ be an orthonormal basis for $bb(R)^n$ consisting of eigenvectors of $bf(A)^T bf(A)$, with eigenvalues $mu_1 >= dots.c >= mu_r > 0 = mu_(r + 1) = dots.c = mu_n$. Let $sigma_i = sqrt(mu_i)$ and $bf(u)_i = frac(1, sigma_i) bf(A) bf(v)_i$, $i = 1, ..., r$. Then ${bf(u)_1, ..., bf(u)_r}$ is an orthonormal basis for $Col(bf(A))$; in particular, $rank(bf(A)) = r$.
]

#proof[
  First, $norm(bf(A) bf(v)_i)^2 = bf(v)_i^T bf(A)^T bf(A) bf(v)_i = mu_i bf(v)_i^T bf(v)_i = mu_i$ for every $i$; this shows once more that the eigenvalues of $bf(A)^T bf(A)$ are nonnegative, and that $bf(A) bf(v)_i = bf(0)$ for $i > r$. For $i, j <= r$,
  $ bf(u)_i dot bf(u)_j = frac(1, sigma_i sigma_j) bf(v)_i^T bf(A)^T bf(A) bf(v)_j = frac(mu_j, sigma_i sigma_j) (bf(v)_i dot bf(v)_j), $
  which is $0$ for $i != j$ and $1$ for $i = j$. Each $bf(u)_i$ lies in $Col(bf(A))$. Conversely, every vector of $Col(bf(A))$ has the form $bf(A) bf(x)$; writing $bf(x) = c_1 bf(v)_1 + dots.c + c_n bf(v)_n$, we get $bf(A) bf(x) = c_1 sigma_1 bf(u)_1 + dots.c + c_r sigma_r bf(u)_r$. Thus the orthonormal, and hence linearly independent, set ${bf(u)_1, ..., bf(u)_r}$ spans $Col(bf(A))$.
]

#indent Extending ${bf(u)_1, ..., bf(u)_r}$ to an orthonormal basis ${bf(u)_1, ..., bf(u)_m}$ for $bb(R)^m$ (Section 5.3) and setting $bf(U) = mat(bf(u)_1, dots.c, bf(u)_m)$, $bf(V) = mat(bf(v)_1, dots.c, bf(v)_n)$, we get
$ bf(A) bf(V) = mat(sigma_1 bf(u)_1, dots.c, sigma_r bf(u)_r, bf(0), dots.c, bf(0)) = bf(U) bf(Sigma), $
that is, $bf(A) = bf(U) bf(Sigma) bf(V)^T$. This gives the following procedure.

#algorithm(title: "singular value decomposition")[
  Let $bf(A)$ be a real $m times n$ matrix.
  + Find the eigenvalues of the symmetric matrix $bf(A)^T bf(A)$ and list them, with multiplicities, in decreasing order: $mu_1 >= dots.c >= mu_r > 0 = mu_(r + 1) = dots.c = mu_n$; then $r = rank(bf(A))$. Set $sigma_i = sqrt(mu_i)$, $i = 1, ..., r$, and form $bf(Sigma)$ as above.
  + Orthogonally diagonalize $bf(A)^T bf(A)$ (Section 6.3): find an orthonormal basis for each eigenspace (including $E_0$, if $r < n$), and let $bf(v)_i$ be the vector associated to $mu_i$, $i = 1, ..., n$. Set $bf(V) = mat(bf(v)_1, dots.c, bf(v)_n)$.
  + Set $bf(u)_i = frac(1, sigma_i) bf(A) bf(v)_i$, $i = 1, ..., r$. If $r < m$, extend ${bf(u)_1, ..., bf(u)_r}$ to an orthonormal basis for $bb(R)^m$: find a basis for the solution space of $mat(bf(u)_1, dots.c, bf(u)_r)^T bf(x) = bf(0)$ and apply the Gram–Schmidt process to it. Set $bf(U) = mat(bf(u)_1, dots.c, bf(u)_m)$.

  Then $bf(A) = bf(U) bf(Sigma) bf(V)^T$.
]

#example[
  Let
  $ bf(A) = mat(1, 1; 0, 1; 1, 0), quad "so that" quad bf(A)^T bf(A) = mat(2, 1; 1, 2), quad char(bf(A)^T bf(A)) = (x - 3)(x - 1). $
  Thus $mu_1 = 3$, $mu_2 = 1$, $r = 2$, and
  $ bf(Sigma) = mat(sqrt(3), 0; 0, 1; 0, 0). $
  From
  $ 3 bf(I) - bf(A)^T bf(A) = mat(1, -1; -1, 1), quad bf(I) - bf(A)^T bf(A) = mat(-1, -1; -1, -1) $
  we obtain the unit eigenvectors $bf(v)_1 = frac(1, sqrt(2)) (1, 1)^T$ and $bf(v)_2 = frac(1, sqrt(2)) (-1, 1)^T$. Next, since $sigma_1 = sqrt(3)$ and $sigma_2 = 1$,
  $ bf(u)_1 = frac(1, sqrt(3)) bf(A) bf(v)_1 = frac(1, sqrt(6)) mat(2; 1; 1), quad bf(u)_2 = bf(A) bf(v)_2 = frac(1, sqrt(2)) mat(0; 1; -1). $
  The system $mat(bf(u)_1, bf(u)_2)^T bf(x) = bf(0)$ is equivalent to $2 x_1 + x_2 + x_3 = 0$, $x_2 - x_3 = 0$, whose solution space is $span{(-1, 1, 1)^T}$; normalizing, $bf(u)_3 = frac(1, sqrt(3)) (-1, 1, 1)^T$. Hence
  $ mat(1, 1; 0, 1; 1, 0) = mat(2 \/ sqrt(6), 0, -1 \/ sqrt(3); 1 \/ sqrt(6), 1 \/ sqrt(2), 1 \/ sqrt(3); 1 \/ sqrt(6), -1 \/ sqrt(2), 1 \/ sqrt(3)) mat(sqrt(3), 0; 0, 1; 0, 0) mat(1 \/ sqrt(2), 1 \/ sqrt(2); -1 \/ sqrt(2), 1 \/ sqrt(2)). $
]

#subsec("Best Low-Rank Approximations", beyond: true) // Tyrtyshnikov §35.7


In each matrix $sigma_k bf(u)_k bf(v)_k^*$, the entry in position $(i, j)$ may be regarded as a function of $i$ and $j$ with separated discrete variables $i$ and $j$: $f(i, j) = f_1(i) f_2(j)$. Thus, writing $bf(A)$ in the form $bf(A) = sum_(i=1)^r sigma_i bf(u)_i bf(v)_i^*$ describes a certain special way of separating variables in each term of the sum or, in matrix terminology, a skeleton decomposition of the matrix $bf(A)$ (see Tyrtyshnikov, §7.2)—moreover, with the important additional property of orthonormality of the sets ${bf(u)_1, ..., bf(u)_r}$ and ${bf(v)_1, ..., bf(v)_r}$.

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
