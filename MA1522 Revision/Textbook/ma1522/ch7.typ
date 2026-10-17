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

Thus, any fixed pair of bases generates three isomorphisms (in the sense of Section 7.2):
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

Recall the definition of equivalent matrices (Section 2.5): $bf(A)$ and $bf(B)$ are called _equivalent_ if $bf(B) = bf(M) bf(A) bf(N)$ for some invertible $bf(M)$ and $bf(N)$.

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
