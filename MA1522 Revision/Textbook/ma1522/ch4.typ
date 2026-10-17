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

#subsec("Row Space and Column Space", added: true) // added for MA1522: definitions of Row(A) and Col(A); column space and consistency

Let $bf(A) = (a_(i j))_(m times n)$. Each of its $m$ rows $mat(a_(i 1), a_(i 2), dots.c, a_(i n))$ has $n$ entries, and each of its $n$ columns is a vector of $bb(R)^m$.

#definition[
  The _row space_ of an $m times n$ matrix $bf(A)$ is the subspace of $bb(R)^n$ spanned by the rows of $bf(A)$:
  $ Row(bf(A)) = span{mat(a_(1 1), dots.c, a_(1 n)), mat(a_(2 1), dots.c, a_(2 n)), ..., mat(a_(m 1), dots.c, a_(m n))}. $
  The _column space_ of $bf(A)$ is the subspace of $bb(R)^m$ spanned by the columns of $bf(A)$:
  $ Col(bf(A)) = span{mat(a_(1 1); a_(2 1); dots.v; a_(m 1)), mat(a_(1 2); a_(2 2); dots.v; a_(m 2)), ..., mat(a_(1 n); a_(2 n); dots.v; a_(m n))}. $
]

#indent Thus $Row(bf(A)) subset.eq bb(R)^n$, since a row has as many entries as $bf(A)$ has columns, while $Col(bf(A)) subset.eq bb(R)^m$. The vectors of the row space are written here as rows, but it is often convenient to write them as columns, that is, to work with the transposed rows; in this form the row space of $bf(A)$ is the column space of $bf(A)^T$. Together with the nullspace $Null(bf(A)) = {bf(v) in bb(R)^n | bf(A) bf(v) = bf(0)} subset.eq bb(R)^n$ (item 3 above), these are the _subspaces associated to the matrix_ $bf(A)$. That $Row(bf(A))$ and $Col(bf(A))$ always have the same dimension is proved in Section 4.2.

In the language of column spaces, the consistency criterion of Section 2.3 reads as follows.

#proposition(title: "Column space and consistency")[
  Let $bf(A) = mat(bf(a)_1, bf(a)_2, dots.c, bf(a)_n)$ be an $m times n$ matrix and $bf(v) in bb(R)^m$. Then $bf(v) in Col(bf(A))$ if and only if the linear system $bf(A) bf(x) = bf(v)$ is consistent. Consequently,
  $ Col(bf(A)) = {bf(A) bf(u) | bf(u) in bb(R)^n} = {bf(v) in bb(R)^m | bf(A) bf(x) = bf(v) "is consistent"}. $
]

#proof[
  For $bf(u) = (c_1, ..., c_n)^T$ we have $bf(A) bf(u) = c_1 bf(a)_1 + c_2 bf(a)_2 + ... + c_n bf(a)_n$. Hence $bf(v)$ is a linear combination of the columns of $bf(A)$ exactly when $bf(v) = bf(A) bf(u)$ for some $bf(u) in bb(R)^n$, that is, exactly when some $bf(u)$ is a solution of $bf(A) bf(x) = bf(v)$.
]

#subsec("Bases for the Row Space, Column Space and Nullspace", added: true) // added for MA1522: row operations preserve the row space and linear relations between columns; bases from the RREF

Recall that $bf(A)$ and $bf(B)$ are _row equivalent_ if $bf(B)$ can be obtained from $bf(A)$ by a finite sequence of elementary row operations. Each elementary row operation is multiplication on the left by an elementary matrix, which is invertible (Sections 1.3 and 2.5). Hence, if the $m times n$ matrices $bf(A)$ and $bf(B)$ are row equivalent, then
$ bf(B) = bf(P) bf(A), quad bf(A) = bf(P)^(-1) bf(B) $
for some invertible matrix $bf(P)$ of order $m$ (a product of elementary matrices).

#theorem(title: "Row operations preserve the row space")[
  If $bf(A)$ and $bf(B)$ are row equivalent matrices, then $Row(bf(A)) = Row(bf(B))$.
]

