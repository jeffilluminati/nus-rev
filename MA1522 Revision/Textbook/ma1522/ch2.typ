#import "common.typ": *

#chapter("Chapter 2. Matrix Algebra")

#sec("2.1", "Definition and Special Types of Matrices")

#subsec("Linear Mappings and Matrices") // Tyrtyshnikov §1.1


In mathematics and other sciences one constantly studies the dependence of some quantities upon others. Usually such a dependence is described by various types of functions (mappings, operators). The simplest case is that of linear mappings. We shall give rigorous definitions later. For now, let us suppose that the variables $y_1, ..., y_m$ are expressed in terms of $x_1, ..., x_n$ as follows:
#eq(
  $ cases(
    y_1 = a_(1 1) x_1 + ... + a_(1 n) x_n\,,
    dots.h.c,
    y_m = a_(m 1) x_1 + ... + a_(m n) x_n\,,
  ) $,
  $(*)$
)
where the coefficients are assumed to be given constant quantities. Let us collect all the constant coefficients into a rectangular table and denote it by the letter $bf(A)$; let us also form column tables from the quantities $x_1, ..., x_n$ and $y_1, ..., y_m$:
$ bf(A) = mat(
  a_(1 1), ..., a_(1 n);
  dots.h, dots.h, dots.h;
  a_(m 1), ..., a_(m n)
), quad
bf(x) = mat(x_1; dots.h; x_n), quad
bf(y) = mat(y_1; dots.h; y_m). $
Such tables are called _matrices_. We have three matrices in all: of sizes $m times n$, $n times 1$, and $m times 1$. The relations $(*)$ describing the dependence of $bf(y)$ on $bf(x)$ may be written symbolically in the following way:
#eq($ bf(y) = bf(A) bf(x). $, $(**)$)
One gets the impression that the matrix $bf(A)$ is _multiplied_ by the column matrix $bf(x)$, resulting in the column matrix $bf(y)$. And so it will be if we say that the relations $(*)$ constitute the _definition_ of the operation $(**)$ of multiplying $bf(A)$ by $bf(x)$.

If $m = n$, the matrix is called _square_. A square matrix of size $n times n$ is also called a _matrix of order_ $n$.

#sec("2.2", "Matrix Algebra")

#subsec("Matrix Multiplication") // Tyrtyshnikov §1.2


Suppose that $y_1, ..., y_m$ are expressed in terms of $x_1, ..., x_n$, and at the same time $x_1, ..., x_n$ are expressed in terms of $z_1, ..., z_k$ as follows:
$ cases(
  y_1 = a_(1 1) x_1 + ... + a_(1 n) x_n\,,
  dots.h.c,
  y_m = a_(m 1) x_1 + ... + a_(m n) x_n\,,
) quad quad
cases(
  x_1 = b_(1 1) z_1 + ... + b_(1 k) z_k\,,
  dots.h.c,
  x_n = b_(n 1) z_1 + ... + b_(n k) z_k .
) $
Clearly, $y_1, ..., y_m$ are expressed in terms of $z_1, ..., z_k$ in a similar manner. Let us denote the matrix of constant coefficients of this dependence by $bf(C)$. Then
$ bf(y) = bf(A) bf(x), quad bf(x) = bf(B) bf(z) quad "and" quad bf(y) = bf(C) bf(z). $
To obtain the entries of the matrix $bf(C)$, one must substitute the expressions for $x_1, ..., x_n$ in terms of $z_1, ..., z_k$ into the formulas expressing $y_1, ..., y_m$ in terms of $x_1, ..., x_n$, and collect the coefficients of the quantities $z_1, ..., z_k$. The result is:
#eq(
  $ bf(C) = (c_(i j)), quad "where" quad c_(i j) = sum_(l=1)^n a_(i l) b_(l j). $,
  $(*)$
)

#definition[
  The matrix $bf(C)$ of the form $(*)$ is called the _product_ of the matrices $bf(A)$ and $bf(B)$ and is denoted by $bf(C) = bf(A) bf(B)$.
]

#corollary[
  $bf(y) = bf(A)(bf(B) bf(z)) = (bf(A) bf(B)) bf(z)$.
]

#indent It is often said that matrices are multiplied according to the "row-by-column" rule. The number of columns in the first factor must, of course, coincide with the number of rows in the second. When we write $bf(C) = bf(A) bf(B)$, we automatically mean that the matrices $bf(A)$ and $bf(B)$ are not altogether arbitrary.

#subsec("Associativity of Matrix Multiplication") // Tyrtyshnikov §1.3


#theorem[
  $(bf(A) bf(B)) bf(C) = bf(A)(bf(B) bf(C))$.
]

#proof[
  Let $bf(A)$, $bf(B)$, $bf(C)$ have sizes $m times n$, $n times k$, $k times l$. Then
  $ {(bf(A) bf(B)) bf(C)}_(i j) = sum_(p=1)^k {bf(A) bf(B)}_(i p) c_(p j) = sum_(p=1)^k ( sum_(q=1)^n a_(i q) b_(q p) ) c_(p j) = \
  = sum_(q=1)^n a_(i q) ( sum_(p=1)^k b_(q p) c_(p j) ) = {bf(A)(bf(B) bf(C))}_(i j). $
]

#subsec("Noncommutativity of Matrix Multiplication") // Tyrtyshnikov §1.4


In the general case $bf(A) bf(B) != bf(B) bf(A)$ even for square matrices. For example,
$ mat(0, 1; 0, 0) mat(0, 0; 1, 0) = mat(1, 0; 0, 0), $
$ mat(0, 0; 1, 0) mat(0, 1; 0, 0) = mat(0, 0; 0, 1). $

#subsec("Matrix Addition and Multiplication by a Scalar") // Tyrtyshnikov §1.5


A matrix $bf(C) = (c_(i j))$ is called the _sum_ of the matrices $bf(A) = (a_(i j))$ and $bf(B) = (b_(i j))$ if
$ c_(i j) = a_(i j) + b_(i j) quad "for all " i, j. $
The matrices $bf(A), bf(B)$ and $bf(C) = bf(A) + bf(B)$ have the same dimensions. The operation of matrix addition possesses two pleasant properties at once:
$ bf(A) + (bf(B) + bf(C)) &= (bf(A) + bf(B)) + bf(C) quad && "(associativity)," \
bf(A) + bf(B) &= bf(B) + bf(A) quad && "(commutativity)." $

#indent It is also useful to introduce the operation of multiplying a matrix by a scalar (number). If $alpha$ is a scalar, then the matrix $bf(C) = alpha bf(A)$ is defined as the matrix of the same dimensions with entries $c_(i j) = alpha a_(i j)$.

#sec("2.3", "Linear System and Matrix Equation")

#subsec("Multiplication of Block Matrices") // Tyrtyshnikov §1.6


Suppose that the matrices $bf(A)$ and $bf(B)$ are partitioned into blocks $bf(A)_(i j)$ and $bf(B)_(i j)$:
$ bf(A) = mat(
  bf(A)_(1 1), ..., bf(A)_(1 q);
  dots.h, dots.h, dots.h;
  bf(A)_(p 1), ..., bf(A)_(p q)
), quad
bf(B) = mat(
  bf(B)_(1 1), ..., bf(B)_(1 r);
  dots.h, dots.h, dots.h;
  bf(B)_(q 1), ..., bf(B)_(q r)
), $
where $bf(A)_(i j)$ is $m_i times n_j$ and $bf(B)_(i j)$ is $n_i times k_j$. Then the product $bf(C) = bf(A) bf(B)$ exists and can be computed using the operations of multiplication and addition of block submatrices:
$ bf(C) = mat(
  bf(C)_(1 1), ..., bf(C)_(1 r);
  dots.h, dots.h, dots.h;
  bf(C)_(p 1), ..., bf(C)_(p r)
), quad "where" quad bf(C)_(i j) = sum_(l=1)^q bf(A)_(i l) bf(B)_(l j) quad "is " m_i times k_j. $
Prove this!

One may say that block matrices are multiplied by the "block-row by block-column" rule. We shall see very soon how useful block multiplication can be.

#subsec("Linear Combinations") // Tyrtyshnikov §3.2


For understanding the essence of the matter, the following interpretation of the linear system $(1)$ of Section 1.1, $bf(A) bf(x) = bf(b)$, is exceptionally useful. By the definition of multiplying a matrix by a scalar, if $alpha in bb(R)$, then
$ alpha mat(b_1; dots.v; b_n) equiv mat(alpha b_1; dots.v; alpha b_n). $

#indent Let $bf(a)_1, ..., bf(a)_k$ be the columns of the matrix $bf(A)$:
$ bf(A) = mat(bf(a)_1, bf(a)_2, dots.c, bf(a)_k), quad bf(a)_1, ..., bf(a)_k in bb(R)^n. $
Then the relations $(1)$ are equivalent to the vector equality
#eq($ x_1 bf(a)_1 + ... + x_k bf(a)_k = bf(b). $, $(2)$)

#indent The expression $x_1 bf(a)_1 + ... + x_k bf(a)_k$ is called a _linear combination_ of the vectors $bf(a)_1, ..., bf(a)_k$, and the numbers $x_1, ..., x_k$ are called the _coefficients of the linear combination_. The set of all possible linear combinations of the vectors $bf(a)_1, ..., bf(a)_k$,
$ span{bf(a)_1, ..., bf(a)_k} = {alpha_1 bf(a)_1 + ... + alpha_k bf(a)_k : alpha_1, ..., alpha_k in bb(R)}, $
is called the _linear span_ of the vectors $bf(a)_1, ..., bf(a)_k$.

