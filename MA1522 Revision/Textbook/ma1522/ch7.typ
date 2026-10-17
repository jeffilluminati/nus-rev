#import "common.typ": *
#let Rng = math.op("R") // range R(T), upright as in the course slides

#chapter("Chapter 7. Linear Transformations")

#sec("7.1", "Introduction to Linear Transformations")

#subsec("Mappings, Functions, Operators") // Tyrtyshnikov §2.2


All three words in the title of this section mean the same thing—we are speaking of a rule according to which to each element $x$ of a set $X$ there is assigned a uniquely determined element $y = f(x)$ of a set $Y$. Specifying such a rule is equivalent to choosing a subset
$ Gamma = {(x, f(x)) : x in X} subset X times Y, $
called the _graph_ of the mapping (function, operator) $f$.

The element $y = f(x)$ is called the _image_ of the element $x$, and $x$ is called a _preimage_ of the element $y$ under the mapping $f$. To emphasize that $f$ acts from $X$ into $Y$, one writes $f : X -> Y$; the set $X$ is called the _domain_ and $Y$ the _codomain_ of $f$.

The set $f(X) equiv {y : y = f(x) "for some" x in X}$ is called the _range_ (or _image_) of the mapping $f$.

If $M subset Y$, then the set $f^(-1)(M) equiv {x : f(x) in M}$ is called the _complete preimage_ of the set $M$. If $M = {y}$, one writes $f^(-1)(y) = f^(-1)(M)$.

A mapping $f : X -> Y$ is called _invertible_ if there exists a mapping $g : Y -> X$ such that $f(g(y)) = y$ $forall y in Y$ and $g(f(x)) = x$ $forall x in X$. In this case, $g$ is called the _inverse mapping_ for $f$, and one writes $g = f^(-1)$.

A mapping $f$ is called _bijective_ if for every $y in Y$ the complete preimage $f^(-1)(y)$ consists of exactly one element; that is, $f$ is both _injective_, or _one-to-one_ (each $f^(-1)(y)$ has at most one element: $f(x_1) = f(x_2)$ implies $x_1 = x_2$), and _surjective_, or _onto_ (each $f^(-1)(y)$ is nonempty: $f(X) = Y$). (The full textbook calls a bijective mapping "one-to-one"; in this edition, as in the course, one-to-one means injective.) It is easy to show that invertibility is equivalent to being bijective.

#subsec("Linear Transformations") // Tyrtyshnikov §27.1


Any matrix $bf(A) in bb(C)^(m times n)$ can be naturally regarded as a mapping that sends a vector $bf(x) in bb(C)^n$ to the vector $bf(A) bf(x) in bb(C)^m$. Obviously, this mapping possesses the _linearity property_:#footnote[This property can also be viewed as the property of _preserving operations_ under a mapping of one vector space into another space over the same field. Such mappings are called _homomorphisms_.]
$ bf(A)(alpha bf(x) + beta bf(y)) = alpha bf(A) bf(x) + beta bf(A) bf(y) quad forall alpha, beta in bb(C), quad forall bf(x), bf(y) in bb(C)^n. $
(For a real $m times n$ matrix $bf(A)$ this is the linear transformation $T_bf(A) : bb(R)^n -> bb(R)^m$, $T_bf(A)(bf(u)) = bf(A) bf(u)$, defined by $bf(A)$.)

#indent The linearity property holds for many very important mappings in vector spaces whose elements are functions united by some common feature (continuity, differentiability, etc.). Above all, one should mention mappings associated with differentiation and integration of functions. Thus, we have sufficient grounds to study the linearity property from a more general standpoint.

#definition[
  Let $V$ and $W$ be arbitrary vector spaces over the same field $bb(P)$. A mapping $T : V -> W$ with the property
  $ T(alpha bf(x) + beta bf(y)) = alpha T(bf(x)) + beta T(bf(y)) quad forall alpha, beta in bb(P), quad forall bf(x), bf(y) in V $
  is called a _linear transformation_ (or _linear operator_) from $V$ to $W$. For linear transformations the argument is often written without parentheses, $T bf(x) = T(bf(x))$; in this edition we keep the parentheses, as the course does.
]

#subsec([Linear Transformations from $bb(R)^n$ to $bb(R)^m$], added: true) // added for MA1522: geometric interpretation of matrix multiplication; definition on R^n, additivity and homogeneity, linear combinations, T(0) = 0, maps that are not linear

In the course $V = bb(R)^n$ and $W = bb(R)^m$ with real scalars, and vectors are written as columns. Thus a mapping $T : bb(R)^n -> bb(R)^m$ is a linear transformation if
$ T(alpha bf(u) + beta bf(v)) = alpha T(bf(u)) + beta T(bf(v)) quad "for all" bf(u), bf(v) in bb(R)^n "and all scalars" alpha, beta; $
$bb(R)^n$ is its _domain_ and $bb(R)^m$ its _codomain_.

An $m times n$ matrix $bf(A)$ sends each $bf(v) in bb(R)^n$ to $bf(A) bf(v) in bb(R)^m$, so it may be pictured as a mapping of $bb(R)^n$ into $bb(R)^m$, the linear transformation $T_bf(A)$. Since $bf(A)(alpha bf(u)) = alpha bf(A) bf(u)$ and $bf(A)(bf(u) + bf(v)) = bf(A) bf(u) + bf(A) bf(v)$, the image of a linear combination is the same linear combination of the images. Geometrically, the parallelogram with sides $bf(u)$, $bf(v)$ and diagonal $bf(u) + bf(v)$ is carried to the (possibly degenerate) parallelogram with sides $bf(A) bf(u)$, $bf(A) bf(v)$ and diagonal $bf(A) bf(u) + bf(A) bf(v)$.

#example(title: "Matrices as mappings")[
  #set enum(numbering: "1.")
  + The $3 times 2$ matrix with columns $bf(e)_1, bf(e)_3 in bb(R)^3$ maps the plane onto the plane $y = 0$ in $bb(R)^3$:
    $ mat(1, 0; 0, 0; 0, 1) mat(x; y) = mat(x; 0; y). $
  + The $2 times 3$ matrix below projects $bb(R)^3$ onto the plane $x = 0$, $(x, y, z)^T |-> (0, y, z)^T$, and identifies this plane with $bb(R)^2$, $(0, y, z)^T |-> (y, z)^T$:
    $ mat(0, 1, 0; 0, 0, 1) mat(x; y; z) = mat(y; z). $
  + In the plane, the matrix $bf(R)_theta$ below is the rotation about the origin through the angle $theta$, and $bf(F)$ is the reflection in the $x$-axis:
    $ bf(R)_theta &= mat(cos theta, -sin theta; sin theta, cos theta): quad mat(r cos phi; r sin phi) |-> mat(r cos(phi + theta); r sin(phi + theta)); \
      bf(F) &= mat(1, 0; 0, -1): quad mat(x; y) |-> mat(x; -y). $
  + The zero matrix $bf(0)_(m times n)$ sends every vector of $bb(R)^n$ to the zero vector of $bb(R)^m$.
]

