#import "common.typ": *
#let rowto = math.stretch(sym.arrow.r, size: 100% + 0.8em) // arrow labelled by row operations

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

#subsec("Notation and Special Types of Matrices", added: true) // added for MA1522: matrix, entries, (i, j)-entry, size; vectors, zero, square, diagonal, scalar, identity, triangular and symmetric matrices

A (real) $m times n$ matrix is a rectangular array of real numbers with $m$ rows and $n$ columns; $m times n$ (read "$m$ by $n$") is its _size_. The numbers in the array are the _entries_ of the matrix, and the number $a_(i j)$ standing in the $i$-th row and the $j$-th column is its _$(i, j)$-entry_. We write
$ bf(A) = (a_(i j))_(m times n) = mat(
  a_(1 1), a_(1 2), dots.c, a_(1 n);
  a_(2 1), a_(2 2), dots.c, a_(2 n);
  dots.v, dots.v, dots.down, dots.v;
  a_(m 1), a_(m 2), dots.c, a_(m n)
), $
and $bf(A) = (a_(i j))_n$ for a square matrix of order $n$. If the two indices could be confused, they are separated by a comma: $a_(1, 23)$ and $a_(12, 3)$ are different entries. A matrix may be specified by a rule for its entries; for example, the $2 times 3$ matrix with $a_(i j) = 2 i - j$ is
$ bf(A) = mat(1, 0, -1; 3, 2, 1). $

#definition[
  - An $n times 1$ matrix is a _column vector_, and a $1 times n$ matrix is a _row vector_. A vector is understood to be a column vector unless stated otherwise.
  - The _zero matrix_ $bf(0)_(m times n)$ is the $m times n$ matrix all of whose entries are $0$; it need not be square.
  - In a square matrix $bf(A) = (a_(i j))_n$ the entries $a_(1 1), a_(2 2), ..., a_(n n)$ are the _diagonal entries_; they form the _main diagonal_.
  - A square matrix $bf(D) = (a_(i j))_n$ is _diagonal_ if $a_(i j) = 0$ whenever $i != j$. With $d_i = a_(i i)$ we write $bf(D) = diag(d_1, d_2, ..., d_n)$.
  - A diagonal matrix with all diagonal entries equal, $diag(c, c, ..., c)$, is a _scalar matrix_. The scalar matrix with $c = 1$ is the _identity matrix_ $bf(I)_n = diag(1, 1, ..., 1)$, also written $bf(I)$. Using scalar multiplication (Section 2.2), a scalar matrix is $c bf(I)_n$.
  - A square matrix $bf(A) = (a_(i j))_n$ is _upper triangular_ if $a_(i j) = 0$ for all $i > j$ (all entries below the main diagonal vanish), and _strictly upper triangular_ if $a_(i j) = 0$ for all $i >= j$. It is _lower triangular_ if $a_(i j) = 0$ for all $i < j$, and _strictly lower triangular_ if $a_(i j) = 0$ for all $i <= j$. Upper and lower triangular matrices are called _triangular_.
  - A square matrix $bf(A) = (a_(i j))_n$ is _symmetric_ if $a_(i j) = a_(j i)$ for all $i$ and $j$, that is, if its entries are symmetric about the main diagonal.
]

#example[
  The matrices
  $ mat(3, 0, 0; 0, -1, 0; 0, 0, 0), quad mat(2, 5, -1; 0, 0, 4; 0, 0, 7), quad mat(1, 4, -2; 4, 0, 5; -2, 5, 3) $
  are diagonal (namely $diag(3, -1, 0)$), upper triangular, and symmetric, respectively. The zero matrix $bf(0)_(n times n)$ is diagonal, and scalar with $c = 0$, but it is not an identity matrix. A matrix that is both symmetric and upper triangular is diagonal.
]

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

#subsec("Equality and the Laws of Matrix Arithmetic", added: true) // added for MA1522: equality of matrices, negative and difference, properties of addition and scalar multiplication, properties of multiplication, zero divisors (with the proofs from the Appendix)

Matrices $bf(A) = (a_(i j))_(m times n)$ and $bf(B) = (b_(i j))_(k times l)$ are _equal_, $bf(A) = bf(B)$, if they have the same size ($m = k$, $n = l$) and $a_(i j) = b_(i j)$ for all $i, j$. Matrices of different sizes are never equal, and matrix addition is defined only for matrices of the same size. The _negative_ of $bf(A)$ is $-bf(A) = (-1) bf(A)$, and the _difference_ of matrices of the same size is $bf(A) - bf(B) = bf(A) + (-1) bf(B)$.

#theorem[
  Let $bf(A)$, $bf(B)$, $bf(C)$ be $m times n$ matrices and $alpha, beta in bb(R)$. Then:
  #[
    #set enum(numbering: "(i)")
    + $bf(A) + bf(B) = bf(B) + bf(A)$ (commutativity);
    + $bf(A) + (bf(B) + bf(C)) = (bf(A) + bf(B)) + bf(C)$ (associativity);
    + $bf(0)_(m times n) + bf(A) = bf(A)$ (additive identity);
    + $bf(A) + (-bf(A)) = bf(0)_(m times n)$ (additive inverse);
    + $alpha(bf(A) + bf(B)) = alpha bf(A) + alpha bf(B)$ (distributive law);
    + $(alpha + beta) bf(A) = alpha bf(A) + beta bf(A)$;
    + $(alpha beta) bf(A) = alpha(beta bf(A))$;
    + if $alpha bf(A) = bf(0)_(m times n)$, then $alpha = 0$ or $bf(A) = bf(0)_(m times n)$.
  ]
]

#proof[
  Both operations act entrywise, so each identity reduces to the corresponding law for real numbers applied to the $(i, j)$-entries. For instance, the $(i, j)$-entry of $alpha(bf(A) + bf(B))$ is $alpha(a_(i j) + b_(i j)) = alpha a_(i j) + alpha b_(i j)$, which is the $(i, j)$-entry of $alpha bf(A) + alpha bf(B)$; and the $(i, j)$-entry of $(alpha beta) bf(A)$ is $(alpha beta) a_(i j) = alpha(beta a_(i j))$. For (viii): if $alpha a_(i j) = 0$ for all $i, j$ and $alpha != 0$, then all $a_(i j) = 0$.
]

#indent By associativity, a sum $bf(A)_1 + bf(A)_2 + dots.c + bf(A)_k$ of matrices of the same size needs no brackets. In a product $bf(A) bf(B)$ we say that $bf(A)$ _pre-multiplies_ $bf(B)$ (is multiplied on the left) and $bf(B)$ _post-multiplies_ $bf(A)$; since $bf(A) bf(B) != bf(B) bf(A)$ in general, the side matters.

#theorem[
  Let $alpha in bb(R)$, and let the matrices have sizes for which the operations below are defined. Then:
  #[
    #set enum(numbering: "(i)")
    + $(bf(A) bf(B)) bf(C) = bf(A)(bf(B) bf(C))$ (associativity);
    + $bf(A)(bf(B) + bf(C)) = bf(A) bf(B) + bf(A) bf(C)$ (left distributive law);
    + $(bf(A) + bf(B)) bf(C) = bf(A) bf(C) + bf(B) bf(C)$ (right distributive law);
    + $alpha(bf(A) bf(B)) = (alpha bf(A)) bf(B) = bf(A)(alpha bf(B))$;
    + $bf(I)_m bf(A) = bf(A) = bf(A) bf(I)_n$ for every $m times n$ matrix $bf(A)$ (multiplicative identity);
    + there exist matrices $bf(A) != bf(0)_(m times p)$ and $bf(B) != bf(0)_(p times n)$ with $bf(A) bf(B) = bf(0)_(m times n)$ (zero divisors);
    + $bf(A) bf(0)_(n times p) = bf(0)_(m times p)$ and $bf(0)_(p times m) bf(A) = bf(0)_(p times n)$ for every $m times n$ matrix $bf(A)$.
  ]
]

#proof[
  Property (i) is the theorem on associativity proved above. For (ii), the $(i, j)$-entry of $bf(A)(bf(B) + bf(C))$ is
  $ sum_k a_(i k)(b_(k j) + c_(k j)) = sum_k a_(i k) b_(k j) + sum_k a_(i k) c_(k j), $
  the $(i, j)$-entry of $bf(A) bf(B) + bf(A) bf(C)$; (iii) is proved in the same way, and (iv) follows from $alpha sum_k a_(i k) b_(k j) = sum_k (alpha a_(i k)) b_(k j) = sum_k a_(i k)(alpha b_(k j))$. For (v), the $(i, k)$-entry of $bf(I)_m$ is $1$ for $k = i$ and $0$ otherwise, so the $(i, j)$-entry of $bf(I)_m bf(A)$ is $a_(i j)$; similarly $bf(A) bf(I)_n = bf(A)$. In (vii) every term of every entry contains a zero factor. For (vi), take
  $ bf(A) = mat(1, 2; 2, 4), quad bf(B) = mat(2, -4; -1, 2): quad bf(A) bf(B) = mat(0, 0; 0, 0). $
]

