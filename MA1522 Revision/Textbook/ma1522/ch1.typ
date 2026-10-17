#import "common.typ": *
#let rowto = math.stretch(sym.arrow.r, size: 100% + 0.8em) // arrow labelled by row operations

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

#subsec("Linear Equations, Solutions and Consistency", added: true) // added for MA1522: linear equations, standard form, homogeneous systems, solutions, general solution, consistency, number of solutions

#definition[
  A _linear equation_ in the variables $x_1, ..., x_n$ is an equation that can be written in the _standard form_
  $ a_1 x_1 + a_2 x_2 + dots.c + a_n x_n = b, $
  where the _coefficients_ $a_1, ..., a_n$ and the _constant_ $b$ are given real numbers. The equation is _homogeneous_ if $b = 0$.
]

#indent Thus each variable enters a linear equation only to the first power and multiplied by a constant. The equation $x_1 = 3 x_2 + 1$ is linear (its standard form is $x_1 - 3 x_2 = 1$), whereas $x_1 x_2 = 1$, $x_1^2 + x_2 = 0$ and $sin x_1 = x_2$ are not. A linear system is a finite collection of linear equations in the same variables; in standard form, with $m$ equations and $n$ variables, it is the system $(1)$ with $m$ and $n$ in place of $n$ and $k$. The system is _homogeneous_ if all its equations are homogeneous, that is, $bf(b) = bf(0)$; the solutions of homogeneous systems are studied in Section 4.2.

#definition[
  Real numbers $c_1, ..., c_n$ give a _solution_ $x_1 = c_1, ..., x_n = c_n$ of a linear system in $n$ variables if every equation of the system becomes a true equality when $c_j$ is substituted for $x_j$, $j = 1, ..., n$; equivalently, $bf(c) = (c_1, ..., c_n)^T$ satisfies $bf(A) bf(c) = bf(b)$. The system is _consistent_ if it has at least one solution and _inconsistent_ if it has none.
]

#indent A system with more than one solution is described by a _general solution_, which captures all of its solutions at once: some of the variables are set equal to arbitrary real numbers $s, t, ...$, called _parameters_, and the other variables are expressed in terms of the parameters, so that every choice of the parameters gives a solution and every solution arises from some choice. The parameters are new symbols. An expression of some variables through the others, such as $y = 3 x - 2$, only restates an equation of the system and is not a general solution.

#example[
  Both equations of the system $3 x - y = 2$, $6 x - 2 y = 4$ express the single condition $y = 3 x - 2$. Choosing $x$ freely gives the general solution
  $ x = s, quad y = 3 s - 2, quad s in bb(R); $
  choosing $y$ freely gives another general solution of the same system, $x = (t + 2)\/3$, $y = t$, $t in bb(R)$. In contrast, the system $x + y = 3$, $x - y = 1$, $3 x + y = 5$ is inconsistent: its first two equations hold only for $x = 2$, $y = 1$, and then $3 x + y = 7 != 5$.
]

#theorem[
  A linear system has either no solution, or exactly one solution, or infinitely many solutions.
]

#proof[
  It suffices to show that a system with two different solutions $bf(u) = (u_1, ..., u_n)^T$ and $bf(v) = (v_1, ..., v_n)^T$ has infinitely many. For $t in bb(R)$ let $bf(w)_t = bf(u) + t (bf(v) - bf(u))$, whose $j$-th entry is $(1 - t) u_j + t v_j$. Substituting it into the $i$-th equation gives
  $ sum_(j=1)^n a_(i j) ((1 - t) u_j + t v_j) = (1 - t) sum_(j=1)^n a_(i j) u_j + t sum_(j=1)^n a_(i j) v_j = (1 - t) b_i + t b_i = b_i, $
  so each $bf(w)_t$ is a solution. Since $bf(v) - bf(u) != bf(0)$, different values of $t$ give different vectors $bf(w)_t$.
]

#indent A more precise description of the set of solutions of a consistent system, as a translate $bf(u) + Null(bf(A))$ of the nullspace, is given in Section 4.2.

#subsec("Geometric Picture in Two and Three Variables", added: true) // added for MA1522: linear systems in 2 and 3 variables as intersections of lines and planes