#proposition(title: "Basic properties")[
  Let $T : bb(R)^n -> bb(R)^m$ be a mapping.
  #set enum(numbering: "(a)")
  + $T$ is linear if and only if it is _additive_ and _homogeneous_:
    $ T(bf(u) + bf(v)) = T(bf(u)) + T(bf(v)), quad T(alpha bf(u)) = alpha T(bf(u)) quad "for all" bf(u), bf(v) in bb(R)^n, alpha in bb(R). $
  + If $T$ is linear, then for any $bf(u)_1, ..., bf(u)_k in bb(R)^n$ and scalars $c_1, ..., c_k$,
    $ T(c_1 bf(u)_1 + c_2 bf(u)_2 + ... + c_k bf(u)_k) = c_1 T(bf(u)_1) + c_2 T(bf(u)_2) + ... + c_k T(bf(u)_k). $
  + If $T$ is linear, then $T(bf(0)) = bf(0)$: the zero vector of $bb(R)^n$ goes to the zero vector of $bb(R)^m$.
]

#proof[
  (a) With $alpha = beta = 1$ the defining identity gives additivity, and with $beta = 0$ it gives homogeneity. Conversely, additivity and then homogeneity give $T(alpha bf(u) + beta bf(v)) = T(alpha bf(u)) + T(beta bf(v)) = alpha T(bf(u)) + beta T(bf(v))$.

  (b) Induction on $k$. For $k = 1$ this is homogeneity; for $k >= 2$, by (a),
  $T(c_1 bf(u)_1 + ... + c_k bf(u)_k) = T(c_1 bf(u)_1 + ... + c_(k - 1) bf(u)_(k - 1)) + c_k T(bf(u)_k)$, and the induction hypothesis applies to the first term.

  (c) $T(bf(0)) = T(0 dot bf(0)) = 0 dot T(bf(0)) = bf(0)$.
]

#indent Consequently, a mapping $T : bb(R)^n -> bb(R)^m$ is _not_ linear as soon as one of the following holds: $T(bf(0)) != bf(0)$; $T(alpha bf(u)) != alpha T(bf(u))$ for some scalar $alpha$ and some $bf(u)$; $T(bf(u) + bf(v)) != T(bf(u)) + T(bf(v))$ for some $bf(u)$, $bf(v)$. The condition $T(bf(0)) = bf(0)$ alone is necessary but not sufficient.

#example(title: "Checking linearity")[
  The mapping $T : bb(R)^3 -> bb(R)^2$, $T(x, y, z)^T = (x - 2 z, 3 y + z)^T$, is linear: for $bf(u)_i = (x_i, y_i, z_i)^T$, $i = 1, 2$,
  $ T(alpha bf(u)_1 + beta bf(u)_2) &= mat(alpha x_1 + beta x_2 - 2(alpha z_1 + beta z_2); 3(alpha y_1 + beta y_2) + alpha z_1 + beta z_2) \
    &= alpha mat(x_1 - 2 z_1; 3 y_1 + z_1) + beta mat(x_2 - 2 z_2; 3 y_2 + z_2) = alpha T(bf(u)_1) + beta T(bf(u)_2). $
]

#example(title: "Mappings that are not linear")[
  #set enum(numbering: "1.")
  + The translation $T : bb(R)^2 -> bb(R)^2$, $T(x, y)^T = (x + 1, y)^T$, is not linear, because $T(bf(0)) = (1, 0)^T != bf(0)$.
  + The norm $T : bb(R)^2 -> bb(R)$, $T(bf(u)) = norm(bf(u))$, satisfies $T(bf(0)) = 0$ but is not linear: $T(-bf(e)_1) = 1 != -1 = -T(bf(e)_1)$, and $T(bf(e)_1 + bf(e)_2) = sqrt(2) != 2 = T(bf(e)_1) + T(bf(e)_2)$.
]

#subsec("Matrix of a Linear Transformation") // Tyrtyshnikov §28.1


Consider a linear transformation $T : V_n -> V_m$, where $V_n$ and $V_m$ are vector spaces of dimensions $n$ and $m$ (over a common field $bb(P)$).

Fix some basis $S = {bf(u)_1, ..., bf(u)_n}$ of $V_n$ and some basis $C = {bf(v)_1, ..., bf(v)_m}$ of $V_m$. By the linearity of the transformation $T$,
#eq($ T(x_1 bf(u)_1 + ... + x_n bf(u)_n) = x_1 T(bf(u)_1) + ... + x_n T(bf(u)_n). $, $(1)$)
Therefore $T$ is completely determined by its action on the basis vectors $bf(u)_1, ..., bf(u)_n$. Let us expand the images of the basis vectors with respect to the basis of the codomain:
#eq($ T(bf(u)_j) = a_(1 j) bf(v)_1 + ... + a_(m j) bf(v)_m, quad j = 1, ..., n. $, $(2)$)
From $(1)$ and $(2)$ we obtain
$ T(x_1 bf(u)_1 + ... + x_n bf(u)_n) = (a_(1 1) x_1 + ... + a_(1 n) x_n) bf(v)_1 + ... + \
+ (a_(m 1) x_1 + ... + a_(m n) x_n) bf(v)_m. $
Consequently,
$ T(x_1 bf(u)_1 + ... + x_n bf(u)_n) = y_1 bf(v)_1 + ... + y_m bf(v)_m quad <=> \
<=> quad mat(y_1; dots.v; y_m) = mat(a_(1 1), ..., a_(1 n); dots.v, dots.v, dots.v; a_(m 1), ..., a_(m n)) mat(x_1; dots.v; x_n). $
The matrix appearing on the right is called the _matrix of the linear transformation_ $T$ in the pair of bases $S$ and $C$ (its representation with respect to $S$ and $C$); we denote it by $[T]_(S, C)$. Its $j$-th column is $[T(bf(u)_j)]_C$, and the equivalence above reads $[T(bf(x))]_C = [T]_(S, C) [bf(x)]_S$ for every $bf(x) in V_n$.

For $T : bb(R)^n -> bb(R)^m$ and the standard basis $C = E$ of $bb(R)^m$ (where $[bf(w)]_E = bf(w)$), this matrix is the _representation of $T$ with respect to the basis $S$_, denoted in the course by $[T]_S$; if, in addition, $S = E = {bf(e)_1, ..., bf(e)_n}$ is the standard basis of $bb(R)^n$, it is the _standard matrix_ $bf(A) = [T]_E$ of $T$:
$ [T]_S &= [T]_(S, E) = mat(T(bf(u)_1), T(bf(u)_2), dots.c, T(bf(u)_n)), \
  bf(A) &= [T]_E = mat(T(bf(e)_1), T(bf(e)_2), dots.c, T(bf(e)_n)). $
