#import "common.typ": *

#chapter("Chapter 1. Linear Systems")

#sec("1.1", "Introduction to Linear Systems")

#subsec("Linear Systems") // Tyrtyshnikov §3.1


A system of equations of the form
#eq(
  $ cases(
    a_(1 1) x_1 + ... + a_(1 k) x_k = b_1\,,
    dots.h.c,
    a_(n 1) x_1 + ... + a_(n k) x_k = b_n
  ) $,
  $(1)$
)
in the variables (unknowns) $x_1, ..., x_k$ is called a _system of linear equations_, or a _linear system_. Using matrix notation (see Section 2.3), it can be written in the form
$ bf(A) bf(x) = bf(b), quad
  bf(A) = mat(
    a_(1 1), ..., a_(1 k);
    dots.v, dots.v, dots.v;
    a_(n 1), ..., a_(n k)
  ), quad
  bf(x) = mat(x_1; dots.v; x_k), quad
  bf(b) = mat(b_1; dots.v; b_n). $

#indent We denote the set of matrices of size $n times k$ with entries $a_(i j) in bb(R)$, where $bb(R)$ is the set of real numbers, by $bb(R)^(n times k)$. In accordance with this notation, $bb(R)^(n times 1)$ and $bb(R)^(k times 1)$ are the sets of column matrices having $n$ and $k$ entries, respectively. For brevity we shall write $bb(R)^n = bb(R)^(n times 1)$ and $bb(R)^k = bb(R)^(k times 1)$ and call column matrices _vectors_.

The matrix $bf(A) in bb(R)^(n times k)$ is called the _coefficient matrix_, the vector $bf(b) in bb(R)^n$ is called the _constant vector_ (the right-hand side), and a vector $bf(x) in bb(R)^k$ is called a _solution_ of the system $(1)$.

#sec("1.2", "Solving a Linear System and Row-Echelon Form")

#subsec("Row-Echelon Form") // Tyrtyshnikov §8.3


We shall say that a matrix $bf(S) = (s_(i j))_(m times n)$ is in _row-echelon form_ (REF) with $k$ nonzero rows if there exist indices $1 <= j_1 < ... < j_k <= n$ for which:
- if $1 <= i <= k$, then $s_(i j) != 0$ for $j = j_i$ and $s_(i j) = 0$ for all $1 <= j <= j_i - 1$;
- if $k + 1 <= i <= m$, then $s_(i j) = 0$ for all $1 <= j <= n$.

#indent Thus the first $k$ rows of $bf(S)$ are its nonzero rows and the zero rows are at the bottom; the entry $s_(i j_i)$ is the _leading entry_ of the $i$-th row, and the columns with indices $j_1, ..., j_k$ are the _pivot columns_ of $bf(S)$. A matrix $bf(S)$ is said to be in _column-echelon form_ with $k$ nonzero columns if $bf(S)^T$ is in row-echelon form with $k$ nonzero rows.

#proposition[
  If a matrix $bf(S)$ is in row-echelon form with $k$ nonzero rows, or in column-echelon form with $k$ nonzero columns, then $rank(bf(S)) = k$.
]

#proof[
  Recall that $rank(bf(S)) = dim(Row(bf(S))) = dim(Col(bf(S)))$ (see Section 4.2). Consider a matrix $bf(S)$ in row-echelon form and let us prove that the dimension of its row space $Row(bf(S))$ (the span of the rows) is equal to the number $k$ of nonzero rows. The zero rows of $bf(S)$ do not contribute to $Row(bf(S))$, so we do not lose generality by assuming that $k = m$. Let us prove that the rows of $bf(S)$ are linearly independent. Set their linear combination with coefficients $alpha_1, ..., alpha_k$ equal to zero:
  $ mat(alpha_1, alpha_2, dots.c, alpha_k) bf(S) = mat(0, 0, dots.c, 0). $
  From this,
  $ alpha_1 s_(1 j_1) = 0 quad => quad alpha_1 = 0. $
  Next,
  $ 0 dot s_(1 j_2) + alpha_2 s_(2 j_2) = 0 quad => quad alpha_2 = 0. $
  Continuing in a similar manner, we find $alpha_1 = ... = alpha_k = 0$. In the case of a matrix $bf(S)$ in column-echelon form, $dim(Col(bf(S)))$ obviously coincides with $dim(Row(bf(S)^T))$, where $bf(S)^T$ is in row-echelon form.
]

#sec("1.3", "Elementary Row Operations")

#subsec("Elementary Row Operations in Matrix Form") // Tyrtyshnikov §8.2