#indent So $bf(A) bf(B) = bf(0)$ does not imply that $bf(A) = bf(0)$ or $bf(B) = bf(0)$; nor does it imply $bf(B) bf(A) = bf(0)$: for the matrices just used, $bf(B) bf(A) = display(mat(-6, -12; 3, 6))$. By associativity, a product $bf(A)_1 bf(A)_2 dots.c bf(A)_k$ of matrices of compatible sizes is also written without brackets.

#subsec("Powers and the Transpose of a Matrix", added: true) // added for MA1522: powers of square matrices, transpose and its properties, symmetric matrices as A^T = A

For a square matrix $bf(A)$ of order $n$, the _powers_ of $bf(A)$ are defined inductively:
$ bf(A)^0 = bf(I)_n, quad bf(A)^k = bf(A) bf(A)^(k - 1), quad k >= 1. $
Thus $bf(A)^k$ is the product of $k$ factors equal to $bf(A)$, and by associativity $bf(A)^k bf(A)^l = bf(A)^(k + l)$ for all nonnegative integers $k, l$. Powers are defined only for square matrices, since $bf(A) bf(A)$ requires $bf(A)$ to have as many columns as rows. For example, induction on $k$ gives
$ mat(1, 1; 0, 1)^k = mat(1, k; 0, 1), quad "because" quad mat(1, 1; 0, 1) mat(1, k - 1; 0, 1) = mat(1, k; 0, 1). $
Since multiplication is not commutative, the identities of school algebra need care: $(bf(A) + bf(B))^2 = bf(A)^2 + bf(A) bf(B) + bf(B) bf(A) + bf(B)^2$, and this equals $bf(A)^2 + 2 bf(A) bf(B) + bf(B)^2$ if and only if $bf(A) bf(B) = bf(B) bf(A)$ (as happens, for example, for diagonal matrices).

The _transpose_ of an $m times n$ matrix $bf(A) = (a_(i j))_(m times n)$ is the $n times m$ matrix $bf(A)^T = (b_(i j))_(n times m)$ with $b_(i j) = a_(j i)$: the $i$-th row of $bf(A)$ becomes the $i$-th column of $bf(A)^T$. (The definition is repeated in Section 2.10.) For example,
$ mat(1, 2, 3; 4, 5, 6)^T = mat(1, 4; 2, 5; 3, 6). $

#theorem[
  For matrices of sizes for which the operations are defined and every $alpha in bb(R)$:
  #[
    #set enum(numbering: "(i)")
    + $(bf(A)^T)^T = bf(A)$;
    + $(alpha bf(A))^T = alpha bf(A)^T$;
    + $(bf(A) + bf(B))^T = bf(A)^T + bf(B)^T$;
    + $(bf(A) bf(B))^T = bf(B)^T bf(A)^T$.
  ]
]

#proof[
  The $(i, j)$-entries of the two sides of (i), (ii) and (iii) are $a_(i j)$, $alpha a_(j i)$ and $a_(j i) + b_(j i)$, respectively. Property (iv) is proved in Section 2.4 (subsection "Inversion and Transposition").
]

#indent Note the reversed order in (iv): if $bf(A)$ is $m times p$ and $bf(B)$ is $p times n$, then $bf(A)^T bf(B)^T$ is not even defined unless $m = n$. A square matrix $bf(A)$ is symmetric if and only if $bf(A)^T = bf(A)$. By (ii) and (iii), scalar multiples and sums of symmetric matrices are symmetric. A product of symmetric matrices need not be: by (iv), $(bf(A) bf(B))^T = bf(B) bf(A)$ for symmetric $bf(A)$ and $bf(B)$, so $bf(A) bf(B)$ is symmetric exactly when $bf(A) bf(B) = bf(B) bf(A)$; for instance, $diag(1, 2) display(mat(0, 1; 1, 0)) = display(mat(0, 1; 2, 0))$.

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

#subsec("Matrix Equations and Homogeneous Systems", added: true) // added for MA1522: matrix equation and vector equation forms; homogeneous systems: always consistent, trivial and nontrivial solutions, infinitely many solutions iff a nontrivial one

A linear system of $m$ equations in $n$ variables, $a_(i 1) x_1 + a_(i 2) x_2 + dots.c + a_(i n) x_n = b_i$, $i = 1, ..., m$, is written as the _matrix equation_ $bf(A) bf(x) = bf(b)$, where $bf(A) = (a_(i j))_(m times n)$ is the coefficient matrix, $bf(x) = (x_j)_(n times 1)$ is the _variable vector_, and $bf(b) = (b_i)_(m times 1)$ is the constant vector; or, as in $(2)$, as the _vector equation_
$ x_1 bf(a)_1 + x_2 bf(a)_2 + dots.c + x_n bf(a)_n = bf(b), $
in which the $j$-th column $bf(a)_j$ of $bf(A)$ is called the _coefficient vector_ of the variable $x_j$. A solution of the system is the same as a vector $bf(u) in bb(R)^n$ with $bf(A) bf(u) = bf(b)$.

The system is homogeneous when $bf(b) = bf(0)$. A homogeneous system $bf(A) bf(x) = bf(0)$ is always consistent, since $bf(A) bf(0) = bf(0)$: the zero vector is a solution, called the _trivial solution_, and a solution $bf(u) != bf(0)$ is called a _nontrivial solution_. Conversely, if $bf(x) = bf(0)$ is a solution of $bf(A) bf(x) = bf(b)$, then $bf(b) = bf(A) bf(0) = bf(0)$, so the system is homogeneous.

#theorem[
  A homogeneous linear system has infinitely many solutions if and only if it has a nontrivial solution.
]

#proof[
  If there are infinitely many solutions, at least one of them is nonzero. Conversely, let $bf(A) bf(u) = bf(0)$ with $bf(u) != bf(0)$. For every $s in bb(R)$ we have $bf(A)(s bf(u)) = s(bf(A) bf(u)) = bf(0)$ (Section 2.2), and the vectors $s bf(u)$, $s in bb(R)$, are pairwise distinct.
]

#indent Hence a homogeneous system has either only the trivial solution or infinitely many solutions; in particular, if its solution is unique, it is the trivial one. For example, the system
$ x_1 + x_2 - 2 x_3 = 0, quad 2 x_1 - x_2 - x_3 = 0 $
has the nontrivial solution $(1, 1, 1)^T$, and therefore all the solutions $s (1, 1, 1)^T$, $s in bb(R)$. There are no others: adding the two equations gives $x_1 = x_3$, and then the first equation gives $x_2 = x_3$.

#see-section("4.2", [The relation between the solutions of $bf(A) bf(x) = bf(b)$ and those of $bf(A) bf(x) = bf(0)$ (if $bf(v)$ is a particular solution of $bf(A) bf(x) = bf(b)$, its solutions are the vectors $bf(v) + bf(u)$ with $bf(A) bf(u) = bf(0)$; the difference of two solutions solves $bf(A) bf(x) = bf(0)$)])

#subsec("Submatrices of a Product", added: true) // added for MA1522: submatrices, block multiplication (rows m1..m2 of A times columns n1..n2 of B), columns and rows of a product

A _submatrix_ of a matrix $bf(A)$ is formed by the entries at the intersections of some chosen rows and columns of $bf(A)$ (see also Section 2.8); in particular, each row and each column of $bf(A)$ is a submatrix. The following special case of the rule for multiplying block matrices is used constantly.

#theorem(title: "Block Multiplication")[
  Let $bf(A)$ be an $m times p$ matrix and $bf(B)$ a $p times n$ matrix. Let $bf(A)_1$ be the submatrix of $bf(A)$ formed by its rows $m_1, m_1 + 1, ..., m_2$, and $bf(B)_1$ the submatrix of $bf(B)$ formed by its columns $n_1, n_1 + 1, ..., n_2$. Then $bf(A)_1 bf(B)_1$ is the $(m_2 - m_1 + 1) times (n_2 - n_1 + 1)$ submatrix of $bf(A) bf(B)$ formed by its rows $m_1, ..., m_2$ and columns $n_1, ..., n_2$.
]

#proof[
  The two matrices have the same size. The entry of $bf(A)_1 bf(B)_1$ that stands in the place of the $(i, j)$-entry of $bf(A) bf(B)$ is the product of the row of $bf(A)_1$ coming from the $i$-th row of $bf(A)$ and the column of $bf(B)_1$ coming from the $j$-th column of $bf(B)$, that is, $sum_(k = 1)^p a_(i k) b_(k j)$, which is the $(i, j)$-entry of $bf(A) bf(B)$.
]