#proof[
  Let $bf(B) = bf(P) bf(A)$ with $bf(P) = (p_(i j))$ invertible. Row $i$ of $bf(P) bf(A)$ is row $i$ of $bf(P)$ times $bf(A)$, that is, the linear combination of the rows of $bf(A)$ with the coefficients $p_(i 1), ..., p_(i m)$. So every row of $bf(B)$ lies in the subspace $Row(bf(A))$, and therefore $Row(bf(B)) subset.eq Row(bf(A))$. The same argument applied to $bf(A) = bf(P)^(-1) bf(B)$ gives $Row(bf(A)) subset.eq Row(bf(B))$.
]

#theorem(title: "Basis for the row space")[
  Let $bf(R)$ be the reduced row-echelon form of a matrix $bf(A)$. Then the nonzero rows of $bf(R)$ form a basis for $Row(bf(R)) = Row(bf(A))$.
]

#proof[
  By the preceding theorem $Row(bf(A)) = Row(bf(R))$, and the zero rows of $bf(R)$ do not contribute to the span, so the nonzero rows $bf(r)_1, ..., bf(r)_k$ of $bf(R)$ span $Row(bf(A))$. Let the leading entry of $bf(r)_i$ lie in column $j_i$. In the reduced row-echelon form, this leading entry is $1$ and all the other entries of column $j_i$ are $0$. Hence, if $alpha_1 bf(r)_1 + ... + alpha_k bf(r)_k = bf(0)$, then the entry of the left-hand side in position $j_i$ equals $alpha_i$, so $alpha_i = 0$ for $i = 1, ..., k$. Thus $bf(r)_1, ..., bf(r)_k$ are linearly independent.
]

#indent The nonzero rows of _any_ row-echelon form of $bf(A)$ also form a basis for $Row(bf(A))$: they span $Row(bf(A))$ by the same argument, and they are linearly independent, as shown in the proof of the proposition in Section 1.2.

#theorem(title: "Row operations preserve linear relations between columns")[
  Let $bf(A) = mat(bf(a)_1, bf(a)_2, dots.c, bf(a)_n)$ and $bf(B) = mat(bf(b)_1, bf(b)_2, dots.c, bf(b)_n)$ be row equivalent $m times n$ matrices. Then for any scalars $c_1, c_2, ..., c_n$,
  $ c_1 bf(a)_1 + c_2 bf(a)_2 + ... + c_n bf(a)_n = bf(0) quad <=> quad c_1 bf(b)_1 + c_2 bf(b)_2 + ... + c_n bf(b)_n = bf(0). $
]

#proof[
  Put $bf(c) = (c_1, ..., c_n)^T$ and let $bf(B) = bf(P) bf(A)$ with $bf(P)$ invertible. The two equalities read $bf(A) bf(c) = bf(0)$ and $bf(B) bf(c) = bf(P)(bf(A) bf(c)) = bf(0)$. The first implies the second, and multiplying the second on the left by $bf(P)^(-1)$ gives the first.
]

#indent In other words, row equivalent matrices have the same nullspace, $Null(bf(A)) = Null(bf(B))$. In particular, some columns of $bf(A)$ are linearly independent if and only if the corresponding columns of $bf(B)$ are, and a column of $bf(A)$ is a given linear combination of other columns of $bf(A)$ if and only if the corresponding column of $bf(B)$ is the same linear combination of the corresponding columns of $bf(B)$.

#theorem(title: "Basis for the column space")[
  Let $bf(R) = (r_(i j))$ be the reduced row-echelon form of $bf(A) = mat(bf(a)_1, bf(a)_2, dots.c, bf(a)_n)$, and let $j_1 < j_2 < ... < j_k$ be the indices of the pivot columns of $bf(R)$. Then the columns $bf(a)_(j_1), ..., bf(a)_(j_k)$ of $bf(A)$ form a basis for $Col(bf(A))$. Moreover, every column of $bf(A)$ is expressed through them by the entries of the corresponding column of $bf(R)$:
  $ bf(a)_j = r_(1 j) bf(a)_(j_1) + r_(2 j) bf(a)_(j_2) + ... + r_(k j) bf(a)_(j_k), quad j = 1, ..., n. $
]