Thus, the equality $(2)$ means that
#eq($ bf(b) in span{bf(a)_1, ..., bf(a)_k}. $, $(3)$)
In other words, the system $(1)$ has a solution (is consistent) if and only if the right-hand side $bf(b)$ belongs to the linear span (is a linear combination) of the columns of the coefficient matrix.

#sec("2.4", "Inverse of Matrices")

#subsec("Inverse Matrix") // Tyrtyshnikov §6.1


A matrix $bf(A)$ of order $n$ is called _invertible_ if there exists a matrix $bf(X)$ of order $n$ such that
$ bf(A) bf(X) = bf(X) bf(A) = bf(I), $
where $bf(I)$ is the identity matrix of order $n$; $bf(X)$ is called the _inverse matrix_ for $bf(A)$.

There can exist only one inverse matrix: if $bf(A) bf(X) = bf(X) bf(A) = bf(I)$ and $bf(A) bf(Y) = bf(Y) bf(A) = bf(I)$, then $bf(X) = bf(X)(bf(A) bf(Y)) = (bf(X) bf(A)) bf(Y) = bf(Y)$.

Notation for the inverse matrix: $bf(X) = bf(A)^(-1)$.

#problem(number: 1)[
  Let $bf(A), bf(B)$ be arbitrary matrices of order $n$; $bf(I)$ and $bf(0)$ be the identity and zero matrices of order $n$. Prove that
  $ mat(bf(I), bf(A), bf(0); bf(0), bf(I), bf(B); bf(0), bf(0), bf(I))^(-1) = mat(bf(I), -bf(A), bf(A) bf(B); bf(0), bf(I), -bf(B); bf(0), bf(0), bf(I)). $
  (It follows from this that any algorithm for computing the inverse of a matrix of order $n$ with operation count $s(n)$ generates an algorithm for multiplying matrices of order $n$ with operation count $s(3 n)$.)
]

#problem(number: 2)[
  Given a square matrix $bf(A)$ such that $bf(A)^3 = bf(0)$. Prove that the matrix $bf(I) - bf(A)$ is invertible.
]

#problem(number: 3)[
  Find all invertible matrices $bf(A)$ of order $n$ for which all entries of $bf(A)$ and $bf(A)^(-1)$ are nonnegative. Prove that the set of all such matrices forms a group with respect to the operation of matrix multiplication.
]

#problem(number: 4)[
  Given matrices $bf(P)_1, ..., bf(P)_n$ of order $n$, each differing from the identity matrix by a permutation of columns (such matrices are called _permutation matrices_). Let $bf(P)_1 + ... + bf(P)_n = bf(E)$, where $bf(E)$ is the matrix all of whose entries are equal to $1$. Furthermore, let $bf(P)_i bf(P)_j = bf(P)_j bf(P)_i$ for all $i, j$. Prove that the set of matrices $bf(P)_1, ..., bf(P)_n$ forms a group with respect to the operation of matrix multiplication.
]

#subsec("Inversion and Transposition") // Tyrtyshnikov §6.3


#proposition[
  $(bf(A) bf(B))^T = bf(B)^T bf(A)^T$.
]

#proof[
  $(bf(A) bf(B))_(i j) = sum_k (bf(A))_(i k) (bf(B))_(k j) = sum_k (bf(B))_(k j) (bf(A))_(i k) = sum_k (bf(B)^T)_(j k) (bf(A)^T)_(k i) = (bf(B)^T bf(A)^T)_(j i)$.
]

#indent From the equality $bf(A) bf(X) = bf(X) bf(A) = bf(I)$ we obtain: $bf(X)^T bf(A)^T = bf(A)^T bf(X)^T = bf(I)$. Thus, _a matrix is invertible if and only if its transpose is invertible_. Moreover,
$ bf(X)^T = (bf(A)^T)^(-1) = (bf(A)^(-1))^T. $
Notation: $bf(A)^(-T) equiv (bf(A)^(-1))^T$.

As a corollary, we obtain the "row" analogue of the matrix invertibility criterion (Section 2.6): _the invertibility of a square matrix is equivalent to the linear independence of its rows_.

#subsec("Group of Invertible Matrices") // Tyrtyshnikov §6.4


The set of invertible $(n times n)$-matrices forms a group with respect to the operation of multiplication. For the proof we have everything except the fact that the product of invertible matrices is invertible. But this is verified directly: if $bf(A)$ and $bf(B)$ are invertible, then
$ (bf(B)^(-1) bf(A)^(-1))(bf(A) bf(B)) &= bf(B)^(-1)(bf(A)^(-1) bf(A)) bf(B) = bf(B)^(-1) bf(I) bf(B) = bf(I), \
(bf(A) bf(B))(bf(B)^(-1) bf(A)^(-1)) &= bf(A)(bf(B) bf(B)^(-1)) bf(A)^(-1) = bf(A) bf(I) bf(A)^(-1) = bf(I). $
Hence
$ (bf(A) bf(B))^(-1) = bf(B)^(-1) bf(A)^(-1). $

#problem(number: 5)[
  Let $H$ be the group of invertible upper triangular matrices of order $n$, and $G$ the group of all invertible matrices of order $n$. Is it true that $bf(A) bf(B) bf(A)^(-1) in H$ for any matrices $bf(B) in H$ and $bf(A) in G$ (in which case the subgroup $H$ is called a _normal subgroup_ of the group $G$)?
]

#subsec("Computing the Inverse Matrix", beyond: true) // Tyrtyshnikov §D8.2


The inverse matrix can be computed using the constructions of the same Gaussian elimination method (one way to organize this is the course's row reduction of $(bf(A) | bf(I))$ to $(bf(I) | bf(A)^(-1))$). Once the LU factorization $bf(A) = bf(L) bf(U)$ (Section 2.7) has been obtained, since $bf(A)^(-1) = bf(U)^(-1) bf(L)^(-1)$, it suffices to learn how to compute the inverses of upper and lower triangular matrices. The total number of arithmetic operations will be $cal(O)(n^3)$.

However, in 1965 Strassen published a paper entitled "Gaussian Elimination Is Not Optimal," in which it was shown for the first time that faster algorithms also exist. Suppose we have an algorithm for multiplying two $(n times n)$-matrices with a number of operations $<= c n^gamma$ (for example, Strassen's algorithm, for which $gamma = log_2 7 < 3$; see Tyrtyshnikov, §§1.10–1.11). Then in the case of a strictly regular matrix $bf(A)$, one can construct an algorithm for computing $bf(A)^(-1)$ with $cal(O)(n^gamma)$ operations.

For simplicity, suppose that $n = 2^p$. Partition $bf(A)$ into blocks of order $n \/ 2$ and consider the following equality:
$ mat(bf(I), bf(0); -bf(A)_(2 1) bf(A)_(1 1)^(-1), bf(I)) mat(bf(A)_(1 1), bf(A)_(1 2); bf(A)_(2 1), bf(A)_(2 2)) = mat(bf(A)_(1 1), bf(A)_(1 2); bf(0), bf(W)), \
  bf(W) = bf(A)_(2 2) - bf(A)_(2 1) bf(A)_(1 1)^(-1) bf(A)_(1 2). $
From the invertibility of $bf(A)$ and $bf(A)_(1 1)$ follows the invertibility of the block $bf(W)$. Moreover, the blocks $bf(A)_(1 1)$ (which is obvious) and $bf(W)$ (prove this!) inherit the strict regularity of the matrix $bf(A)$. It is not hard to verify that
$ mat(bf(A)_(1 1), bf(A)_(1 2); bf(0), bf(W))^(-1) = mat(bf(A)_(1 1)^(-1), -bf(A)_(1 1)^(-1) bf(A)_(1 2) bf(W)^(-1); bf(0), bf(W)^(-1)). $
Thus,
#eq($ bf(A)^(-1) = mat(bf(A)_(1 1)^(-1), -bf(A)_(1 1)^(-1) bf(A)_(1 2) bf(W)^(-1); bf(0), bf(W)^(-1)) mat(bf(I), bf(0); -bf(A)_(2 1) bf(A)_(1 1)^(-1), bf(I)). $, $(*)$)
The expressions for the blocks of the matrix $bf(A)^(-1)$ obtained from $(*)$ are sometimes called the _Frobenius formulas_.

For our purpose, formula $(*)$ is interesting in that it shows how inverting a matrix of order $n$ reduces to two analogous problems for the matrices $bf(A)_(1 1)$ and $bf(W)$ of order $n \/ 2$. To carry out this reduction, one must perform several multiplications of matrices of order $n \/ 2$. The total cost across all steps of the reduction is proportional to
$ (n / 2)^gamma + 2 (n / 2^2)^gamma + 2^2 (n / 2^3)^gamma + ... <= n^gamma / 2^gamma dot 1 / (1 - 1 \/ 2^(gamma - 1)) = n^gamma / (2^gamma - 2). $

#indent Following Strassen's discovery, a paper by other authors appeared under the title "Strassen's Method Is Not Optimal." Yet the leadership of the new algorithm did not last very long. The competition to construct ever faster algorithms for inverting matrices and solving systems continues to this day, and the question of an optimal algorithm from the standpoint of the number of operations remains open.

Even less clear is the question of an algorithm with the minimum number of parallel steps (even in the model of infinite parallelism). Quite a long time ago, an algorithm was devised in which the number of parallel steps in the case of a general matrix is $cal(O)(log_2^2 n)$. Nobody knows whether a faster parallel algorithm can be constructed. Curiously, the algorithm presented has nothing in common with either Gaussian elimination or Strassen's method. Furthermore, even for a triangular matrix, no algorithm with a smaller number of parallel steps (in order of dependence on $n$) is known.

#problem(number: 6)[
  Prove that the determinant of a strictly regular matrix of order $n$ can be computed in $cal(O)(n^(log_2 7))$ arithmetic operations.
]

#sec("2.5", "Elementary Matrices")

#see-section("1.3", [Elementary row operations in matrix form (permutation and row modification matrices)])

#subsec("Equivalent Matrices", beyond: true) // Tyrtyshnikov §8.6


Matrices $bf(A)$ and $bf(B)$ are called _equivalent_ (not to be confused with _row equivalent_) if there exist invertible matrices $bf(P)$ and $bf(Q)$ such that $bf(B) = bf(P) bf(A) bf(Q)$.

#theorem[
  Matrices $bf(A)$ and $bf(B)$ are equivalent if and only if they have the same dimensions and the same ranks.
]

