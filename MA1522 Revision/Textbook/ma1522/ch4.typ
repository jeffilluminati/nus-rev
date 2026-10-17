#import "common.typ": *

#chapter("Chapter 4. Subspaces Associated to a Matrix")

#sec("4.1", "Column Space, Row Space, and Nullspace")

#subsec("Examples of Finite-Dimensional Vector Spaces") // Tyrtyshnikov §11.3


Vector spaces that are the span of some finite number of their vectors are called _finite-dimensional_.

+ _The set of polynomials of order $n$._

  A polynomial in $x$ of order $n$ is an expression of the form
  $ f(x) = a_(n - 1) x^(n - 1) + a_(n - 2) x^(n - 2) + ... + a_1 x + a_0. $
  If $a_k != 0$ and $a_(k + 1) = ... = a_(n - 1) = 0$, then $k$ is called the _degree_ of the polynomial $f(x)$. Expressions of the form $a x^i$ are called _monomials_.

  Let us regard $f(x)$ as a function of $x$. Then the sum of polynomials and the multiplication of a polynomial by a number are defined in the same way as in the case of general functions. In doing so, it is clear that the results of these operations remain polynomials. Obviously, the vector space of all polynomials of order $n$ is the span of the monomials of the form
  $ x^(n - 1), x^(n - 2), ..., x^1, x^0 equiv 1. $

+ _The set of $m times n$ matrices with fixed dimensions $m$ and $n$._

  In this case, vector addition is defined as matrix addition, and multiplication of a vector by a number as multiplication of a matrix by a number.

  Denote by $bf(E)^(k l) = ((bf(E)^(k l))_(i j))$ the $m times n$ matrix with entries of the form
  $ (bf(E)^(k l))_(i j) = cases(
    1\, & quad i = k\, j = l\,,
    0 & quad "otherwise."
  ) $
  There are exactly $m n$ such matrices, and obviously the entire space of $m times n$ matrices is their span.

+ _The set of all solutions of a homogeneous linear system $bf(A) bf(x) = bf(0)$._

  If the rank of the $m times n$ matrix $bf(A)$ equals $r$, then a basis for the solution space of this homogeneous system contains $n - r$ vectors, and the entire set of solutions coincides with their span. This vector space is called the _nullspace_ of the matrix $bf(A)$. Notation: $Null(bf(A))$ (in some books $ker bf(A)$ or $"null" bf(A)$). Its dimension is called the _nullity_ of $bf(A)$: $nullity(bf(A)) = dim(Null(bf(A)))$.

+ _The set of all vectors of the form $bf(y) = bf(A) bf(x)$ (for a given matrix $bf(A)$)._

  This is a set well familiar to us, coinciding with the span of the columns of the matrix $bf(A)$. It is called the _column space_ of the matrix $bf(A)$ (in some books, the _image_ of $bf(A)$, $"im" bf(A)$). Notation: $Col(bf(A))$.

#see-section("4.2", [The row space $Row(bf(A))$, the span of the rows of $bf(A)$,])

#sec("4.2", "Rank")

#subsec("Separation of Variables and Matrices", beyond: true) // Tyrtyshnikov §7.1


In the study of functions of two variables, a special role is played by functions with _separated variables_, $f(x, y) = u(x) v(y)$, or sums of such functions:#footnote[Separation of variables is applied with great success to the approximation of functions of general form.]
$ f(x, y) = u_1(x) v_1(y) + ... + u_r (x) v_r (y). $
Suppose we are given an $m times n$ matrix $bf(A)$. Its entry $a_(i j)$ can be regarded as a function of the discrete variables $i in {1, ..., m}$, $j in {1, ..., n}$. In this case, separation of variables means that
$ a_(i j) = u_i v_j, quad 1 <= i <= m, quad 1 <= j <= n. $
From this it is easy to deduce that $bf(A)$ is the product of a column and a row:#footnote[The matrix $bf(u) bf(v)^T$ is sometimes called the _outer product_ $bf(u) times.o bf(v) = bf(u) bf(v)^T$ of the vectors $bf(u) in bb(C)^m$ and $bf(v) in bb(C)^n$.]
$ bf(A) = bf(u) bf(v)^T, quad bf(u) = mat(u_1; dots.v; u_m), quad bf(v) = mat(v_1; dots.v; v_n). $