#proof[
  Denote the columns of $bf(R)$ by $bf(r)_1, ..., bf(r)_n$. The pivot column $bf(r)_(j_i)$ is the column $bf(e)_i in bb(R)^m$ of the identity matrix, so $bf(r)_(j_1), ..., bf(r)_(j_k)$ are linearly independent. Every column $bf(r)_j$ has zero entries below row $k$, so
  $ bf(r)_j = r_(1 j) bf(e)_1 + ... + r_(k j) bf(e)_k = r_(1 j) bf(r)_(j_1) + ... + r_(k j) bf(r)_(j_k). $
  Both facts are linear relations between columns of $bf(R)$, and by the preceding theorem they hold for the corresponding columns of $bf(A)$: the columns $bf(a)_(j_1), ..., bf(a)_(j_k)$ are linearly independent, and each $bf(a)_j$ is the stated combination of them. The latter shows that $Col(bf(A)) = span{bf(a)_(j_1), ..., bf(a)_(j_k)}$.
]

#remark(title: "What row operations do not preserve")[
  Row operations change the column space in general, and they do not preserve linear relations between the rows. For example,
  $ bf(A) = mat(1, 2; 2, 4) quad stretch(->)^(R_2 - 2 R_1) quad bf(B) = mat(1, 2; 0, 0), $
  but $Col(bf(A)) = span{(1, 2)^T} != span{(1, 0)^T} = Col(bf(B))$; the second row of $bf(A)$ is twice the first, while the second row of $bf(B)$ is not. This is why the basis for $Col(bf(A))$ must be taken from the columns of $bf(A)$ itself, not from those of $bf(R)$. Likewise, the rows of $bf(A)$ standing in the positions of the nonzero rows of $bf(R)$ need not form a basis for $Row(bf(A))$, because the reduction may interchange rows:
  $ mat(1, 1; 2, 2; 0, 1) quad stretch(->)^"RREF" quad mat(1, 0; 0, 1; 0, 0), $
  yet the first two rows of the matrix on the left are linearly dependent.
]

#algorithm(title: "Bases for the subspaces associated to a matrix")[
  + Reduce $bf(A)$ to its reduced row-echelon form $bf(R)$ by Gauss–Jordan elimination (Section 1.4).
  + A basis for $Row(bf(A))$: the nonzero rows of $bf(R)$.
  + A basis for $Col(bf(A))$: the columns of $bf(A)$ in the positions of the pivot columns of $bf(R)$.
  + A basis for $Null(bf(A))$: solve $bf(R) bf(x) = bf(0)$ (which has the same solutions as $bf(A) bf(x) = bf(0)$), assigning a parameter $s_i$ to each variable that corresponds to a non-pivot column of $bf(R)$, and write the general solution as $s_1 bf(v)_1 + ... + s_p bf(v)_p$. The vectors $bf(v)_1, ..., bf(v)_p$ form a basis for $Null(bf(A))$: they span it, and they are linearly independent because $bf(v)_i$ has the entry $1$ in the position of the $i$-th parameter and $0$ in the positions of the other parameters (see Homogeneous Linear Systems in Section 4.2).
]

#example(title: "Bases for the three subspaces")[
  Let
  $ bf(A) = mat(1, 2, 0, -1, 0; 2, 4, 1, 0, 0; -1, -2, 1, 3, 1; 1, 2, 1, 1, 2) quad stretch(->)^"RREF" quad bf(R) = mat(1, 2, 0, -1, 0; 0, 0, 1, 2, 0; 0, 0, 0, 0, 1; 0, 0, 0, 0, 0). $
  The pivot columns of $bf(R)$ are its columns $1$, $3$ and $5$. Hence
  $ Row(bf(A)) = span{mat(1, 2, 0, -1, 0), mat(0, 0, 1, 2, 0), mat(0, 0, 0, 0, 1)}, $
  $ Col(bf(A)) = span{bf(a)_1, bf(a)_3, bf(a)_5} = span{mat(1; 2; -1; 1), mat(0; 1; 1; 1), mat(0; 0; 1; 2)}, $
  and the vectors displayed are bases. The non-pivot columns of $bf(R)$ give the relations $bf(a)_2 = 2 bf(a)_1$ and $bf(a)_4 = -bf(a)_1 + 2 bf(a)_3$ between the columns of $bf(A)$. The columns $bf(e)_1, bf(e)_2, bf(e)_3$ of $bf(R)$ span a different subspace of $bb(R)^4$: all its vectors have last entry $0$, whereas $bf(a)_5 = (0, 0, 1, 2)^T$ does not. Finally, with the parameters $x_2 = s$ and $x_4 = t$, the system $bf(R) bf(x) = bf(0)$ gives $x_1 = -2 s + t$, $x_3 = -2 t$, $x_5 = 0$, so
  $ bf(x) = s mat(-2; 1; 0; 0; 0) + t mat(1; 0; -2; 1; 0), $
  and these two vectors form a basis for $Null(bf(A))$; thus $nullity(bf(A)) = 2$.
]

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