#proof[
  By virtue of the theorem on reduction to diagonal form (Section 1.4), each of the matrices $bf(A)$ and $bf(B)$ is equivalent to a rectangular diagonal matrix—let us denote them by $bf(D)_A$ and $bf(D)_B$. Moreover, it is obvious that $bf(D)_A$ and $bf(D)_B$ are equivalent if and only if they have the same number of nonzero diagonal entries. The latter means that $rank(bf(D)_A) = rank(bf(D)_B)$. It remains to take into account that $rank(bf(A)) = rank(bf(D)_A)$ and $rank(bf(B)) = rank(bf(D)_B)$.
]

#sec("2.6", "Equivalent Statements for Invertibility")

#subsec("Invertibility Criterion for a Matrix") // Tyrtyshnikov §6.2


#theorem[
  A square matrix is invertible if and only if its columns form a linearly independent system.
]

#proof[
  Let a matrix $bf(A)$ of order $n$ have linearly independent columns. According to the results of Section 1.5 on the consistency of linear systems, each of the systems
  $ bf(A) bf(x)_1 = bf(e)_1, quad bf(A) bf(x)_2 = bf(e)_2, quad ..., quad bf(A) bf(x)_n = bf(e)_n, $
  where $bf(e)_1, bf(e)_2, ..., bf(e)_n$ are the columns of the identity matrix, has a unique solution. Let $bf(X) = display(mat(bf(x)_1, bf(x)_2, dots.c, bf(x)_n))$. Then $bf(A) bf(X) = bf(I)$.

  The columns of the matrix $bf(X)$ are linearly independent. Indeed, suppose some linear combination of these columns is equal to zero:
  $ alpha_1 bf(x)_1 + alpha_2 bf(x)_2 + ... + alpha_n bf(x)_n = bf(0). $
  This means that
  $ bf(X) mat(alpha_1; alpha_2; dots.v; alpha_n) = bf(0). $
  Consequently,
  $ bf(A) bf(X) mat(alpha_1; alpha_2; dots.v; alpha_n) = mat(alpha_1; alpha_2; dots.v; alpha_n) = bf(0). $
  Hence $alpha_1 = alpha_2 = ... = alpha_n = 0$. Thus, for $bf(X)$ there exists a matrix $bf(Y)$ such that $bf(X) bf(Y) = bf(I)$. Let us prove that $bf(Y) = bf(A)$. Indeed, $bf(A) = bf(A)(bf(X) bf(Y)) = (bf(A) bf(X)) bf(Y) = bf(Y)$.#footnote[In essence, this reproduces part of the proof of a more general proposition connected with the redundancy of the definition of a group (see Tyrtyshnikov, Supplement to Lecture 2, #box[§$cal(D)$2.5]).]

  Now suppose that $bf(A) = display(mat(bf(a)_1, bf(a)_2, dots.c, bf(a)_n))$ is an invertible matrix, and consider a linear combination of its columns equal to zero:
  $ alpha_1 bf(a)_1 + alpha_2 bf(a)_2 + ... + alpha_n bf(a)_n = bf(0). $
  Let us write this equality in the following form:
  $ bf(A) mat(alpha_1; alpha_2; dots.v; alpha_n) = bf(0). $
  Multiplying both sides on the left by $bf(A)^(-1)$, we find: $alpha_1 = ... = alpha_n = 0$. Consequently, the columns $bf(a)_1, ..., bf(a)_n$ are linearly independent.
]

#subsec("Invertibility and the Determinant") // Tyrtyshnikov §6.8


#theorem[
  A square matrix $bf(A)$ is invertible if and only if $det(bf(A)) != 0$.
]

#proof[
  Suppose that for the matrix $bf(A)$ there exists an inverse matrix $bf(A)^(-1)$. Then $bf(A) bf(A)^(-1) = bf(I)$ and, by virtue of the theorem on the determinant of a product of matrices (Section 2.10),
  $ det(bf(A)) dot det(bf(A)^(-1)) = det(bf(I)) = 1 quad => quad det(bf(A)) != 0. $
  If $det(bf(A)) != 0$, then $bf(A)$ is invertible by the theorem on the inversion of a matrix with nonzero determinant (the adjoint formula, Section 2.10).
]

#corollary[
  The columns of a matrix $bf(A)$ are linearly independent if and only if $det(bf(A)) != 0$.
]

#problem(number: 1)[
  Let $bf(I)_n$ and $bf(I)_m$ be the identity matrices of orders $n$ and $m$, respectively. Prove that for any matrices $bf(A)$ of size $m times n$ and $bf(B)$ of size $n times m$, the invertibility of $bf(I)_m - bf(A) bf(B)$ implies the invertibility of
  $bf(I)_n - bf(B) bf(A)$. Prove also that the invertibility of each of these matrices is equivalent to the invertibility of the matrix of order $m + n$ with the block partitioning of the form
  $ mat(bf(I)_m, bf(A); bf(B), bf(I)_n). $
]

#problem(number: 2)[
  Given numbers $a$ and $b$ such that $1 - a b != 0$. Prove that the matrix
  $ bf(A) = mat(
    1, a, a^2, ..., a^n;
    b, 1, a, ..., a^(n-1);
    b^2, b, 1, ..., a^(n-2);
    dots.v, dots.v, dots.v, dots.down, dots.v;
    b^n, b^(n-1), b^(n-2), ..., 1
  ) $
  is invertible and its inverse matrix is tridiagonal.
]

#problem(number: 3)[
  Suppose that in the statement of the preceding problem $a$ and $b$ are square blocks $bf(a)$ and $bf(b)$ of order $n$, and $1$ is replaced by the identity matrix $bf(I)$ of the same order. Prove that if the block $bf(I) - bf(a) bf(b)$ is an invertible matrix, then the block matrix $bf(A)$ with blocks of order $n$ is invertible and, moreover, its inverse matrix is block-tridiagonal.
]

#sec("2.7", "LU Factorization")

#subsec("Gaussian Elimination and LU Factorization") // Tyrtyshnikov §8.7


The method of successive elimination of unknowns described in Section 1.4 is usually called _Gaussian elimination_ (or _Gauss's method_). Suppose it is applied to a linear system $bf(A) bf(x) = bf(b)$ with an invertible matrix $bf(A)$. In this case, the row-echelon form to which the matrix $bf(A)$ is reduced turns out to be an upper triangular matrix.

Gaussian elimination can be interpreted as a method of eliminating entries of a matrix with the aim of reducing it to a simpler form. If one can do without permuting equations (row interchanges $R_i <-> R_j$), then Gaussian elimination for a matrix of order $n$ consists in successively eliminating the entries in columns from the $1$-st to the $(n - 1)$-st and leads to an equivalent system
#eq(
  $ (bf(Z)_(n-1) ... bf(Z)_2 bf(Z)_1 bf(A)) bf(x) = bf(Z)_(n-1) ... bf(Z)_2 bf(Z)_1 bf(b), $,
  $(*)$
)
where $bf(Z)_1, ..., bf(Z)_(n-1)$ are row modification matrices (Section 1.3), with $bf(Z)_i$ differing from $bf(I)$ precisely in the $i$-th column. Each of the matrices $bf(Z)_1, ..., bf(Z)_(n-1)$ is lower triangular, and therefore their product
$ hat(bf(L)) = bf(Z)_(n-1) ... bf(Z)_1 $
is also a lower triangular matrix. The coefficient matrix of the system $(*)$
$ bf(U) = bf(Z)_(n-1) ... bf(Z)_1 bf(A) = hat(bf(L)) bf(A) $
is upper triangular. The matrix $bf(L) = hat(bf(L))^(-1)$ is lower triangular. Consequently, Gaussian elimination generates a decomposition
of the matrix $bf(A)$ into a product of a lower and an upper triangular matrix:
$ bf(A) = bf(L) bf(U). $
Moreover, $bf(L)$ has ones on the main diagonal (it is a _unit lower triangular_ matrix), and $bf(U)$ is an invertible matrix (by virtue of the invertibility of $bf(A)$). Such a decomposition, with $bf(L)$ unit lower triangular and $bf(U)$ a row-echelon form of $bf(A)$, is called an _LU factorization_ of $bf(A)$.