#subsec("Skeleton Decomposition", beyond: true) // Tyrtyshnikov §7.2


Now suppose that $a_(i j) = u_(i 1) v_(j 1) + ... + u_(i r) v_(j r)$, $1 <= i <= m$, $1 <= j <= n$. In this case $bf(A)$ is a sum of $r$ matrices of the "column-by-row" form:
$ bf(A) = sum_(k=1)^r bf(u)_k bf(v)_k^T, quad bf(u)_k = mat(u_(1 k); dots.v; u_(m k)), quad bf(v)_k = mat(v_(1 k); dots.v; v_(n k)). $
This same equality, written in the form of a product of two matrices:
#eq(
  $ bf(A) = bf(U) bf(V)^T = mat(
    u_(1 1), ..., u_(1 r);
    dots.v, dots.v, dots.v;
    u_(m 1), ..., u_(m r)
  ) mat(
    v_(1 1), ..., v_(n 1);
    dots.v, dots.v, dots.v;
    v_(1 r), ..., v_(n r)
  ), \
  bf(U) = mat(bf(u)_1, dots.c, bf(u)_r), quad bf(V) = mat(bf(v)_1, dots.c, bf(v)_r), $,
  $(1)$
)
is called a _skeleton decomposition_ of the matrix $bf(A)$. It means that every column of the matrix $bf(A)$ is a linear combination of the columns of the matrix $bf(U)$, and every row of the matrix $bf(A)$ is a linear combination of the rows of the matrix $bf(V)^T$. From this there immediately follows

#theorem[
  The dimension of the column space of a matrix $bf(A)$ coincides with the dimension of its _row space_ $Row(bf(A))$, the span of its rows:
  $ dim(Col(bf(A))) = dim(Row(bf(A))), \
  Col(bf(A)) = span{bf(a)_1, ..., bf(a)_n}, quad Row(bf(A)) = span{hat(bf(a))_1^T, ..., hat(bf(a))_m^T}, \
  bf(A) = mat(bf(a)_1, bf(a)_2, dots.c, bf(a)_n) = mat(hat(bf(a))_1^T; dots.v; hat(bf(a))_m^T). $
]

#proof[
  Let the columns of the matrix $bf(U)$ form a basis for the column space $Col(bf(A))$, and let the $j$-th column of the matrix $bf(V)^T$ consist of the coefficients of their linear combination yielding the column $bf(a)_j$. Then, obviously, $bf(A) = bf(U) bf(V)^T$. By virtue of the remark preceding the theorem, the dimension of the row space of the matrix $bf(A)$ does not exceed the number of rows of the matrix $bf(V)^T$, which by construction equals the dimension of the column space of the matrix $bf(A)$. The opposite inequality is proved similarly—the roles of columns and rows are interchanged by transposition.
]

#subsec("Matrix Rank") // Tyrtyshnikov §7.3


The dimension of the column space $Col(bf(A))$ (row space $Row(bf(A))$) of a matrix $bf(A)$ is sometimes called its column (row) rank. Since the column and row ranks coincide, it is natural to call their common value simply the _rank_ of the matrix; this is the definition used in MA1522:
$ rank(bf(A)) = dim(Col(bf(A))) = dim(Row(bf(A))). $
From our proof of this fact it also follows that this value is equal to the smallest number of matrices of the "column-by-row" form whose sum yields the given matrix.

Nevertheless, another definition is often given: the _rank_ of a matrix is the largest $k$ for which the matrix has a nonzero $k times k$ minor. Here and throughout this section, a _$k times k$ minor_ (or _minor of order $k$_) means the determinant of a $k times k$ submatrix; it is a number, not to be confused with the $(i, j)$ matrix minor $bf(M)_(i j)$ of Section 2.8, which is a submatrix. A nonzero minor of this largest order and the corresponding submatrix are called a _basis minor_ and a _basis submatrix_. Since a square matrix is invertible if and only if its determinant is nonzero (Section 2.6),
the rank in this sense is equal to the largest order of an invertible square submatrix of the given matrix. Notation: $rank(bf(A))$.

Two obvious properties of the rank of an $m times n$ matrix $bf(A)$:
$ rank(bf(A)) <= min{m, n}, quad rank(bf(A)) = rank(bf(A)^T). $
It is less obvious that: _the largest order of a nonzero minor of a matrix coincides with its column and row rank_. Let us prove this.