#subsec("Dimensions of the Column and Row Spaces", added: true) // added for MA1522: dim Col(A) = dim Row(A) via the RREF; rank from the RREF; row equivalent matrices have equal rank; rank(A) = 0 iff A = 0

The bases found in Section 4.1 show that the column space and the row space of every matrix have the same dimension, and they show how to compute it.

#theorem[
  Let $bf(R)$ be the reduced row-echelon form of a matrix $bf(A)$. Then
  $ dim(Col(bf(A))) &= "number of pivot columns of" bf(R) \
    &= "number of nonzero rows of" bf(R) = dim(Row(bf(A))). $
]

#proof[
  By the theorems of Section 4.1, the columns of $bf(A)$ in the positions of the pivot columns of $bf(R)$ form a basis for $Col(bf(A))$, and the nonzero rows of $bf(R)$ form a basis for $Row(bf(A))$. Each nonzero row of $bf(R)$ contains exactly one leading entry, and each pivot column contains exactly one leading entry; so both numbers equal the number of leading entries of $bf(R)$.
]

#indent This common dimension is the _rank_ of $bf(A)$, $rank(bf(A)) = dim(Col(bf(A))) = dim(Row(bf(A)))$ (see Matrix Rank below). Thus $rank(bf(A))$ is the number of pivot columns, or of nonzero rows, of the reduced row-echelon form of $bf(A)$; by the observation following the theorem on a basis for the row space (Section 4.1), it is also the number of nonzero rows of _any_ row-echelon form of $bf(A)$.

#corollary[
  + If $bf(A)$ and $bf(B)$ are row equivalent, then $rank(bf(A)) = rank(bf(B))$.
  + $rank(bf(A)) = 0$ if and only if $bf(A) = bf(0)$.
]

#proof[
  1. Row equivalent matrices have the same row space (Section 4.1), hence the same rank. (This is also a special case of Proposition 3 in Properties of Rank below.)
  2. $rank(bf(A)) = 0$ means $Col(bf(A)) = {bf(0)}$, that is, every column of $bf(A)$ is zero.
]

#example[
  For the $4 times 5$ matrix $bf(A)$ of the example in Section 4.1, the reduced row-echelon form has three pivot columns and three nonzero rows, so $rank(bf(A)) = 3$. Its column space is a $3$-dimensional subspace of $bb(R)^4$, and its row space a $3$-dimensional subspace of $bb(R)^5$.
]

#subsec("Matrix Rank") // Tyrtyshnikov §7.3


The dimension of the column space $Col(bf(A))$ (row space $Row(bf(A))$) of a matrix $bf(A)$ is sometimes called its column (row) rank. Since the column and row ranks coincide, it is natural to call their common value simply the _rank_ of the matrix; this is the definition used in MA1522:
$ rank(bf(A)) = dim(Col(bf(A))) = dim(Row(bf(A))). $
This value is also equal to the smallest number of matrices of the "column-by-row" form $bf(u) bf(v)^T$ whose sum yields the given matrix (this follows from the skeleton decomposition; see Tyrtyshnikov, §§7.1–7.3).

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
  is noninvertible. Such a matrix $bf(M)$, obtained from $bf(P)$ by adding one row and one column, is called a _bordering_ of $bf(P)$. By the lemma on noninvertible bordering (proved in Tyrtyshnikov, §7.4: if the submatrix $bf(P)$ of such a bordering is invertible while the bordering itself is not, then its last column is the linear combination of its first $k$ columns with the coefficients $bf(P)^(-1) bf(v)_j$, where $bf(v)_j$ consists of the first $k$ entries of that column), the last column in $bf(M)$ is a linear combination of the first $k$ columns. Moreover, the coefficients of this linear combination do not depend on $i$ (since they are determined by the vector $bf(P)^(-1) bf(v)_j$). Hence, the $j$-th column of the matrix $bf(A)$ for $j > k$ is a linear combination of the first $k$ columns. The linear independence of the first $k$ columns is proved as follows: suppose their linear combination with coefficients $alpha_1, ..., alpha_k$ is equal to $bf(0)$; then
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