#indent In particular, write $bf(B) = mat(bf(b)_1, bf(b)_2, dots.c, bf(b)_n)$ by its columns and let $bf(r)_1, ..., bf(r)_m$ be the rows of $bf(A)$. Taking for $bf(B)_1$ a single column, or for $bf(A)_1$ a single row, we get
$ bf(A) bf(B) = mat(bf(A) bf(b)_1, bf(A) bf(b)_2, dots.c, bf(A) bf(b)_n), quad quad bf(A) bf(B) = mat(bf(r)_1 bf(B); bf(r)_2 bf(B); dots.v; bf(r)_m bf(B)): $
the $j$-th column of $bf(A) bf(B)$ is $bf(A)$ times the $j$-th column of $bf(B)$ (the _column rule_), and the $i$-th row of $bf(A) bf(B)$ is the $i$-th row of $bf(A)$ times $bf(B)$ (the _row rule_). For example, for
$ bf(A) = mat(1, 0, 2; -1, 3, 1; 2, 1, 0), quad bf(B) = mat(1, 2, 0, 1; 0, 1, -1, 2; 3, 0, 1, 1), quad bf(A) bf(B) = mat(7, 2, 2, 3; 2, 1, -2, 6; 2, 5, -1, 4), $
rows $2$ and $3$ of $bf(A)$ times columns $2$ and $3$ of $bf(B)$ give
$ mat(-1, 3, 1; 2, 1, 0) mat(2, 0; 1, -1; 0, 1) = mat(1, -2; 5, -1), $
which is indeed the submatrix of $bf(A) bf(B)$ in rows $2$, $3$ and columns $2$, $3$.

#subsec("Solving Matrix Equations", added: true) // added for MA1522: solving AX = B column by column; combined augmented matrices

Let $bf(A)$ be an $m times n$ matrix and $bf(B) = mat(bf(b)_1, bf(b)_2, dots.c, bf(b)_p)$ an $m times p$ matrix. By the column rule, an $n times p$ matrix $bf(X) = mat(bf(x)_1, bf(x)_2, dots.c, bf(x)_p)$ satisfies the matrix equation $bf(A) bf(X) = bf(B)$ if and only if its columns solve the $p$ linear systems
$ bf(A) bf(x)_1 = bf(b)_1, quad bf(A) bf(x)_2 = bf(b)_2, quad ..., quad bf(A) bf(x)_p = bf(b)_p. $
All these systems have the same coefficient matrix, so the same row operations reduce each of them. It therefore suffices to reduce once the _combined augmented matrix_
$ (bf(A) | bf(b)_1 | bf(b)_2 | dots.c | bf(b)_p), $
also written $(bf(A) | bf(B))$, and to read the solutions of all $p$ systems off its (reduced) row-echelon form.

#example[
  Let us solve $bf(A) bf(X) = bf(B)$ for
  $ bf(A) = mat(1, 1, 1; 0, 1, 2; 1, 2, 4), quad bf(B) = mat(2, 2; 2, 1; 5, 4). $
  The operations $R_3 - R_1$ and $R_3 - R_2$ produce a row-echelon form, and $R_2 - 2 R_3$, $R_1 - R_3$, $R_1 - R_2$ then produce the reduced row-echelon form:
  $ mat(1, 1, 1, 2, 2; 0, 1, 2, 2, 1; 1, 2, 4, 5, 4; augment: #(vline: (3, 4))) rowto mat(1, 1, 1, 2, 2; 0, 1, 2, 2, 1; 0, 0, 1, 1, 1; augment: #(vline: (3, 4))) rowto mat(1, 0, 0, 1, 2; 0, 1, 0, 0, -1; 0, 0, 1, 1, 1; augment: #(vline: (3, 4))). $
  Both systems have unique solutions, $bf(x)_1 = (1, 0, 1)^T$ and $bf(x)_2 = (2, -1, 1)^T$, so $bf(X) = display(mat(1, 2; 0, -1; 1, 1))$ is the unique solution of $bf(A) bf(X) = bf(B)$.
]

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

#subsec("Singular Matrices and the Cancellation Law", added: true) // added for MA1522: only square matrices are invertible, singular matrices, failure of cancellation, cancellation law, inverse of a 2×2 matrix, properties of inverses, negative powers

Only square matrices can be invertible in the sense of the definition above. A square matrix that is not invertible is called _singular_. (Some books call every non-invertible matrix, square or not, singular.) Non-square matrices may have one-sided inverses; see Section 2.6.

For real numbers, $a b = a c$ with $a != 0$ implies $b = c$. For matrices this _cancellation_ fails even when $bf(A) != bf(0)$:
$ bf(A) = mat(1, 1; 1, 1), quad bf(B) = bf(I)_2, quad bf(C) = mat(0, 1; 1, 0): \
  bf(A) bf(B) = bf(A) bf(C) = mat(1, 1; 1, 1), quad "but" quad bf(B) != bf(C). $
Invertibility restores it.

#theorem(title: "Cancellation Law")[
  Let $bf(A)$ be an invertible matrix of order $n$.
  #[
    #set enum(numbering: "(i)")
    + (Left cancellation) If $bf(B)$ and $bf(C)$ are $n times p$ matrices with $bf(A) bf(B) = bf(A) bf(C)$, then $bf(B) = bf(C)$.
    + (Right cancellation) If $bf(B)$ and $bf(C)$ are $p times n$ matrices with $bf(B) bf(A) = bf(C) bf(A)$, then $bf(B) = bf(C)$.
  ]
]

#proof[
  $bf(B) = bf(A)^(-1) bf(A) bf(B) = bf(A)^(-1) bf(A) bf(C) = bf(C)$, and $bf(B) = bf(B) bf(A) bf(A)^(-1) = bf(C) bf(A) bf(A)^(-1) = bf(C)$.
]

#indent The matrix must be cancelled on the same side: $bf(A) bf(B) = bf(C) bf(A)$ only gives $bf(B) = bf(A)^(-1) bf(C) bf(A)$. For instance,
$ bf(A) = mat(0, 1; 1, 0), quad bf(B) = diag(1, 2), quad bf(C) = diag(2, 1): \
  bf(A) bf(B) = bf(C) bf(A) = mat(0, 2; 1, 0), quad "but" quad bf(B) != bf(C). $

#theorem[
  A $2 times 2$ matrix $bf(A) = display(mat(a, b; c, d))$ is invertible if and only if $a d - b c != 0$, and in this case
  $ bf(A)^(-1) = 1 / (a d - b c) mat(d, -b; -c, a). $
]

#proof[
  Let $bf(B) = display(mat(d, -b; -c, a))$. Direct multiplication gives $bf(A) bf(B) = bf(B) bf(A) = (a d - b c) bf(I)_2$. Hence, if $a d - b c != 0$, the matrix $(a d - b c)^(-1) bf(B)$ is the inverse of $bf(A)$. If $a d - b c = 0$, then $bf(A) bf(B) = bf(0)$; were $bf(A)$ invertible, we would get $bf(B) = bf(A)^(-1) bf(A) bf(B) = bf(0)$, so $a = b = c = d = 0$ and $bf(A) = bf(0)$, which is not invertible—a contradiction.
]

#indent For instance,
$ mat(2, 3; 1, 4)^(-1) = 1/5 mat(4, -3; -1, 2). $
Here $a d - b c = det(bf(A))$, and the matrix $bf(B)$ of the proof is the adjoint $adj(bf(A))$; so the formula is the case $n = 2$ of the adjoint formula for the inverse (Section 2.10).

#theorem[
  Let $bf(A)$ and $bf(B)$ be invertible matrices of order $n$, and let $alpha != 0$ be a real number. Then:
  #[
    #set enum(numbering: "(i)")
    + $bf(A)^(-1)$ is invertible and $(bf(A)^(-1))^(-1) = bf(A)$;
    + $alpha bf(A)$ is invertible and $(alpha bf(A))^(-1) = alpha^(-1) bf(A)^(-1)$;
    + $bf(A)^T$ is invertible and $(bf(A)^T)^(-1) = (bf(A)^(-1))^T$;
    + $bf(A) bf(B)$ is invertible and $(bf(A) bf(B))^(-1) = bf(B)^(-1) bf(A)^(-1)$.
  ]
]

#proof[
  (i) The equalities $bf(A)^(-1) bf(A) = bf(A) bf(A)^(-1) = bf(I)$ say that $bf(A)$ is an inverse of $bf(A)^(-1)$. (ii) $(alpha^(-1) bf(A)^(-1))(alpha bf(A)) = (alpha^(-1) alpha) bf(A)^(-1) bf(A) = bf(I)$, and likewise in the other order. Statements (iii) and (iv) are proved in the subsections "Inversion and Transposition" (where it is also shown that $bf(A)$ is invertible if and only if $bf(A)^T$ is) and "Group of Invertible Matrices".
]

#indent By (iv) and induction, a product of invertible matrices $bf(A)_1, bf(A)_2, ..., bf(A)_k$ of order $n$ is invertible and
$ (bf(A)_1 bf(A)_2 dots.c bf(A)_k)^(-1) = bf(A)_k^(-1) dots.c bf(A)_2^(-1) bf(A)_1^(-1); $
note the reversed order: in general $(bf(A) bf(B))^(-1) != bf(A)^(-1) bf(B)^(-1)$. _Negative powers_ of an invertible matrix are defined by $bf(A)^(-k) = (bf(A)^(-1))^k$ for $k > 0$. By (iii), the inverse of an invertible symmetric matrix is symmetric: $(bf(A)^(-1))^T = (bf(A)^T)^(-1) = bf(A)^(-1)$.

#subsec("Invertible Matrices and Linear Systems", added: true) // added for MA1522: Ax = b has the unique solution A^(-1) b; homogeneous system has only the trivial solution; RREF of (A | b); computing A^(-1) from (A | I)