An equation $a x + b y = c$ in two variables with $(a, b) != (0, 0)$ describes a straight line in the $x y$-plane, and the solutions of a system of such equations are the points lying on all of its lines. For a system of two equations
$ a_1 x + b_1 y = c_1, quad a_2 x + b_2 y = c_2 $
there are three possibilities:
+ the two lines are parallel and distinct, and the system has no solution;
+ the lines meet in exactly one point, and the system has a unique solution;
+ the lines coincide, and the system has infinitely many solutions, its general solution having one parameter.

#example[
  The lines $x + 2 y = 4$ and $3 x - y = 5$ meet only at the point $x = 2$, $y = 1$. The lines $2 x - y = 1$ and $4 x - 2 y = 3$ are parallel and distinct (the second is the line $2 x - y = 3\/2$), so this system is inconsistent. The equations $2 x - y = 1$ and $6 x - 3 y = 3$ describe the same line, and the general solution is $x = s$, $y = 2 s - 1$, $s in bb(R)$.
]

#indent Similarly, an equation $a x + b y + c z = d$ with $(a, b, c) != (0, 0, 0)$ describes a plane in three-dimensional space, and two planes that are not parallel meet in a straight line. For a system of three such equations:
+ there is no solution if two of the planes are parallel and distinct, or if no two of them are parallel but the three lines in which they meet pairwise are parallel and distinct, so that no point lies on all three planes;
+ there is a unique solution if the three planes have exactly one common point;
+ there are infinitely many solutions, with one parameter in the general solution, if the three planes have a common line but do not all coincide;
+ there are infinitely many solutions, with two parameters in the general solution, if the three planes coincide.

#example[
  The planes $x + y + z = 6$, $x - y + z = 2$, $x + y - z = 0$ have the single common point $(1, 2, 3)$. In the system $x + y + z = 2$, $x - y = 0$, $2 x + z = 2$, the third equation is the sum of the first two, so the third plane contains the line in which the first two meet; the general solution is $x = s$, $y = s$, $z = 2 - 2 s$, $s in bb(R)$. In the system $x + y + z = 1$, $x - y = 0$, $2 x + z = 3$ no two planes are parallel, but the sum of the first two equations, $2 x + z = 1$, contradicts the third: the system is inconsistent, and the three lines of pairwise intersection are parallel.
]

#sec("1.2", "Solving a Linear System and Row-Echelon Form")

#subsec("Augmented Matrix", added: true) // added for MA1522: augmented matrix of a linear system

In solving a linear system only its coefficients and constants are manipulated. A system of $m$ equations in $n$ variables, written in standard form, is therefore recorded by its _augmented matrix_
$ (bf(A) | bf(b)) = mat(
    a_(1 1), a_(1 2), dots.c, a_(1 n), b_1;
    a_(2 1), a_(2 2), dots.c, a_(2 n), b_2;
    dots.v, dots.v, , dots.v, dots.v;
    a_(m 1), a_(m 2), dots.c, a_(m n), b_m;
    augment: #(-1)
  ), $
whose $i$-th row lists the coefficients of the $i$-th equation to the left of the bar and its constant to the right. Once the order of the variables is fixed, a system in standard form and its augmented matrix determine each other. A system must therefore first be brought to standard form, with the variables in the same order in every equation and coefficient $0$ for each variable that does not occur in an equation.

#example[
  Let $a$ be a fixed real number. The system
  $ x + 3 z = 2 y - 1, quad 4 y = z, quad a x = y + a $
  has the standard form
  $ x - 2 y + 3 z = -1, quad 4 y - z = 0, quad a x - y = a, $
  and its augmented matrix is
  $ mat(1, -2, 3, -1; 0, 4, -1, 0; a, -1, 0, a; augment: #(-1)). $
  The number $a$ enters both as a coefficient (of $x$ in the third equation) and as a constant.
]

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

#subsec("Pivot Columns and Reduced Row-Echelon Form", added: true) // added for MA1522: zero and nonzero rows, leading entries, REF in words, pivot and non-pivot columns, RREF

In a matrix (in particular, in an augmented matrix) a _zero row_ is a row all of whose entries are $0$; every other row is a _nonzero row_, and its first nonzero entry from the left is its _leading entry_. In these terms, the definition of row-echelon form given above says that a matrix is in row-echelon form if and only if
+ all zero rows, if there are any, lie below all nonzero rows, and
+ the leading entry of each nonzero row lies strictly to the right of the leading entry of the row above it.
#indent Indeed, the leading entry of the $i$-th row is $s_(i j_i)$, and condition 2 is the inequality $j_1 < j_2 < dots.c < j_k$.