#subsec("Summary of the Subspaces Associated to a Matrix", added: true) // added for MA1522: nullity = number of non-pivot columns; rank–nullity via the RREF; summary table

Let $bf(A)$ be an $m times n$ matrix with reduced row-echelon form $bf(R)$. The basis for $Null(bf(A))$ constructed in Section 4.1 contains one vector for each variable to which a parameter is assigned, that is, for each non-pivot column of $bf(R)$. Hence
$ nullity(bf(A)) = "number of non-pivot columns of" bf(R), $
and the rank–nullity theorem merely counts the columns of $bf(R)$: the $rank(bf(A))$ pivot columns and the $nullity(bf(A))$ non-pivot columns together make up all $n$ columns. The following table collects the results on the three subspaces associated to $bf(A)$.

#block(above: 0.9em, below: 0.9em, {
  set par(first-line-indent: 0pt, justify: false)
  set text(size: 9pt)
  table(
    columns: (auto, auto, 1fr, 1fr),
    stroke: (x, y) => if y == 0 { (bottom: 0.5pt + rgb("#62788f")) } else { (bottom: 0.3pt + rgb("#d6dade")) },
    inset: (x: 5pt, y: 4.5pt),
    table.header([*Subspace*], [*Subspace of*], [*Basis*], [*Dimension*]),
    [$Col(bf(A))$], [$bb(R)^m$], [the columns of $bf(A)$ in the positions of the pivot columns of $bf(R)$], [$rank(bf(A))$ = number of pivot columns of $bf(R)$],
    [$Row(bf(A))$], [$bb(R)^n$], [the nonzero rows of $bf(R)$], [$rank(bf(A))$ = number of nonzero rows of $bf(R)$],
    [$Null(bf(A))$], [$bb(R)^n$], [the vectors multiplying the parameters in the general solution of $bf(A) bf(x) = bf(0)$], [$nullity(bf(A))$ = number of non-pivot columns of $bf(R)$],
  )
})

#example[
  For the $4 times 5$ matrix $bf(A)$ of the example in Section 4.1, $Col(bf(A))$ is a subspace of $bb(R)^4$, while $Row(bf(A))$ and $Null(bf(A))$ are subspaces of $bb(R)^5$. We found $rank(bf(A)) = 3$ (pivot columns $1$, $3$, $5$) and $nullity(bf(A)) = 2$ (non-pivot columns $2$, $4$), and indeed $3 + 2 = 5$ is the number of columns of $bf(A)$.
]

#subsec("Full Rank", added: true) // added for MA1522: full rank; equivalent statements for invertibility (extended); full rank equal to the number of columns or of rows; left and right inverses

Let $bf(A)$ be an $m times n$ matrix with reduced row-echelon form $bf(R)$. Since $rank(bf(A))$ is the number of pivot columns of $bf(R)$, it is at most $n$; since it is also the number of nonzero rows of $bf(R)$, it is at most $m$. Thus $rank(bf(A)) <= min{m, n}$: the largest rank an $m times n$ matrix can have is the smaller of its two dimensions.

#definition[
  An $m times n$ matrix $bf(A)$ is of _full rank_ if $rank(bf(A)) = min{m, n}$, that is, if its rank equals the number of its rows or the number of its columns, whichever is smaller.
]

#example[
  The matrices
  $ bf(A)_1 = mat(1, 0, 0; 1, 1, 0; 0, 1, 1; 0, 0, 1), quad bf(A)_2 = mat(1, 2, 0; 0, 1, 1), quad bf(A)_3 = mat(1, 2; 2, 4) $
  have the reduced row-echelon forms
  $ mat(1, 0, 0; 0, 1, 0; 0, 0, 1; 0, 0, 0), quad mat(1, 0, -2; 0, 1, 1), quad mat(1, 2; 0, 0). $
  Thus $rank(bf(A)_1) = 3$ is the number of columns and $rank(bf(A)_2) = 2$ is the number of rows: both matrices are of full rank. The square matrix $bf(A)_3$ has rank $1 < 2$ and is not of full rank; neither is the $4 times 5$ matrix of the example in Section 4.1, whose rank is $3 < 4$.
]