#theorem[
  If $bf(A)$ is an invertible matrix of order $n$, then for every $bf(b) in bb(R)^n$ the system $bf(A) bf(x) = bf(b)$ has a unique solution, namely $bf(x) = bf(A)^(-1) bf(b)$.
]

#proof[
  The vector $bf(u) = bf(A)^(-1) bf(b)$ is a solution: $bf(A) bf(u) = bf(A) bf(A)^(-1) bf(b) = bf(b)$. If $bf(v)$ is also a solution, then $bf(A) bf(v) = bf(b) = bf(A) bf(u)$, and left cancellation gives $bf(v) = bf(u)$.
]

#corollary[
  If $bf(A)$ is invertible, then the homogeneous system $bf(A) bf(x) = bf(0)$ has only the trivial solution.
]

#indent Section 2.6 shows that both properties characterize invertible matrices. It also shows that the reduced row-echelon form of an invertible matrix $bf(A)$ is $bf(I)$; then the reduced row-echelon form of $(bf(A) | bf(b))$ is $(bf(I) | bf(c))$, where $bf(c)$ is the unique solution, so that
$ (bf(A) | bf(b)) rowto dots.c rowto (bf(I) | bf(A)^(-1) bf(b)). $

Similarly, the inverse $bf(A)^(-1)$ is the unique solution $bf(X)$ of the matrix equation $bf(A) bf(X) = bf(I)$. By Section 2.3, it is found by reducing the combined augmented matrix $(bf(A) | bf(e)_1 | dots.c | bf(e)_n) = (bf(A) | bf(I))$; for an invertible $bf(A)$, Gauss–Jordan elimination gives
$ (bf(A) | bf(I)) rowto dots.c rowto (bf(I) | bf(A)^(-1)). $
Strictly speaking, solving $bf(A) bf(X) = bf(I)$ produces a right inverse of $bf(A)$; Section 2.6 shows that for a square matrix a right inverse is automatically the inverse, and turns this computation into an algorithm that also detects singular matrices.

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

#see-section("1.3", [The material on the three types of elementary row operations and their reverses, row equivalence, the fact that row-equivalent augmented matrices give linear systems with the same solutions, and elementary row operations in matrix form (permutation and row modification matrices)])

#subsec("Elementary Matrices and Row Operations", added: true) // added for MA1522: elementary matrices, EA performs the row operation, row equivalence as B = E_k ... E_1 A, inverses of elementary matrices

#definition[
  A square matrix $bf(E)$ of order $n$ is an _elementary matrix_ if it can be obtained from the identity matrix $bf(I)_n$ by a single elementary row operation $r$, $bf(I)_n rowto^r bf(E)$. The operation $r$ is called the row operation _corresponding_ to $bf(E)$.
]

#indent For example, for $n = 3$ the operations $R_2 - 4 R_1$, $R_1 <-> R_3$ and $5 R_2$ correspond to the elementary matrices
$ bf(E)_1 = mat(1, 0, 0; -4, 1, 0; 0, 0, 1), quad bf(E)_2 = mat(0, 0, 1; 0, 1, 0; 1, 0, 0), quad bf(E)_3 = mat(1, 0, 0; 0, 5, 0; 0, 0, 1). $
In the language of Section 1.3, the elementary matrices corresponding to $R_i + c R_j$ with $i > j$ are row modification matrices, and those corresponding to $R_i <-> R_j$ are permutation matrices.

#theorem[
  Let $bf(A)$ be an $n times p$ matrix and $bf(E)$ the elementary matrix of order $n$ corresponding to an elementary row operation $r$. Then $bf(E) bf(A)$ is the matrix obtained from $bf(A)$ by performing $r$: $bf(A) rowto^r bf(E) bf(A)$.
]

#proof[
  By the row rule (Section 2.3), the $i$-th row of $bf(E) bf(A)$ is the $i$-th row of $bf(E)$ times $bf(A)$, and $bf(e)_k^T bf(A)$ is the $k$-th row of $bf(A)$. If $r$ does not change the $i$-th row of $bf(I)_n$, then the $i$-th row of $bf(E)$ is $bf(e)_i^T$, and the $i$-th row of $bf(E) bf(A)$ is the $i$-th row of $bf(A)$. The rows that $r$ changes are: for $R_i <-> R_j$, the $i$-th and $j$-th rows, which become $bf(e)_j^T$ and $bf(e)_i^T$; for $c R_i$, the $i$-th row, which becomes $c bf(e)_i^T$; for $R_i + c R_j$, the $i$-th row, which becomes $bf(e)_i^T + c bf(e)_j^T$. Multiplied by $bf(A)$, these rows give, respectively, the $j$-th and $i$-th rows of $bf(A)$; $c$ times its $i$-th row; and its $i$-th row plus $c$ times its $j$-th row.
]

#indent For instance, pre-multiplication by $bf(E)_1$ performs $R_2 - 4 R_1$:
$ bf(E)_1 mat(1, 0, 2; 4, 1, 3; 0, 2, 1) = mat(1, 0, 2; 0, 1, -5; 0, 2, 1). $
Thus performing an elementary row operation is the same as pre-multiplying by the corresponding elementary matrix. If $bf(B)$ is row equivalent to $bf(A)$, obtained by the operations $r_1, r_2, ..., r_k$ performed in this order, and $bf(E)_i$ is the elementary matrix corresponding to $r_i$, then applying the theorem $k$ times gives
$ bf(A) rowto^(r_1) bf(E)_1 bf(A) rowto^(r_2) bf(E)_2 bf(E)_1 bf(A) rowto^(r_3) dots.c rowto^(r_k) bf(E)_k dots.c bf(E)_2 bf(E)_1 bf(A) = bf(B). $

#theorem[
  Every elementary matrix $bf(E)$ is invertible, and $bf(E)^(-1)$ is the elementary matrix corresponding to the reverse of the row operation corresponding to $bf(E)$:
  #[
    #set enum(numbering: "(i)")
    + if $bf(E)$ corresponds to $R_i + c R_j$, then $bf(E)^(-1)$ corresponds to $R_i - c R_j$;
    + if $bf(E)$ corresponds to $R_i <-> R_j$, then $bf(E)^(-1)$ corresponds to $R_i <-> R_j$, that is, $bf(E)^(-1) = bf(E)$;
    + if $bf(E)$ corresponds to $c R_i$ ($c != 0$), then $bf(E)^(-1)$ corresponds to $(1\/c) R_i$.
  ]
]

#proof[
  Let $r$ be the operation corresponding to $bf(E)$, let $r'$ be its reverse (Section 1.3), and let $bf(E)'$ be the elementary matrix corresponding to $r'$. Performing $r$ on $bf(I)$ and then $r'$ returns $bf(I)$: $bf(I) rowto^r bf(E) rowto^(r') bf(I)$. By the preceding theorem the second step is pre-multiplication by $bf(E)'$, so $bf(E)' bf(E) = bf(I)$. Since $r$ is the reverse of $r'$, the same argument gives $bf(E) bf(E)' = bf(I)$.
]

#indent For the matrices above,
$ bf(E)_1^(-1) = mat(1, 0, 0; 4, 1, 0; 0, 0, 1), quad bf(E)_2^(-1) = bf(E)_2, quad bf(E)_3^(-1) = mat(1, 0, 0; 0, 1\/5, 0; 0, 0, 1), $
corresponding to $R_2 + 4 R_1$, $R_1 <-> R_3$ and $(1\/5) R_2$. If $bf(B) = bf(E)_k dots.c bf(E)_1 bf(A)$, then $bf(A) = bf(E)_1^(-1) dots.c bf(E)_k^(-1) bf(B)$, in accordance with the symmetry of row equivalence. In this matrix form, the theorem of Section 1.3 on row-equivalent augmented matrices reads: if $(bf(B) | bf(c)) = bf(P)(bf(A) | bf(b)) = (bf(P) bf(A) | bf(P) bf(b))$ with $bf(P) = bf(E)_k dots.c bf(E)_1$, then $bf(A) bf(u) = bf(b)$ implies $bf(B) bf(u) = bf(P) bf(A) bf(u) = bf(P) bf(b) = bf(c)$, and $bf(B) bf(u) = bf(c)$ implies $bf(A) bf(u) = bf(P)^(-1) bf(B) bf(u) = bf(P)^(-1) bf(c) = bf(b)$.

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

#subsec("Equivalent Statements for Invertibility", added: true) // added for MA1522: left and right inverses, products of elementary matrices, the equivalent statements of invertibility (i)–(ix), consequences

#definition[
  Let $bf(A)$ be an $n times m$ matrix. An $m times n$ matrix $bf(B)$ is a _left inverse_ of $bf(A)$ if $bf(B) bf(A) = bf(I)_m$, and a _right inverse_ of $bf(A)$ if $bf(A) bf(B) = bf(I)_n$.
]