Let us count the number of arithmetic operations in reducing $bf(A)$ to the upper triangular matrix $bf(U)$. At the $i$-th step, it is required to obtain $n - i$ zeros below the diagonal in the $i$-th column. When obtaining a zero at the intersection of the $i$-th column and the $l$-th row for $l > i$, from the $l$-th row one subtracts the $i$-th row, previously multiplied by a coefficient whose choice ensures obtaining this zero. Since in the rows under consideration there can be only $n - i$ nonzero entries (beyond the $i$-th position), the number of multiplications (and subtractions) in obtaining zeros in the $i$-th column is equal to $(n - i)^2$. In total, this requires
$ (n - 1)^2 + (n - 2)^2 + ... + 1^2 = 1/3 n^3 + cal(O)(n^2) $
multiplications and the same number of subtractions; by $cal(O)(n^2)$ we denote a polynomial in $n$ of degree $2$.

To find the solution of the system $bf(A) bf(x) = bf(b)$, one must perform two more steps:
- compute the vector $bf(Z)_(n-1) ... bf(Z)_1 bf(b)$;
- find the solution of the system with the upper triangular matrix $bf(U)$.

#indent Each of these steps requires only $cal(O)(n^2)$ arithmetic operations—an order of magnitude less than the reduction to upper triangular form.

#problem(number: 1)[
  An invertible matrix and its inverse are partitioned into blocks of identical dimensions:
  $ bf(A) = mat(bf(A)_(1 1), bf(A)_(1 2); bf(A)_(2 1), bf(A)_(2 2)), quad bf(A)^(-1) = mat(bf(B)_(1 1), bf(B)_(1 2); bf(B)_(2 1), bf(B)_(2 2)). $
  Prove that the block $bf(A)_(1 1)$ is invertible if and only if the block $bf(B)_(2 2)$ is invertible.
]

#subsec("LU Factorization and Strictly Regular Matrices", beyond: true) // Tyrtyshnikov §8.8


Suppose that an invertible matrix $bf(A)$ has an LU factorization: $bf(A) = bf(L) bf(U)$. Denote by $bf(A)_k, bf(L)_k, bf(U)_k$ the submatrices of order $k$ located in the upper left corner
of the matrices $bf(A), bf(L), bf(U)$, respectively, and consider the equality of block matrices
$ bf(A) equiv mat(bf(A)_k, bf(P); bf(Q), tilde(bf(A))_k) = mat(bf(L)_k, bf(0); bf(V), tilde(bf(L))_k) mat(bf(U)_k, bf(W); bf(0), tilde(bf(U))_k). $
From this it follows that
$ bf(A)_k = bf(L)_k bf(U)_k, quad k = 1, ..., n. $
Obviously, the matrices $bf(L)_k$ and $bf(U)_k$ are invertible (as triangular matrices with a nonzero diagonal). Therefore, the submatrix $bf(A)_k$ must be invertible. A matrix $bf(A)$ in which all the leading principal submatrices $bf(A)_k$ are invertible is called _strictly regular_. Thus, for the existence of an LU factorization of an invertible matrix $bf(A)$, it is necessary that it be strictly regular.

It can be proved that this condition is also sufficient. Indeed, suppose that an LU factorization has already been constructed for the submatrix $bf(A)_k = bf(L)_k bf(U)_k$. Then
#eq(
  $ mat(bf(L)_k^(-1), bf(0); -bf(Q) bf(A)_k^(-1), bf(I)) mat(bf(A)_k, bf(P); bf(Q), tilde(bf(A))_k) = mat(bf(U)_k, bf(L)_k^(-1) bf(P); bf(0), bf(W)), quad bf(W) = tilde(bf(A))_k - bf(Q) bf(A)_k^(-1) bf(P). $,
  $(\#)$
)
The block $bf(W)$ is called the _Schur complement_ of the block $bf(A)_k$ in the matrix $bf(A)$. From equality $(\#)$ and the strict regularity of $bf(A)$, one can deduce that $bf(W)$ is also a strictly regular matrix. Suppose that for $bf(W)$ an LU factorization $bf(W) = tilde(bf(L))_k tilde(bf(U))_k$ has already been constructed. Then we set
$ bf(L) = mat(bf(L)_k, bf(0); bf(0), bf(I)) mat(bf(I), bf(0); bf(Q) bf(A)_k^(-1) bf(L)_k, tilde(bf(L))_k), quad bf(U) = mat(bf(U)_k, bf(L)_k^(-1) bf(P); bf(0), tilde(bf(U))_k). $
The matrix $bf(L)$ obtained in this way is lower triangular. The equality $bf(L) bf(U) = bf(A)$ is verified by direct computation.

#problem(number: 2)[
  Let $bf(A)$ be an invertible matrix of order $n$ and $bf(A)(I, J)$ be its invertible submatrix on the rows and columns determined by the index sets $I = (i_1, ..., i_k)$ and $J = (j_1, ..., j_k)$, respectively (the notation of Section 2.8). Let $k < n$, and let $I'$ and $J'$ be the complementary index sets. Prove that
  $ det(bf(A)^(-1)(J', I')) = (-1)^(i_1 + ... + i_k + j_1 + ... + j_k) (det(bf(A)(I, J))) / (det(bf(A))). $
]

#sec("2.8", "Determinant by Cofactor Expansion")

#subsec("Linear Dependence Indicator") // Tyrtyshnikov §4.1


Consider a system of vectors $bf(a)_1, ..., bf(a)_n in bb(R)^n$ and let us try to construct a linear dependence indicator—a function $f(bf(a)_1, ..., bf(a)_n)$ that equals zero when the given system is linearly dependent. At the same time, the function $f$ should have as simple a form as possible: let $f$ be _linear_ in each argument when the values of the remaining arguments are fixed.

Let us give a precise formulation of the requirements on the function $f$:
- A) for every $1 <= i <= n$, the function is linear in the $i$-th argument (the function must have a "simple form"):
  $ f(bf(a)_1, ..., bf(a)_(i-1), alpha bf(a) + beta bf(b), bf(a)_(i+1), ..., bf(a)_n) = \
    = alpha f(bf(a)_1, ..., bf(a)_(i-1), bf(a), bf(a)_(i+1), ..., bf(a)_n) + \
    + beta f(bf(a)_1, ..., bf(a)_(i-1), bf(b), bf(a)_(i+1), ..., bf(a)_n) $
  for any vectors $bf(a), bf(b) in bb(R)^n$ and scalars $alpha, beta in bb(R)$;
- B) if the system of vectors $bf(a)_1, ..., bf(a)_n$ is linearly dependent, then $f(bf(a)_1, ..., bf(a)_n) = 0$;
- C) the function takes a prescribed nonzero value on a given linearly independent system (normalization condition):
  $ f(bf(e)_1, ..., bf(e)_n) = 1, $
  where $bf(e)_1, ..., bf(e)_n$ are the columns of the identity matrix of order $n$.

#indent A function $f$ with the stated properties will be called a linear dependence indicator. To construct it, we shall need the concept of a permutation.

#subsec("Permutations") // Tyrtyshnikov §4.2


An invertible mapping $sigma : bold(N) -> bold(N)$, where $bold(N) = {1, 2, ..., n}$, is called a _permutation_ (also a _substitution_) of
degree $n$. To denote a permutation $sigma$, one often uses the table
$ sigma = mat(delim: "(", 1, 2, ..., n; sigma(1), sigma(2), ..., sigma(n)), $
in which the numbers $sigma(1), sigma(2), ..., sigma(n)$ are the numbers $1, 2, ..., n$ written in some order (this is equivalent to the invertibility of the mapping $sigma$).

Let us define the product of permutations $a$ and $b$ as the mapping obtained by the sequential execution (composition) of the mappings $b$ and $a$:
$ (a b)(i) = a(b(i)), quad i in bold(N). $
This is an algebraic operation on the set of all permutations of degree $n$, with respect to which it is a group. Indeed, associativity is obvious (the composition of mappings always possesses this property). The role of the identity element is played by the identity mapping
$ e = mat(delim: "(", 1, 2, ..., n; 1, 2, ..., n), $
and the inverse element for $sigma$ is the inverse mapping $sigma^(-1)$.

The group of permutations of degree $n$ is called the _symmetric group_ of degree $n$ and is denoted by $S_n$. This is one of the most important examples of finite groups (groups with a finite number of elements; the number of elements is called the _order_ of the group). It is not hard to verify that the order of the group $S_n$ is equal to $n! = 1 dot 2 dot ... dot n$.

The name of the symmetric group is inspired by the definition of _symmetric functions_: a function $F(x_1, ..., x_n)$ is so called if it is invariant under all permutations of its arguments:
$ F(x_1, ..., x_n) = F(x_(sigma(1)), ..., x_(sigma(n))) quad forall sigma in S_n. $
An example of a symmetric function (determined by a numerical parameter $k$):
$ F_k (x_1, ..., x_n) = sum_(i=1)^n x_i^k. $