#subsec("Bordering of an Invertible Submatrix", beyond: true) // Tyrtyshnikov §7.4


We begin with a useful auxiliary proposition. Suppose a square matrix $bf(Q)$ of order $k + 1$ has the block form:
$ bf(Q) = mat(bf(P), bf(v); bf(u)^T, c), quad bf(P) in bb(R)^(k times k), quad bf(u), bf(v) in bb(R)^(k times 1). $
In this case $bf(Q)$ is called a _bordering of the submatrix_ $bf(P)$.

#lemma(title: "on noninvertible bordering")[
  If the submatrix $bf(P)$ is invertible, while its bordering $bf(Q)$ is a noninvertible matrix, then the last column of the matrix $bf(Q)$ is a linear combination of the first $k$ columns.
]

#proof[
  Using the rule for multiplying block matrices (see Section 2.3), it is easy to verify the validity of the equality
  $ mat(bf(I), bf(0); -bf(u)^T bf(P)^(-1), 1) mat(bf(P), bf(v); bf(u)^T, c) = mat(bf(P), bf(v); bf(0), gamma), quad gamma = c - bf(u)^T bf(P)^(-1) bf(v). $
  Denote the matrix on the right-hand side by $bf(M)$. As the product of an invertible and a noninvertible matrix, $bf(M)$ cannot be an invertible matrix. Yet it has block-triangular form, and if the blocks $bf(P)$ and $gamma$ were both invertible, then $bf(M)$ would have an inverse matrix of the form
  $ bf(M)^(-1) = mat(bf(P)^(-1), -bf(P)^(-1) bf(v) gamma^(-1); bf(0), gamma^(-1)). $
  (The equality $bf(M) bf(M)^(-1) = bf(I)$ is verified directly.) Since $bf(M)$ is not an invertible matrix, we necessarily have
  $ gamma = c - bf(u)^T bf(P)^(-1) bf(v) = 0 quad => quad c = bf(u)^T bf(P)^(-1) bf(v). $
  Consequently,
  $ mat(bf(P); bf(u)^T) (bf(P)^(-1) bf(v)) = mat(bf(v); c). $
]

#subsec("Basis Minor Theorem") // Tyrtyshnikov §7.5


#theorem[
  The columns (rows) containing a basis minor are linearly independent, and any column (any row) of the given matrix is a linear combination of them.
]

#proof[
  Without loss of generality, suppose that the basis submatrix $bf(P)$ of order $k$ is located in the upper left corner of the $m times n$ matrix $bf(A)$. Thus,
  $ bf(A) = mat(
    bf(P), bf(v)_(k+1), ..., bf(v)_n;
    bf(u)_(k+1)^T, a_(k+1, k+1), ..., a_(k+1, n);
    dots.v, dots.v, dots.down, dots.v;
    bf(u)_m^T, a_(m, k+1), ..., a_(m n)
  ), \
  bf(u)_(k+1), ..., bf(u)_m, bf(v)_(k+1), ..., bf(v)_n in bb(R)^(k times 1). $
  By the hypothesis of the theorem, any submatrix of order $k + 1$ of the form
  $ bf(M) = mat(bf(P), bf(v)_j; bf(u)_i^T, a_(i j)), quad i, j > k, $
  is noninvertible. By the lemma on noninvertible bordering of an invertible submatrix, the last column in $bf(M)$ is a linear combination of the first $k$ columns. Moreover, the coefficients of this linear combination do not depend on $i$ (since they are determined by the vector $bf(P)^(-1) bf(v)_j$). Hence, the $j$-th column of the matrix $bf(A)$ for $j > k$ is a linear combination of the first $k$ columns. The linear independence of the first $k$ columns is proved as follows: suppose their linear combination with coefficients $alpha_1, ..., alpha_k$ is equal to $bf(0)$; then
  $ bf(P) mat(alpha_1; dots.v; alpha_k) = bf(0) quad => quad mat(alpha_1; dots.v; alpha_k) = bf(0). $
  The assertion of the theorem concerning the rows is proved by passing to the transposed matrix.
]

#corollary(title: "1")[
  A matrix has rank $r$ if and only if some $r times r$ minor is nonzero, while all $(r + 1) times (r + 1)$ minors bordering it are equal to zero.
]