#indent Thus $bf(B)$ is a left inverse of $bf(A)$ if and only if $bf(A)$ is a right inverse of $bf(B)$, and the inverse of an invertible matrix is both a left and a right inverse. A non-square matrix may have a one-sided inverse; for example,
$ bf(A) = mat(1, 0, 2; 0, 1, -1), quad bf(B) = mat(1, 0; 0, 1; 0, 0): quad bf(A) bf(B) = bf(I)_2, quad bf(B) bf(A) = mat(1, 0, 2; 0, 1, -1; 0, 0, 0) != bf(I)_3, $
so $bf(B)$ is a right inverse of $bf(A)$ but not a left inverse. A non-square matrix cannot have both. Indeed, let $bf(A)$ be $n times m$, $bf(B) bf(A) = bf(I)_m$ and $bf(A) bf(C) = bf(I)_n$. Then $bf(B) = bf(B)(bf(A) bf(C)) = (bf(B) bf(A)) bf(C) = bf(C)$. Moreover, the _trace_ $tr(bf(X))$ of a square matrix, the sum of its diagonal entries, satisfies $tr(bf(A) bf(B)) = sum_(i, k) a_(i k) b_(k i) = tr(bf(B) bf(A))$; hence $n = tr(bf(I)_n) = tr(bf(A) bf(B)) = tr(bf(B) bf(A)) = tr(bf(I)_m) = m$.

#theorem(title: "Equivalent Statements for Invertibility")[
  Let $bf(A)$ be a square matrix of order $n$. The following statements are equivalent.
  #[
    #set enum(numbering: "(i)")
    + $bf(A)$ is invertible.
    + $bf(A)^T$ is invertible.
    + (Left inverse) There is a matrix $bf(B)$ such that $bf(B) bf(A) = bf(I)$.
    + (Right inverse) There is a matrix $bf(B)$ such that $bf(A) bf(B) = bf(I)$.
    + The reduced row-echelon form of $bf(A)$ is the identity matrix.
    + $bf(A)$ can be expressed as a product of elementary matrices.
    + The homogeneous system $bf(A) bf(x) = bf(0)$ has only the trivial solution.
    + For every $bf(b) in bb(R)^n$, the system $bf(A) bf(x) = bf(b)$ has a unique solution.
    + The determinant of $bf(A)$ is nonzero, $det(bf(A)) != 0$.
  ]
]

#proof[
  The equivalence (i) $<=>$ (ii) is shown in the subsection "Inversion and Transposition" of Section 2.4, and (i) $<=>$ (ix) is the theorem of the subsection "Invertibility and the Determinant" above. We prove the cycle (i) $=>$ (vii) $=>$ (v) $=>$ (vi) $=>$ (i), and then (i) $=>$ (iii) $=>$ (vii), (i) $=>$ (iv) $=>$ (i), and (i) $=>$ (viii) $=>$ (iv).

  (i) $=>$ (vii) is the corollary in the subsection "Invertible Matrices and Linear Systems" of Section 2.4.

  (vii) $=>$ (v). Let $bf(R)$ be the reduced row-echelon form of $bf(A)$. If all $n$ columns of $bf(R)$ are pivot columns, its leading entries lie on the main diagonal and $bf(R) = bf(I)_n$. Otherwise $bf(R)$ has a non-pivot column; the corresponding variable is a parameter of the general solution of $bf(R) bf(x) = bf(0)$ (Section 1.2), so this system has a nontrivial solution, and so does $bf(A) bf(x) = bf(0)$, which has the same solutions (Section 1.3). This contradicts (vii).

  (v) $=>$ (vi). If $bf(E)_k dots.c bf(E)_2 bf(E)_1 bf(A) = bf(I)$ with elementary matrices $bf(E)_i$ (Section 2.5), then multiplying on the left successively by $bf(E)_k^(-1), ..., bf(E)_1^(-1)$ gives $bf(A) = bf(E)_1^(-1) bf(E)_2^(-1) dots.c bf(E)_k^(-1)$, and the inverse of an elementary matrix is elementary.

  (vi) $=>$ (i). Elementary matrices are invertible, and a product of invertible matrices is invertible (Section 2.4).

  (i) $=>$ (iii) and (i) $=>$ (iv): take $bf(B) = bf(A)^(-1)$.

  (iii) $=>$ (vii). If $bf(B) bf(A) = bf(I)$ and $bf(A) bf(u) = bf(0)$, then $bf(u) = bf(B) bf(A) bf(u) = bf(B) bf(0) = bf(0)$.

  (iv) $=>$ (i). Transposing $bf(A) bf(B) = bf(I)$ gives $bf(B)^T bf(A)^T = bf(I)^T = bf(I)$. Thus $bf(A)^T$ has a left inverse; by the implications (iii) $=>$ (vii) $=>$ (i) already proved, applied to $bf(A)^T$, the matrix $bf(A)^T$ is invertible, and therefore so is $bf(A)$.

  (i) $=>$ (viii) is the theorem in the subsection "Invertible Matrices and Linear Systems" of Section 2.4.

  (viii) $=>$ (iv). Let $bf(b)_j$ be the solution of $bf(A) bf(x) = bf(e)_j$, $j = 1, ..., n$, and $bf(B) = mat(bf(b)_1, bf(b)_2, dots.c, bf(b)_n)$. By the column rule (Section 2.3),
  $ bf(A) bf(B) = mat(bf(A) bf(b)_1, bf(A) bf(b)_2, dots.c, bf(A) bf(b)_n) = mat(bf(e)_1, bf(e)_2, dots.c, bf(e)_n) = bf(I). $
]

#indent The textbook's criteria—the columns of $bf(A)$ are linearly independent (subsection "Invertibility Criterion for a Matrix"), the rows of $bf(A)$ are linearly independent (Section 2.4)—can be added to this list; Sections 3.6 and 4.2 extend it further.

#corollary[
  Let $bf(A)$ and $bf(B)$ be square matrices of order $n$.
  #[
    #set enum(numbering: "(i)")
    + If $bf(B) bf(A) = bf(I)$ or $bf(A) bf(B) = bf(I)$, then $bf(A)$ is invertible and $bf(B) = bf(A)^(-1)$.
    + If $bf(A) bf(B)$ is invertible, then both $bf(A)$ and $bf(B)$ are invertible.
  ]
]

#proof[
  (i) By the theorem, $bf(A)$ is invertible, and then $bf(B) = bf(B)(bf(A) bf(A)^(-1)) = (bf(B) bf(A)) bf(A)^(-1) = bf(A)^(-1)$, or $bf(B) = (bf(A)^(-1) bf(A)) bf(B) = bf(A)^(-1)(bf(A) bf(B)) = bf(A)^(-1)$. (ii) Let $bf(C) = (bf(A) bf(B))^(-1)$. Then $bf(A)(bf(B) bf(C)) = bf(I)$ and $(bf(C) bf(A)) bf(B) = bf(I)$, so $bf(A)$ has a right inverse and $bf(B)$ has a left inverse.
]

#indent In particular, a matrix $bf(X)$ found by solving $bf(A) bf(X) = bf(I)$ for a square matrix $bf(A)$ is the inverse of $bf(A)$, not merely a right inverse.

#subsec("Finding the Inverse by Row Reduction", added: true) // added for MA1522: algorithm (A | I) -> (I | A^(-1)) with the test for invertibility

#algorithm(title: "Inverse by row reduction")[
  Let $bf(A)$ be a square matrix of order $n$.
  + Form the $n times 2 n$ matrix $(bf(A) | bf(I)_n)$.
  + Reduce it by elementary row operations to a row-echelon form, or to the reduced row-echelon form $(bf(R) | bf(B))$.
  + If the left half of the row-echelon form has a zero row (equivalently, $bf(R) != bf(I)_n$), then $bf(A)$ is singular. Otherwise $bf(A)$ is invertible; the reduced row-echelon form is then $(bf(I)_n | bf(B))$, and $bf(A)^(-1) = bf(B)$.
]

#indent Row operations act on the two halves of $(bf(A) | bf(I))$ independently, so the left half of every matrix obtained is row equivalent to $bf(A)$. A square matrix in row-echelon form has a zero row if and only if it has fewer than $n$ pivot columns; then $bf(A) bf(x) = bf(0)$ has a nontrivial solution, as in the proof of (vii) $=>$ (v), and $bf(A)$ is singular. Otherwise the reduced row-echelon form of $bf(A)$ is $bf(I)$; the columns of $bf(B)$ then solve the systems $bf(A) bf(x) = bf(e)_j$, so $bf(A) bf(B) = bf(I)$ by the column rule, and $bf(B) = bf(A)^(-1)$ by the corollary above.