#definition[
  Let a matrix be in row-echelon form. A column containing a leading entry is a _pivot column_, and a column containing no leading entry is a _non-pivot column_. The matrix is in _reduced row-echelon form_ (RREF) if, in addition to conditions 1 and 2,
  3. every leading entry is equal to $1$, and
  4. in each pivot column, all entries other than the leading entry are equal to $0$.
]

#indent A matrix in reduced row-echelon form is, in particular, in row-echelon form. Each nonzero row contains exactly one leading entry, and each pivot column contains exactly one, so a matrix in row-echelon form has as many pivot columns as nonzero rows.

#example[
  Of the augmented matrices
  $ mat(0, 1, 2, 3; 1, 0, 1, 2; augment: #(-1)), quad
    mat(2, 1, -1, 3; 0, 0, 1, 2; 0, 0, 0, 0; augment: #(-1)), quad
    mat(1, 3, 0, -2, 5; 0, 0, 1, 4, -1; 0, 0, 0, 0, 0; augment: #(-1)), $
  the first is not in row-echelon form, since the leading entry of its second row lies to the left of that of the first row. The second is in row-echelon form, with pivot columns 1 and 3, but not in reduced row-echelon form: its first leading entry is $2$, and the pivot column 3 contains the nonzero entry $-1$ above the leading entry of the second row. The third is in reduced row-echelon form, with pivot columns 1 and 3 and non-pivot columns 2, 4 and 5.
]

#subsec("Solutions from REF and RREF", added: true) // added for MA1522: back substitution, reading off solutions, parameters for non-pivot columns, inconsistency test

When the augmented matrix of a system is in row-echelon form, the system is solved from the bottom up by _back substitution_; when it is in reduced row-echelon form, the solutions are read off directly. In both cases the variables corresponding to the non-pivot columns of the coefficient part are the ones that become parameters.

#theorem[
  Let the augmented matrix $(bf(A) | bf(b))$ of a linear system in $n$ variables be in row-echelon form with $k$ nonzero rows.
  + The system is inconsistent if and only if the last column of $(bf(A) | bf(b))$ is a pivot column.
  + If the last column is not a pivot column, then for every choice of values of the variables corresponding to the non-pivot columns of $bf(A)$ the system has exactly one solution in which these variables take the chosen values. Hence the general solution is obtained by making these $n - k$ variables parameters and solving for the remaining $k$ variables; the system has a unique solution if $k = n$ and infinitely many solutions if $k < n$.
]

#proof[
  Denote the entries of $(bf(A) | bf(b))$ by $s_(i j)$ to the left of the bar and by $d_i$ to the right of it. If the last column is a pivot column, the row containing its leading entry $d_i != 0$ is the equation $0 x_1 + dots.c + 0 x_n = d_i$, which no values of the variables satisfy.

  Suppose that the last column is not a pivot column. Then all $k$ pivot columns $j_1 < dots.c < j_k$ are columns of $bf(A)$, and $bf(A)$ has $n - k$ non-pivot columns. The zero rows are the equations $0 = 0$, which impose no condition, and row $i$ ($1 <= i <= k$) is the equation
  $ s_(i j_i) x_(j_i) + sum_(j > j_i) s_(i j) x_j = d_i, quad s_(i j_i) != 0. $
  Each variable $x_j$ with $j > j_i$ is either a non-pivot variable or a pivot variable $x_(j_l)$ with $l > i$. Therefore, once the non-pivot variables are fixed, the equations taken in the order $i = k, k - 1, ..., 1$ determine $x_(j_k), x_(j_(k-1)), ..., x_(j_1)$ in turn, uniquely, by
  $ x_(j_i) = 1/s_(i j_i) (d_i - sum_(j > j_i) s_(i j) x_j), $
  and the values so obtained satisfy all the equations. In particular, the system is consistent, which completes the proof of statement 1. If $k < n$, there is at least one parameter, and different values of it give different solutions.
]