#indent For a square matrix of order $n$, full rank means $rank(bf(A)) = n$. This is one more condition equivalent to invertibility, and we add it, together with a condition on the nullity, to the equivalent statements for invertibility collected in Sections 2.6 and 3.6.

#theorem(title: "Equivalent statements for invertibility")[
  Let $bf(A)$ be a square matrix of order $n$. The following statements are equivalent.
  #[
    #set enum(numbering: "(i)")
    + $bf(A)$ is invertible.
    + $bf(A)^T$ is invertible.
    + (left inverse) There is a matrix $bf(B)$ such that $bf(B) bf(A) = bf(I)$.
    + (right inverse) There is a matrix $bf(B)$ such that $bf(A) bf(B) = bf(I)$.
    + The reduced row-echelon form of $bf(A)$ is the identity matrix.
    + $bf(A)$ can be expressed as a product of elementary matrices.
    + The homogeneous system $bf(A) bf(x) = bf(0)$ has only the trivial solution.
    + For every $bf(b) in bb(R)^n$, the system $bf(A) bf(x) = bf(b)$ has a unique solution.
    + The determinant of $bf(A)$ is nonzero, $det(bf(A)) != 0$.
    + The columns of $bf(A)$ are linearly independent; the rows of $bf(A)$ are linearly independent.
    + The columns of $bf(A)$ span $bb(R)^n$; the rows of $bf(A)$ span $bb(R)^n$.
    + $rank(bf(A)) = n$, that is, $bf(A)$ is of full rank.
    + $nullity(bf(A)) = 0$.
  ]
  In (x) and (xi), the statement about the columns and the statement about the rows are each equivalent to all the other statements.
]

#proof[
  The equivalence of (i)–(ix) is established in Section 2.6. We show that each of the remaining statements is equivalent to (xii), and that (xii) is equivalent to (vii). Recall that $rank(bf(A)) = dim(Col(bf(A))) = dim(Row(bf(A)))$, where $Col(bf(A))$ is spanned by the $n$ columns and $Row(bf(A))$ by the $n$ rows of $bf(A)$, both subspaces of $bb(R)^n$. For any $n$ vectors $bf(u)_1, ..., bf(u)_n in bb(R)^n$ with span $V$, we have:
  - $bf(u)_1, ..., bf(u)_n$ are linearly independent if and only if $dim(V) = n$, since a maximal linearly independent subsystem of them is a basis for $V$ (Section 3.6);
  - $V = bb(R)^n$ if and only if $dim(V) = n$. Indeed, $dim(bb(R)^n) = n$; conversely, if $dim(V) = n$, a basis for $V$ is a linearly independent set in $bb(R)^n$, so by the Basis Extension Lemma (Section 3.7) it is part of a basis for $bb(R)^n$; as every basis for $bb(R)^n$ has $n$ vectors (Section 3.6), it is itself a basis for $bb(R)^n$, and $V = bb(R)^n$.
  Applied to the columns and to the rows of $bf(A)$, these two facts give (x) $<=>$ (xii) and (xi) $<=>$ (xii). Next, (vii) says that $Null(bf(A)) = {bf(0)}$, which holds if and only if $nullity(bf(A)) = 0$; thus (vii) $<=>$ (xiii). Finally, (xii) $<=>$ (xiii) by the rank–nullity theorem $rank(bf(A)) + nullity(bf(A)) = n$.
]

#indent When $bf(A)$ is not square, a matrix of full rank satisfies either $rank(bf(A)) = n < m$ or $rank(bf(A)) = m < n$, and in each case part of the list above survives. A _left inverse_ of an $m times n$ matrix $bf(A)$ is an $n times m$ matrix $bf(B)$ with $bf(B) bf(A) = bf(I)_n$; a _right inverse_ is an $n times m$ matrix $bf(C)$ with $bf(A) bf(C) = bf(I)_m$.