#example[
  Let
  $ bf(A) = mat(1, 0, 1; 1, 1, 0; 0, 1, 1). $
  The operations $R_2 - R_1$ and $R_3 - R_2$ give a row-echelon form
  $ (bf(A) | bf(I)) = mat(1, 0, 1, 1, 0, 0; 1, 1, 0, 0, 1, 0; 0, 1, 1, 0, 0, 1; augment: #3) rowto mat(1, 0, 1, 1, 0, 0; 0, 1, -1, -1, 1, 0; 0, 0, 2, 1, -1, 1; augment: #3) $
  whose left half has no zero row, so $bf(A)$ is invertible. The operations $(1\/2) R_3$, $R_2 + R_3$, $R_1 - R_3$ then give the reduced row-echelon form
  $ mat(1, 0, 0, 1\/2, 1\/2, -1\/2; 0, 1, 0, -1\/2, 1\/2, 1\/2; 0, 0, 1, 1\/2, -1\/2, 1\/2; augment: #3), quad "so" quad bf(A)^(-1) = 1/2 mat(1, 1, -1; -1, 1, 1; 1, -1, 1). $
  On the other hand, for
  $ bf(A) = mat(1, 2, 3; 0, 1, 1; 1, 3, 4) $
  the operations $R_3 - R_1$ and $R_3 - R_2$ give
  $ (bf(A) | bf(I)) rowto mat(1, 2, 3, 1, 0, 0; 0, 1, 1, 0, 1, 0; 0, 0, 0, -1, -1, 1; augment: #3), $
  whose left half is a row-echelon form with a zero row; this matrix $bf(A)$ is singular (its third row is the sum of the first two).
]

#subsec("Invertible Matrices and Row Equivalence", added: true) // added for MA1522: B row equivalent to A iff B = PA with P invertible (invertible row operations are composed of elementary ones); row equivalent iff same RREF (Appendix)

#theorem[
  Let $bf(A)$ and $bf(B)$ be $n times m$ matrices. Then $bf(B)$ is row equivalent to $bf(A)$ if and only if $bf(B) = bf(P) bf(A)$ for some invertible matrix $bf(P)$ of order $n$.
]

#proof[
  If $bf(B)$ is obtained from $bf(A)$ by row operations with elementary matrices $bf(E)_1, ..., bf(E)_k$, then $bf(B) = bf(P) bf(A)$ with $bf(P) = bf(E)_k dots.c bf(E)_1$, which is invertible. Conversely, an invertible $bf(P)$ is a product of elementary matrices, $bf(P) = bf(E)_k dots.c bf(E)_1$ (statement (vi)), and then $bf(P) bf(A) = bf(E)_k (dots.c (bf(E)_1 bf(A)))$ is obtained from $bf(A)$ by the corresponding row operations (Section 2.5).
]

#indent This makes precise the remark that elementary row operations are the building blocks of all reversible row operations: every operation on $n$-row matrices of the form $bf(A) |-> bf(P) bf(A)$ with an invertible $bf(P)$—each new row is a fixed linear combination of the old rows, and the operation can be undone—is a composition of elementary row operations.

#see-section("1.4", [The uniqueness of the reduced row-echelon form of a matrix])

#corollary[
  Two $m times n$ matrices are row equivalent if and only if they have the same reduced row-echelon form.
]

#proof[
  If $bf(A)$ and $bf(B)$ have the same reduced row-echelon form $bf(R)$, then $bf(A)$ is row equivalent to $bf(R)$, and $bf(R)$ to $bf(B)$. Conversely, if $bf(A)$ and $bf(B)$ are row equivalent and $bf(R)$ is the reduced row-echelon form of $bf(A)$, then $bf(B)$ is row equivalent to $bf(R)$ as well, since row equivalence is symmetric and transitive; by uniqueness, $bf(R)$ is the reduced row-echelon form of $bf(B)$.
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

#subsec([LU Factorization of an $m times n$ Matrix], added: true) // added for MA1522: unit lower triangular matrices, LU factorization of an m×n matrix, algorithm and the shortcut for L, solving Ax = b with an LU factorization, LUP factorization and permutation matrices

The construction above extends to rectangular matrices, without assuming invertibility.

#definition[
  A square matrix $bf(L)$ is _unit lower triangular_ if it is lower triangular and all its diagonal entries are equal to $1$. An _LU factorization_ of an $m times n$ matrix $bf(A)$ is a factorization
  $ bf(A) = bf(L) bf(U), $
  where $bf(L)$ is an $m times m$ unit lower triangular matrix and $bf(U)$ is a row-echelon form of $bf(A)$. If $bf(A)$ has an LU factorization, it is said to be _LU factorizable_.
]

#lemma[
  The product of two unit lower triangular matrices of the same order is unit lower triangular.
]

#proof[
  Let $bf(A) = (a_(i j))_n$ and $bf(B) = (b_(i j))_n$ be unit lower triangular. A term $a_(i k) b_(k j)$ of $(bf(A) bf(B))_(i j)$ can be nonzero only if $k <= i$ and $k >= j$. Hence $(bf(A) bf(B))_(i j) = 0$ for $i < j$, and $(bf(A) bf(B))_(i i) = a_(i i) b_(i i) = 1$.
]

#indent The elementary matrix corresponding to $R_i + c R_j$ with $i > j$ differs from $bf(I)$ only in its $(i, j)$-entry, which is $c$ and lies below the diagonal; so it is unit lower triangular, and so is its inverse, which corresponds to $R_i - c R_j$ (Section 2.5).

#algorithm(title: "LU factorization")[
  Let $bf(A)$ be an $m times n$ matrix.
  + Reduce $bf(A)$ to a row-echelon form $bf(U)$ using only operations $R_i + c R_j$ with $i > j$ (adding a multiple of a row to a row below it), in the order of Gaussian elimination: first the operations that use $R_1$, then those that use $R_2$, and so on, each entry being eliminated once. If a row interchange is needed, the algorithm fails.
  + If $r_1, ..., r_k$ are the operations used and $bf(E)_1, ..., bf(E)_k$ the corresponding elementary matrices, then $bf(E)_k dots.c bf(E)_2 bf(E)_1 bf(A) = bf(U)$, and therefore
    $ bf(A) = bf(L) bf(U), quad bf(L) = bf(E)_1^(-1) bf(E)_2^(-1) dots.c bf(E)_k^(-1), $
    where $bf(L)$ is unit lower triangular by the lemma.
  + In practice $bf(L)$ is written down at once: if $r_l$ is the operation $R_i + c_l R_j$, then the $(i, j)$-entry of $bf(L)$ is $-c_l$; all other entries below the diagonal are $0$.
]

#indent Step 3 holds because $bf(E)_l^(-1) = bf(I) - c_l bf(e)_(i_l) bf(e)_(j_l)^T$ when $r_l$ is $R_(i_l) + c_l R_(j_l)$. In the order of step 1, $j_l <= j_s < i_s$ for $l < s$, so $bf(e)_(j_l)^T bf(e)_(i_s) = 0$, and when the product $bf(E)_1^(-1) dots.c bf(E)_k^(-1)$ is multiplied out, every product of two or more of the terms $c_l bf(e)_(i_l) bf(e)_(j_l)^T$ vanishes. Hence $bf(L) = bf(I) - sum_l c_l bf(e)_(i_l) bf(e)_(j_l)^T$.

#example[
  For
  $ bf(A) = mat(2, 1, -1, 3; 4, 5, 1, 4; -2, 2, 4, -1) $
  the operations $R_2 - 2 R_1$, $R_3 + R_1$ and then $R_3 - R_2$ give
  $ bf(A) rowto mat(2, 1, -1, 3; 0, 3, 3, -2; 0, 3, 3, 2) rowto mat(2, 1, -1, 3; 0, 3, 3, -2; 0, 0, 0, 4) = bf(U). $
  The multipliers $c_l$ are $-2$, $1$, $-1$, so $bf(L)$ has the entries $2$, $-1$, $1$ in positions $(2, 1)$, $(3, 1)$, $(3, 2)$:
  $ bf(A) = mat(1, 0, 0; 2, 1, 0; -1, 1, 1) mat(2, 1, -1, 3; 0, 3, 3, -2; 0, 0, 0, 4). $
]

#indent An LU factorization replaces the system $bf(A) bf(x) = bf(b)$ by two easy ones. Put $bf(y) = bf(U) bf(x)$. First solve $bf(L) bf(y) = bf(b)$ by forward substitution; since $bf(L)$ is unit lower triangular, this system has a unique solution, found from the first equation down. Then solve $bf(U) bf(x) = bf(y)$ by back substitution, since $bf(U)$ is in row-echelon form. For $bf(A)$ as in the example and $bf(b) = (2, 11, 9)^T$, the system $bf(L) bf(y) = bf(b)$ gives
$ y_1 = 2, quad y_2 = 11 - 2 y_1 = 7, quad y_3 = 9 + y_1 - y_2 = 4, $
and $bf(U) bf(x) = bf(y)$ gives $x_4 = 1$, $x_2 = 3 - x_3$, $x_1 = x_3 - 2$; with the parameter $x_3 = t$ the general solution is
$ bf(x) = (t - 2, 3 - t, t, 1)^T, quad t in bb(R). $