#indent If $(bf(A) | bf(b))$ is in reduced row-echelon form, then $s_(i j_i) = 1$ and $s_(i j_l) = 0$ for $l != i$, so the formula becomes $x_(j_i) = d_i - sum s_(i j) x_j$, the sum being over the non-pivot columns $j > j_i$ of $bf(A)$: each pivot variable is read off from its own row, and no substitution is needed.

#example[
  (a) The augmented matrix
  $ mat(1, 3, 0, -2, 5; 0, 0, 1, 4, -1; 0, 0, 0, 0, 0; augment: #(-1)) $
  is in reduced row-echelon form, and the non-pivot columns of its coefficient part are columns 2 and 4. With $x_2 = s$ and $x_4 = t$ the two nonzero rows give $x_1 = 5 - 3 s + 2 t$ and $x_3 = -1 - 4 t$, so the general solution is
  $ x_1 = 5 - 3 s + 2 t, quad x_2 = s, quad x_3 = -1 - 4 t, quad x_4 = t, quad s, t in bb(R). $

  (b) The augmented matrix
  $ mat(0, 2, 1, -1, 0, 1; 0, 0, 0, 1, 2, 3; 0, 0, 0, 0, 1, -1; augment: #(-1)) $
  is in row-echelon form but not in reduced row-echelon form. Its non-pivot columns 1 and 3 give the parameters $x_1 = s$, $x_3 = t$, and back substitution gives $x_5 = -1$ from the third row, $x_4 = 3 - 2 x_5 = 5$ from the second, and $2 x_2 = 1 - x_3 + x_4 = 6 - t$ from the first. The general solution is
  $ x_1 = s, quad x_2 = 3 - t\/2, quad x_3 = t, quad x_4 = 5, quad x_5 = -1, quad s, t in bb(R). $

  (c) In the row-echelon form
  $ mat(1, 2, -1, 4; 0, 1, 3, 1; 0, 0, 0, 2; augment: #(-1)) $
  the last column is a pivot column: the third row is the equation $0 x_1 + 0 x_2 + 0 x_3 = 2$, and the system is inconsistent.
]

#sec("1.3", "Elementary Row Operations")

#subsec("Elementary Row Operations and Row Equivalence", added: true) // added for MA1522: three types of elementary row operations, notation, reverse operations, row equivalence, row-equivalent systems have the same solutions

#definition[
  The _elementary row operations_ on a matrix are of three types:
  + interchanging two rows, $R_i <-> R_j$ ($i != j$);
  + adding a multiple of one row to another row, $R_i + c R_j$ ($i != j$, $c in bb(R)$);
  + multiplying a row by a nonzero constant, $a R_i$ ($a != 0$).
]

#indent The operation $R_i + c R_j$ replaces the $i$-th row by the sum of the $i$-th row and $c$ times the $j$-th row, and leaves all other rows, the $j$-th included, unchanged. Thus $R_1 + R_2$ and $R_2 + R_1$ are different operations:
$ mat(1, 0; 0, 1) rowto^(R_1 + R_2) mat(1, 1; 0, 1), quad quad mat(1, 0; 0, 1) rowto^(R_2 + R_1) mat(1, 0; 1, 1). $
An expression such as $2 R_2 + R_1$ is not an elementary row operation: it stands for two of them, $2 R_2$ followed by $R_2 + R_1$. Operations performed in succession are written from left to right in the order in which they are performed, because in general the result depends on the order:
$ mat(1, 2; 3, 4) rowto^(3 R_1) mat(3, 6; 3, 4) rowto^(R_1 <-> R_2) mat(3, 4; 3, 6), \
  mat(1, 2; 3, 4) rowto^(R_1 <-> R_2) mat(3, 4; 1, 2) rowto^(3 R_1) mat(9, 12; 1, 2). $
Operations that give the same result in either order, such as $R_2 - 2 R_1$ and $R_3 + R_1$ (each changes a different row, using a row that neither of them changes), may be written one above the other over a single arrow.

The requirement $a != 0$ in the third type is essential. The system $x + y = 3$, $x - y = 1$ has the unique solution $x = 2$, $y = 1$, but "multiplying" its second row by $0$,
$ mat(1, 1, 3; 1, -1, 1; augment: #(-1)) rowto^(0 R_2) mat(1, 1, 3; 0, 0, 0; augment: #(-1)), $
produces a system with the general solution $x = 3 - s$, $y = s$, $s in bb(R)$.

#proposition[
  Each elementary row operation is undone by an elementary row operation of the same type, called its _reverse_:
  + the reverse of $R_i <-> R_j$ is $R_i <-> R_j$;
  + the reverse of $R_i + c R_j$ is $R_i - c R_j$;
  + the reverse of $a R_i$ is $(1\/a) R_i$.
]

#proof[
  The first and third statements are obvious. Let the rows be $bf(r)_1, ..., bf(r)_m$. The operation $R_i + c R_j$ replaces $bf(r)_i$ by $bf(r)_i + c bf(r)_j$ and does not change $bf(r)_j$, since $i != j$; then $R_i - c R_j$ replaces $bf(r)_i + c bf(r)_j$ by $(bf(r)_i + c bf(r)_j) - c bf(r)_j = bf(r)_i$.
]