Thus $T(bf(x)) = [T]_S [bf(x)]_S$ and $T(bf(x)) = bf(A) bf(x)$ for all $bf(x) in bb(R)^n$. (Note that the course's $[T]_S$ is $[T]_(S, E)$, not $[T]_(S, S)$.)

Thus, any fixed pair of bases generates three _isomorphisms_, that is, bijective linear mappings (see Tyrtyshnikov, §12.2):
$ V_n <-> bb(P)^n, quad V_m <-> bb(P)^m, quad cal(L)(V_n, V_m) <-> bb(P)^(m times n), $
where $cal(L)(V_n, V_m)$ is the vector space of all linear transformations from the space $V_n$ into the space $V_m$, and $bb(P)^(m times n)$ is the vector space of all $m times n$ matrices with
entries from the field $bb(P)$. From this, in particular, it is seen that the dimension of the space of linear transformations $cal(L)(V_n, V_m)$ is equal to $m n$.

#example[
  Let $D : V -> W$ be the differentiation transformation on the space of polynomials $V = W$ of degree $2$ and lower. Consider the basis $S = {1 + t, 1 - t, t^2}$ of $V$ and the basis $C = {1, t, t^2}$ of $W$. Obviously,
  $ D(1 + t) = 1, quad D(1 - t) = -1, quad D(t^2) = 2 t. $
  Therefore, in the pair of bases $S$ and $C$, the matrix of the linear transformation $D$ has the form
  $ [D]_(S, C) = mat(1, -1, 0; 0, 0, 2; 0, 0, 0). $
  What will be the matrix of the same transformation if the same basis $S$ is chosen in $W = V$? For this we need to find the expansions of the images of the vectors $1 + t$, $1 - t$, $t^2$ of $S$ with respect to the same vectors $1 + t$, $1 - t$, $t^2$:
  $ cases(
    reverse: #true,
    D(1 + t) = 1/2 (1 + t) + 1/2 (1 - t)\,,
    D(1 - t) = -1/2 (1 + t) - 1/2 (1 - t)\,,
    D(t^2) = (1 + t) - (1 - t)
  ) quad => quad [D]_(S, S) = mat(1/2, -1/2, 1; 1/2, -1/2, -1; 0, 0, 0). $
]

#subsec("The Standard Matrix", added: true) // added for MA1522: standard matrix theorem (T linear iff T(u) = Au for a unique A with columns T(e_i)); finding the standard matrix from a formula

#theorem(title: "Standard Matrix")[
  A mapping $T : bb(R)^n -> bb(R)^m$ is a linear transformation if and only if there is an $m times n$ matrix $bf(A)$ such that
  $ T(bf(u)) = bf(A) bf(u) quad "for all" bf(u) in bb(R)^n. $
  Such a matrix is unique, namely
  $ bf(A) = mat(T(bf(e)_1), T(bf(e)_2), dots.c, T(bf(e)_n)), $
  where $E = {bf(e)_1, ..., bf(e)_n}$ is the standard basis of $bb(R)^n$: the $j$-th column of $bf(A)$ is $T(bf(e)_j)$.
]

#proof[
  If $T(bf(u)) = bf(A) bf(u)$ for all $bf(u)$, then $T$ is linear by the linearity of matrix multiplication. Conversely, let $T$ be linear. Every $bf(u) = (u_1, ..., u_n)^T$ equals $u_1 bf(e)_1 + ... + u_n bf(e)_n$, so by linearity
  $ T(bf(u)) = u_1 T(bf(e)_1) + ... + u_n T(bf(e)_n) = mat(T(bf(e)_1), dots.c, T(bf(e)_n)) mat(u_1; dots.v; u_n) = bf(A) bf(u). $
  If also $T(bf(u)) = bf(B) bf(u)$ for all $bf(u)$, then for each $j$ the $j$-th columns $bf(B) bf(e)_j = T(bf(e)_j) = bf(A) bf(e)_j$ coincide, so $bf(B) = bf(A)$.
]

#indent This matrix is the standard matrix $bf(A) = [T]_E$ of $T$ defined above. By the theorem, the rule $bf(A) |-> T_bf(A)$ is a bijective correspondence between the real $m times n$ matrices and the linear transformations from $bb(R)^n$ to $bb(R)^m$: every linear transformation is multiplication by exactly one matrix. If $T$ is given by a formula, its standard matrix is read off by collecting the coefficients of each variable; the coefficients of the $j$-th variable form the $j$-th column.

#example[
  For $T : bb(R)^3 -> bb(R)^2$ given by
  $ T mat(x; y; z) = mat(4 x - y + 2 z; x + 3 z) = x mat(4; 1) + y mat(-1; 0) + z mat(2; 3) = \
  = mat(4, -1, 2; 1, 0, 3) mat(x; y; z), $
  the standard matrix is $bf(A) = mat(4, -1, 2; 1, 0, 3)$; its columns are $T(bf(e)_1)$, $T(bf(e)_2)$, $T(bf(e)_3)$.
]

#subsec("Composition of Linear Transformations") // Tyrtyshnikov §28.2


The product of linear transformations $T_1 : V_n -> V_m$ and $T_2 : V_m -> V_k$ is defined as the composition of mappings: $T_2 T_1$ is the transformation from $V_n$ to $V_k$ defined by the rule $(T_2 T_1)(bf(x)) = T_2(T_1(bf(x)))$. It is elementary to verify that the product of linear transformations is a linear transformation.

Let $bf(A) = [T_1]_(S, C)$ be the matrix of a linear transformation $T_1$ in a pair of bases $S$ and $C$, and let $bf(B) = [T_2]_(C, D)$ be the matrix of a linear transformation $T_2$ in a pair of bases $C$ and $D$. Then _the product of the matrices $bf(B) bf(A)$ is the matrix of the product of the transformations $T_2 T_1$ in the pair of bases $S$ and $D$_: $[T_2 T_1]_(S, D) = [T_2]_(C, D) [T_1]_(S, C)$.

The proof reduces to a direct verification. Note that the full textbook actually began with the definition of matrix multiplication (reproduced here in Sections 2.1 and 2.2) and, in effect, with a discussion of the composition of linear mappings!

#subsec("Change of Bases") // Tyrtyshnikov §28.3


Let $[T]_(S, C)$ be the matrix of a linear transformation $T$ in a pair of bases $S = {bf(u)_1, ..., bf(u)_n}$ and $C = {bf(v)_1, ..., bf(v)_m}$. How can one find the matrix $[T]_(S', C')$ of the same transformation in another pair of bases: $S' = {bf(u)'_1, ..., bf(u)'_n}$ and $C' = {bf(v)'_1, ..., bf(v)'_m}$?

Consider the equalities
$ T(x_1 bf(u)_1 + ... + x_n bf(u)_n) &= y_1 bf(v)_1 + ... + y_m bf(v)_m, \
  T(z_1 bf(u)'_1 + ... + z_n bf(u)'_n) &= w_1 bf(v)'_1 + ... + w_m bf(v)'_m. $
According to the definition of the matrices $[T]_(S, C)$ and $[T]_(S', C')$, we find
$ [T]_(S, C) bf(x) = bf(y), quad [T]_(S', C') bf(z) = bf(w), $
$ bf(x) = mat(x_1; dots.v; x_n), quad bf(y) = mat(y_1; dots.v; y_m), quad bf(z) = mat(z_1; dots.v; z_n), quad bf(w) = mat(w_1; dots.v; w_m). $
Next we write
$ bf(u)'_j &= p_(1 j) bf(u)_1 + ... + p_(n j) bf(u)_n, quad 1 <= j <= n, \
  bf(v)'_i &= q_(1 i) bf(v)_1 + ... + q_(m i) bf(v)_m, quad 1 <= i <= m, $