#problem(number: 1)[
  Given two systems of numbers $x_1 <= x_2 <= ... <= x_n$ and $y_1 <= y_2 <= ... <= y_n$, prove that for any permutation $sigma in S_n$ the inequality
  $ sum_(i=1)^n abs(x_i - y_i) <= sum_(i=1)^n abs(x_i - y_(sigma(i))) $
  holds.
]

#subsec("Cycles and Transpositions", beyond: true) // Tyrtyshnikov §4.3


A permutation $a in S_n$ is called a _cycle_ of length $k$ if there exist $k$ pairwise distinct indices $i_1, ..., i_k in bold(N)$ such that:

1) $a(i_1) = i_2, a(i_2) = i_3, ..., a(i_(k-1)) = i_k, a(i_k) = i_1$,

2) $a(i) = i$ $forall i in bold(N) without {i_1, i_2, ..., i_k}$.

To denote the cycle $a$, it is convenient to use the notation
$ a = (i_1, ..., i_k). $
A cycle of length $2$ is also called a _transposition_.

Cycles $a = (i_1, ..., i_k)$ and $b = (j_1, ..., j_m)$ are called _independent_ (or _disjoint_) if
$ {i_1, ..., i_k} inter {j_1, ..., j_m} = emptyset. $

#properties[
  1) _Any independent cycles $a$ and $b$ commute: $a b = b a$._

  2) _Every permutation $sigma in S_n$ can be represented as a product of independent cycles uniquely up to the order of the factors._

  3) _Every cycle of length $k$ can be represented as a product of $k - 1$ transpositions._

  4) _Every permutation can be represented as a product of transpositions._
]

Statement (1) is verified directly: in the case of independent cycles $a = (i_1, ..., i_k)$ and $b = (j_1, ..., j_m)$, we find
$ (a b)(i) &= (b a)(i) = a(i) && "for" i in {i_1, ..., i_k}, \
  (a b)(i) &= (b a)(i) = b(i) && "for" i in {j_1, ..., j_m}, \
  (a b)(i) &= (b a)(i) = i && "for" i notin {i_1, ..., i_k} union {j_1, ..., j_m}. $

#indent To prove (2), let us take an arbitrary index $j$ and consider the sequence of indices $j, sigma(j), sigma^2 (j), ...$ There are only $n$ distinct values—therefore, for some $k < l$ we must have $sigma^k (j) = sigma^l (j)$, whence we obtain $sigma^(l-k) (j) = j$. Let $k$ be the smallest positive index such that $sigma^k (j) = j$. Then we obtain the cycle
$ a = (j, sigma(j), sigma^2 (j), ..., sigma^(k-1) (j)), $
for which
$ sigma(i) = a(i) quad "for" i in {j, sigma(j), sigma^2 (j), ..., sigma^(k-1) (j)}. $
Clearly, the permutation $sigma_1 = sigma a^(-1)$ leaves fixed the indices
$ i in {j, sigma(j), sigma^2 (j), ..., sigma^(k-1) (j)}. $
Next, we take $j_1 notin {j, sigma(j), sigma^2 (j), ..., sigma^(k-1) (j)}$ and in a similar manner construct a cycle $b$ performing transformations of the form
$ j_1 -> sigma_1 (j_1) -> sigma_1^2 (j_1) -> ... $
(Note that $sigma_1^l (j_1) = sigma^l (j_1)$ for all $l$.) Continuing such constructions, we inevitably arrive at the identity permutation
$ sigma a^(-1) b^(-1) ... c^(-1) = e, $
whence
$ sigma = c ... b a. $
By construction, the cycles $a, b, ..., c$ are independent.

Statement (3) is proved by verifying, for example, the following equality:
$ (i_1, ..., i_k) = (i_1, i_2)(i_2, i_3) ... (i_(k-1), i_k). $
Statement (4) obviously follows from (2) and (3).

#problem(number: 2)[
  Prove that the entire set of permutations of degree $n$ can be ordered in such a way that each subsequent permutation is obtained from the preceding one by multiplying on the right by some transposition.
]

#subsec("Parity of a Permutation", beyond: true) // Tyrtyshnikov §4.4


A permutation can be decomposed into a product of transpositions in many ways. For example,
$ mat(delim: "(", 1, 2, 3, 4, 5, 6, 7; 7, 5, 3, 1, 2, 4, 6) = \
  = (1, 7)(7, 6)(6, 4)(2, 5) = (1, 7)(7, 6)(6, 4)(7, 2)(7, 5)(7, 2). $
However, the number of transpositions in any decomposition of one and the same permutation possesses the following important property.

#lemma(title: "Number of Transpositions")[
  The parity of the number of transpositions does not depend on the way a permutation is represented as a product of transpositions.
]

#proof[
  For a given permutation $sigma in S_n$,
  $ sigma = mat(delim: "(", 1, 2, ..., n; sigma(1), sigma(2), ..., sigma(n)), $
  let us call a pair $(i, j)$ an _inversion_ if $i < j$ but $sigma(i) > sigma(j)$. Let $delta(sigma)$ be the total number of inversions for $sigma$. Let us prove that for any
  transposition $tau$, the difference $delta(sigma tau) - delta(sigma)$ is an odd number.

  Let $tau = (i, j)$, $i < j$. Then
  $ sigma tau = mat(delim: "(", column-gap: #0.45em,
    1, ..., i - 1, i, i + 1, ..., j - 1, j, j + 1, ..., n;
    sigma(1), ..., sigma(i - 1), sigma(j), sigma(i + 1), ..., sigma(j - 1), sigma(i), sigma(j + 1), ..., sigma(n)
  ). $
  Suppose that the permutation $sigma$ has $k$ inversions among pairs of the form
  #eq($ (i, l), quad "where" quad l in {i + 1, i + 2, ..., j - 1}, $, $(dagger)$)
  $m$ inversions among pairs of the form
  #eq($ (l, j), quad "where" quad l in {i + 1, i + 2, ..., j - 1}, $, $(dagger.double)$)
  and $s$ more inversions among all other pairs. Then $sigma tau$ will have $j - i - 1 - m$ inversions among pairs of the form $(dagger)$ and $j - i - 1 - k$ inversions among pairs of the form $(dagger.double)$. Furthermore, among all other pairs the permutation $sigma tau$ will have $s + 1$ inversions if the pair $(i, j)$ was not an inversion, and $s - 1$ inversions otherwise. Thus,
  $ delta(sigma) = k + m + s, $
  $ delta(sigma tau) = (j - i - 1 - k) + (j - i - 1 - m) + s plus.minus 1. $
  Hence
  $ delta(sigma tau) - delta(sigma) = 2(j - i - 1 - k - m) plus.minus 1. $
]

#corollary[
  The parity of the number of transpositions in a decomposition of a permutation coincides with the parity of its number of inversions.
]

#definition[
  A permutation is called _even_ if it is a product of an even number of transpositions, and _odd_ otherwise.
]

#remark[
  Consider the function
  $ Delta(x_1, ..., x_n) = product_(i < j) (x_j - x_i). $
  Then for any permutation $sigma in S_n$ one of the two holds: either
  $ Delta(x_1, ..., x_n) = Delta(x_(sigma(1)), ..., x_(sigma(n))) $
  or
  $ Delta(x_1, ..., x_n) = -Delta(x_(sigma(1)), ..., x_(sigma(n))). $
  Even permutations, and only they, preserve the sign (the first case); odd permutations, and only they, reverse the sign (the second case).
]

#indent The set of all even permutations in $S_n$ forms a subgroup (prove this!), which is called the _alternating group_ of degree $n$ and is denoted by $A_n$.

#problem(number: 3)[
  Prove that every even permutation of degree $n >= 3$ can be represented as a product of cycles of length $3$.
]

#subsec("Uniqueness of the Linear Dependence Indicator") // Tyrtyshnikov §4.5


Let us return to the construction of the linear dependence indicator—a function $f(bf(a)_1, ..., bf(a)_n)$ of the vectors
$ bf(a)_1 = mat(a_(1 1); a_(2 1); dots.v; a_(n 1)), quad
  bf(a)_2 = mat(a_(1 2); a_(2 2); dots.v; a_(n 2)), quad
  ..., quad
  bf(a)_n = mat(a_(1 n); a_(2 n); dots.v; a_(n n)), $
satisfying requirements (A), (B), (C). It is easy to see that
$ bf(a)_1 = sum_(i_1 = 1)^n a_(i_1 1) bf(e)_(i_1), quad
  bf(a)_2 = sum_(i_2 = 1)^n a_(i_2 2) bf(e)_(i_2), quad
  ..., quad
  bf(a)_n = sum_(i_n = 1)^n a_(i_n n) bf(e)_(i_n), $
where $bf(e)_1, bf(e)_2, ..., bf(e)_n$ are the columns of the identity matrix of size $n times n$.

If the sought function $f$ exists, then property (A) of linearity in each argument leads to the expression
$ f(bf(a)_1, ..., bf(a)_n) = sum_(i_1 = 1)^n ... sum_(i_n = 1)^n a_(i_1 1) a_(i_2 2) ... a_(i_n n) f(bf(e)_(i_1), bf(e)_(i_2), ..., bf(e)_(i_n)). $