Not every matrix is LU factorizable. Every $2 times 2$ matrix in row-echelon form is upper triangular, so an equality
$ mat(0, 1; 1, 0) = mat(1, 0; l, 1) mat(u_(1 1), u_(1 2); 0, u_(2 2)) $
would give, on comparing the first columns, $u_(1 1) = 0$ and $l u_(1 1) = 1$, which is impossible. (A characterization of the invertible LU factorizable matrices, beyond the course, is given in Tyrtyshnikov, §8.8.) Every matrix, however, has an _LU factorization with pivoting_ (an _LUP factorization_)
$ bf(A) = bf(P) bf(L) bf(U), $
where $bf(L)$ is unit lower triangular, $bf(U)$ is a row-echelon form of $bf(A)$, and $bf(P)$ is a _permutation matrix_: a square matrix with exactly one entry $1$ in each row and each column and zeros elsewhere, or, equivalently, a product of elementary matrices corresponding to row interchanges (Section 1.3). Indeed, Gaussian elimination as in the proof of Theorem 1 of Section 1.4 gives $bf(Z)_k bf(Pi)_k dots.c bf(Z)_1 bf(Pi)_1 bf(A) = bf(U)$, where $bf(Pi)_l$ interchanges the $l$-th row with a lower one and $bf(Z)_l = bf(I) + bf(z)_l bf(e)_l^T$, with $bf(z)_l$ having zeros in its first $l$ positions, uses the $l$-th row to eliminate below it. For $s > l$ we have $bf(Pi)_s bf(e)_l = bf(e)_l$, hence $bf(Pi)_s bf(Z)_l = (bf(I) + (bf(Pi)_s bf(z)_l) bf(e)_l^T) bf(Pi)_s$, a matrix of the same kind as $bf(Z)_l$ times $bf(Pi)_s$. Moving all the permutations to the right in this way gives $bf(L)' bf(Pi) bf(A) = bf(U)$ with $bf(Pi) = bf(Pi)_k dots.c bf(Pi)_1$, where $bf(L)'$ is a product of matrices $bf(I) + bf(w) bf(e)_l^T$ with the first $l$ entries of $bf(w)$ equal to zero. Each such factor has the unit lower triangular inverse $bf(I) - bf(w) bf(e)_l^T$, so $bf(L)'$ is invertible and $bf(L)'^(-1)$ is unit lower triangular by the lemma; thus $bf(A) = bf(Pi)^T bf(L) bf(U)$ with $bf(L) = bf(L)'^(-1)$, and $bf(P) = bf(Pi)^T$ is a permutation matrix.

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

#subsec("Transpositions", added: true) // added for MA1522 (Appendix): the n-permutation group, one-line notation, transpositions, every permutation is a composition of transpositions

The group $S_n$ is also called the _$n$-permutation group_; its elements are the permutations of the $n$ objects $1, 2, ..., n$. MA1522 writes a permutation in _one-line notation_, listing only the bottom row of its table: $sigma = (sigma(1), sigma(2), ..., sigma(n))$. For example, $S_2$ consists of $(1, 2)$, the identity, and $(2, 1)$; and $(2, 4, 1, 3) in S_4$ is the permutation
$ sigma = mat(delim: "(", 1, 2, 3, 4; 2, 4, 1, 3). $

#indent A _transposition_ is a permutation that exchanges two numbers $i != j$ and leaves all the others fixed. In this book the transposition exchanging $i$ and $j$ is denoted by $(i, j)$:
$ (i, j)(i) = j, quad (i, j)(j) = i, quad (i, j)(l) = l quad "for" l != i, j. $
This two-entry symbol is not one-line notation: the transposition $(1, 2) in S_3$ is $(2, 1, 3)$ in one-line notation. To avoid ambiguity, one-line notation is not used below; permutations are given by their tables. Clearly $tau tau = e$, that is, $tau^(-1) = tau$, for every transposition $tau$.

#theorem[
  Every permutation is a composition (product) of transpositions.
]

#proof[
  We use induction on the number $m$ of indices moved by $sigma in S_n$, that is, of indices $i$ with $sigma(i) != i$. If $m = 0$, then $sigma = e = tau tau$ for any transposition $tau$ (for $n = 1$, $e$ is regarded as the empty product). Let $m > 0$, choose $i$ with $j = sigma(i) != i$, and let $tau = (i, j)$. Then $(tau sigma)(i) = tau(j) = i$. If $sigma(l) = l$, then $l != i$, and also $l != j$, since $sigma(j) = j$ would contradict $sigma(i) = j$; hence $(tau sigma)(l) = tau(l) = l$. Thus $tau sigma$ fixes $i$ and every index fixed by $sigma$, so it moves fewer than $m$ indices and is a product of transpositions by the induction hypothesis. Hence so is $sigma = tau (tau sigma)$.
]

#indent For the permutation $sigma$ above, $sigma = (1, 2)(2, 4)(3, 4)$ (recall that the right-hand factor acts first). A permutation has many such decompositions, but the number of factors always has the same parity (subsection "Parity of a Permutation" below). This is what makes the _sign_ $op("sgn")(sigma) = (-1)^k$, where $k$ is the number of transpositions in a decomposition of $sigma$, well defined; it is introduced formally in the subsection "Uniqueness of the Linear Dependence Indicator". For the $sigma$ above, $op("sgn")(sigma) = (-1)^3 = -1$.

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

#subsec("Parity of a Permutation") // Tyrtyshnikov §4.4


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
  Prove that every even permutation of degree $n >= 3$ can be represented as a product of cycles of length $3$ (permutations that map $i_1 |-> i_2 |-> i_3 |-> i_1$ for some pairwise distinct indices $i_1, i_2, i_3$ and fix all other indices).
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

#subsec("The Determinant by Cofactor Expansion", added: true) // added for MA1522: inductive definition (orders 1, 2, matrix minor, cofactor, expansion along any row or column), sign pattern, order 3, Leibniz formula in the course's form and its equivalence with cofactor expansion (Appendix), determinant of a triangular matrix

MA1522 defines the determinant $det(bf(A)) = |bf(A)|$ of a square matrix $bf(A) = (a_(i j))_n$ by induction on the order $n$:
- for $n = 1$, $bf(A) = (a)$ and $det(bf(A)) = a$;
- for $n = 2$, $det display(mat(a, b; c, d)) = a d - b c$;
- for $n >= 2$, once determinants of order $n - 1$ are defined, let $bf(M)_(i j)$ be the $(i, j)$ matrix minor (the submatrix of order $n - 1$ obtained by deleting the $i$-th row and the $j$-th column) and $A_(i j) = (-1)^(i + j) det(bf(M)_(i j))$ the $(i, j)$-cofactor; then
  $ det(bf(A)) &= a_(i 1) A_(i 1) + a_(i 2) A_(i 2) + dots.c + a_(i n) A_(i n) = sum_(k = 1)^n a_(i k) A_(i k) \
    &= a_(1 j) A_(1 j) + a_(2 j) A_(2 j) + dots.c + a_(n j) A_(n j) = sum_(k = 1)^n a_(k j) A_(k j), $
  the _cofactor expansion_ along the $i$-th row, or along the $j$-th column.

#indent This is at once a theorem and a definition: the theorem is that all $2 n$ expansions give the same number. It is the case $k = 1$ of Laplace's theorem (end of the preceding subsection): every expansion equals the Leibniz sum $(triangle.stroked.t)$. Hence the course's determinant is the determinant studied in this chapter, and the case $n = 2$ agrees with the general rule. The sign $(-1)^(i + j)$ of the $(i, j)$-cofactor follows a checkerboard pattern beginning with $+$ in position $(1, 1)$:
$ mat(+, -, +, dots.c; -, +, -, dots.c; +, -, +, dots.c; dots.v, dots.v, dots.v, dots.down). $
For $n = 3$, expansion along the first row gives
$ detmat(a, b, c; d, e, f; g, h, i) = a detmat(e, f; h, i) - b detmat(d, f; g, i) + c detmat(d, e; g, h) = a e i - a f h - b d i + b f g + c d h - c e g, $
which is the formula for a determinant of order $3$ in the subsection "The Determinant", written in other letters.

#example[
  Let
  $ bf(A) = mat(2, -1, 3; 0, 4, 1; 1, 2, -2). $
  Expanding along the second row, which contains a zero, we need
  $ A_(2 2) = (+1) detmat(2, 3; 1, -2) = -7, quad A_(2 3) = (-1) detmat(2, -1; 1, 2) = -5, $
  and obtain $det(bf(A)) = 0 dot A_(2 1) + 4 dot (-7) + 1 dot (-5) = -33$. Along the first column, $A_(1 1) = detmat(4, 1; 2, -2) = -10$ and $A_(3 1) = detmat(-1, 3; 4, 1) = -13$ give the same value, $det(bf(A)) = 2 dot (-10) + 0 dot A_(2 1) + 1 dot (-13) = -33$.
]

#indent In the course's Appendix the determinant is also defined by the _Leibniz formula_, written with the permutations acting on the column indices:
$ det(bf(A)) = sum_(sigma in S_n) op("sgn")(sigma) a_(1 sigma(1)) a_(2 sigma(2)) dots.c a_(n sigma(n)). $
The right-hand side is formula $(triangle.stroked.t)$ applied to $bf(A)^T$, so it equals $det(bf(A)^T) = det(bf(A))$ (Section 2.10; the first line of the proof there is exactly this sum). For $n = 2$ the identity permutation and the transposition $(1, 2)$ give $a_(1 1) a_(2 2) - a_(1 2) a_(2 1)$. Together with Laplace's theorem this shows that the Leibniz formula and the cofactor expansion along any row or column define the same function.

#theorem[
  The determinant of a triangular matrix $bf(A) = (a_(i j))_n$ is the product of its diagonal entries:
  $ det(bf(A)) = a_(1 1) a_(2 2) dots.c a_(n n). $
]