and introduce the transition matrices
$ bf(P) = mat(p_(1 1), ..., p_(1 n); dots.v, dots.v, dots.v; p_(n 1), ..., p_(n n)), quad bf(Q) = mat(q_(1 1), ..., q_(1 m); dots.v, dots.v, dots.v; q_(m 1), ..., q_(m m)). $
The columns of $bf(P)$ are $[bf(u)'_j]_S$, so $bf(P)$ is the transition matrix from $S'$ to $S$, and $bf(Q)$ is the transition matrix from $C'$ to $C$ (see Section 3.8; some books, including the full textbook, name these matrices the other way round). Then $bf(x) = bf(P) bf(z)$ and $bf(y) = bf(Q) bf(w)$. Consequently, $[T]_(S, C) (bf(P) bf(z)) = bf(Q) bf(w) => (bf(Q)^(-1) [T]_(S, C) bf(P)) bf(z) = bf(w) =>$
#eq($ [T]_(S', C') = bf(Q)^(-1) [T]_(S, C) bf(P). $, $(*)$)

#indent For $T : bb(R)^n -> bb(R)^m$ with $C = C' = E$ (so that $bf(Q) = bf(I)_m$) and $S' = E$, formula $(*)$ becomes $bf(A) = [T]_S bf(P)$, where $bf(A)$ is the standard matrix of $T$ and $bf(P)$ is the transition matrix from $E$ to $S$.

Recall that matrices $bf(A)$ and $bf(B)$ are called _equivalent_ if $bf(B) = bf(M) bf(A) bf(N)$ for some invertible $bf(M)$ and $bf(N)$; matrices of the same size are equivalent if and only if they have the same rank, and a matrix of rank $r$ is equivalent to the matrix whose first $r$ diagonal entries are $1$ and all other entries are $0$ (proved in Tyrtyshnikov, §8.6).

#proposition(title: "1")[
  Matrices are equivalent if and only if they are matrices of one and the same linear transformation in some pairs of bases.
]

#proof[
  Obviously, $(*)$ means the equivalence of the matrices $[T]_(S', C')$ and $[T]_(S, C)$. If $bf(B) = bf(M) bf(A) bf(N)$, then $bf(M)$ and $bf(N)$ can be regarded as transition matrices for different pairs of bases.
]

#corollary[
  For matrices of the same size to be matrices of one and the same linear transformation in some pairs of bases, it is necessary and sufficient that they have the same rank.
]

#indent Let $bf(A)$ be the matrix of a linear transformation $T$ in some pair of bases. If $r = rank(bf(A))$, then $bf(A)$ is equivalent to the matrix $bf(B) = (b_(i j))$ in which $b_(1 1) = ... = b_(r r) = 1$ and all other entries are equal to $0$. Consequently, there exists a pair of "canonical" bases in which $T$ is determined by the matrix $bf(B)$.

Thus, by choosing a pair of bases, the matrix of a linear transformation can acquire a form so simple that it may turn out to be almost useless for studying the individual properties of the given transformation. Therefore, studying a transformation cannot, in general, be reduced to studying its matrix.

If $V_n = V_m$, then it becomes possible to take $C = S$. Owing to the fact that images and preimages are considered in one and the same basis, the matrix of the transformation now contains everything needed for any detailed study of it. The same holds for any other pair of bases $S'$ and $C'$, provided $C' = S'$. In this case, of course, $bf(Q) = bf(P) =>$
#eq($ [T]_(S', S') = bf(P)^(-1) [T]_(S, S) bf(P). $, $(**)$)
Matrices $bf(A)$ and $bf(B)$ are called _similar_ if $bf(B) = bf(P)^(-1) bf(A) bf(P)$ for some invertible matrix $bf(P)$. Obviously, the following proposition holds.

#proposition(title: "2")[
  Matrices are similar if and only if they are matrices of one and the same linear transformation in some bases, provided identical bases are chosen in the common domain and codomain.
]

#problem(number: 1)[
  Given arbitrary numbers $beta_1, ..., beta_(n - 1)$, prove that any bidiagonal $n times n$ matrix $bf(A)$ of the form
  $ bf(A) = mat(
    alpha_1, 1, , , 0;
    , alpha_2, 1, ;
    , , dots.down, dots.down;
    , , , alpha_(n - 1), 1;
    0, , , , alpha_n
  ) $
  is similar to some $n times n$ matrix $bf(B) = (b_(i j))$ in which $b_(1 1) = beta_1, ..., b_(n - 1, n - 1) = beta_(n - 1)$.
]

#subsec("Recovering a Linear Transformation from the Images of a Basis", added: true) // added for MA1522: T(v) = [T]_S [v]_S and A = [T]_S P; computing the standard matrix from the images of a basis; images of a set that is not a basis

Let $T : bb(R)^n -> bb(R)^m$ be linear and $S = {bf(u)_1, ..., bf(u)_n}$ a basis of $bb(R)^n$. We have seen that
$ T(bf(v)) = [T]_S [bf(v)]_S quad "for all" bf(v) in bb(R)^n, quad "where" quad [T]_S = mat(T(bf(u)_1), dots.c, T(bf(u)_n)), $
and, by $(*)$, that the standard matrix is $bf(A) = [T]_S bf(P)$, where $bf(P)$ is the transition matrix from $E$ to $S$. Both facts are also immediate. If $bf(v) = c_1 bf(u)_1 + ... + c_n bf(u)_n$, then $[bf(v)]_S = (c_1, ..., c_n)^T$ and, by linearity,
$ T(bf(v)) = c_1 T(bf(u)_1) + ... + c_n T(bf(u)_n) = [T]_S [bf(v)]_S; $
since $bf(P) bf(v) = bf(P) [bf(v)]_E = [bf(v)]_S$, we get $bf(A) bf(v) = T(bf(v)) = [T]_S bf(P) bf(v)$ for every $bf(v)$, whence $bf(A) = [T]_S bf(P)$. The transition matrix from $S$ to $E$ is $bf(U) = mat(bf(u)_1, dots.c, bf(u)_n)$, because $[bf(u)_j]_E = bf(u)_j$; hence $bf(P) = bf(U)^(-1)$ (Section 3.6). Thus _a linear transformation is completely determined by the images of the vectors of a basis_, and its formula is recovered as follows.

#algorithm(title: "Standard matrix from the images of a basis")[
  + Form the matrices $bf(U) = mat(bf(u)_1, dots.c, bf(u)_n)$ and $[T]_S = mat(T(bf(u)_1), dots.c, T(bf(u)_n))$.
  + Compute $bf(U)^(-1)$, for instance by Gauss–Jordan elimination $(bf(U) | bf(I)) -> (bf(I) | bf(U)^(-1))$.
  + Then $bf(A) = [T]_S bf(U)^(-1)$, and $T(bf(x)) = bf(A) bf(x)$ is the formula for $T$.
]