#lemma[
  For every $m times n$ matrix $bf(A)$, $Null(bf(A)) = Null(bf(A)^T bf(A))$.
]

#proof[
  If $bf(A) bf(u) = bf(0)$, then $bf(A)^T bf(A) bf(u) = bf(A)^T bf(0) = bf(0)$; hence $Null(bf(A)) subset.eq Null(bf(A)^T bf(A))$. Conversely, let $bf(A)^T bf(A) bf(u) = bf(0)$. Then
  $ norm(bf(A) bf(u))^2 = (bf(A) bf(u)) dot (bf(A) bf(u)) = (bf(A) bf(u))^T (bf(A) bf(u)) = bf(u)^T (bf(A)^T bf(A) bf(u)) = bf(u)^T bf(0) = 0, $
  so $bf(A) bf(u) = bf(0)$. Hence $Null(bf(A)^T bf(A)) subset.eq Null(bf(A))$.
]

#theorem(title: "Full rank equal to the number of columns")[
  Let $bf(A)$ be an $m times n$ matrix. The following statements are equivalent.
  #[
    #set enum(numbering: "(i)")
    + $rank(bf(A)) = n$, that is, $bf(A)$ is of full rank and its rank equals the number of its columns.
    + The rows of $bf(A)$ span $bb(R)^n$, that is, $Row(bf(A)) = bb(R)^n$.
    + The columns of $bf(A)$ are linearly independent.
    + The homogeneous system $bf(A) bf(x) = bf(0)$ has only the trivial solution, that is, $Null(bf(A)) = {bf(0)}$.
    + $bf(A)^T bf(A)$ is an invertible matrix of order $n$.
    + $bf(A)$ has a left inverse.
  ]
]

#proof[
  (i) $<=>$ (ii): $Row(bf(A))$ is a subspace of $bb(R)^n$ of dimension $rank(bf(A))$, and a subspace of $bb(R)^n$ coincides with $bb(R)^n$ if and only if its dimension is $n$ (see the proof of the preceding theorem).

  (i) $<=>$ (iii): $rank(bf(A))$ is the dimension of the span of the $n$ columns of $bf(A)$, and it equals $n$ if and only if these columns are linearly independent (ibid.).

  (iii) $<=>$ (iv): if $bf(a)_1, ..., bf(a)_n$ are the columns of $bf(A)$ and $bf(c) = (c_1, ..., c_n)^T$, then $c_1 bf(a)_1 + ... + c_n bf(a)_n = bf(A) bf(c)$.

  (iv) $=>$ (v): by the lemma, $Null(bf(A)^T bf(A)) = Null(bf(A)) = {bf(0)}$, so the square matrix $bf(A)^T bf(A)$ of order $n$ is invertible by the equivalent statements for invertibility.

  (v) $=>$ (vi): put $bf(B) = (bf(A)^T bf(A))^(-1) bf(A)^T$. Then $bf(B)$ is a left inverse of $bf(A)$, since $bf(B) bf(A) = (bf(A)^T bf(A))^(-1) (bf(A)^T bf(A)) = bf(I)_n$.

  (vi) $=>$ (i): if $bf(B) bf(A) = bf(I)_n$, then by Proposition 2 of Properties of Rank, $n = rank(bf(I)_n) = rank(bf(B) bf(A)) <= rank(bf(A)) <= n$.
]

#example(title: "A left inverse")[
  The matrix $bf(A)_1$ of the example above has rank $3$, the number of its columns. Accordingly,
  $ bf(A)_1^T bf(A)_1 = mat(2, 1, 0; 1, 2, 1; 0, 1, 2), quad (bf(A)_1^T bf(A)_1)^(-1) = 1/4 mat(3, -2, 1; -2, 4, -2; 1, -2, 3), $
  and the matrix
  $ bf(L) = (bf(A)_1^T bf(A)_1)^(-1) bf(A)_1^T = 1/4 mat(3, 1, -1, 1; -2, 2, 2, -2; 1, -1, 1, 3) $
  satisfies $bf(L) bf(A)_1 = bf(I)_3$, as is checked directly.
]