#proof[
  Induction on $n$; for $n = 1$ there is nothing to prove. If $bf(A)$ is upper triangular, the only entry of its first column that can be nonzero is $a_(1 1)$, so the expansion along the first column gives $det(bf(A)) = a_(1 1) A_(1 1) = a_(1 1) det(bf(M)_(1 1))$. The matrix minor $bf(M)_(1 1)$ is upper triangular with diagonal entries $a_(2 2), ..., a_(n n)$, and the induction hypothesis gives the result. For a lower triangular matrix, expand along the first row in the same way.
]

#indent For example,
$ detmat(2, 7, -1; 0, 3, 5; 0, 0, -4) = 2 dot 3 dot (-4) = -24, $
and in particular $det(bf(I)_n) = 1$. Determinants of triangular matrices are therefore easy to compute, and Section 2.9 reduces the general case to this one.

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

#subsec("Determinant and Elementary Row Operations", added: true) // added for MA1522: effect of each elementary row operation on det, determinants of elementary matrices, determinant of row-equivalent matrices, computing the determinant by reduction (with the remaining Appendix proof)

#theorem[
  Let $bf(A)$ be a square matrix, and let $bf(B)$ be obtained from $bf(A)$ by a single elementary row operation. Then
  #[
    #set enum(numbering: "(i)")
    + $det(bf(B)) = det(bf(A))$ if the operation is $R_i + a R_j$ ($i != j$);
    + $det(bf(B)) = c det(bf(A))$ if the operation is $c R_i$;
    + $det(bf(B)) = -det(bf(A))$ if the operation is $R_i <-> R_j$.
  ]
]

#proof[
  By Property 4, the determinant is a linear function of each row, changes sign when two rows are interchanged, and vanishes when the rows are linearly dependent, in particular when two rows are equal. Statement (iii) is the second of these facts, and (ii) is linearity in the $i$-th row. For (i), let $bf(r)_1, ..., bf(r)_n$ be the rows of $bf(A)$; the $i$-th row of $bf(B)$ is $bf(r)_i + a bf(r)_j$, and its other rows are those of $bf(A)$. By linearity in the $i$-th row, $det(bf(B)) = det(bf(A)) + a det(bf(C))$, where $bf(C)$ is obtained from $bf(A)$ by replacing its $i$-th row with $bf(r)_j$. The matrix $bf(C)$ has two equal rows, the $i$-th and the $j$-th, so $det(bf(C)) = 0$.
]

#corollary[
  Let $bf(E)$ be an elementary matrix. If $bf(E)$ corresponds to $R_i + a R_j$, then $det(bf(E)) = 1$; if it corresponds to $c R_i$, then $det(bf(E)) = c$; if it corresponds to $R_i <-> R_j$, then $det(bf(E)) = -1$. In every case $det(bf(E)) != 0$, and
  $ det(bf(E) bf(A)) = det(bf(E)) det(bf(A)) $
  for every square matrix $bf(A)$ of the same order.
]

#proof[
  Apply the theorem to $bf(I)$, whose determinant is $1$, to obtain $det(bf(E))$. Since $bf(E) bf(A)$ is obtained from $bf(A)$ by the row operation corresponding to $bf(E)$ (Section 2.5), the theorem gives $det(bf(E) bf(A)) = det(bf(E)) det(bf(A))$ in each of the three cases.
]

#theorem[
  If $bf(R) = bf(E)_k dots.c bf(E)_2 bf(E)_1 bf(A)$ for a square matrix $bf(A)$ and elementary matrices $bf(E)_1, ..., bf(E)_k$, then
  $ det(bf(R)) = det(bf(E)_k) dots.c det(bf(E)_2) det(bf(E)_1) det(bf(A)). $
]

#proof[
  Apply the corollary $k$ times.
]

#indent Since the determinants of elementary matrices are nonzero, $det(bf(A))$ and $det(bf(R))$ determine each other for row-equivalent matrices $bf(A)$ and $bf(R)$. Let
$ bf(A) rowto^(r_1) dots.c rowto^(r_k) bf(R), $
where $bf(R)$ is a row-echelon form of $bf(A)$, and let $bf(E)_i$ be the elementary matrix corresponding to $r_i$. A square matrix in row-echelon form is upper triangular; if $d_1, ..., d_n$ are its diagonal entries, the theorem on triangular matrices (Section 2.8) gives $det(bf(R)) = d_1 d_2 dots.c d_n$, and hence
$ det(bf(A)) = (d_1 d_2 dots.c d_n) / (det(bf(E)_k) dots.c det(bf(E)_2) det(bf(E)_1)). $
This is the computation of a determinant _by reduction_; for large $n$ it is far cheaper than cofactor expansion.

#example[
  Let us reduce
  $ bf(A) = mat(0, 2, 4; 1, 1, 1; 2, 3, 5) rowto^(R_1 <-> R_2) mat(1, 1, 1; 0, 2, 4; 2, 3, 5) rowto^(R_3 - 2 R_1) mat(1, 1, 1; 0, 2, 4; 0, 1, 3) $
  and further
  $ mat(1, 1, 1; 0, 2, 4; 0, 1, 3) rowto^((1\/2) R_2) mat(1, 1, 1; 0, 1, 2; 0, 1, 3) rowto^(R_3 - R_2) mat(1, 1, 1; 0, 1, 2; 0, 0, 1). $
  The elementary matrices used have determinants $-1$, $1$, $1\/2$, $1$, and the final matrix has determinant $1$. Hence
  $ det(bf(A)) = 1 / ((1)(1\/2)(1)(-1)) = -2, $
  in agreement with the cofactor expansion along the first column: $0 - 1 dot (2 dot 5 - 4 dot 3) + 2 dot (2 dot 1 - 4 dot 1) = -2$.
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

#subsec("Further Properties of the Determinant", added: true) // added for MA1522: det of a product of k matrices, det(A^(-1)), det(cA), A adj(A) = det(A) I for every square matrix, det(A) != 0 in the equivalent statements

By induction on $k$, the theorem on the determinant of a product extends to any number of factors:
$ det(bf(A)_1 bf(A)_2 dots.c bf(A)_k) = det(bf(A)_1) det(bf(A)_2) dots.c det(bf(A)_k). $
For instance, if $bf(A) = bf(L) bf(U)$ is an LU factorization of a square matrix (Section 2.7), then $det(bf(L)) = 1$ and $det(bf(A)) = det(bf(U))$ is the product of the diagonal entries of $bf(U)$.

#theorem[
  Let $bf(A)$ be a square matrix of order $n$.
  #[
    #set enum(numbering: "(i)")
    + If $bf(A)$ is invertible, then $det(bf(A)^(-1)) = det(bf(A))^(-1)$.
    + For every $c in bb(R)$, $det(c bf(A)) = c^n det(bf(A))$.
  ]
]

#proof[
  (i) $1 = det(bf(I)) = det(bf(A)^(-1) bf(A)) = det(bf(A)^(-1)) det(bf(A))$, and $det(bf(A)) != 0$ since $bf(A)$ is invertible. (ii) $c bf(A) = (c bf(I)_n) bf(A)$, and the scalar matrix $c bf(I)_n$ is diagonal with determinant $c^n$; hence $det(c bf(A)) = det(c bf(I)_n) det(bf(A)) = c^n det(bf(A))$.
]

#indent For example, if $bf(A)$ and $bf(B)$ are of order $3$, $det(bf(A)) = 2$ and $det(bf(B)) = -1$, then
$ det(2 bf(A)^T bf(B)^(-1)) = 2^3 det(bf(A)^T) det(bf(B)^(-1)) = 8 dot 2 dot (-1)^(-1) = -16. $

The proof of the adjoint formula above never uses the assumption $det(bf(A)) != 0$: the relations $(*)$ and the two matrix identities derived from them hold for every square matrix. Thus, for every square matrix $bf(A)$,
$ bf(A) adj(bf(A)) = adj(bf(A)) bf(A) = det(bf(A)) bf(I), $
and the _adjoint formula for the inverse_, $bf(A)^(-1) = det(bf(A))^(-1) adj(bf(A))$ for an invertible $bf(A)$, is the special case $det(bf(A)) != 0$; for $n = 2$ it is the formula for the inverse of a $2 times 2$ matrix in Section 2.4. For a singular $bf(A)$ the identity gives $bf(A) adj(bf(A)) = bf(0)$; for example,
$ bf(A) = mat(1, 2; 2, 4), quad adj(bf(A)) = mat(4, -2; -2, 1), quad bf(A) adj(bf(A)) = mat(0, 0; 0, 0). $
Finally, the condition $det(bf(A)) != 0$ is statement (ix) in the list of equivalent statements for invertibility (Section 2.6).

#subsec("Determinant of a Block-Triangular Matrix", beyond: true) // Tyrtyshnikov §5.8


Consider a block-triangular matrix of order $n$:
$ bf(A) = mat(bf(P), bf(R); bf(0), bf(Q)), quad bf(P) in bb(R)^(k times k), quad bf(Q) in bb(R)^(m times m), quad k + m = n. $
Applying Laplace's theorem (Section 2.8) to the system of the first $k$ columns (or rows) immediately gives the useful formula
$ det(bf(A)) = det(bf(P)) det(bf(Q)). $