#example[
  Let $T : bb(R)^3 -> bb(R)^2$ be a linear transformation with
  $ T mat(1; 1; 0) = mat(1; 1), quad T mat(0; 1; 1) = mat(0; 4), quad T mat(1; 0; 1) = mat(3; 3). $
  The three vectors form a basis $S$ of $bb(R)^3$, since the matrix $bf(U)$ with these columns has $det(bf(U)) = 2 != 0$. Here
  $ bf(U) = mat(1, 0, 1; 1, 1, 0; 0, 1, 1), quad [T]_S = mat(1, 0, 3; 1, 4, 3), quad bf(U)^(-1) = 1/2 mat(1, 1, -1; -1, 1, 1; 1, -1, 1), $
  and therefore
  $ bf(A) = [T]_S bf(U)^(-1) = mat(2, -1, 1; 0, 1, 3), quad T mat(x; y; z) = mat(2 x - y + z; y + 3 z). $
]

#proposition(title: [When the images determine $T$])[
  Let $bf(u)_1, ..., bf(u)_k in bb(R)^n$. The images $T(bf(u)_1), ..., T(bf(u)_k)$ determine a linear transformation $T : bb(R)^n -> bb(R)^m$ uniquely if and only if $span{bf(u)_1, ..., bf(u)_k} = bb(R)^n$.
]

#proof[
  If the vectors span $bb(R)^n$, some of them form a basis of $bb(R)^n$ (Section 3.6), and $T$ is determined by its values on that basis. If they do not, the $n times k$ matrix $bf(U) = mat(bf(u)_1, dots.c, bf(u)_k)$ has $rank(bf(U)^T) = rank(bf(U)) < n$, so by the Rank–Nullity Theorem (Section 4.2) there is a vector $bf(y) != bf(0)$ with $bf(U)^T bf(y) = bf(0)$, that is, $bf(y) dot bf(u)_i = 0$ for all $i$. Fix any nonzero $bf(c) in bb(R)^m$ and put $T'(bf(x)) = T(bf(x)) + (bf(y) dot bf(x)) bf(c)$. Then $T'$ is linear (its standard matrix is $bf(A) + bf(c) bf(y)^T$) and $T'(bf(u)_i) = T(bf(u)_i)$ for all $i$, but $T'(bf(y)) = T(bf(y)) + norm(bf(y))^2 bf(c) != T(bf(y))$.
]

#example(title: "Too little information")[
  Suppose a linear transformation $T : bb(R)^3 -> bb(R)^2$ satisfies
  $ T mat(1; 0; 1) = mat(1; 2), quad T mat(0; 1; 1) = mat(0; 1), quad T mat(1; 1; 2) = mat(1; 3). $
  The third vector is the sum of the first two (and the data agree with this), so the three vectors are linearly dependent and span only a plane; $T$ is not determined. Indeed, for any real $s$ and $t$ the linear transformation
  $ T mat(x; y; z) = mat(1 - s, -s, s; 2 - t, 1 - t, t) mat(x; y; z) = mat(x + s(z - x - y); 2 x + y + t(z - x - y)) $
  takes the three prescribed values, since $z - x - y = 0$ at each of the three given vectors.
]

#sec("7.2", "Range and Kernel of a Linear Transformation")

#subsec("Kernel and Range of a Linear Transformation") // Tyrtyshnikov §28.6


The set $ker(T) equiv {bf(x) in V_n : T(bf(x)) = bf(0)}$ is called the _kernel_ of the linear transformation $T$, and the set $Rng(T) equiv {bf(y) in V_m : bf(y) = T(bf(x)) "for some" bf(x) in V_n}$ is called its _range_ (or _image_). The dimension of the range is called the _rank_ of the transformation $T$, and the dimension of the kernel is called its _nullity_ (or _defect_). Notation: $rank(T) = dim(Rng(T))$, $nullity(T) = dim(ker(T))$.

#proposition(title: "1")[
  The kernel of a linear transformation $T : V -> W$ is a subspace of $V$, and its range is a subspace of $W$.
]

#proof[
  Let $bf(x), bf(y) in ker(T)$. Then $T(alpha bf(x) + beta bf(y)) = alpha T(bf(x)) + beta T(bf(y)) = alpha bf(0) + beta bf(0) = bf(0) => alpha bf(x) + beta bf(y) in ker(T)$. Let $bf(x), bf(y) in Rng(T)$. Then $bf(x) = T(bf(u))$ and $bf(y) = T(bf(v))$ for some $bf(u), bf(v) in V => alpha bf(x) + beta bf(y) = T(alpha bf(u) + beta bf(v)) => alpha bf(x) + beta bf(y) in Rng(T)$.
]

#theorem(title: "Rank–Nullity Theorem")[
  Let $V$ be finite-dimensional. Then
  $ dim(ker(T)) + dim(Rng(T)) = dim(V). $
]

#proof[
  Let $dim(ker(T)) = k$ and let $bf(v)_1, ..., bf(v)_k$ be a basis of the subspace $ker(T)$. Complete it with some vectors $bf(v)_(k + 1), ..., bf(v)_n$ to a basis of $V$. Obviously,
  $ Rng(T) = span{T(bf(v)_(k + 1)), ..., T(bf(v)_n)}. $
  It remains to prove that the vectors $T(bf(v)_(k + 1)), ..., T(bf(v)_n)$ are linearly independent.

  Suppose $alpha_(k + 1) T(bf(v)_(k + 1)) + ... + alpha_n T(bf(v)_n) = bf(0) => T(alpha_(k + 1) bf(v)_(k + 1) + ... + alpha_n bf(v)_n) = bf(0) => alpha_(k + 1) bf(v)_(k + 1) + ... + alpha_n bf(v)_n in ker(T) => alpha_(k + 1) bf(v)_(k + 1) + ... + alpha_n bf(v)_n = beta_1 bf(v)_1 + ... + beta_k bf(v)_k$ for some scalars $beta_1, ..., beta_k => alpha_(k + 1) = ... = alpha_n = 0$.
]

#remark[
  This theorem could have been left unproved, since it is a consequence of a fact we already know: for any matrix $bf(A)$, the sum of its rank and its nullity (the dimension of its nullspace $Null(bf(A))$, the solution space of the homogeneous system $bf(A) bf(x) = bf(0)$) equals the number of its columns. We know that the rank coincides with the dimension of the column space $Col(bf(A))$, and the latter is obviously the range of $bf(A)$ (regarded as the transformation of multiplication by the given matrix).
]

#proposition(title: "2")[
  Suppose a linear transformation $T$ acts from $V$ to $V$. Then its kernel and range are invariant under $T$.
]

#proof[
  The invariance of the kernel is obvious, since every vector in it is mapped to $bf(0)$.

  Let $bf(x) in Rng(T)$. Then $bf(x) = T(bf(u)) => T(bf(x)) = T(T(bf(u))) => T(bf(x)) in Rng(T)$.
]

#problem(number: 1)[
  For two linear transformations acting from $V$ to $W$, the sum of their kernels coincides with $V$. Prove that the range of the sum of these transformations equals the sum of their ranges. Does this hold in the case of three transformations?
]