#indent For instance, $R_3 - 2 R_1$ is undone by $R_3 + 2 R_1$, and $(1\/3) R_2$ by $3 R_2$.

#definition[
  Two matrices of the same size are _row equivalent_ if one of them can be obtained from the other by a finite sequence of elementary row operations.
]

#indent If $bf(B)$ is obtained from $bf(A)$ by a sequence of elementary row operations, then $bf(A)$ is obtained from $bf(B)$ by the reverse operations taken in the opposite order. Hence row equivalence is symmetric; it is clearly also reflexive and transitive.

#theorem[
  If the augmented matrices of two linear systems are row equivalent, then the two systems have the same solutions.
]

#proof[
  It suffices to consider a single elementary row operation, transforming a system $(S)$ into a system $(S')$. Each equation of $(S')$ is an equation of $(S)$, or a nonzero multiple of one, or the sum of an equation of $(S)$ and a multiple of another equation of $(S)$. Hence every solution of $(S)$ satisfies every equation of $(S')$. Since $(S)$ is obtained from $(S')$ by the reverse operation, which is again an elementary row operation, the same argument shows that every solution of $(S')$ is a solution of $(S)$.
]

#indent Since solutions are easily obtained from a row-echelon form (Section 1.2), a linear system is solved by reducing its augmented matrix to row-echelon or reduced row-echelon form by elementary row operations; algorithms for this are given in Section 1.4. In matrix language, each elementary row operation is multiplication on the left by the invertible matrix obtained from $bf(I)$ by the same operation, an elementary matrix (Section 2.5). The subsection below describes the operations $R_i <-> R_j$ and $R_i + c R_j$ in this form.

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

#subsec("Gaussian and Gauss–Jordan Elimination as Algorithms", added: true) // added for MA1522: Gaussian elimination (steps 1-4), Gauss-Jordan elimination (steps 5-6), worked example, existence and uniqueness of the RREF

The elimination described above is organized as follows; it applies to any matrix, in particular to the augmented matrix of a linear system. A matrix in row-echelon form (reduced row-echelon form) that is row equivalent to $bf(A)$ is called _a row-echelon form_ (_a reduced row-echelon form_) _of_ $bf(A)$.

#algorithm(title: "Gaussian elimination")[
  + Find the leftmost column that does not consist entirely of zeros.
  + If the top entry of this column is $0$, interchange the top row with a row that has a nonzero entry in this column.
  + To each row below the top row add a suitable multiple of the top row, so that the entry of that row in this column becomes $0$.
  + Cover the top row and apply Steps 1–4 to the submatrix formed by the remaining rows. Stop when no rows remain or the remaining rows are all zero; the matrix is then in row-echelon form.
]

#algorithm(title: "Gauss–Jordan elimination")[
  #set par(first-line-indent: 0pt)
  Perform Steps 1–4 of Gaussian elimination, and then:
  5. Multiply each nonzero row by the reciprocal of its leading entry, so that all leading entries become $1$.
  6. Beginning with the lowest nonzero row and working upward, add suitable multiples of each row to the rows above it, so that all entries above its leading entry become $0$.
  The matrix is then in reduced row-echelon form.
]