Each step of the elimination of unknowns (Gaussian elimination, described in Section 1.4) transforms a linear system $bf(A) bf(x) = bf(b)$ into an equivalent system of the form $(bf(P) bf(A)) bf(x) = bf(P) bf(b)$, where $bf(P)$ is some invertible matrix. If $k$ steps were required, then as a result a sequence of equivalent systems arises:
$ bf(A) bf(x) = bf(b), quad (bf(P)_1 bf(A)) bf(x) = bf(P)_1 bf(b), quad (bf(P)_2 bf(P)_1 bf(A)) bf(x) = bf(P)_2 bf(P)_1 bf(b), quad ..., \
..., quad (bf(P)_k ... bf(P)_2 bf(P)_1 bf(A)) bf(x) = bf(P)_k ... bf(P)_2 bf(P)_1 bf(b). $
The coefficient matrix of the last system has such a simple form that solving the corresponding system is carried out in an obvious way.

The goal of each step is to obtain additional zeros, or, as is often said, the _elimination of entries_ in the matrix of the transformed system. To explain how this is done, consider a matrix $bf(A)$ of size $4 times 6$; entries known to be zero will be denoted by a "zero," arbitrary entries by a "cross," and entries known to be nonzero by a "boxed cross." If $a_(1 1) != 0$, then from each row with index $i > 1$ we can subtract the first row with a coefficient yielding zero in position $(i, 1)$ (the elementary row operations $R_i + c_i R_1$ with $c_i = -a_(i 1) \/ a_(1 1)$, $i = 2, 3, 4$):
$ mat(
  times.square, times, times, times, times, times;
  times, times, times, times, times, times;
  times, times, times, times, times, times;
  times, times, times, times, times, times
) |-> mat(
  times.square, times, times, times, times, times;
  0, times, times, times, times, times;
  0, times, times, times, times, times;
  0, times, times, times, times, times
). $
Thereafter the first row and column remain unchanged. If in the second column there is a nonzero entry, we make the corresponding row the second row (a row interchange $R_2 <-> R_i$) and use it to eliminate all the remaining entries of the second column (the operations $R_i + c_i R_2$, $i = 3, 4$):
$ mat(
  times.square, times, times, times, times, times;
  0, times.square, times, times, times, times;
  0, times, times, times, times, times;
  0, times, times, times, times, times
) |-> mat(
  times.square, times, times, times, times, times;
  0, times.square, times, times, times, times;
  0, 0, times, times, times, times;
  0, 0, times, times, times, times
). $
The first two columns and the first two rows will no longer change. It may happen that we obtain "unscheduled" zero columns. For instance, if the remaining "crosses" in the third and fourth columns turn out to be zeros, then elimination should be carried out using a nonzero entry in the fifth column (if there is one):
$ mat(
  times.square, times, times, times, times, times;
  0, times.square, times, times, times, times;
  0, 0, 0, 0, times.square, times;
  0, 0, 0, 0, times, times
) |-> mat(
  times.square, times, times, times, times, times;
  0, times.square, times, times, times, times;
  0, 0, 0, 0, times.square, times;
  0, 0, 0, 0, 0, times
). $
Each step obviously reduces to multiplying the matrix on the left by some matrix $bf(P)_l$. Moreover, each of the matrices $bf(P)_l$, $1 <= l <= k$, can be represented as the product of two matrices:
$ bf(P)_l = bf(Z)_l bf(Pi)_l, $
where $bf(Z)_l$ differs from $bf(I)$ (the identity matrix) only in the positions below the main diagonal of some single (say, the $j$-th) column:
$ bf(Z)_l = mat(
  1, , , , ;
  , dots.down, , , ;
  , , 1, , ;
  , , (bf(Z)_l)_(j+1, j), dots.down, ;
  , , dots.v, , ;
  , , (bf(Z)_l)_(n j), , 1
), $
and $bf(Pi)_l$ is obtained from $bf(I)$ by a permutation of columns (or rows). The matrix $bf(Pi)_l$ is called a _permutation matrix_, and $bf(Z)_l$ a _row modification matrix_. Both are products of elementary matrices (matrices obtained from $bf(I)$ by a single elementary row operation): $bf(Pi)_l$ of elementary matrices corresponding to row interchanges $R_i <-> R_j$, and $bf(Z)_l$ of those corresponding to the operations $R_i + (bf(Z)_l)_(i j) R_j$, $i = j + 1, ..., n$. Their role in the elimination process is explained by the following facts:
- the matrix $bf(Pi)_l bf(A)$ differs from $bf(A)$ by a permutation of rows;
- if $bf(Z)_l$ differs from the identity matrix in the $j$-th column, then the matrix $bf(Z)_l bf(A)$ has the same first $j$ rows as the matrix $bf(A)$, while the $i$-th row for $i > j$ is the sum of the $i$-th row and the $j$-th row of the matrix $bf(A)$ taken with some coefficient (namely $(bf(Z)_l)_(i j)$: the operation $R_i + (bf(Z)_l)_(i j) R_j$).