#corollary(title: "2")[
  The largest order of a nonzero minor of a matrix $bf(A)$ coincides with its column and row rank, that is, with $rank(bf(A)) = dim(Col(bf(A))) = dim(Row(bf(A)))$.
]

#remark[
  The basis minor theorem does not use the previously proved theorem on the equality of the column and row ranks. In essence, it provides yet another proof of this fact.
]

#indent Thus the columns containing a basis minor form a basis for $Col(bf(A))$, just as the columns of $bf(A)$ corresponding to the pivot columns of its reduced row-echelon form do; likewise, the rows containing a basis minor form a basis for $Row(bf(A))$.

#problem(number: 1)[
  Let $bf(A)$ be an $n times n$ matrix of rank $k$, and $bf(B)$ any invertible $k times k$ submatrix. Denote by $bf(R)$ the $k times n$ submatrix consisting of the rows of the matrix $bf(A)$ containing the submatrix $bf(B)$, and by $bf(C)$ the $n times k$ submatrix consisting of the columns containing $bf(B)$. Prove that
  $ bf(A) = bf(C) bf(B)^(-1) bf(R). $
]

#problem(number: 2)[
  Prove that the submatrix located at the intersection of $r$ linearly independent rows and $r$ linearly independent columns of a matrix of rank $r$ is invertible.
]

#problem(number: 3)[
  It is known that $bf(A)^T = -bf(A)$. Prove that the rank of the matrix $bf(A)$ is an even number.
]

#subsec("Properties of Rank") // Tyrtyshnikov §7.6


#proposition(title: "1")[
  The rank of a sum of matrices does not exceed the sum of their ranks:
  $ rank(bf(A) + bf(B)) <= rank(bf(A)) + rank(bf(B)). $
]

#proof[
  Obviously, $bf(A)$ and $bf(B)$ must have the same number of columns:
  $ bf(A) = mat(bf(a)_1, bf(a)_2, dots.c, bf(a)_n), quad bf(B) = mat(bf(b)_1, bf(b)_2, dots.c, bf(b)_n). $
  Clearly, $span{bf(a)_1 + bf(b)_1, ..., bf(a)_n + bf(b)_n} subset.eq span{bf(a)_1, ..., bf(a)_n, bf(b)_1, ..., bf(b)_n}$. In the smaller span, let us choose some set of vectors forming a basis. According to the Basis Extension Lemma (Section 3.7), a basis for the larger span can be obtained by extending this set by some vectors from the larger span. Therefore,
  $ rank(bf(A) + bf(B)) &= dim(span{bf(a)_1 + bf(b)_1, ..., bf(a)_n + bf(b)_n}) <= \
  &<= dim(span{bf(a)_1, ..., bf(a)_n, bf(b)_1, ..., bf(b)_n}). $
  Let $p = rank(bf(A))$, $q = rank(bf(B))$, and suppose without loss of generality that a basis for $span{bf(a)_1, ..., bf(a)_n}$ is formed by the first $p$ vectors, and a basis for $span{bf(b)_1, ..., bf(b)_n}$ by the first $q$ vectors. Then $span{bf(a)_1, ..., bf(a)_n, bf(b)_1, ..., bf(b)_n} = span{bf(a)_1, ..., bf(a)_p, bf(b)_1, ..., bf(b)_q} =>$
  $ dim(span{bf(a)_1, ..., bf(a)_n, bf(b)_1, ..., bf(b)_n}) <= p + q. $
]

#proposition(title: "2")[
  The rank of a product of matrices does not exceed the rank of each of the factors:
  $ rank(bf(A) bf(B)) <= min{rank(bf(A)), rank(bf(B))}. $
]

#proof[
  It suffices to note that each of the columns of the matrix $bf(A) bf(B)$ is a linear combination of the columns of the matrix $bf(A)$. Therefore, the column space of the matrix $bf(A) bf(B)$ is contained in the column space of the matrix $bf(A)$: $Col(bf(A) bf(B)) subset.eq Col(bf(A))$. Consequently, $rank(bf(A) bf(B)) <= rank(bf(A))$. Furthermore,
  $ rank(bf(A) bf(B)) = rank((bf(A) bf(B))^T) = rank(bf(B)^T bf(A)^T) <= rank(bf(B)^T) = rank(bf(B)). $
]