#example[
  For the system $x + 2 y - z = 3$, $2 x + 3 y + z = 8$, $-x + y + 2 z = 1$, Gaussian elimination gives
  $ mat(1, 2, -1, 3; 2, 3, 1, 8; -1, 1, 2, 1; augment: #(-1))
    rowto^(R_2 - 2 R_1)_(R_3 + R_1)
    mat(1, 2, -1, 3; 0, -1, 3, 2; 0, 3, 1, 4; augment: #(-1))
    rowto^(R_3 + 3 R_2)
    mat(1, 2, -1, 3; 0, -1, 3, 2; 0, 0, 10, 10; augment: #(-1)). $
  The last matrix is in row-echelon form, and back substitution gives $z = 1$, then $y = 3 z - 2 = 1$ from the second row, and $x = 3 - 2 y + z = 2$ from the first. Gauss–Jordan elimination continues with
  $ rowto^((1\/10) R_3)_(-R_2)
    mat(1, 2, -1, 3; 0, 1, -3, -2; 0, 0, 1, 1; augment: #(-1))
    rowto^(R_2 + 3 R_3)_(R_1 + R_3)
    mat(1, 2, 0, 4; 0, 1, 0, 1; 0, 0, 1, 1; augment: #(-1))
    rowto^(R_1 - 2 R_2)
    mat(1, 0, 0, 2; 0, 1, 0, 1; 0, 0, 1, 1; augment: #(-1)), $
  and the unique solution $x = 2$, $y = 1$, $z = 1$ is read off from the reduced row-echelon form.
]

#theorem(title: "3")[
  Every matrix has a row-echelon form and a reduced row-echelon form: Gaussian elimination produces the former, and Gauss–Jordan elimination the latter.
]

#proof[
  We use induction on the number of rows; a matrix with one row, or a zero matrix, is already in row-echelon form. After Steps 1–3 the top row has a nonzero entry in some column $j_1$, and every other row has zeros in columns $1, ..., j_1$. By the induction hypothesis, Step 4 brings the submatrix of these rows to row-echelon form; its nonzero rows have their leading entries to the right of column $j_1$, so the whole matrix is in row-echelon form (cf. Theorem 1).

  Step 5 does not move the leading entries, so the matrix stays in row-echelon form and its leading entries become $1$. In Step 6, when multiples of the $i$-th row are added to the rows above it, the $i$-th row has zeros in all pivot columns other than its own: to the left of its leading entry by the echelon form, and in the pivot columns of the lower rows because these columns have already been cleared. Hence these operations make the entries above the $i$-th leading entry zero without changing any other entry of a pivot column, and at the end conditions 1–4 of reduced row-echelon form hold.
]

#indent A matrix has many row-echelon forms; for example,
$ mat(1, 2; 3, 4) rowto^(R_2 - 3 R_1) mat(1, 2; 0, -2) rowto^(2 R_1) mat(2, 4; 0, -2), $
and both matrices obtained are in row-echelon form. The reduced row-echelon form, however, is unique.

#theorem(title: "4")[
  Every matrix is row equivalent to exactly one matrix in reduced row-echelon form.
]

#proof[
  Existence is Theorem 3. Let $bf(R)$ and $bf(R)'$ be reduced row-echelon forms of an $m times n$ matrix $bf(A)$. Then $bf(R)$ and $bf(R)'$ are row equivalent, and so are $(bf(R) | bf(0))$ and $(bf(R)' | bf(0))$; by the theorem of Section 1.3 the homogeneous systems $bf(R) bf(x) = bf(0)$ and $bf(R)' bf(x) = bf(0)$ have the same solutions. We prove $bf(R) = bf(R)'$ by induction on $n$.

  If $n = 1$, a matrix in reduced row-echelon form is either the zero column or the first column of $bf(I)_m$. An elementary row operation turns a zero column into a zero column and, being reversible, a nonzero column into a nonzero one; hence $bf(R) = bf(R)'$.

  Let $n > 1$, and let $bf(R)_0$, $bf(R)'_0$ and $bf(A)_0$ be obtained from $bf(R)$, $bf(R)'$ and $bf(A)$ by deleting the last column. Deleting the last column preserves conditions 1–4 (a row whose only nonzero entry was in the last column becomes a zero row, but it was the lowest nonzero row), and the operations that reduce $bf(A)$ to $bf(R)$ or $bf(R)'$ reduce $bf(A)_0$ to $bf(R)_0$ or $bf(R)'_0$. By the induction hypothesis, $bf(R)_0 = bf(R)'_0$.

  Suppose that $bf(R) != bf(R)'$. Then they differ only in the last column, say in the $i$-th entry: $r_(i n) != r'_(i n)$. For every solution $bf(x)$ of $bf(R) bf(x) = bf(0)$, which is also a solution of $bf(R)' bf(x) = bf(0)$, the $i$-th entry of $(bf(R) - bf(R)') bf(x) = bf(0)$ is $(r_(i n) - r'_(i n)) x_n = 0$, so $x_n = 0$. If the last column of $bf(R)$ were a non-pivot column, $x_n$ would be a parameter of the general solution of $bf(R) bf(x) = bf(0)$ (Section 1.2), and there would be a solution with $x_n = 1$. Hence the last column of $bf(R)$ is a pivot column, and likewise the last column of $bf(R)'$. Let $p$ be the number of nonzero rows of $bf(R)_0 = bf(R)'_0$. The leading entry in the last column of $bf(R)$ lies in the first row that is zero in $bf(R)_0$, that is, in row $p + 1$, and by conditions 3 and 4 the last column of $bf(R)$ is the $(p + 1)$-th column of $bf(I)_m$. The same holds for $bf(R)'$, so $bf(R) = bf(R)'$, a contradiction.
]

#indent Because of Theorem 4 one speaks of _the_ reduced row-echelon form of a matrix.

#corollary[
  All row-echelon forms of a matrix $bf(A)$ have their leading entries in the same positions, namely those of the reduced row-echelon form of $bf(A)$. In particular, their pivot columns and their number of nonzero rows, equal to $rank(bf(A))$ by Theorem 1, do not depend on the row-echelon form chosen; they are called the _pivot columns_ of $bf(A)$.
]

#proof[
  Steps 5 and 6 of Gauss–Jordan elimination, applied to a row-echelon form of $bf(A)$, do not move its leading entries and produce a reduced row-echelon form of $bf(A)$, which by Theorem 4 is the reduced row-echelon form of $bf(A)$.
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

#subsec("Solving a Linear System: Summary", added: true) // added for MA1522: summary procedure for solving a linear system; consistency and number of solutions

#algorithm(title: "Solving a linear system")[
  + Write the system in standard form.
  + Form its augmented matrix $(bf(A) | bf(b))$.
  + Reduce $(bf(A) | bf(b))$ to a row-echelon form or to its reduced row-echelon form, for instance by Gaussian or Gauss–Jordan elimination (Section 1.4).
  + If the last column is a pivot column, the system is inconsistent. Otherwise it is consistent; make the variables corresponding to the non-pivot columns of $bf(A)$ parameters $s, t, ... in bb(R)$.
  + From the reduced row-echelon form, read off the remaining variables; from a row-echelon form, find them by back substitution, starting with the lowest nonzero row.
  + Write down the general solution (the unique solution if there are no parameters).
]