#proposition(title: "1")[
  Any permutation matrix $bf(Pi)$ is invertible and, moreover,
  $ bf(Pi)^(-1) = bf(Pi)^T. $
]

#proposition(title: "2")[
  Any row modification matrix $bf(Z) = bf(Z)_l$ is invertible and, moreover, the inverse matrix is obtained from $bf(Z)$ by changing the signs of the subdiagonal entries:
  $ bf(Z)^(-1) = mat(
    1, , , , ;
    , dots.down, , , ;
    , , 1, , ;
    , , -(bf(Z)_l)_(j+1, j), dots.down, ;
    , , dots.v, , ;
    , , -(bf(Z)_l)_(n j), , 1
  ). $
]

#indent The proof reduces to a direct verification of the equalities $bf(Pi) bf(Pi)^(-1) = bf(I)$, $bf(Z) bf(Z)^(-1) = bf(I)$. (Proposition 2 expresses the fact that the operations $R_i + c R_j$ are reversed by the operations $R_i - c R_j$.)

#sec("1.4", "Row Reduction, Gaussian and Gauss–Jordan Elimination")

#subsec("Gaussian Elimination") // Tyrtyshnikov §8.1


If a linear system $bf(A) bf(x) = bf(b)$ is given and one is required to find its general solution or establish its inconsistency, this is most conveniently done by _successive elimination of unknowns_ (_Gaussian elimination_): if in some equation the coefficient of $x_1$ is nonzero, then one can eliminate $x_1$ from all the other equations by subtracting this equation, previously multiplied by suitably chosen coefficients; if among the equations that no longer contain $x_1$ there is an equation with a nonzero coefficient of $x_2$, then $x_2$ can be eliminated in a similar manner from all the other equations except the given one and the first equation containing $x_1$, and so on.

At each step of elimination, one obtains a new system that is obviously equivalent to the original one: in terms of the augmented matrix $(bf(A) | bf(b))$, each step consists of elementary row operations $R_i + c R_j$ (and row interchanges $R_i <-> R_j$ if the equations are reordered), so the new augmented matrix is row equivalent to $(bf(A) | bf(b))$. If an equation arises in which all the coefficients of the unknowns are equal to zero while the right-hand side is a nonzero number, then the system has no solutions (in a row-echelon form of $(bf(A) | bf(b))$, the last column is then a pivot column). Otherwise, the system is consistent, and the method described allows one to write out its general solution with ease (by back substitution, with the variables corresponding to the non-pivot columns as parameters).

#subsec("Reduction to Row-Echelon Form") // Tyrtyshnikov §8.4


#theorem(title: "1")[
  For any $m times n$ matrix $bf(A)$ of rank $r$, there exists an invertible matrix $bf(P)$ representable as a product of a finite number of permutation and row modification matrices such that the matrix $bf(S) = bf(P) bf(A)$ is in row-echelon form with $r$ nonzero rows.
]

#proof[
  We follow the steps of Gaussian elimination. Denote by $j_1$ the index of the first column of the matrix $bf(A)$ in which there is at least one nonzero entry. (If no such column exists, then $bf(A) = bf(0)$ and the theorem is already proved.) By multiplying on the left by some permutation matrix $bf(Pi)_1$ (a row interchange $R_1 <-> R_i$, if necessary), a nonzero entry can be moved to position $(1, j_1)$. Next, by multiplying on the left by some
  row modification matrix $bf(Z)_1$ (the operations $R_i + c_i R_1$, $i = 2, ..., m$), one can obtain a matrix with zeros in the subdiagonal positions of the $j_1$-th column while preserving the zeros in the preceding columns. Obviously, the transformed matrix has the block form (by $bf(0)_(p times q)$ we denote the zero block of size $p times q$):
  $ bf(Z)_1 bf(Pi)_1 bf(A) = mat(bf(0)_(1 times (j_1 - 1)), bf(u)^T; bf(0)_((m - 1) times (j_1 - 1)), bf(B)), quad bf(u) in bb(R)^((n - j_1 + 1) times 1). $
  Let us make the inductive hypothesis that there exists a matrix $bf(Q)$ which is a product of permutation and row modification matrices of order $m - 1$ and is such that $bf(Q) bf(B)$ is in row-echelon form. Consider the matrix
  $ bf(P) = mat(1, bf(0); bf(0), bf(Q)) bf(Z)_1 bf(Pi)_1. $
  It is easy to see that $bf(P)$ is a product of permutation and row modification matrices and, moreover, $bf(S) = bf(P) bf(A)$ is in row-echelon form. Let the number of nonzero rows be equal to $k$. This means that $dim(Row(bf(S))) = k => k = rank(bf(S)) = rank(bf(A)) = r$.
]