#proposition(title: "3")[
  The rank of a matrix does not change when it is multiplied on the left or on the right by an invertible matrix.
]

#proof[
  Let $bf(B) = bf(P) bf(A) bf(Q)$, where $bf(P)$ and $bf(Q)$ are invertible matrices.#footnote[Of course, the order of $bf(P)$ is equal to the number of rows, and the order of $bf(Q)$ to the number of columns of the matrix $bf(A)$.] By virtue of the preceding proposition, $rank(bf(B)) <= rank(bf(A))$. At the same time, $bf(A) = bf(P)^(-1) bf(B) bf(Q)^(-1) => rank(bf(A)) <= rank(bf(B))$.
]

#indent This proposition is useful when computing the rank. Usually this is done with the aid of _elementary row and column operations_, simplifying the form of the matrix by eliminating its entries; these operations reduce to multiplying the matrix on the left and on the right by certain invertible matrices (elementary matrices) and therefore preserve the rank.

#proposition(title: "4")[
  When $k$ rows (columns) of a matrix are changed, its rank cannot change by more than $k$.
]

#proof[
  It suffices to consider the case $k = 1$. Let the rank be equal to $r$, and let the columns $bf(a)_(j_1), ..., bf(a)_(j_r)$ be basis columns. If the column $bf(a)_j$ coincides with one of these columns, then under any change to it, this set of columns will have a linearly independent subset of $r - 1$ columns. Therefore, the rank of the new matrix is no less than $r - 1$ and, of course, no greater than $r + 1$. If the column $bf(a)_j$ does not coincide with any of the chosen basis columns, then every column of the new matrix is a linear combination of the columns $bf(a)_(j_1), ..., bf(a)_(j_r), bf(a)_j$, so its rank is no greater than $r + 1$ and no less than $r$, since there is a set of $r$ linearly independent columns $bf(a)_(j_1), ..., bf(a)_(j_r)$.
]

#corollary[
  When $k$ columns are added (or removed), the rank of a matrix cannot change by more than $k$.
]

#problem(number: 4)[
  Let $bf(A)$ and $bf(B)$ be matrices of rank $1$. Prove that if $bf(A) bf(B) != bf(0)$, then the rank of the matrix $bf(A) + bf(B)$ is at most $1$.
]

#problem(number: 5)[
  Given vectors $bf(x), bf(y) in bb(R)^n$, with $bf(x) != bf(0)$. Prove that there exists a symmetric matrix $bf(A) in bb(R)^(n times n)$ such that $rank(bf(A)) <= 2$ and $bf(A) bf(x) = bf(y)$.
]

#problem(number: 6)[
  A matrix $bf(A)$ has $r$ columns, and a matrix $bf(B)$ has $r$ rows. Prove that $r >= rank(bf(A)) + rank(bf(B)) - rank(bf(A) bf(B))$.
]

#problem(number: 7)[
  Prove that any matrix of rank $r$ with nonnegative entries can be represented as the difference of matrices with nonnegative entries and rank not exceeding $2^r$.
]

#subsec("Homogeneous Linear Systems") // Tyrtyshnikov §7.7