#indent The theorem of Section 1.2, combined with the theorem of Section 1.3 on row-equivalent systems and the corollary of Section 1.4, gives the following criterion, which does not depend on the row-echelon form used.

#theorem(title: "3")[
  Let $bf(A) bf(x) = bf(b)$ be a linear system in $n$ variables.
  + The system is inconsistent if and only if the last column of $(bf(A) | bf(b))$ is a pivot column, that is, if and only if $rank(bf(A)) < rank((bf(A) | bf(b)))$.
  + A consistent system has a unique solution if every column of $bf(A)$ is a pivot column, that is, if $rank(bf(A)) = n$, and infinitely many solutions otherwise; its general solution has $n - rank(bf(A))$ parameters, one for each non-pivot column of $bf(A)$.
]

#proof[
  Let $bf(R)$ be a row-echelon form of $(bf(A) | bf(b))$. The system with augmented matrix $bf(R)$ has the same solutions as $bf(A) bf(x) = bf(b)$ (Section 1.3), and $bf(R)$ without its last column is a row-echelon form of $bf(A)$, with the same pivot columns as $bf(R)$ among the first $n$ columns. By the corollary of Section 1.4, the number of nonzero rows of $bf(R)$ is $rank((bf(A) | bf(b)))$, and that of $bf(R)$ without its last column is $rank(bf(A))$; these numbers differ (by one) exactly when the last column of $bf(R)$ is a pivot column. It remains to apply the theorem of Section 1.2 to $bf(R)$, whose number of nonzero rows is then $rank(bf(A))$.
]