#subsec("Range and Kernel via the Standard Matrix", added: true) // added for MA1522: R(T) = Col(A), ker(T) = Null(A), rank(T) = rank(A), nullity(T) = nullity(A); range and kernel are subspaces (appendix)

For $T : bb(R)^n -> bb(R)^m$ the definitions above read
$ Rng(T) &= T(bb(R)^n) = {bf(v) in bb(R)^m : bf(v) = T(bf(u)) "for some" bf(u) in bb(R)^n}, \
  ker(T) &= {bf(u) in bb(R)^n : T(bf(u)) = bf(0)}. $
The proof of Proposition 1 shows that both sets are closed under linear combinations; both also contain the zero vector, because $T(bf(0)) = bf(0)$ (Section 7.1). Hence $Rng(T)$ is a subspace of the codomain $bb(R)^m$ and $ker(T)$ is a subspace of the domain $bb(R)^n$.

#proposition(title: "3")[
  Let $bf(A)$ be the standard matrix of a linear transformation $T : bb(R)^n -> bb(R)^m$. Then
  $ Rng(T) = Col(bf(A)), quad ker(T) = Null(bf(A)). $
  Consequently $rank(T) = rank(bf(A))$ and $nullity(T) = nullity(bf(A))$; in particular, $rank(T) + nullity(T) = n$.
]

#proof[
  Write $bf(A) = mat(bf(a)_1, dots.c, bf(a)_n)$. As $bf(u) = (u_1, ..., u_n)^T$ runs over $bb(R)^n$, the vector $T(bf(u)) = bf(A) bf(u) = u_1 bf(a)_1 + ... + u_n bf(a)_n$ runs over all linear combinations of the columns of $bf(A)$; hence $Rng(T) = Col(bf(A))$. Next, $T(bf(u)) = bf(0)$ if and only if $bf(A) bf(u) = bf(0)$, so $ker(T) = Null(bf(A))$. Taking dimensions gives the equalities for the rank and the nullity, and the last equality is the Rank–Nullity Theorem for matrices (Section 4.2).
]

#indent In particular, $bf(v) in Rng(T)$ if and only if the system $bf(A) bf(x) = bf(v)$ is consistent. So the range is described by row reducing $(bf(A) | bf(v))$ with an arbitrary $bf(v)$, and the kernel is the solution set of $bf(A) bf(x) = bf(0)$.

#example[
  Consider the linear transformation $T : bb(R)^3 -> bb(R)^3$ given by
  $ T mat(x; y; z) = mat(x + 2 y - z; 2 x + 4 y + z; x + 2 y + 2 z). $
  The row operations $R_2 - 2 R_1$, $R_3 - R_1$, $R_3 - R_2$ give
  $ mat(1, 2, -1, v_1; 2, 4, 1, v_2; 1, 2, 2, v_3; augment: #(-1)) -> mat(1, 2, -1, v_1; 0, 0, 3, v_2 - 2 v_1; 0, 0, 0, v_1 - v_2 + v_3; augment: #(-1)). $
  Hence $Rng(T)$ is the plane $v_1 - v_2 + v_3 = 0$, spanned by the first and third columns $(1, 2, 1)^T$, $(-1, 1, 2)^T$ of $bf(A)$ (the pivot columns), and $rank(T) = 2$. Solving $bf(A) bf(x) = bf(0)$ gives $z = 0$, $x = -2 y$, so $ker(T) = span{(-2, 1, 0)^T}$ and $nullity(T) = 1$; indeed $2 + 1 = 3$.

  For the transformation $T(x, y, z)^T = (4 x - y + 2 z, x + 3 z)^T$ of Section 7.1,
  $ bf(A) = mat(4, -1, 2; 1, 0, 3) quad "has the reduced row-echelon form" quad mat(1, 0, 3; 0, 1, 10). $
  So $rank(T) = 2$ and therefore $Rng(T) = bb(R)^2$, while the kernel is the line spanned by $(-3, -10, 1)^T$ and $nullity(T) = 1$.
]

#subsec("Injective and Surjective Linear Transformations", added: true) // added for MA1522: injectivity iff ker(T) = {0} (appendix proof); surjectivity iff rank(T) = m; full rank equals number of columns / rows, with the injective / surjective item; n <= m and n >= m

Recall (Section 7.1) that $T : bb(R)^n -> bb(R)^m$ is _injective_ (one-to-one) if $T(bf(u)_1) = T(bf(u)_2)$ implies $bf(u)_1 = bf(u)_2$, that is, every $bf(v) in Rng(T)$ is the image of exactly one $bf(u) in bb(R)^n$; and $T$ is _surjective_ (onto) if every $bf(v) in bb(R)^m$ is the image of some $bf(u) in bb(R)^n$, that is, $Rng(T) = bb(R)^m$.

#theorem(title: "Injectivity")[
  A linear transformation $T : bb(R)^n -> bb(R)^m$ is injective if and only if its kernel is trivial, $ker(T) = {bf(0)}$.
]

#proof[
  Let $T$ be injective. If $bf(u) in ker(T)$, then $T(bf(u)) = bf(0) = T(bf(0))$, hence $bf(u) = bf(0)$. Conversely, let $ker(T) = {bf(0)}$ and $T(bf(u)_1) = T(bf(u)_2)$. Then $T(bf(u)_1 - bf(u)_2) = T(bf(u)_1) - T(bf(u)_2) = bf(0)$, so $bf(u)_1 - bf(u)_2 in ker(T)$, that is, $bf(u)_1 = bf(u)_2$.
]

#indent In the language of linear systems: if $bf(A)$ is the standard matrix of $T$, then $T(bf(x)) = bf(v)$ means $bf(A) bf(x) = bf(v)$, and the solution set of a consistent system $bf(A) bf(x) = bf(v)$ is $bf(u) + Null(bf(A))$ for any particular solution $bf(u)$ (Section 4.2). So the system has a unique solution for every $bf(v) in Rng(T) = Col(bf(A))$ exactly when $bf(A) bf(x) = bf(0)$ has only the trivial solution.

#theorem(title: "Surjectivity")[
  A linear transformation $T : bb(R)^n -> bb(R)^m$ with standard matrix $bf(A)$ is surjective if and only if $rank(T) = m$, that is, $rank(bf(A)) = m$.
]

#proof[
  $T$ is surjective if and only if $Rng(T) = bb(R)^m$, and then $rank(T) = dim(bb(R)^m) = m$. Conversely, let $dim(Rng(T)) = m$. A basis of $Rng(T)$ consists of $m$ linearly independent vectors of $bb(R)^m$; by the Basis Extension Lemma (Section 3.7) it can be completed to a basis of $bb(R)^m$, which has exactly $m$ vectors (Basis Theorem, Section 3.6), so nothing is added and $Rng(T) = bb(R)^m$. Finally, $rank(T) = rank(bf(A))$ by Proposition 3.
]

#indent The two theorems extend the equivalent statements for matrices of full rank (Section 4.2) by one item each.