A linear system with a zero right-hand side
#eq($ bf(A) bf(x) = bf(0) $, $(*)$)
is called _homogeneous_. Suppose that the given system has $m$ equations and $n$ variables. Then the coefficient matrix $bf(A)$ has size $m times n$. Let us write $bf(A)$ by its columns, $bf(A) = display(mat(bf(a)_1, bf(a)_2, dots.c, bf(a)_n))$, and suppose that its rank is equal to $r$. Without loss of generality, we shall assume that a basis submatrix in $bf(A)$ is located in the first $r$ columns—we shall call them _basis_ columns. The components of the solution $x_1, ..., x_r$ corresponding to the basis columns will also be called _basis_ (or _basic_) variables, and the remaining components $x_(r+1), ..., x_n$ will be called _free_ variables. (Under this assumption the basis columns are exactly the columns of $bf(A)$ corresponding to the pivot columns of its reduced row-echelon form, and the free variables are those to which parameters are assigned in the general solution.) Thus, the solution vector has the form
$ bf(x) = mat(x_1; dots.v; x_r; x_(r+1); dots.v; x_n). $
The system $(*)$ is equivalent to the equality
#eq(
  $ x_1 bf(a)_1 + ... + x_r bf(a)_r = -x_(r+1) bf(a)_(r+1) - ... - x_n bf(a)_n. $,
  $(**)$
)
By the basis minor theorem, the columns $bf(a)_(r+1), ..., bf(a)_n$ belong to $span{bf(a)_1, ..., bf(a)_r}$. Therefore, for any choice of values of the free variables, the values of the basis variables satisfying equality $(**)$ exist and are uniquely determined. Thus, there exist $n - r$ vectors of the form
$ bf(v)_1 = mat(x_(1 1); dots.v; x_(r 1); 1; 0; dots.v; 0), quad
bf(v)_2 = mat(x_(1 2); dots.v; x_(r 2); 0; 1; dots.v; 0), quad ..., quad
bf(v)_(n-r) = mat(x_(1, n-r); dots.v; x_(r, n-r); 0; 0; dots.v; 1), $
each of which is a solution of the system $(*)$:
$ bf(A) bf(v)_1 = bf(0), quad ..., quad bf(A) bf(v)_(n-r) = bf(0). $
The vectors $bf(v)_1, ..., bf(v)_(n-r)$ are linearly independent:
$ alpha_1 bf(v)_1 + ... + alpha_(n-r) bf(v)_(n-r) = mat(*; dots.v; *; alpha_1; alpha_2; dots.v; alpha_(n-r)) = bf(0) quad => quad alpha_1 = ... = alpha_(n-r) = 0. $
Moreover, any linear combination of these vectors is a solution of the system $(*)$ and, furthermore, if $bf(x)$ is an arbitrary solution of the system $(*)$, then
$ bf(x) = x_(r+1) bf(v)_1 + ... + x_n bf(v)_(n-r). $
Thus, we have proved the following important statement.

#theorem[
  The set of solutions of the homogeneous linear system $(*)$ coincides with $span{bf(v)_1, ..., bf(v)_(n-r)}$, the span of the linearly independent vectors $bf(v)_1, ..., bf(v)_(n-r)$; that is, ${bf(v)_1, ..., bf(v)_(n-r)}$ is a basis for the nullspace $Null(bf(A))$.
]

#corollary(title: "Rank–Nullity Theorem")[
  For the $m times n$ matrix $bf(A)$ of rank $r$, $nullity(bf(A)) = dim(span{bf(v)_1, ..., bf(v)_(n-r)}) = n - r$; in other words,
  $ rank(bf(A)) + nullity(bf(A)) = n. $
]

#indent A linearly independent set of solutions ${bf(w)_1, ..., bf(w)_k}$ of the system $bf(A) bf(x) = bf(0)$ is called a _basis for the solution space_ (classically, a _fundamental system of solutions_) if $span{bf(w)_1, ..., bf(w)_k}$ coincides with the set of all solutions of the homogeneous system $bf(A) bf(x) = bf(0)$.

#corollary[
  The number of vectors in any basis for the solution space of $bf(A) bf(x) = bf(0)$ is equal to $n - r$, where $r = rank(bf(A))$.
]

#indent For the proof, it suffices to note that the span of the vectors of such a basis also has a basis consisting of the vectors $bf(v)_1, ..., bf(v)_(n-r)$ constructed above.

#problem(number: 8)[
  Given square matrices $bf(A)$ and $bf(B)$ of order $n$ such that $bf(A) bf(B) = bf(0)$ and the matrix $bf(A) + bf(B)$ is invertible. Prove that $rank(bf(A)) + rank(bf(B)) = n$.
]

#subsec("Rank and Consistency (Kronecker–Capelli Theorem)") // Tyrtyshnikov §7.8


Consider a linear system $bf(A) bf(x) = bf(b)$ with an $m times n$ matrix $bf(A) = display(mat(bf(a)_1, bf(a)_2, dots.c, bf(a)_n))$. The matrix $(bf(A) | bf(b)) = display(mat(bf(a)_1, bf(a)_2, dots.c, bf(a)_n, bf(b), augment: #(-1)))$ is called the _augmented matrix_ of the given system.

#theorem[
  The linear system $bf(A) bf(x) = bf(b)$ is consistent if and only if the rank of the coefficient matrix coincides with the rank of the augmented matrix:
  $ rank(bf(A)) = rank((bf(A) | bf(b))). $
]

#proof[
  We already know (see Section 1.5) that the consistency of the system $bf(A) bf(x) = bf(b)$ is equivalent to the equality of the spans $span{bf(a)_1, ..., bf(a)_n} = span{bf(a)_1, ..., bf(a)_n, bf(b)}$. It remains to note that $rank(bf(A)) = dim(span{bf(a)_1, ..., bf(a)_n})$ and $rank((bf(A) | bf(b))) = dim(span{bf(a)_1, ..., bf(a)_n, bf(b)})$.
]