#indent According to requirement (B), $f = 0$ on any linearly dependent system of vectors. Obviously, the system of vectors $bf(e)_(i_1), bf(e)_(i_2), ..., bf(e)_(i_n)$ is linearly dependent if and only if there are equal vectors among them (if all these vectors are pairwise distinct, then they form a permutation of the columns of the identity matrix). Consequently, excluding the terms that are certainly zero from the summation, we find
$ f(bf(a)_1, ..., bf(a)_n) = sum_(sigma in S_n) a_(sigma(1) 1) a_(sigma(2) 2) ... a_(sigma(n) n) times \
  times f(bf(e)_(sigma(1)), bf(e)_(sigma(2)), ..., bf(e)_(sigma(n))). $

#indent Furthermore, from requirements (A) and (B) it follows that $f$ must change sign when any two arguments are interchanged. Let us prove
this, for example, for the first and second arguments. Taking into account that $f = 0$ in the case of equal arguments, and using linearity in each argument, we have
$ 0 &= f(bf(a)_1 + bf(a)_2, bf(a)_1 + bf(a)_2, bf(a)_3, ..., bf(a)_n) = \
    &= f(bf(a)_1, bf(a)_1, bf(a)_3, ..., bf(a)_n) + f(bf(a)_1, bf(a)_2, bf(a)_3, ..., bf(a)_n) + \
    &+ f(bf(a)_2, bf(a)_1, bf(a)_3, ..., bf(a)_n) + f(bf(a)_2, bf(a)_2, bf(a)_3, ..., bf(a)_n). $
The first and fourth terms have coinciding vectors and are therefore equal to zero. Hence
$ f(bf(a)_1, bf(a)_2, bf(a)_3, ..., bf(a)_n) = -f(bf(a)_2, bf(a)_1, bf(a)_3, ..., bf(a)_n). $
Consequently, if the permutation $sigma$ is a transposition, then
$ f(bf(e)_(sigma(1)), bf(e)_(sigma(2)), ..., bf(e)_(sigma(n))) = -f(bf(e)_1, bf(e)_2, ..., bf(e)_n) = -1. $

#indent In the general case, a permutation $sigma$ can be decomposed into a product of transpositions. Let $delta(sigma)$ be the number of transpositions in any one of the decompositions. Then
$ f(bf(e)_(sigma(1)), bf(e)_(sigma(2)), ..., bf(e)_(sigma(n))) = (-1)^(delta(sigma)). $
By the lemma on the number of transpositions, the parity of the number $delta(sigma)$ does not depend on the specific decomposition into a product of transpositions; therefore the quantity $(-1)^(delta(sigma))$ depends only on $sigma$. We call it the _sign of the permutation_ and denote it by $op("sgn")(sigma)$. Finally:
#eq(
  $ f(bf(a)_1, ..., bf(a)_n) = sum_(sigma in S_n) op("sgn")(sigma) a_(sigma(1) 1) a_(sigma(2) 2) ... a_(sigma(n) n). $,
  $(*)$
)

#indent We have proved an important result:

#proposition[
  If a linear dependence indicator function exists, then it is given by formula $(*)$.
]

#subsec("The Determinant") // Tyrtyshnikov §4.6


#definition[
  A function of the form $(*)$ is called the _determinant_ of the matrix $bf(A)$ with columns $bf(a)_1, bf(a)_2, ..., bf(a)_n$ and is denoted by $det(bf(A))$ or $abs(bf(A))$.
]

#indent Thus, if $bf(A) = (a_(i j))$ is a matrix of size $n times n$, then
#eq(
  $ det(bf(A)) = abs(bf(A)) = detmat(
    a_(1 1), ..., a_(1 n);
    dots.v, dots.v, dots.v;
    a_(n 1), ..., a_(n n)
  ) = \
  = sum_(sigma in S_n) op("sgn")(sigma) a_(sigma(1) 1) a_(sigma(2) 2) ... a_(sigma(n) n). $,
  $(triangle.stroked.t)$
)

#indent Special cases:
$ detmat(a_(1 1), a_(1 2); a_(2 1), a_(2 2)) = a_(1 1) a_(2 2) - a_(2 1) a_(1 2), $
$ detmat(
    a_(1 1), a_(1 2), a_(1 3);
    a_(2 1), a_(2 2), a_(2 3);
    a_(3 1), a_(3 2), a_(3 3)
  ) = a_(1 1) a_(2 2) a_(3 3) + a_(1 2) a_(2 3) a_(3 1) + a_(1 3) a_(2 1) a_(3 2) - \
  - a_(1 3) a_(2 2) a_(3 1) - a_(1 2) a_(2 1) a_(3 3) - a_(1 1) a_(2 3) a_(3 2). $

#indent In the general case, the sum $(triangle.stroked.t)$ (the _Leibniz formula_ for the determinant) contains $n!$ terms; in each of them $n$ entries of the matrix are multiplied together, and no two entries in a single product belong to the same row or the same column.

Despite the fact that the determinant is introduced as a function of a matrix, historically the concept of a determinant took shape in the 18th century (first in the works of Leibniz and Cramer, and then the theory of determinants was developed in the works of Vandermonde, Laplace, Cauchy, and C. Jacobi)—much earlier than the concept of a matrix, which was introduced into algebra by Hamilton and Cayley in the middle of the 19th century.

Of course, from the very beginning the determinant was associated with a square $n times n$ table of numbers (which is why one spoke of a determinant of _order_ $n$). These were, in particular, the coefficient tables of a "square" linear system. Yet such tables came to be called matrices only later—when the operation of multiplication was introduced for them.

#subsec([Submatrices and $k times k$ Minors]) // Tyrtyshnikov §5.4


For a given matrix $bf(A) = (a_(i j))$, one can select some of its rows and columns and form the table of entries located at the intersections of the selected rows and columns. Such a table is called a _submatrix_ of the matrix $bf(A)$.

Let $bf(A)$ be a square matrix of order $n$. To specify a square submatrix of order $k$, one must indicate the indices of the rows $1 <= i_1 < ... < i_k <= n$ and columns $1 <= j_1 < ... < j_k <= n$ containing it. Let us denote by $bold(N)_k$ the set of all systems of indices $(i_1, ..., i_k)$ ordered in ascending order: $1 <= i_1 < ... < i_k <= n$. Then specifying a submatrix is equivalent to choosing two specific systems of indices
$ I = (i_1, ..., i_k) in bold(N)_k, quad J = (j_1, ..., j_k) in bold(N)_k. $
The submatrix on the rows with indices from $I$ and columns with indices from $J$ is denoted by
$ bf(A)(I, J) = (a_(i_p j_q)), quad 1 <= p <= k, quad 1 <= q <= k. $

#indent Let $I' = (i'_1, ..., i'_m)$ be another system of indices ordered in ascending order: $1 <= i'_1 < ... < i'_m <= n$. We call the system $I'$ _complementary_ to $I = (i_1, ..., i_k)$ if
$ {i_1, ..., i_k} inter {i'_1, ..., i'_m} = emptyset, $
$ {i_1, ..., i_k} union {i'_1, ..., i'_m} = {1, ..., n}. $
Obviously, in this case $k + m = n$.

Suppose we are given systems of row and column indices $I, J in bold(N)_k$, and let $I'$ and $J'$ be the complementary systems for $I$ and $J$, respectively. The submatrix $bf(A)(I', J')$ of order $m = n - k$ is called the _complementary_ submatrix with respect to the submatrix $bf(A)(I, J)$ of order $k$.

The determinant $det(bf(A)(I, J))$ of a submatrix of order $k$ is called a _$k times k$ minor_ (or a _minor of order_ $k$), and the determinant of the corresponding complementary submatrix is called the _complementary minor_. A $k times k$ minor is a number; it must not be confused with the course's $(i, j)$ _matrix minor_ $bf(M)_(i j)$, which is the submatrix obtained from $bf(A)$ by deleting the $i$-th row and the $j$-th column. In the notation above, $bf(M)_(i j) = bf(A)(I', J')$ is the complementary submatrix of the $1 times 1$ submatrix $(a_(i j)) = bf(A)(I, J)$, $I = (i)$, $J = (j)$.

#subsec("Laplace's Theorem") // Tyrtyshnikov §5.7


#theorem(title: "Laplace's Theorem")[
  Let $bf(A)$ be a square matrix of order $n$. Fix any system of $k$ columns by choosing $J in bold(N)_k$. Then the computation of the determinant of the matrix $bf(A)$ reduces to computing the $k times k$ minors on the fixed $k$ columns and their complementary minors:
  $ det(bf(A)) = sum_(I in bold(N)_k) det(bf(A)(I, J)) det(bf(A)(I', J')) (-1)^(nu(I) + nu(J)), $
  where $nu(I) = i_1 + ... + i_k$ for $I = (i_1, ..., i_k)$, and likewise $nu(J) = j_1 + ... + j_k$.
]