#theorem(title: "Full Rank Equals Number of Columns")[
  Let $bf(A)$ be an $m times n$ matrix and $T : bb(R)^n -> bb(R)^m$, $T(bf(u)) = bf(A) bf(u)$, the linear transformation defined by $bf(A)$. The following statements are equivalent.
  #set enum(numbering: "(i)")
  + $rank(bf(A)) = n$: the rank equals the number of columns.
  + The rows of $bf(A)$ span $bb(R)^n$: $Row(bf(A)) = bb(R)^n$.
  + The columns of $bf(A)$ are linearly independent.
  + The homogeneous system $bf(A) bf(x) = bf(0)$ has only the trivial solution: $Null(bf(A)) = {bf(0)}$.
  + $bf(A)^T bf(A)$ is an invertible matrix of order $n$.
  + $bf(A)$ has a left inverse: $bf(B) bf(A) = bf(I)_n$ for some $n times m$ matrix $bf(B)$.
  + $T$ is injective.
]

#proof[
  Statements (i)–(vi) are equivalent by the theorem on full rank equal to the number of columns (Section 4.2). Since $ker(T) = Null(bf(A))$ (Proposition 3), the injectivity theorem gives (iv) $<=>$ (vii).
]

#theorem(title: "Full Rank Equals Number of Rows")[
  Let $bf(A)$ be an $m times n$ matrix and $T : bb(R)^n -> bb(R)^m$, $T(bf(u)) = bf(A) bf(u)$, the linear transformation defined by $bf(A)$. The following statements are equivalent.
  #set enum(numbering: "(i)")
  + $rank(bf(A)) = m$: the rank equals the number of rows.
  + The columns of $bf(A)$ span $bb(R)^m$: $Col(bf(A)) = bb(R)^m$.
  + The rows of $bf(A)$ are linearly independent.
  + The system $bf(A) bf(x) = bf(b)$ is consistent for every $bf(b) in bb(R)^m$.
  + $bf(A) bf(A)^T$ is an invertible matrix of order $m$.
  + $bf(A)$ has a right inverse: $bf(A) bf(B) = bf(I)_m$ for some $n times m$ matrix $bf(B)$.
  + $T$ is surjective.
]

#proof[
  Statements (i)–(vi) are equivalent by the theorem on full rank equal to the number of rows (Section 4.2). Since $Rng(T) = Col(bf(A))$ (Proposition 3), $T$ is surjective if and only if $Col(bf(A)) = bb(R)^m$; thus (ii) $<=>$ (vii).
]

#corollary[
  Let $T : bb(R)^n -> bb(R)^m$ be a linear transformation. If $T$ is injective, then $n <= m$; if $T$ is surjective, then $n >= m$. In particular, a bijective linear transformation $bb(R)^n -> bb(R)^m$ exists only for $n = m$.
]

#proof[
  Let $bf(A)$ be the standard matrix of $T$; recall that $rank(bf(A)) <= min{m, n}$ (Section 4.2). If $T$ is injective, then $n = rank(bf(A)) <= m$; if $T$ is surjective, then $m = rank(bf(A)) <= n$.
]

#example(title: "Injective but not surjective")[
  Let $T : bb(R)^2 -> bb(R)^3$, $T(x, y)^T = (x + y, x - y, 2 x + y)^T$. Row reduction of the augmented matrix of $T(bf(x)) = bf(v)$ gives
  $ mat(1, 1, v_1; 1, -1, v_2; 2, 1, v_3; augment: #(-1)) -> mat(1, 1, v_1; 0, -2, v_2 - v_1; 0, 0, 3 v_1 + v_2 - 2 v_3; augment: #(-1)). $
  So $bf(v) in Rng(T)$ if and only if $3 v_1 + v_2 - 2 v_3 = 0$; the range is a plane, and $T$ is not surjective. For such $bf(v)$ the solution is unique, $x = (v_1 + v_2) \/ 2$, $y = (v_1 - v_2) \/ 2$; thus $T$ is injective, and $bf(v) = bf(0)$ gives $ker(T) = {bf(0)}$. Accordingly $rank(bf(A)) = 2 = n$, and a left inverse of $bf(A)$ is
  $ bf(B) = (bf(A)^T bf(A))^(-1) bf(A)^T = 1/14 mat(1, 5, 4; 4, -8, 2), quad bf(B) bf(A) = bf(I)_2. $
  In the other direction, the transformation $T : bb(R)^3 -> bb(R)^2$ of the example on the standard matrix in Section 7.1 has $rank(T) = 2 = m$ and $nullity(T) = 1$ (see the previous subsection); it is surjective but not injective.
]

#subsec("The Inverse of a Linear Transformation") // Tyrtyshnikov §28.7


A transformation $T : V -> W$ is called _invertible_ if there exists a transformation $S : W -> V$ such that $T(S(bf(y))) = bf(y) quad forall bf(y) in W$ and $S(T(bf(x))) = bf(x) quad forall bf(x) in V$. In this case $S$ is called the _inverse transformation_ for $T$.

#proposition[
  If a linear transformation is invertible, then the inverse transformation is also linear.
]

#proof[
  Any vectors $bf(y)_1, bf(y)_2 in W$ can be represented in the form $bf(y)_1 = T(bf(x)_1)$, $bf(y)_2 = T(bf(x)_2)$. Therefore,
  $ S(alpha bf(y)_1 + beta bf(y)_2) = S(alpha T(bf(x)_1) + beta T(bf(x)_2)) = S(T(alpha bf(x)_1 + beta bf(x)_2)) = alpha bf(x)_1 + beta bf(x)_2. $
  It remains to take into account that
  $ bf(x)_1 = S(bf(y)_1), quad bf(x)_2 = S(bf(y)_2). $
]

#theorem[
  Let $T : V -> W$ be a linear transformation, and let $V$ and $W$ be finite-dimensional spaces of the same dimension. The transformation $T$ is invertible if and only if $ker(T) = {bf(0)}$.
]

#proof[
  Let $dim(V) = dim(W) = n$. By the rank–nullity theorem, if $dim(ker(T)) = 0$, then $dim(Rng(T)) = n$. This means that for each vector $bf(y) in W$ there exists $bf(x) in V$ such that $T(bf(x)) = bf(y)$ ($T$ is surjective). Moreover, such a vector $bf(x)$ is unique (otherwise the kernel would contain a nonzero vector), so $T$ is also injective. Define the transformation $S : W -> V$ by the rule $S(bf(y)) = bf(x)$. Then $T(S(bf(y))) = bf(y)$ and $S(T(bf(x))) = bf(x) => S$ is the inverse transformation for $T$.

  Conversely, if it is known that $T$ is an invertible transformation, then its kernel can only be zero (if $bf(x)_1 != bf(x)_2$ and $T(bf(x)_1) = T(bf(x)_2)$, this contradicts the invertibility of the transformation $T$).
]

#remark[
  If a linear transformation $T : V -> W$ is invertible, then necessarily $W = Rng(T)$, that is, $T$ is surjective. At the same time, the condition $W = Rng(T)$ is not sufficient for the invertibility of $T$.
]