#theorem(title: "Full rank equal to the number of rows")[
  Let $bf(A)$ be an $m times n$ matrix. The following statements are equivalent.
  #[
    #set enum(numbering: "(i)")
    + $rank(bf(A)) = m$, that is, $bf(A)$ is of full rank and its rank equals the number of its rows.
    + The columns of $bf(A)$ span $bb(R)^m$, that is, $Col(bf(A)) = bb(R)^m$.
    + The rows of $bf(A)$ are linearly independent.
    + The linear system $bf(A) bf(x) = bf(b)$ is consistent for every $bf(b) in bb(R)^m$.
    + $bf(A) bf(A)^T$ is an invertible matrix of order $m$.
    + $bf(A)$ has a right inverse.
  ]
]

#proof[
  Apply the preceding theorem to the $n times m$ matrix $bf(A)^T$, which has $m$ columns. Here $rank(bf(A)^T) = rank(bf(A))$; the rows of $bf(A)^T$ are the transposed columns of $bf(A)$, so $Row(bf(A)^T) = bb(R)^m$ means $Col(bf(A)) = bb(R)^m$; the columns of $bf(A)^T$ are the transposed rows of $bf(A)$; $(bf(A)^T)^T bf(A)^T = bf(A) bf(A)^T$; and $bf(C) bf(A)^T = bf(I)_m$ if and only if $bf(A) bf(C)^T = bf(I)_m$, so $bf(A)^T$ has a left inverse if and only if $bf(A)$ has a right inverse. This proves that (i), (ii), (iii), (v) and (vi) are equivalent. Finally, (ii) $<=>$ (iv), because the system $bf(A) bf(x) = bf(b)$ is consistent exactly when $bf(b) in Col(bf(A))$ (Section 4.1).
]

#indent Transposing the left inverse $(bf(A) bf(A)^T)^(-1) bf(A)$ of $bf(A)^T$ given by the proof, we obtain an explicit right inverse of $bf(A)$: $bf(A)^T (bf(A) bf(A)^T)^(-1)$. Indeed, $bf(A) bf(A)^T (bf(A) bf(A)^T)^(-1) = bf(I)_m$.

#example(title: "A right inverse")[
  The matrix $bf(A)_2$ of the example above has rank $2$, the number of its rows. Here
  $ bf(A)_2 bf(A)_2^T = mat(5, 2; 2, 2), quad (bf(A)_2 bf(A)_2^T)^(-1) = 1/6 mat(2, -2; -2, 5), $
  and
  $ bf(A)_2^T (bf(A)_2 bf(A)_2^T)^(-1) = 1/6 mat(2, -2; 2, 1; -2, 5) $
  is a right inverse of $bf(A)_2$: multiplying $bf(A)_2$ by it gives $bf(I)_2$.
]

#remark(title: "A left inverse does not produce solutions")[
  Let $rank(bf(A)) = n < m$, and let $bf(L)$ be a left inverse of $bf(A)$. If the system $bf(A) bf(x) = bf(b)$ is consistent, then its solution is unique (as $Null(bf(A)) = {bf(0)}$; see General Solution of a Linear System above), and multiplying $bf(A) bf(x) = bf(b)$ on the left by $bf(L)$ shows that this solution is $bf(x) = bf(L) bf(b)$. The argument presupposes that a solution exists; it does not make $bf(L) bf(b)$ a solution for every $bf(b)$, and it cannot, since by the last theorem ($rank(bf(A)) = n < m$) the system is inconsistent for some $bf(b) in bb(R)^m$. For the matrix $bf(A)_1$ and its left inverse $bf(L)$ above, $bf(b) = (1, 3, 1, -1)^T$ gives $bf(L) bf(b) = (1, 2, -1)^T$, and indeed $bf(A)_1 (1, 2, -1)^T = bf(b)$; but $bf(L) bf(e)_1 = (3\/4, -1\/2, 1\/4)^T$, while $bf(A)_1 bf(L) bf(e)_1 = (3\/4, 1\/4, -1\/4, 1\/4)^T != bf(e)_1$, so the system $bf(A)_1 bf(x) = bf(e)_1$ is inconsistent. Note also that a matrix with both a left and a right inverse has $rank(bf(A)) = n$ and $rank(bf(A)) = m$, so it must be square.
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