#proof[
  Relying on the lemma on partitioning the set of permutations of degree $n$ into the subsets of permutations $sigma(pi, tau)$, $pi in S_k$, $tau in S_m$ (see Tyrtyshnikov, §5.6), we find
  $ det(bf(A)) &= sum_(I in bold(N)_k) ( sum_(pi in S_k) sum_(tau in S_m) (a_(i_(pi(1)) j_1) ... a_(i_(pi(k)) j_k)) times \
    &times (a_(i'_(tau(1)) j'_1) ... a_(i'_(tau(m)) j'_m)) op("sgn")(sigma(pi, tau)) ) = \
    &= sum_(I in bold(N)_k) ( sum_(pi in S_k) sum_(tau in S_m) (a_(i_(pi(1)) j_1) ... a_(i_(pi(k)) j_k)) times \
    &times (a_(i'_(tau(1)) j'_1) ... a_(i'_(tau(m)) j'_m)) op("sgn")(pi) op("sgn")(tau) ) (-1)^(nu(I) + nu(J)) = \
    &= sum_(I in bold(N)_k) ( sum_(pi in S_k) (a_(i_(pi(1)) j_1) ... a_(i_(pi(k)) j_k)) op("sgn")(pi) ) times \
    &times ( sum_(tau in S_m) (a_(i'_(tau(1)) j'_1) ... a_(i'_(tau(m)) j'_m)) op("sgn")(tau) ) (-1)^(nu(I) + nu(J)). $
  It remains to note that the first and second parenthesized sums yield $det(bf(A)(I, J))$ and $det(bf(A)(I', J'))$, respectively.
]

#indent The quantity $det(bf(A)(I', J')) (-1)^(nu(I) + nu(J))$ is called the _cofactor_ (or _algebraic complement_) of the $k times k$ minor $det(bf(A)(I, J))$. Thus, Laplace's theorem asserts that for any choice of a system of columns, _the determinant of a matrix is equal to the sum of all possible $k times k$ minors located in the given columns, multiplied by their cofactors._

Since $det(bf(A)) = det(bf(A)^T)$ (Section 2.10), the following version of Laplace's theorem also holds: _for any choice of a system of rows, the determinant of a matrix is equal to the sum of all possible $k times k$ minors located in the given rows, multiplied by their cofactors._

For $k = 1$, Laplace's theorem is the _cofactor expansion_. Take $J = (j)$ and $I = (i)$: the $1 times 1$ minor is the entry $a_(i j)$, its complementary submatrix is the $(i, j)$ matrix minor $bf(M)_(i j)$, and its cofactor is the $(i, j)$-_cofactor_ $A_(i j) = (-1)^(i + j) det(bf(M)_(i j))$. Hence
$ det(bf(A)) = a_(1 j) A_(1 j) + a_(2 j) A_(2 j) + ... + a_(n j) A_(n j) $
(cofactor expansion along the $j$-th column) and, by the row version,
$ det(bf(A)) = a_(i 1) A_(i 1) + a_(i 2) A_(i 2) + ... + a_(i n) A_(i n) $
(cofactor expansion along the $i$-th row). MA1522 takes the cofactor expansion as the definition of the determinant; Laplace's theorem shows that it agrees with formula $(triangle.stroked.t)$.

#problem(number: 4)[
  A matrix $bf(B)$ with determinant $b = det(bf(B))$ is obtained from a matrix $bf(A)$ with determinant $a = det(bf(A))$ by adding a number $c != 0$ to each entry. Find the sums of the cofactors of all entries (submatrices of order $1$) for $bf(A)$ and for $bf(B)$.
]

#problem(number: 5)[
  In an $(n times n)$-matrix there is a unique $r times r$ minor, $r < n$, that is nonzero. Prove that all $k times k$ minors with $k >= r + 1$ are equal to zero.
]

#problem(number: 6)[
  Let $bf(A)$ be a matrix of order $n$ with entries $a_(i j) = plus.minus 1$. Prove that if $n = 4$, then $abs(det(bf(A))) <= 16$, and construct a matrix for which $det(bf(A)) = 16$.#footnote[In the general case one can prove that if $abs(a_(i j)) <= 1$, then $abs(det(bf(A))) <= n^(n / 2)$ (see Section 5.4). Matrices with entries $plus.minus 1$ for which $abs(det(bf(A))) = n^(n / 2)$ are called _Hadamard matrices_. It is not hard to establish that Hadamard matrices do not exist for all $n$. There is a conjecture that Hadamard matrices exist for all $n$ divisible by $4$.]
]

#sec("2.9", "Determinant by Reduction")

#subsec("The Determinant as a Function of the Columns (Rows) of a Matrix") // Tyrtyshnikov §5.2


#property(title: "1")[
  The determinant as a function of the columns of a matrix is a linear function with respect to each column: if $bf(A) = display(mat(bf(a)_1, dots.c, bf(a)_n))$ and $bf(a)_i = alpha bf(p) + beta bf(q)$ is a linear combination of the columns $bf(p)$ and $bf(q)$, then
  $ det(bf(A)) = alpha det(bf(A)_p) + beta det(bf(A)_q), $
  where the matrices $bf(A)_p$ and $bf(A)_q$ are obtained from $bf(A)$ by replacing the column $bf(a)_i$ with $bf(p)$ and $bf(q)$, respectively.
]

#proof[
  In accordance with the definition,
  $ det(bf(A)) &= sum_(sigma in S_n) op("sgn")(sigma) a_(sigma(1) 1) a_(sigma(2) 2) ... a_(sigma(i) i) ... a_(sigma(n) n) = \
    &= sum_(sigma in S_n) op("sgn")(sigma) a_(sigma(1) 1) a_(sigma(2) 2) ... (alpha p_(sigma(i) i) + beta q_(sigma(i) i)) ... a_(sigma(n) n) = \
    &= alpha sum_(sigma in S_n) op("sgn")(sigma) a_(sigma(1) 1) a_(sigma(2) 2) ... p_(sigma(i) i) ... a_(sigma(n) n) + \
    &+ beta sum_(sigma in S_n) op("sgn")(sigma) a_(sigma(1) 1) a_(sigma(2) 2) ... q_(sigma(i) i) ... a_(sigma(n) n) = \
    &= alpha det(bf(A)_p) + beta det(bf(A)_q). $
]

#property(title: "2")[
  The determinant changes sign when two columns are interchanged.
]

#proof[
  Suppose the matrix $bf(B) = (b_(i j))$ differs from $bf(A)$ by the interchange of the columns $bf(a)_k$ and $bf(a)_l$. Then for any permutation $sigma in S_n$,
  $ a_(sigma(1) 1) ... a_(sigma(n) n) = b_((sigma tau)(1) 1) ... b_((sigma tau)(n) n), $
  where $tau = (k, l)$, and since a transposition changes the sign of a permutation,
  $ op("sgn")(sigma tau) = -op("sgn")(sigma). $
  It is easy to see that the mapping $sigma -> sigma tau$ defines a one-to-one correspondence between permutations. Each term of the sum of the form $(triangle.stroked.t)$ of Section 2.8 is determined by one and only one permutation. The permutations $sigma$ and $sigma tau$ in the expansions of $det(bf(A))$ and $det(bf(B))$ determine terms with the product of the very same entries (in a different order), but with opposite signs. Hence $det(bf(A)) = -det(bf(B))$.
]

#property(title: "3")[
  If the columns of a matrix are linearly dependent, then its determinant is equal to zero.
]

#proof[
  First of all, let us note that a determinant with two equal columns is equal to zero, since by statement (2) it is equal to itself with the opposite sign.

  If the columns $bf(a)_1, bf(a)_2, ..., bf(a)_n$ are linearly dependent, then at least one of them is linearly expressible in terms of the others. Suppose
  $ bf(a)_i = sum_(k != i) alpha_k bf(a)_k. $
  Denote by $bf(B)$ the matrix obtained from $bf(A)$ by replacing the column $bf(a)_i$ with
  $ bf(a)_i - sum_(k != i) alpha_k bf(a)_k = bf(0). $
  Relying on property (1) already established, we find
  $ 0 = det(bf(B)) = det(bf(A)) - sum_(k != i) alpha_k det(bf(A)_k), $
  where the matrix $bf(A)_k$ is obtained from $bf(A)$ by replacing the $i$-th column with $bf(a)_k$. Clearly, in $bf(A)_k$ the $i$-th and $k$-th columns are equal, so $det(bf(A)_k) = 0$. Thus, $det(bf(A)) = det(bf(B)) = 0$.
]

#property(title: "4")[
  The determinant as a function of the rows of a matrix possesses properties analogous to (1), (2), (3).
]

#proof[
  It suffices to take into account that $det(bf(A)) = det(bf(A)^T)$ (Section 2.10) and consider $det(bf(A))$ as a function of the columns of the matrix $bf(A)^T$.
]

#problem(number: 1)[
  Given column matrices $bf(u)_1, ..., bf(u)_k, bf(v)_1, ..., bf(v)_k in bb(R)^n$ and $bf(A) = bf(u)_1 bf(v)_1^T + ... + bf(u)_k bf(v)_k^T$, prove that $det(bf(A)) = 0$ if $k < n$.
]

#problem(number: 2)[
  Let $bf(u), bf(v) in bb(R)^n$ and let $bf(I)$ be the identity matrix. Prove that $det(bf(I) + bf(u) bf(v)^T) = 1 + bf(v)^T bf(u)$.
]

#subsec("Existence of the Linear Dependence Indicator") // Tyrtyshnikov §5.3


#theorem[
  The linear dependence indicator (a function endowed with properties (A), (B), (C) from Section 2.8) exists, is unique, and is the determinant.
]

#indent Properties (A) and (B) of the linear dependence indicator coincide with properties (1) and (3) of the determinant established above. Property (C) means that the determinant of the identity matrix is equal to $1$, and is a consequence of the following more general statement.