#problem(number: 2)[
  Linear transformations $S$ and $T$ are such that the transformation $S + T$ is invertible. Prove that the transformations $P = (S + T)^(-1) S$ and $Q = (S + T)^(-1) T$ commute.
]

#problem(number: 3)[
  A transformation $T : bb(C)^n -> bb(C)^n$ preserves inner products. Prove that $T$ is an invertible transformation. Must it be linear?
]

#problem(number: 4)[
  A linear transformation $T : bb(R)^(n times n) -> bb(R)^(n times n)$ preserves the determinant of a matrix. Prove that every such transformation is invertible.
]

#subsec("Equivalent Statements for Invertibility", added: true) // added for MA1522: final equivalent statements of invertibility (adds T injective, T surjective); T bijective iff A invertible, inverse transformation

#theorem(title: "Equivalent Statements for Invertibility")[
  Let $bf(A)$ be a square matrix of order $n$, and let $T : bb(R)^n -> bb(R)^n$, $T(bf(u)) = bf(A) bf(u)$, be the linear transformation defined by $bf(A)$. The following statements are equivalent.
  #set enum(numbering: "(i)")
  + $bf(A)$ is invertible.
  + $bf(A)^T$ is invertible.
  + (left inverse) $bf(B) bf(A) = bf(I)$ for some matrix $bf(B)$.
  + (right inverse) $bf(A) bf(B) = bf(I)$ for some matrix $bf(B)$.
  + The reduced row-echelon form of $bf(A)$ is $bf(I)_n$.
  + $bf(A)$ is a product of elementary matrices.
  + The homogeneous system $bf(A) bf(x) = bf(0)$ has only the trivial solution.
  + The system $bf(A) bf(x) = bf(b)$ has a unique solution for every $bf(b) in bb(R)^n$.
  + $det(bf(A)) != 0$.
  + The columns of $bf(A)$ are linearly independent; so are its rows.
  + The columns of $bf(A)$ span $bb(R)^n$; so do its rows.
  + $rank(bf(A)) = n$ ($bf(A)$ has full rank).
  + $nullity(bf(A)) = 0$.
  + $0$ is not an eigenvalue of $bf(A)$.
  + $T$ is injective.
  + $T$ is surjective.
]

#proof[
  The equivalence of (i)–(xiv) is the theorem on equivalent statements for invertibility in Section 6.1. For $m = n$, the two theorems on full rank above give (vii) $<=>$ (xv) (the homogeneous system has only the trivial solution if and only if $T$ is injective) and (xi) $<=>$ (xvi) (the columns of $bf(A)$ span $bb(R)^n$ if and only if $T$ is surjective).
]

#indent If $bf(A)$ is invertible, then $T$ is bijective and its inverse transformation is multiplication by $bf(A)^(-1)$: $T(bf(A)^(-1) bf(v)) = bf(v)$ and $bf(A)^(-1) T(bf(u)) = bf(u)$. Conversely, let $T$ have an inverse transformation $S$ (by Section 7.1, this is the same as $T$ being bijective). Then $S$ is linear by the proposition above; if $bf(B)$ is its standard matrix, then $bf(A) bf(B) bf(u) = T(S(bf(u))) = bf(u)$ for all $bf(u)$, so $bf(A) bf(B) = bf(I)$ and $bf(A)$ is invertible with $bf(B) = bf(A)^(-1)$. Thus a linear transformation $T : bb(R)^n -> bb(R)^n$ is bijective if and only if its standard matrix $bf(A)$ is invertible, and the standard matrix of $T^(-1)$ is then $bf(A)^(-1)$.

#example[
  Let $T : bb(R)^3 -> bb(R)^3$, $T(x, y, z)^T = (x + 2 y, y + z, x + 2 y + z)^T$. Its standard matrix
  $ bf(A) = mat(1, 2, 0; 0, 1, 1; 1, 2, 1) quad "has" quad det(bf(A)) = 1, quad bf(A)^(-1) = mat(-1, -2, 2; 1, 1, -1; -1, 0, 1). $
  Hence $T$ is both injective and surjective: for every $bf(v) = (v_1, v_2, v_3)^T$ the equation $T(bf(x)) = bf(v)$ has the unique solution
  $ bf(x) = T^(-1)(bf(v)) = bf(A)^(-1) bf(v) = mat(-v_1 - 2 v_2 + 2 v_3; v_1 + v_2 - v_3; -v_1 + v_3). $
]

#subsec("Isomorphism of Vector Spaces", beyond: true) // Tyrtyshnikov §12.2


Two real vector spaces $V$ and $W$ are called _isomorphic_ if there exists a bijective mapping $Phi : V -> W$ preserving the operations in the following sense:
$ Phi(bf(a) + bf(b)) = Phi(bf(a)) + Phi(bf(b)), quad Phi(alpha bf(a)) = alpha Phi(bf(a)) quad forall bf(a), bf(b) in V, forall alpha in bb(R). $
The mapping $Phi$ itself—a bijective linear transformation from $V$ to $W$—is then called an _isomorphism_.

Note that the operations of vector addition and scalar multiplication on the left-hand and right-hand sides of these equalities are, generally speaking, _different_! The operations on the left act in $V$, while the operations on the right act in $W$. Nevertheless, once it is established that the spaces are isomorphic, this means that they are indistinguishable from the standpoint of the _properties of the operations_.

#proposition[
  $Phi(bf(0)) = bf(0), quad Phi(-bf(a)) = -Phi(bf(a)) quad forall bf(a) in V$.
]

#proof[
  $Phi(bf(0)) = Phi(bf(0) + bf(0)) = Phi(bf(0)) + Phi(bf(0))$. Add to both sides the vector $bf(b) = -Phi(bf(0))$ (the vector opposite to $Phi(bf(0))$):
  $ bf(0) = bf(b) + Phi(bf(0)) = (bf(b) + Phi(bf(0))) + Phi(bf(0)) = bf(0) + Phi(bf(0)) = Phi(bf(0)) => Phi(bf(0)) = bf(0). $
]

#indent Obviously, on the set of all real vector spaces, isomorphism generates an equivalence relation. Importantly, investigations carried out for one space $V$ carry over immediately to any space isomorphic to it. For example, vectors $bf(a)_1, ..., bf(a)_n in V$ are linearly dependent if and only if the vectors $Phi(bf(a)_1), ..., Phi(bf(a)_n)$ are linearly dependent.

#theorem[
  Any real vector space $V$ of dimension $n = dim(V)$ is isomorphic to $bb(R)^n$.
]

#proof[
  Choose some basis $S = {bf(a)_1, ..., bf(a)_n}$ of the space $V$ and define the mapping $Phi$ as follows:
  $ Phi(bf(v)) = [bf(v)]_S = mat(x_1; dots.v; x_n), $
  where $x_1, ..., x_n$ are the coefficients of the expansion of the vector $bf(v)$ in this basis:
  $ bf(v) = x_1 bf(a)_1 + ... + x_n bf(a)_n. $
  Preservation of the operations is verified in an obvious manner.
]

#corollary[
  Any finite-dimensional real vector spaces of the same dimension are isomorphic.
]