#indent The rank form of statement 1 is the Kronecker–Capelli theorem of Section 4.2.

#subsec("Systems with Unknown Coefficients", added: true) // added for MA1522: linear systems with unknown constants in the coefficients and the constants

When some coefficients or constants of a system are letters, standing for fixed but unknown real numbers, the same elimination is used, with one precaution: an operation that is legitimate for some values of the letters may be illegitimate for others. The operations $R_i <-> R_j$ and $R_i + c R_j$ may be used with any expression $c$, but multiplying a row by an expression such as $a$ or $1\/(a - 1)$ is an elementary row operation only for the values of $a$ at which this expression is defined and nonzero. Likewise, an entry such as $a - 1$ can serve as a leading entry only when $a != 1$. One therefore reduces as far as possible without such divisions (a row interchange that brings a constant nonzero entry to the top often helps) and then considers separately the values of the letters at which a divisor or a would-be leading entry vanishes. The answer must cover all values of the letters, not one chosen value.

#example[
  Let $a in bb(R)$, and consider the system $x + y + a z = 1$, $x + a y + z = 1$, $a x + y + z = 1$. Using only operations of the form $R_i + c R_j$, we obtain
  $ mat(1, 1, a, 1; 1, a, 1, 1; a, 1, 1, 1; augment: #(-1))
    & rowto^(R_2 - R_1)_(R_3 - a R_1)
    mat(1, 1, a, 1; 0, a - 1, 1 - a, 0; 0, 1 - a, 1 - a^2, 1 - a; augment: #(-1)) \
    & rowto^(R_3 + R_2)
    mat(1, 1, a, 1; 0, a - 1, 1 - a, 0; 0, 0, (1 - a)(a + 2), 1 - a; augment: #(-1)). $
  If $a = 1$, the last two rows are zero, and the system reduces to the single equation $x + y + z = 1$: it is consistent, with the general solution $x = 1 - s - t$, $y = s$, $z = t$, $s, t in bb(R)$ (two parameters). If $a = -2$, the last row is $(0, 0, 0 | 3)$, so the last column is a pivot column and the system is inconsistent. If $a != 1, -2$, the matrix is in row-echelon form with the leading entries $1$, $a - 1$, $(1 - a)(a + 2)$ in the three columns of the coefficient part, so the solution is unique. Back substitution gives $z = 1\/(a + 2)$, then $(a - 1)(y - z) = 0$, so $y = z$, and finally $x = 1 - y - a z = 1\/(a + 2)$:
  $ x = y = z = 1/(a + 2), quad a != 1, -2. $
]

#subsec("Constructing a System with a Given General Solution", added: true) // added for MA1522: constructing a linear system from its general solution

Suppose a general solution is given in which every parameter is equal to one of the variables, as is the case for the general solutions obtained in Section 1.2. Replacing each parameter by that variable in the formulas for the other variables, and moving all variables to the left-hand side, gives a linear system. Every vector of the given form satisfies this system; conversely, if $bf(x)$ is a solution of the system, then giving each parameter the value of the corresponding variable in $bf(x)$ shows that $bf(x)$ is of the given form. Hence the system has exactly the given general solution.

#example[
  For the general solution
  $ x_1 = 2 + s - 3 t, quad x_2 = s, quad x_3 = -1 + 2 t, quad x_4 = t, quad s, t in bb(R), $
  substituting $s = x_2$ and $t = x_4$ into the formulas for $x_1$ and $x_3$ gives the system
  $ x_1 - x_2 + 3 x_4 = 2, quad x_3 - 2 x_4 = -1, $
  whose augmented matrix
  $ mat(1, -1, 0, 3, 2; 0, 0, 1, -2, -1; augment: #(-1)) $
  is in reduced row-echelon form; its non-pivot columns 2 and 4 give back the general solution above.
]

#indent A system with more equations and the same solutions is obtained by appending equations that are linear combinations of these, since they impose no new condition. For instance, appending the sum of the two equations, $x_1 - x_2 + x_3 + x_4 = 1$, gives a system of three equations. The operations $R_3 - R_1$ and $R_3 - R_2$ turn its augmented matrix into the matrix above followed by a zero row, so by the theorem of Section 1.3 it has the same general solution.