#proposition[
  The determinant of a diagonal matrix is equal to the product of its diagonal entries:
  $ det mat(a_(1 1), , 0; , dots.down, ; 0, , a_(n n)) = a_(1 1) dot ... dot a_(n n). $
]

#proof[
  For a diagonal matrix, in the sum $(triangle.stroked.t)$ of Section 2.8 for its determinant there is only one nonzero term, equal to the product of the entries on the main diagonal.
]

#sec("2.10", "Properties of Determinant")

#subsec("Determinant of the Transpose Matrix") // Tyrtyshnikov §5.1


Suppose we have a rectangular matrix of size $m times n$:
$ bf(A) = (a_(i j)), quad 1 <= i <= m, quad 1 <= j <= n. $
If we interchange its rows and columns, we obtain a new matrix—of size $n times m$. It is called the _transpose_ with respect to $bf(A)$ and is denoted by $bf(A)^T$:
$ bf(A)^T = (a_(j i)), quad 1 <= j <= n, quad 1 <= i <= m. $

#proposition[
  For any square matrix, $det(bf(A)^T) = det(bf(A))$.
]

#proof[
  By the definition of the transpose matrix and formula $(triangle.stroked.t)$ of Section 2.8 for the determinant of a matrix of order $n$,
  $ det(bf(A)^T) &= sum_(sigma in S_n) op("sgn")(sigma) a_(1 sigma(1)) ... a_(n sigma(n)) = \
    &= sum_(sigma in S_n) op("sgn")(sigma) a_(sigma^(-1)(1) 1) ... a_(sigma^(-1)(n) n) = \
    &= sum_(sigma^(-1) in S_n) op("sgn")(sigma^(-1)) a_(sigma^(-1)(1) 1) ... a_(sigma^(-1)(n) n) = det(bf(A)). $
  In the last equality we took into account that $op("sgn")(sigma^(-1)) = op("sgn")(sigma)$.
]

#problem(number: 1)[
  Prove that the columns of a real rectangular matrix $bf(A)$ are linearly independent if and only if the columns of the matrix $bf(A)^T bf(A)$ are linearly independent.
]

#subsec("Determinant of a Product of Matrices") // Tyrtyshnikov §6.7


#theorem[
  The determinant of a product of square matrices is equal to the product of their determinants.
]

#proof[
  Let $bf(A) = display(mat(bf(a)_1, dots.c, bf(a)_n))$ be a matrix of order $n$ with columns $bf(a)_1, ..., bf(a)_n$ and $bf(B) = (b_(i j))$. Then any column of the matrix
  $bf(A) bf(B)$ is a linear combination of the columns of the matrix $bf(A)$ with coefficients from the corresponding column of the matrix $bf(B)$:
  $ bf(A) bf(B) = mat(sum_(i_1 = 1)^n b_(i_1 1) bf(a)_(i_1), dots.c, sum_(i_n = 1)^n b_(i_n n) bf(a)_(i_n)). $
  Using the linearity of the determinant in each column, we obtain
  $ det(bf(A) bf(B)) &= sum_(i_1 = 1)^n ... sum_(i_n = 1)^n b_(i_1 1) ... b_(i_n n) det mat(bf(a)_(i_1), dots.c, bf(a)_(i_n)) = \
  &= sum_(sigma in S_n) b_(sigma(1) 1) ... b_(sigma(n) n) det mat(bf(a)_(sigma(1)), dots.c, bf(a)_(sigma(n))) = \
  &= (sum_(sigma in S_n) b_(sigma(1) 1) ... b_(sigma(n) n) op("sgn")(sigma)) det(bf(A)) = \
  &= det(bf(B)) dot det(bf(A)). $
]

#problem(number: 2)[
  Let $bf(P)$ be an invertible matrix of order $n$. Prove that for any columns $bf(u), bf(v) in bb(R)^(n times 1)$ the equality $det(bf(I) + bf(u) bf(v)^T) = det(bf(I) + (bf(P) bf(u))(bf(P)^(-T) bf(v))^T)$ holds.
]

#problem(number: 3)[
  Prove that the determinant of a tridiagonal matrix does not change if every superdiagonal entry is multiplied and every subdiagonal entry is divided by one and the same nonzero number.
]

#subsec("The Adjoint Formula for the Inverse") // Tyrtyshnikov §6.5


In this subsection we consider square matrices with a nonzero determinant.

Let $tilde(bf(A)) = (A_(i j))$ be the matrix of order $n$ in which the entry $A_(i j)$ is the cofactor of the entry $a_(i j)$ in the matrix $bf(A)$, that is, the $(i, j)$-cofactor $A_(i j) = (-1)^(i + j) det(bf(M)_(i j))$ (Section 2.8). The matrix $adj(bf(A)) = tilde(bf(A))^T$, whose $(i, j)$-entry is the $(j, i)$-cofactor $A_(j i)$, is called the _adjoint_ (also the _adjugate_ or _classical adjoint_) of the matrix $bf(A)$.

#theorem[
  If a matrix $bf(A)$ of order $n$ has $det(bf(A)) != 0$, then it is invertible and, moreover,
  $ bf(A)^(-1) = 1 / (det(bf(A))) adj(bf(A)), $
  where $adj(bf(A))$ is the adjoint of $bf(A)$.
]

#proof[
  Note that
  #eq(
    $ sum_(j=1)^n a_(i j) A_(k j) = cases(
      det(bf(A))\, & quad k = i\,,
      0\, & quad k != i.
    ) $,
    $(*)$
  )
  For $k = i$, equality $(*)$ is obtained by applying Laplace's theorem, that is, by the cofactor expansion of the determinant of the matrix $bf(A)$ along the $k$-th row. For $k != i$, the left-hand side of equality $(*)$ represents the cofactor expansion along the $k$-th row of the determinant of the matrix obtained from $bf(A)$ by replacing the $k$-th row with the $i$-th row. Such a determinant is equal to zero, as the determinant of a matrix with two identical rows. For example, if $n = 3$, $i = 1$, $k = 2$, then
  $ a_(1 1) A_(2 1) + a_(1 2) A_(2 2) + a_(1 3) A_(2 3) = \
  = a_(1 1) (-detmat(a_(1 2), a_(1 3); a_(3 2), a_(3 3))) + a_(1 2) detmat(a_(1 1), a_(1 3); a_(3 1), a_(3 3)) + a_(1 3) (-detmat(a_(1 1), a_(1 2); a_(3 1), a_(3 2))) = \
  = detmat(a_(1 1), a_(1 2), a_(1 3); a_(1 1), a_(1 2), a_(1 3); a_(3 1), a_(3 2), a_(3 3)) = 0. $
  Furthermore,
  $ sum_(j=1)^n a_(i j) A_(k j) = sum_(j=1)^n a_(i j) (adj(bf(A)))_(j k), quad 1 <= i, k <= n. $
  Therefore, by virtue of the relations $(*)$,
  $ bf(A) adj(bf(A)) = mat(
    det(bf(A)), , ;
    , dots.down, ;
    , , det(bf(A))
  ) = det(bf(A)) bf(I). $
  Using Laplace's theorem for expanding the determinant along the $k$-th column (cofactor expansion along a column), we find
  $ sum_(i=1)^n a_(i j) A_(i k) = cases(
    det(bf(A))\, & quad k = j\,,
    0\, & quad k != j
  ) quad => \
  => quad adj(bf(A)) bf(A) = mat(
    det(bf(A)), , 0;
    , dots.down, ;
    0, , det(bf(A))
  ) = det(bf(A)) bf(I). $
]

#problem(number: 4)[
  Prove that any invertible matrix can be made singular by changing just one of its entries.
]

#subsec("Cramer's Rule") // Tyrtyshnikov §6.6


#theorem[
  Let $bf(A)$ be a matrix of order $n$ with $det(bf(A)) != 0$. Then the linear system $bf(A) bf(x) = bf(b)$ has a unique solution $bf(x)$ with components
  $ x_i = (det(bf(A)_i (bf(b)))) / (det(bf(A))), quad 1 <= i <= n, $
  where $bf(A)_i (bf(b))$ is the matrix obtained from $bf(A)$ by replacing the $i$-th column with $bf(b)$.
]

#proof[
  According to the theorem on the inversion of a matrix with nonzero determinant (the adjoint formula),
  $ bf(x) = bf(A)^(-1) bf(b) = 1 / (det(bf(A))) adj(bf(A)) bf(b) quad => quad x_i = 1 / (det(bf(A))) sum_(j=1)^n A_(j i) b_j, quad 1 <= i <= n. $
  It remains to note that the sum $sum_(j=1)^n A_(j i) b_j$ is the cofactor expansion along the $i$-th column of the determinant of the matrix $bf(A)_i (bf(b))$.
]

#subsec("Determinant of a Block-Triangular Matrix", beyond: true) // Tyrtyshnikov §5.8


Consider a block-triangular matrix of order $n$:
$ bf(A) = mat(bf(P), bf(R); bf(0), bf(Q)), quad bf(P) in bb(R)^(k times k), quad bf(Q) in bb(R)^(m times m), quad k + m = n. $
Applying Laplace's theorem (Section 2.8) to the system of the first $k$ columns (or rows) immediately gives the useful formula
$ det(bf(A)) = det(bf(P)) det(bf(Q)). $