#subsec("General Solution of a Linear System") // Tyrtyshnikov §7.9


If $U$ and $V$ are two sets of vectors in $bb(R)^n$, then the sum $U + V$ is defined as the set consisting of all possible sums of vectors of the form $bf(u) + bf(v)$, where $bf(u) in U$, $bf(v) in V$.

#theorem[
  Suppose that the system $bf(A) bf(x) = bf(b)$ is consistent, and fix an arbitrary particular solution $bf(u)$ ($bf(A) bf(u) = bf(b)$). Then the set of all solutions of the system $bf(A) bf(x) = bf(b)$ has the form $bf(u) + V$, where $V = Null(bf(A))$ is the set of all solutions of the corresponding homogeneous system $bf(A) bf(x) = bf(0)$.
]

#proof[
  Let $bf(x)$ be an arbitrary solution of the system $bf(A) bf(x) = bf(b)$. Then, obviously, $bf(A)(bf(x) - bf(u)) = bf(0) => bf(x) - bf(u) in V => bf(x) in bf(u) + V$. Next, take an arbitrary vector $bf(x) in bf(u) + V => bf(x) = bf(u) + bf(v)$, $bf(v) in V => bf(A)(bf(u) + bf(v)) = bf(A) bf(u) + bf(A) bf(v) = bf(b) + bf(0) = bf(b)$.
]

#corollary[
  The general solution of a consistent system $bf(A) bf(x) = bf(b)$ has the form
  $ bf(x) = bf(u) + c_1 bf(v)_1 + ... + c_(n-r) bf(v)_(n-r), $
  where $bf(u)$ is an arbitrary particular solution of the given system, $bf(v)_1, ..., bf(v)_(n-r)$ are linearly independent solutions of the corresponding homogeneous system (a basis for $Null(bf(A))$), $r = rank(bf(A))$, and the coefficients $c_1, ..., c_(n-r)$ are arbitrary real numbers (the parameters of the general solution).
]

#problem(number: 9)[
  What can be said about the matrix and right-hand side of a system $bf(A) bf(x) = bf(b)$ with respect to a vector $bf(x) in bb(R)^n$ if every vector in $bb(R)^n$ is a solution of it?
]

#subsec("Instability of Rank", beyond: true) // Tyrtyshnikov §7.10


An $m times n$ matrix $bf(A)$ is said to be of _full rank_ if its rank coincides with one of its dimensions, i.e., has the maximum possible value $rank(bf(A)) = min{m, n}$. Otherwise, one speaks of a matrix of _deficient rank_ (or _rank-deficient matrix_).

It can be proved that if $bf(A)$ is an $m times n$ matrix of full rank, then for all sufficiently small $epsilon > 0$ the matrix $bf(A) + bf(F)$, where all entries of the perturbation matrix $bf(F)$ are less than $epsilon$ in modulus, will also be a matrix of full rank. For this it suffices to note that the determinant of any square submatrix (any minor) can be regarded as a function of its entries, and this function is continuous. If a continuous function is nonzero at some values of the variables, then it will also be nonzero in some sufficiently small neighborhood of those values.

At the same time, if $bf(A)$ has deficient rank, then for any arbitrarily small $epsilon$ there exists a perturbation matrix $bf(F)$ with entries no greater than $epsilon$ in modulus such that $bf(A) + bf(F)$ is a matrix of full rank. For example, the matrix
$ bf(A) = mat(
  1, 0, 0, 0;
  0, 1, 0, 0;
  0, 0, 0, 0
) $
has rank $2$, whereas for any $epsilon != 0$ the matrix
$ bf(A) + bf(F) = mat(
  1, 0, 0, 0;
  0, 1, 0, 0;
  0, 0, epsilon, 0
) $
obviously has rank $3$.