#theorem(title: "2")[
  For any $m times n$ matrix $bf(A)$ of rank $r$, there exists an invertible matrix $bf(Q)$ representable as a product of a finite number of permutation and row modification matrices such that the matrix $bf(A) bf(Q)^T$ is in column-echelon form with $r$ nonzero columns.
]

#proof[
  It suffices to apply Theorem 1 to the matrix $bf(A)^T$ and note that if the matrix $bf(Q) bf(A)^T$ is in row-echelon form, then the matrix $(bf(Q) bf(A)^T)^T = bf(A) bf(Q)^T$ will be in column-echelon form.
]

#subsec("Reduction to Diagonal Form", beyond: true) // Tyrtyshnikov §8.5


#theorem[
  For any $m times n$ matrix $bf(A)$ of rank $r$, there exist invertible matrices $bf(P)$ and $bf(Q)$ representable as a product of a finite number of permutation and row modification matrices such that the matrix $bf(B) = bf(P) bf(A) bf(Q)^T$ has nonzero entries $b_(1 1), ..., b_(r r)$, while all its other entries are equal to zero.
]

#proof[
  First we reduce $bf(A)$ to row-echelon form $bf(S) = bf(P) bf(A)$, and then note that the column-echelon form $bf(S) bf(Q)^T$, obtained according to the constructions of Theorem 2, will have the required diagonal form.
]

#remark[
  Gauss–Jordan elimination uses elementary row operations only and reduces $bf(A)$ to its reduced row-echelon form (RREF), which in general is not diagonal. The diagonal form $bf(B)$ also requires operations on the columns of $bf(A)$; these are performed by the factor $bf(Q)^T$ on the right.
]

#sec("1.5", "More on Linear Systems")

#subsec("Consistency of a Linear System") // Tyrtyshnikov §3.10


#theorem(title: "1")[
  A linear system $bf(A) bf(x) = bf(b)$, $bf(A) = display(mat(bf(a)_1, bf(a)_2, dots.c, bf(a)_k))$, is consistent if and only if
  $ span{bf(a)_1, ..., bf(a)_k} = span{bf(a)_1, ..., bf(a)_k, bf(b)}. $
]

#proof[
  In any case we have
  #eq($ span{bf(a)_1, ..., bf(a)_k} subset.eq span{bf(a)_1, ..., bf(a)_k, bf(b)}. $, $(*)$)
  If the system is consistent, then $bf(b) in span{bf(a)_1, ..., bf(a)_k}$. Consequently,
  #eq($ span{bf(a)_1, ..., bf(a)_k, bf(b)} subset.eq span{bf(a)_1, ..., bf(a)_k}. $, $(**)$)
  The inclusions $(*)$ and $(**)$ prove the equality of the two spans. If $(**)$ holds, then it is obvious that $bf(b) in span{bf(a)_1, ..., bf(a)_k}$, and this is precisely what the consistency of the system $bf(A) bf(x) = bf(b)$ means.
]

#theorem(title: "2")[
  If $n = k$, then when the vectors $bf(a)_1, ..., bf(a)_n$ are linearly independent, the linear system $bf(A) bf(x) = bf(b)$ is consistent and has a unique solution.
]

#proof[
  It is obvious that
  $ bf(a)_1, ..., bf(a)_n in span{bf(e)_1, ..., bf(e)_n}, $
  where $bf(e)_1, ..., bf(e)_n$ are the columns of the identity matrix $bf(I)_n$ (in the vector $bf(e)_i$, the $i$-th entry is $1$, and all other entries are equal to $0$). By the Basis Extension Lemma (Section 3.7), there exists a basis of $r >= n$ vectors containing the vectors $bf(a)_1, ..., bf(a)_n$. By the theorem on the dimension of a linear span (Section 3.6), $r <= n$. For the same reason, the vectors $bf(a)_1, ..., bf(a)_n$ form a basis in $span{bf(a)_1, ..., bf(a)_n, bf(b)}$. Therefore $bf(b) in span{bf(a)_1, ..., bf(a)_n}$, which proves the consistency of the system. The uniqueness of the solution follows from Lemma 3 (Section 3.5).
]

#problem(number: 1)[
  A linear system of the form
  $ mat(a_0, a_1, a_2; a_1, a_0, a_1; a_2, a_1, a_0) mat(x_1; x_2; x_3) = mat(1; 0; 0) $
  has a solution with $x_1 != 0$. Prove that the columns of the coefficient matrix are linearly independent.
]
