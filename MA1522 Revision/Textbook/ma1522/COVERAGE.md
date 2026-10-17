# MA1522 lecture-slide coverage

Every topic of the MA1522 lecture slides (Chapter_1–7.pdf, appendices included) and where this edition covers it.
*covered* = the book's own text states it; *added* = written for this edition (subsections tagged "added for MA1522");
*see-section* = covered in another section of this edition. All locations are visible with `show-beyond = false`.
Totals: 429 topics — 92 covered by the book, 319 added, 12 cross-referenced, 1 marked not in the syllabus by the slides.

## Chapter 1. Linear Systems

| Slide section | Topic | Status (covered / added / see-section) | Where in the edition (MA section › subsection) |
|---|---|---|---|
| 1.1 | Linear equation in standard form: coefficients, constant; homogeneous equation; what makes an equation non-linear | added | 1.1 › Linear Equations, Solutions and Consistency (Definition + following paragraph) |
| 1.1 | Linear system: finitely many linear equations, m equations in n variables, standard form | covered | 1.1 › Linear Systems (system (1)); bridging sentence in 1.1 › Linear Equations, Solutions and Consistency |
| 1.1 | Homogeneous linear system (b_1 = … = b_m = 0) | added | 1.1 › Linear Equations, Solutions and Consistency (theory in 4.2 › Homogeneous Linear Systems) |
| 1.1 | Solution of a linear system (x_1 = c_1, …, x_n = c_n satisfies every equation) | covered | 1.1 › Linear Systems (vector form); componentwise form added in 1.1 › Linear Equations, Solutions and Consistency (Definition) |
| 1.1 | General solution, parameters (s ∈ ℝ); variables must not be used as parameters | added | 1.1 › Linear Equations, Solutions and Consistency (paragraph + Example) |
| 1.1 | Consistent / inconsistent system | added | 1.1 › Linear Equations, Solutions and Consistency (Definition + Example) |
| 1.1 (and Discussion 3) | A linear system has no solution, exactly one, or infinitely many | added | 1.1 › Linear Equations, Solutions and Consistency (Theorem with proof) |
| 1.1 | Two variables: equations as lines; parallel distinct / one point / coincident | added | 1.1 › Geometric Picture in Two and Three Variables (list + Example) |
| 1.1 | Three variables: equations as planes; no solution / unique / line (1 parameter) / coincident planes (2 parameters) | added | 1.1 › Geometric Picture in Two and Three Variables (list + Example) |
| 1.2 | Augmented matrix (A \| b); standard form first; unknown constants as entries | added | 1.2 › Augmented Matrix (definition + Example with a parameter a) |
| 1.2 | Zero row, nonzero row, leading entry | added | 1.2 › Pivot Columns and Reduced Row-Echelon Form (leading entry also in 1.2 › Row-Echelon Form) |
| 1.2 | Row-echelon form (zero rows at bottom; leading entries move right) | covered | 1.2 › Row-Echelon Form (index definition); restated in the course's two conditions in 1.2 › Pivot Columns and Reduced Row-Echelon Form |
| 1.2 | Pivot column / non-pivot column | added | 1.2 › Pivot Columns and Reduced Row-Echelon Form (Definition; pivot columns already named in 1.2 › Row-Echelon Form) |
| 1.2 | Reduced row-echelon form (leading entries 1; zeros elsewhere in pivot columns), with examples of non-REF / REF-not-RREF / RREF | added | 1.2 › Pivot Columns and Reduced Row-Echelon Form (Definition + Example) |
| 1.2 | RREF is a special case of REF | added | 1.2 › Pivot Columns and Reduced Row-Echelon Form |
| 1.2 | Number of pivot columns = number of nonzero rows (Challenge, part 1) | added | 1.2 › Pivot Columns and Reduced Row-Echelon Form |
| 1.2 | Solutions from REF (back substitution) and from RREF (read off) | added | 1.2 › Solutions from REF and RREF (Theorem, proof, remark, Examples (a), (b)) |
| 1.2 | Inconsistent iff the last column of a REF of the augmented matrix is a pivot column | added | 1.2 › Solutions from REF and RREF (Theorem, part 1; Example (c)); general form 1.5 › Solving a Linear System: Summary (Theorem 3) |
| 1.2 | Parameters for the variables of non-pivot columns; number of parameters = number of non-pivot columns of A | added | 1.2 › Solutions from REF and RREF (Theorem, part 2) |
| 1.3 | Three elementary row operations R_i ↔ R_j, R_i + cR_j, aR_i (a ≠ 0) | added | 1.3 › Elementary Row Operations and Row Equivalence (Definition); matrix form of the first two in 1.3 › Elementary Row Operations in Matrix Form |
| 1.3 | Multiplying a row by 0 is not allowed (can change the solution set) | added | 1.3 › Elementary Row Operations and Row Equivalence (example after the notation paragraph) |
| 1.3 | Row operations do not commute; written left to right; commuting operations may be stacked | added | 1.3 › Elementary Row Operations and Row Equivalence |
| 1.3 | R_i + cR_j changes only R_i; 2R_2 + R_1 is not an elementary row operation | added | 1.3 › Elementary Row Operations and Row Equivalence |
| 1.3 | Reverse of each elementary row operation | added | 1.3 › Elementary Row Operations and Row Equivalence (Proposition with proof); matrix form in 1.3 › Elementary Row Operations in Matrix Form (Propositions 1, 2) |
| 1.3 | Row-equivalent matrices | added | 1.3 › Elementary Row Operations and Row Equivalence (Definition; symmetric, reflexive, transitive) |
| 1.3 | Row-equivalent augmented matrices give systems with the same solutions (elementary row operations preserve solutions) | added | 1.3 › Elementary Row Operations and Row Equivalence (Theorem with proof) |
| 1.3 | Aim: reduce the augmented matrix to REF/RREF by elementary row operations | added | 1.3 › Elementary Row Operations and Row Equivalence (closing paragraph) |
| 1.4 | Gaussian elimination, Steps 1–4 | added | 1.4 › Gaussian and Gauss–Jordan Elimination as Algorithms (Algorithm); prose in 1.4 › Gaussian Elimination, matrix form in 1.4 › Reduction to Row-Echelon Form (Theorem 1) |
| 1.4 | Gauss–Jordan elimination, Steps 5–6; every matrix has a REF and an RREF | added | 1.4 › Gaussian and Gauss–Jordan Elimination as Algorithms (Algorithm, Theorem 3 with proof) |
| 1.4 | Worked example: REF + back substitution, then RREF | added | 1.4 › Gaussian and Gauss–Jordan Elimination as Algorithms (Example) |
| 1.4 | REF is not unique; RREF is unique (Challenge); pivot columns of a matrix well defined | added | 1.4 › Gaussian and Gauss–Jordan Elimination as Algorithms (Theorem 4 with proof, Corollary) |
| 1.5 | Summary procedure for solving a linear system; consistency / unique / infinitely many | added | 1.5 › Solving a Linear System: Summary (Algorithm, Theorem 3 with proof, link to Kronecker–Capelli in 4.2) |
| 1.4–1.5 | Systems with unknowns in the coefficients and constants: case analysis, avoiding division by expressions that may vanish, row swaps | added | 1.5 › Systems with Unknown Coefficients (method + Example) |
| 1.5 | Constructing a linear system from a general solution; extra equations as combinations | added | 1.5 › Constructing a System with a Given General Solution (method with proof + Example) |

Totals: 34 topics; 3 covered (with bridging text), 31 added, 0 redirected.

## Chapter 2. Matrix Algebra

| Slide section | Topic | Status (covered / added / see-section) | Where in the edition (MA section › subsection) |
|---|---|---|---|
| 2.1 | Matrix as a rectangular array; entries, (i, j)-entry, size m × n, notation (a_ij)_{m×n} | added | 2.1 › Notation and Special Types of Matrices (matrices introduced in 2.1 › Linear Mappings and Matrices) |
| 2.1 | Remarks: size read "m by n"; comma in a_{i,j} when indices are ambiguous | added | 2.1 › Notation and Special Types of Matrices |
| 2.1 | Matrix defined by a formula for its entries | added | 2.1 › Notation and Special Types of Matrices (example a_ij = 2i − j) |
| 2.1 | Column and row vectors (default: column) | added | 2.1 › Notation and Special Types of Matrices |
| 2.1 | Zero matrix 0_{m×n} | added | 2.1 › Notation and Special Types of Matrices |
| 2.1 | Square matrix, order n, diagonal entries | covered + added | 2.1 › Linear Mappings and Matrices (square, order); diagonal entries in 2.1 › Notation and Special Types of Matrices |
| 2.1 | Diagonal matrix diag(d_1, …, d_n) | added | 2.1 › Notation and Special Types of Matrices |
| 2.1 | Scalar matrix cI | added | 2.1 › Notation and Special Types of Matrices |
| 2.1 | Identity matrix I_n | added | 2.1 › Notation and Special Types of Matrices |
| 2.1 | Upper/lower triangular, strictly upper/lower triangular | added | 2.1 › Notation and Special Types of Matrices |
| 2.1 | Symmetric matrix a_ij = a_ji (and: symmetric + upper triangular ⇒ diagonal) | added | 2.1 › Notation and Special Types of Matrices (definition, example) |
| 2.2 | Equality of matrices | added | 2.2 › Equality and the Laws of Matrix Arithmetic |
| 2.2 | Matrix addition and scalar multiplication | covered | 2.2 › Matrix Addition and Multiplication by a Scalar |
| 2.2 | Addition only for equal sizes; −A = (−1)A; A − B = A + (−1)B | added | 2.2 › Equality and the Laws of Matrix Arithmetic |
| 2.2 | Theorem: properties (i)–(viii) of addition and scalar multiplication (proof in Appendix) | added (commutativity, associativity already in textbook) | 2.2 › Equality and the Laws of Matrix Arithmetic (theorem + proof) |
| 2.2 | Sums A_1 + … + A_k without brackets | added | 2.2 › Equality and the Laws of Matrix Arithmetic |
| 2.2 | Matrix multiplication (row-by-column rule) | covered | 2.2 › Matrix Multiplication |
| 2.2 | Size rule (m × p)(p × n) = m × n | covered | 2.2 › Matrix Multiplication (last paragraph) |
| 2.2 | Multiplication is not commutative | covered | 2.2 › Noncommutativity of Matrix Multiplication |
| 2.2 | Pre-multiplying / post-multiplying | added | 2.2 › Equality and the Laws of Matrix Arithmetic |
| 2.2 | Theorem: properties of multiplication (i)–(vii): associativity, distributive laws, scalars, identity I_m A = A = A I_n, zero divisors, zero matrix (proofs in Appendix) | covered (associativity) + added | 2.2 › Associativity of Matrix Multiplication; 2.2 › Equality and the Laws of Matrix Arithmetic (theorem + proof) |
| 2.2 | Products A_1A_2⋯A_k without brackets | added | 2.2 › Equality and the Laws of Matrix Arithmetic |
| 2.2 | Zero divisors example (AB = 0 with A, B ≠ 0) | added | 2.2 › Equality and the Laws of Matrix Arithmetic |
| 2.2 | Powers A^0 = I, A^n = AA^{n−1}; A^nA^m = A^{n+m}; only for square matrices | added | 2.2 › Powers and the Transpose of a Matrix |
| 2.2 | (A + B)^2 ≠ A^2 + 2AB + B^2 in general (equal iff AB = BA, e.g. diagonal) | added | 2.2 › Powers and the Transpose of a Matrix |
| 2.2 | Transpose definition | added (also in textbook) | 2.2 › Powers and the Transpose of a Matrix; 2.10 › Determinant of the Transpose Matrix |
| 2.2 | Properties of transpose (A^T)^T, (cA)^T, (A+B)^T | added | 2.2 › Powers and the Transpose of a Matrix |
| 2.2 | (AB)^T = B^TA^T; A^TB^T undefined in general | covered + added | 2.4 › Inversion and Transposition (proof); remark in 2.2 › Powers and the Transpose of a Matrix |
| 2.2 | Symmetric ⇔ A^T = A (sums of symmetric matrices symmetric; products need not be) | added | 2.2 › Powers and the Transpose of a Matrix |
| 2.3 | Matrix equation Ax = b: coefficient matrix, variable vector, constant vector | added (partly in 1.1) | 2.3 › Matrix Equations and Homogeneous Systems |
| 2.3 | Vector equation x_1a_1 + … + x_na_n = b; coefficient vectors | covered + added | 2.3 › Linear Combinations (equality (2)); naming in 2.3 › Matrix Equations and Homogeneous Systems |
| 2.3 | Homogeneous system is always consistent (A0 = 0) | added | 2.3 › Matrix Equations and Homogeneous Systems |
| 2.3 | Trivial and nontrivial solutions | added | 2.3 › Matrix Equations and Homogeneous Systems |
| 2.3 | Homogeneous system has infinitely many solutions iff it has a nontrivial solution | added | 2.3 › Matrix Equations and Homogeneous Systems (theorem + proof + example) |
| 2.3 | Lemma: v + u solves Ax = b if Av = b, Au = 0 | see-section | pointer in 2.3; proved in 4.2 › General Solution of a Linear System |
| 2.3 | Lemma: v_1 − v_2 solves Ax = 0 | see-section | pointer in 2.3; proved in 4.2 › General Solution of a Linear System |
| 2.3 | General solution of Ax = b = particular solution + general solution of Ax = 0 (challenge) | see-section | 4.2 › General Solution of a Linear System (theorem and corollary) |
| 2.3 | Submatrices; rows and columns as submatrices | covered + added | 2.8 › Submatrices and k × k Minors; 2.3 › Submatrices of a Product |
| 2.3 | Block multiplication theorem (rows m_1–m_2 of A times columns n_1–n_2 of B) | added (general block rule stated in textbook) | 2.3 › Multiplication of Block Matrices; 2.3 › Submatrices of a Product (theorem + proof + example) |
| 2.3 | Columns of AB are Ab_j; rows of AB are a_iB | added | 2.3 › Submatrices of a Product (column rule, row rule) |
| 2.3 | Solving matrix equations AX = B as p systems | added | 2.3 › Solving Matrix Equations |
| 2.3 | Combined augmented matrix (A ∣ b_1 ∣ … ∣ b_p) | added | 2.3 › Solving Matrix Equations (with example) |
| 2.4 | Failure of cancellation (AB = AC, A ≠ 0, B ≠ C) | added | 2.4 › Singular Matrices and the Cancellation Law |
| 2.4 | AB = I need not give BA = I (non-square) | added | 2.6 › Equivalent Statements for Invertibility (left/right inverse example) |
| 2.4 | Definition of invertible matrix and inverse | covered | 2.4 › Inverse Matrix |
| 2.4 | Only square matrices are invertible; a non-square matrix has no two-sided inverse | added | 2.4 › Singular Matrices and the Cancellation Law; 2.6 › Equivalent Statements for Invertibility (trace argument) |
| 2.4 | Uniqueness of the inverse; notation A^{−1} | covered | 2.4 › Inverse Matrix |
| 2.4 | Singular matrix (non-invertible square matrix) | added | 2.4 › Singular Matrices and the Cancellation Law |
| 2.4 | Inverse of a 2 × 2 matrix, invertible iff ad − bc ≠ 0 | added | 2.4 › Singular Matrices and the Cancellation Law (theorem + proof) |
| 2.4 | Cancellation law (left and right); caution AB = CA does not give B = C | added | 2.4 › Singular Matrices and the Cancellation Law |
| 2.4 | A invertible ⇒ Ax = b has the unique solution A^{−1}b | added | 2.4 › Invertible Matrices and Linear Systems |
| 2.4 | Corollary: A invertible ⇒ Ax = 0 has only the trivial solution | added | 2.4 › Invertible Matrices and Linear Systems |
| 2.4 | Remark: RREF of (A ∣ b) is (I ∣ A^{−1}b); RREF of invertible A is I | added | 2.4 › Invertible Matrices and Linear Systems; 2.6 › Equivalent Statements for Invertibility |
| 2.4 | Computing A^{−1}: (A ∣ I) → (I ∣ A^{−1}) | added | 2.4 › Invertible Matrices and Linear Systems; 2.6 › Finding the Inverse by Row Reduction |
| 2.4 | Remark: solving AX = I gives a right inverse — is it a left inverse? | added | 2.6 › Equivalent Statements for Invertibility (corollary (i)) |
| 2.4 | Properties of inverses: (A^{−1})^{−1} = A, (aA)^{−1} = a^{−1}A^{−1} | added | 2.4 › Singular Matrices and the Cancellation Law |
| 2.4 | (A^T)^{−1} = (A^{−1})^T; A invertible iff A^T invertible | covered | 2.4 › Inversion and Transposition |
| 2.4 | (AB)^{−1} = B^{−1}A^{−1} | covered | 2.4 › Group of Invertible Matrices |
| 2.4 | Products of k invertible matrices; (AB)^{−1} ≠ A^{−1}B^{−1}; negative powers A^{−n} | added | 2.4 › Singular Matrices and the Cancellation Law |
| 2.4 | AB invertible ⇒ A, B invertible (question) | added | 2.6 › Equivalent Statements for Invertibility (corollary (ii)) |
| 2.4 | Inverse of a symmetric matrix is symmetric (question) | added | 2.4 › Singular Matrices and the Cancellation Law |
| 2.5 | Elementary matrix; corresponding row operation | added (passing mention in 1.3) | 2.5 › Elementary Matrices and Row Operations |
| 2.5 | EA is the result of performing r on A | added | 2.5 › Elementary Matrices and Row Operations (theorem + proof) |
| 2.5 | Row equivalence (definition) | see-section | pointer in 2.5; defined in 1.3 › Elementary Row Operations and Row Equivalence |
| 2.5 | B row equivalent to A ⇒ B = E_k⋯E_2E_1A | added | 2.5 › Elementary Matrices and Row Operations |
| 2.5 | Reverse row operations | see-section | pointer in 2.5; 1.3 › Elementary Row Operations and Row Equivalence |
| 2.5 | Inverses of elementary matrices (reverse operation, same type) | added | 2.5 › Elementary Matrices and Row Operations (theorem + proof) |
| 2.6 | Product of elementary matrices is invertible | added | 2.6 › Equivalent Statements for Invertibility ((vi) ⇒ (i)) |
| 2.6 | RREF of A is I ⇒ A invertible | added | 2.6 › Equivalent Statements for Invertibility ((v) ⇒ (vi) ⇒ (i)) |
| 2.6 | A invertible ⇔ Ax = 0 has only the trivial solution | added | 2.6 › Equivalent Statements for Invertibility |
| 2.6 | A invertible ⇔ RREF of A is I | added | 2.6 › Equivalent Statements for Invertibility |
| 2.6 | A invertible ⇔ A is a product of elementary matrices | added | 2.6 › Equivalent Statements for Invertibility |
| 2.6 | Left and right inverses (n × m matrices) | added | 2.6 › Equivalent Statements for Invertibility (definition, example) |
| 2.6 | A invertible ⇔ A has a left inverse | added | 2.6 › Equivalent Statements for Invertibility |
| 2.6 | A invertible ⇔ A has a right inverse | added (textbook proof contains the idea) | 2.6 › Equivalent Statements for Invertibility; 2.6 › Invertibility Criterion for a Matrix |
| 2.6 | A invertible ⇔ Ax = b has a unique solution for every b | added | 2.6 › Equivalent Statements for Invertibility |
| 2.6 | Algorithm for finding the inverse with invertibility test (REF zero row / RREF ≠ I) | added | 2.6 › Finding the Inverse by Row Reduction (algorithm, justification, two examples) |
| 2.6 | A, B row equivalent ⇔ B = PA, P invertible (challenge; invertible row operations are composed of elementary ones) | added | 2.6 › Invertible Matrices and Row Equivalence |
| 2.6 | Equivalent statements of invertibility (i)–(viii) | added | 2.6 › Equivalent Statements for Invertibility (items (i)–(ix) in the slides' order) |
| 2.7 | Unit lower triangular matrix | added (term used in textbook) | 2.7 › LU Factorization of an m × n Matrix |
| 2.7 | LU factorization of an m × n matrix; LU factorizable | added (square invertible case in textbook) | 2.7 › Gaussian Elimination and LU Factorization; 2.7 › LU Factorization of an m × n Matrix |
| 2.7 | Lemma: product of unit lower triangular matrices is unit lower triangular | added | 2.7 › LU Factorization of an m × n Matrix |
| 2.7 | Elementary matrices of R_i + cR_j (i > j) and their inverses are unit lower triangular | added | 2.7 › LU Factorization of an m × n Matrix |
| 2.7 | Algorithm to LU factorization; L = E_1^{−1}⋯E_k^{−1}; shortcut "−c_l in the (i, j)-entry" | added | 2.7 › LU Factorization of an m × n Matrix (algorithm, justification, example) |
| 2.7 | Solving Ax = b by Ly = b, then Ux = y | added (textbook gives the two steps for square A) | 2.7 › LU Factorization of an m × n Matrix (with example) |
| 2.7 | Not every matrix is LU factorizable; characterization beyond the course | added | 2.7 › LU Factorization of an m × n Matrix (counterexample; pointer to Tyrtyshnikov §8.8) |
| 2.7 | LUP factorization A = PLU; permutation matrix | added | 2.7 › LU Factorization of an m × n Matrix (definition, proof sketch); permutation matrices also in 1.3 |
| 2.8 | Determinant of orders 1 and 2 | added (order 2 also covered) | 2.8 › The Determinant by Cofactor Expansion; 2.8 › The Determinant |
| 2.8 | (i, j) matrix minor M_ij | covered | 2.8 › Submatrices and k × k Minors |
| 2.8 | (i, j)-cofactor A_ij = (−1)^{i+j} det(M_ij); sign pattern | covered + added | 2.8 › Laplace's Theorem (last paragraph); sign pattern in 2.8 › The Determinant by Cofactor Expansion |
| 2.8 | Determinant by cofactor expansion along any row or column (definition and theorem) | covered + added | 2.8 › Laplace's Theorem (case k = 1); inductive definition and example in 2.8 › The Determinant by Cofactor Expansion |
| 2.8 | det(A) = det(A^T) | covered | 2.10 › Determinant of the Transpose Matrix |
| 2.8 | Order 3 formula aei − afh − bdi + bfg + cdh − ceg | covered | 2.8 › The Determinant (special cases); 2.8 › The Determinant by Cofactor Expansion |
| 2.8 | Determinant of a triangular matrix = product of diagonal entries | added (diagonal case covered) | 2.8 › The Determinant by Cofactor Expansion (theorem + proof); diagonal case 2.9 › Existence of the Linear Dependence Indicator |
| 2.9 | Effect of R_i + aR_j, cR_i, R_i ↔ R_j on the determinant | added (Properties 1–4 in textbook) | 2.9 › Determinant and Elementary Row Operations; 2.9 › The Determinant as a Function of the Columns (Rows) |
| 2.9 | Determinants of elementary matrices (1, c, −1) | added | 2.9 › Determinant and Elementary Row Operations |
| 2.9 | det(R) = det(E_k)⋯det(E_1)det(A) for R = E_k⋯E_1A | added | 2.9 › Determinant and Elementary Row Operations |
| 2.9 | det(A) = d_1⋯d_n / (det(E_k)⋯det(E_1)) (determinant by reduction) | added | 2.9 › Determinant and Elementary Row Operations (with example) |
| 2.10 | A invertible ⇔ det(A) ≠ 0 | covered | 2.6 › Invertibility and the Determinant |
| 2.10 | Equivalent statements of invertibility with (ix) det(A) ≠ 0 | added | 2.6 › Equivalent Statements for Invertibility; 2.10 › Further Properties of the Determinant |
| 2.10 | det(AB) = det(A)det(B) | covered | 2.10 › Determinant of a Product of Matrices |
| 2.10 | det(A_1⋯A_k) = det(A_1)⋯det(A_k); det of an LU-factorizable matrix (question) | added | 2.10 › Further Properties of the Determinant |
| 2.10 | det(A^{−1}) = det(A)^{−1} | added | 2.10 › Further Properties of the Determinant |
| 2.10 | det(cA) = c^n det(A) | added | 2.10 › Further Properties of the Determinant |
| 2.10 | Adjoint adj(A): (i, j)-entry is the (j, i)-cofactor | covered | 2.10 › The Adjoint Formula for the Inverse |
| 2.10 | A adj(A) = det(A) I for every square matrix (also for singular A) | covered (proof) + added (statement for all A) | 2.10 › The Adjoint Formula for the Inverse; 2.10 › Further Properties of the Determinant |
| 2.10 | Adjoint formula for the inverse; 2 × 2 inverse formula from it | covered + added | 2.10 › The Adjoint Formula for the Inverse; 2.4 › Singular Matrices and the Cancellation Law |
| 2.10 | Cramer's rule | covered | 2.10 › Cramer's Rule |
| Appendix | Proof of properties of addition and scalar multiplication | added | 2.2 › Equality and the Laws of Matrix Arithmetic |
| Appendix | Proof of properties of matrix multiplication | covered (associativity) + added | 2.2 › Associativity of Matrix Multiplication; 2.2 › Equality and the Laws of Matrix Arithmetic |
| Appendix | Row-equivalent augmented matrices have the same solutions | see-section (+ matrix-form proof added) | 1.3 › Elementary Row Operations and Row Equivalence; matrix form in 2.5 › Elementary Matrices and Row Operations |
| Appendix | Permutation group S_n; permutations as functions | covered + added | 2.8 › Permutations; one-line notation and "n-permutation group" in 2.8 › Transpositions |
| Appendix | Transposition | added (textbook definition sits in a beyond subsection) | 2.8 › Transpositions |
| Appendix | Every permutation is a composition of transpositions | added (textbook proof sits in a beyond subsection) | 2.8 › Transpositions (theorem + proof) |
| Appendix | Sign sgn(σ) = (−1)^{number of transpositions} (well defined) | covered | 2.8 › Uniqueness of the Linear Dependence Indicator; well-definedness in 2.8 › Parity of a Permutation (beyond flag removed) |
| Appendix | Leibniz formula for the determinant (row form Σ sgn(σ) Π a_{iσ(i)}) | covered + added | 2.8 › The Determinant (formula (△), column form); row form in 2.8 › The Determinant by Cofactor Expansion |
| Appendix | Equivalence: Leibniz formula = cofactor expansion along any row or column | covered | 2.8 › Laplace's Theorem (case k = 1); 2.8 › The Determinant by Cofactor Expansion |
| Appendix | Proof that det(A^T) = det(A) | covered (Leibniz-based proof instead of induction) | 2.10 › Determinant of the Transpose Matrix |
| Appendix | Row interchange changes the sign of det | covered | 2.9 › The Determinant as a Function of the Columns (Rows) (Properties 2, 4) |
| Appendix | Multiplying a row by c multiplies det by c | covered | 2.9 › The Determinant as a Function of the Columns (Rows) (Properties 1, 4) |
| Appendix | Two identical rows (columns) ⇒ det = 0 | covered | 2.9 › The Determinant as a Function of the Columns (Rows) (proof of Property 3, Property 4) |
| Appendix | Adding a multiple of a row leaves det unchanged | added | 2.9 › Determinant and Elementary Row Operations |
| Appendix | Proof of det(AB) = det(A)det(B) | covered (different proof) | 2.10 › Determinant of a Product of Matrices |
| Appendix | Proof of the adjoint formula A adj(A) = det(A) I | covered | 2.10 › The Adjoint Formula for the Inverse |
| Appendix | Proof of Cramer's rule | covered | 2.10 › Cramer's Rule |
| Appendix | Uniqueness of the RREF | see-section | pointer in 2.6; 1.4 › Gaussian and Gauss–Jordan Elimination as Algorithms (Theorem 4) |
| Appendix | Two matrices are row equivalent iff they have the same RREF | added | 2.6 › Invertible Matrices and Row Equivalence (corollary) |

## Chapter 3. Euclidean Vector Spaces

| Slide section | Topic | Status (covered / added / see-section) | Where in the edition (MA section › subsection) |
|---|---|---|---|
| 3.1 | n-vectors, i-th coordinate | added | 3.1 › Vectors in ℝⁿ |
| 3.1 | Definition of the Euclidean n-space ℝⁿ | added | 3.1 › Vectors in ℝⁿ |
| 3.1 | Geometric interpretation of a vector (point / arrow from the origin) | added | 3.1 › Vectors in ℝⁿ |
| 3.1 | Geometric interpretation of vector algebra (head-to-tail sum, scaling) | covered | 3.1 › Linear Operations on Vectors (bridged in 3.1 › Vectors in ℝⁿ) |
| 3.1 | Theorem: vector algebra properties (i)–(x) in ℝⁿ | added | 3.1 › Vectors in ℝⁿ (Theorem "Vector algebra in ℝⁿ") |
| 3.1 | Definition of an abstract vector space (10 axioms) | covered | 3.1 › Abstract Vector Spaces |
| 3.1 | Challenge: polynomials of degree ≤ n and m×n matrices are vector spaces | covered | 4.1 › Examples of Finite-Dimensional Vector Spaces |
| 3.2 | Outer product (marked "not part of syllabus" on the slides) | not required | — |
| 3.2 | Inner (dot) product u·v = uᵀv = Σ uᵢvᵢ | covered | 3.2 › On Generalizations (7); 3.2 › Euclidean Space (8) |
| 3.2 | Norm in ℝ² and ℝ³ via Pythagoras | added | 3.2 › Norm, Distance and Angle in ℝⁿ |
| 3.2 | Definition of the norm in ℝⁿ | added | 3.2 › Norm, Distance and Angle in ℝⁿ |
| 3.2 | Theorem: properties of dot product and norm (symmetry, scalars, distributivity, positive definiteness, ‖cu‖ = \|c\|‖u‖) | added | 3.2 › Norm, Distance and Angle in ℝⁿ |
| 3.2 | Unit vectors (definition, eᵢ, examples) | added | 3.2 › Norm, Distance and Angle in ℝⁿ |
| 3.2 | Normalizing a nonzero vector | added | 3.2 › Norm, Distance and Angle in ℝⁿ |
| 3.2 | Distance d(u, v) = ‖u − v‖ (with ℝ², ℝ³ motivation) | added | 3.2 › Norm, Distance and Angle in ℝⁿ |
| 3.2 | Angle between nonzero vectors, 0 ≤ θ ≤ π (with Cauchy–Schwarz for well-definedness) | added | 3.2 › Norm, Distance and Angle in ℝⁿ (formula also in 3.2 › On Generalizations) |
| 3.3 | Linear combination, coefficients | see-section | 2.3 › Linear Combinations (pointer at top of 3.3) |
| 3.3 | Linear span span{u₁, …, u_k} | see-section | 2.3 › Linear Combinations; also 3.1 › Abstract Vector Spaces |
| 3.3 | Vector equation ↔ matrix equation; v ∈ span iff Ax = v consistent | see-section | 2.3 › Linear Combinations; restated in 3.3 › Checking Linear Combinations and Spanning Sets |
| 3.3 | Algorithm to check for a linear combination; solutions = coefficients | added | 3.3 › Checking Linear Combinations and Spanning Sets |
| 3.3 | When span(S) = ℝⁿ: theorem and algorithm (RREF of (u₁ ⋯ u_k) has no zero rows) | added | 3.3 › Checking Linear Combinations and Spanning Sets |
| 3.3 | k < n vectors never span ℝⁿ | added | 3.3 › Checking Linear Combinations and Spanning Sets (Corollary) |
| 3.3 | Standard basis spans ℝⁿ, w = Σ wᵢeᵢ | added | 3.3 › Checking Linear Combinations and Spanning Sets (Example) |
| 3.3 | Theorem: properties of linear spans (0 ∈ span, closure under scalar multiplication and addition) | added | 3.3 › Properties of Linear Spans |
| 3.3 | Remark (ii′) closure under linear combinations; Corollary span{v₁, …, v_m} ⊆ span(S) | added | 3.3 › Properties of Linear Spans (also 3.5 › Transitivity of Linear Dependence) |
| 3.3 | Theorem/algorithm for set relations between spans: span(T) ⊆ span(S) iff (S \| T) consistent; equality test | added | 3.3 › Properties of Linear Spans |
| 3.3 | Challenge: span(S) is a vector space | covered | 3.4 › Subspaces of ℝⁿ (subspaces = spans; subspaces satisfy the axioms) |
| 3.4 | Solution sets described implicitly and explicitly | added | 3.4 › Solution Sets of Linear Systems |
| 3.4 | Solution set of a homogeneous system = span of the general-solution vectors | see-section | 4.2 › Homogeneous Linear Systems (pointer and sentence in 3.4 › Solution Sets of Linear Systems) |
| 3.4 | Definition of a subspace of ℝⁿ (0 ∈ V, closed under scalar multiplication and addition) | added | 3.4 › Subspaces of ℝⁿ (general form in 3.4 › Subspaces of a Vector Space) |
| 3.4 | Remark: (i′) V nonempty; (ii′) closed under linear combinations | added | 3.4 › Subspaces of ℝⁿ |
| 3.4 | Theorem: solution set of Ax = b is a subspace iff b = 0 | added | 3.4 › Solution Sets of Linear Systems |
| 3.4 | Definition: solution space | added | 3.4 › Solution Sets of Linear Systems (= Null(A), 4.1) |
| 3.4 | Challenge: the 3 criteria imply the 10 axioms | added | 3.4 › Subspaces of ℝⁿ |
| 3.4 | Equivalent definition: V is a subspace iff V = span(S) for a finite S | added | 3.4 › Subspaces of ℝⁿ (Theorem) |
| 3.4 | Remarks: how to show a set is / is not a subspace (with examples) | added | 3.4 › Subspaces of ℝⁿ (Remark, Example) |
| 3.4 | Questions: {0} is a subspace; S ⊆ V subspace ⇒ span(S) ⊆ V; (i),(ii) without (iii) | covered / added | 3.4 › Subspaces of a Vector Space (span ⊆ W); 3.4 › Subspaces of ℝⁿ (zero space, Example (d)) |
| 3.4 | Subspaces of ℝ² and ℝ³ (zero space, lines, planes, whole space) | added | 3.4 › Subspaces of ℝⁿ (Proposition) |
| 3.4 | Theorem (affine space): solution set of a consistent non-homogeneous system is u + V | covered | 4.2 › General Solution of a Linear System; 3.4 › Affine Sets (Example 1); bridged in 3.4 › Solution Sets of Linear Systems |
| 3.4 | Non-homogeneous solution set is not a subspace; it is a translate parallel to V | added | 3.4 › Solution Sets of Linear Systems |
| 3.4 | Question: is ℝ² ⊆ ℝ³? | added | 3.4 › Subspaces of ℝⁿ (closing remark) |
| 3.5 | Motivation: redundant vectors; one homogeneous system tests them all | added | 3.5 › Checking Linear Independence (Proposition) |
| 3.5 | Definition of a linearly independent / dependent set | covered | 3.5 › Linear Dependence, 3.5 › Linear Independence (set form in 3.5 › Checking Linear Independence) |
| 3.5 | Example: the standard basis is linearly independent | added | 3.5 › Checking Linear Independence |
| 3.5 | Algorithm/Theorem: S independent iff Ax = 0 has only the trivial solution iff RREF has no non-pivot column | added | 3.5 › Checking Linear Independence |
| 3.5 | More than n vectors in ℝⁿ are linearly dependent | added | 3.5 › Checking Linear Independence (special case (v)) |
| 3.5 | Special cases: ∅, {0}, {v} with v ≠ 0, {v₁, v₂} | added | 3.5 › Checking Linear Independence (Proposition "special cases") |
| 3.5 | Theorem: adding a vector to a dependent set; sets containing 0 are dependent | added | 3.5 › Adding and Removing Vectors |
| 3.5 | Theorem: S independent and u ∉ span(S) ⇒ S ∪ {u} independent | added | 3.5 › Adding and Removing Vectors |
| 3.5 | Theorem: subsets of independent sets are independent | covered | 3.5 › Linear Independence (Lemma 2) |
| 3.6 | Motivation: unique coordinates; non-unique for dependent spanning sets | covered | 3.5 › Linear Independence (Lemma 3); 3.3 › Checking Linear Combinations (example) |
| 3.6 | Definition of a basis for a subspace V | added | 3.6 › Bases of Subspaces of ℝⁿ (for spans: 3.6 › Basis and Dimension) |
| 3.6 | Theorem: every v ∈ V is a unique linear combination of a basis | covered | 3.6 › Expansion in a Basis; restated in 3.6 › Bases of Subspaces of ℝⁿ |
| 3.6 | Basis for the solution space of a homogeneous system (general-solution vectors) | see-section | 4.2 › Homogeneous Linear Systems (pointer in 3.6 › Bases of Subspaces of ℝⁿ) |
| 3.6 | Bases are not unique (example) | added | 3.6 › Bases of Subspaces of ℝⁿ (Example) |
| 3.6 | Basis for the zero space is ∅; span as the smallest subspace containing S | added | 3.6 › Bases of Subspaces of ℝⁿ (Remark) |
| 3.6 | Theorem: A invertible iff its columns are linearly independent | covered | 2.6 › Invertibility Criterion for a Matrix; restated in 3.6 › Bases of ℝⁿ and Invertibility |
| 3.6 | Theorem: A invertible iff its columns span ℝⁿ | added | 3.6 › Bases of ℝⁿ and Invertibility |
| 3.6 | Corollary: n vectors in ℝⁿ are independent iff they span ℝⁿ | added | 3.6 › Bases of ℝⁿ and Invertibility (Corollary 1) |
| 3.6 | Corollary: S basis for ℝⁿ iff k = n and (u₁ ⋯ u_k) invertible | added | 3.6 › Bases of ℝⁿ and Invertibility (Corollary 2) |
| 3.6 | Theorems: A invertible iff rows form a basis / rows are independent | added | 3.6 › Bases of ℝⁿ and Invertibility (also 2.4 › Inversion and Transposition) |
| 3.6 | Equivalent statements for invertibility (i)–(xi) | added | 3.6 › Bases of ℝⁿ and Invertibility (Theorem) |
| 3.6 | Challenge: basis for ℝ^{2×2} | covered | 4.1 › Examples of Finite-Dimensional Vector Spaces; 3.6 › Basis and Dimension of an Abstract Vector Space |
| 3.6 | Coordinates relative to a basis: identification of V with ℝᵏ, definition of [v]_S | covered / added | 3.6 › Expansion in a Basis; 3.6 › Computing Coordinates Relative to a Basis |
| 3.6 | Example: [w]_E = w for the standard basis | added | 3.6 › Computing Coordinates Relative to a Basis |
| 3.6 | Remarks: [v]_S has k entries; one-to-one only for a basis; dependence on the order | added | 3.6 › Computing Coordinates Relative to a Basis |
| 3.6 | Algorithm for computing relative coordinates | added | 3.6 › Computing Coordinates Relative to a Basis |
| 3.6 | Theorem: u = v iff [u]_B = [v]_B; linearity of coordinates | added | 3.6 › Computing Coordinates Relative to a Basis |
| 3.7 | Introduction: dimension as identification with ℝᵏ, independent of the basis | added | 3.7 › Dimension of Subspaces of ℝⁿ |
| 3.7 | Theorem: coordinates preserve linear independence and spanning (appendix proof) | added | 3.7 › Dimension of Subspaces of ℝⁿ |
| 3.7 | Corollary: m > k vectors dependent; m < k vectors do not span | added | 3.7 › Dimension of Subspaces of ℝⁿ |
| 3.7 | Corollary: any two bases have the same number of vectors | covered | 3.6 › Basis and Dimension (Basis Theorem); also follows in 3.7 › Dimension of Subspaces of ℝⁿ |
| 3.7 | Definition of dim(V) | covered | 3.6 › Basis and Dimension; restated in 3.7 › Dimension of Subspaces of ℝⁿ |
| 3.7 | Examples: dim ℝⁿ = n; plane z = 0; hyperplanes have dimension n − 1 | added | 3.7 › Dimension of Subspaces of ℝⁿ |
| 3.7 | Dimension of the zero space is 0 | covered | 3.7 › Existence of a Basis; 3.6 › Bases of Subspaces of ℝⁿ (Remark) |
| 3.7 | Theorem: dim of the solution space = number of non-pivot columns of the RREF | added | 3.7 › Dimension of Subspaces of ℝⁿ (rank–nullity in 4.2 › Homogeneous Linear Systems) |
| 3.7 | Spanning Set Theorem | covered / added | 3.6 › Basis and Dimension (dimension of a span, proposition on bases); restated with proof in 3.7 › Dimension of Subspaces of ℝⁿ |
| 3.7 | Linear Independence Theorem | covered / added | 3.7 › Completion to a Basis (Basis Extension Lemma); restated with proof in 3.7 › Dimension of Subspaces of ℝⁿ |
| 3.7 | Challenge: k vectors in a k-dimensional V are independent iff they span V | added | 3.7 › Dimension of Subspaces of ℝⁿ (B1, B2) |
| 3.7 | Theorem: U ⊆ V ⇒ dim U ≤ dim V, equality iff U = V | added | 3.7 › Dimension of Subspaces of ℝⁿ |
| 3.7 | Theorem (B1) | added | 3.7 › Dimension of Subspaces of ℝⁿ |
| 3.7 | Theorem (B2) | added | 3.7 › Dimension of Subspaces of ℝⁿ |
| 3.7 | Summary table of ways to check a basis; examples | added | 3.7 › Dimension of Subspaces of ℝⁿ |
| 3.8 | Relation between [v]_S and [v]_T | covered | 3.6 › Expansion in a Basis |
| 3.8 | Definition: transition matrix from T to S, P = ([v₁]_S ⋯ [v_k]_S) | covered | 3.6 › Expansion in a Basis (recalled in 3.8 › Computing Transition Matrices) |
| 3.8 | Theorem [w]_S = P[w]_T (with the Peᵢ heuristic) | covered / added | 3.6 › Expansion in a Basis (proof); heuristic in 3.8 › Computing Transition Matrices |
| 3.8 | Algorithm (S \| T) → (I_k P; 0 0) | added | 3.8 › Computing Transition Matrices |
| 3.8 | Theorem: P⁻¹ is the transition matrix from S to T | added | 3.8 › Computing Transition Matrices (statement also in 3.6 › Expansion in a Basis) |
| Appendix | Proof: independent S plus u ∉ span(S) is independent | added | 3.5 › Adding and Removing Vectors |
| Appendix | Proof: subsets of independent sets are independent | covered | 3.5 › Linear Independence (Lemma 2) |
| Appendix | Proof: coordinates preserve independence and spanning | added | 3.7 › Dimension of Subspaces of ℝⁿ |
| Appendix | Proof of [w]_S = P[w]_T | covered | 3.6 › Expansion in a Basis |
| Appendix | Geometric interpretation of transition matrices (scaling, turning of axes) | added | 3.8 › Computing Transition Matrices (Remark) |

## Chapter 4. Subspaces Associated to a Matrix

| Slide section | Topic | Status (covered / added / see-section) | Where in the edition (MA section › subsection) |
|---|---|---|---|
| 4.1 (sl. 3–4) | Definition of the row space Row(A), a subspace of R^n | added | 4.1 › Row Space and Column Space (Definition) |
| 4.1 (sl. 3–4) | Definition of the column space Col(A), a subspace of R^m | covered | 4.1 › Examples of Finite-Dimensional Vector Spaces (item 4); restated in 4.1 › Row Space and Column Space (Definition) |
| 4.1 (sl. 5) | Vectors of the row space may be written as columns (Row(A) as Col(A^T)) | added | 4.1 › Row Space and Column Space (paragraph after the Definition) |
| 4.1 (sl. 7–9) | Row operations preserve the row space (row-equivalent matrices have Row(A) = Row(B)) | added | 4.1 › Bases for the Row Space, Column Space and Nullspace (Theorem: Row operations preserve the row space) |
| 4.1 (sl. 10) | Nonzero rows of the RREF form a basis for Row(R) = Row(A); also for any REF | added | 4.1 › Bases for the Row Space, Column Space and Nullspace (Theorem: Basis for the row space, and the paragraph after it) |
| 4.1 (sl. 13–15) | Row operations preserve linear relations between columns (so Null(A) = Null(B)) | added | 4.1 › Bases for the Row Space, Column Space and Nullspace (Theorem: Row operations preserve linear relations between columns) |
| 4.1 (sl. 16–18) | Columns of A in the pivot-column positions of the RREF form a basis for Col(A); non-pivot columns of R give the coefficients | added | 4.1 › Bases for the Row Space, Column Space and Nullspace (Theorem: Basis for the column space; Example) |
| 4.1 (sl. 19–20) | Row operations do not preserve the column space or linear relations between rows (columns of R are not a basis for Col(A); rows of A in nonzero-row positions need not be independent) | added | 4.1 › Bases for the Row Space, Column Space and Nullspace (Remark: What row operations do not preserve) |
| 4.1 (sl. 21–22) | Column space and consistency: v in Col(A) iff Ax = v consistent; Col(A) = {Au} = {v : Ax = v consistent} | added | 4.1 › Row Space and Column Space (Proposition: Column space and consistency) |
| 4.1 (sl. 23) | Definition of the nullspace Null(A) and nullity(A) | covered | 4.1 › Examples of Finite-Dimensional Vector Spaces (item 3); set notation in 4.1 › Row Space and Column Space |
| 4.1 (sl. 24) | Basis for the nullspace from the RREF (one vector per parameter) | covered | 4.2 › Homogeneous Linear Systems (Theorem); procedure and worked example in 4.1 › Bases for the Row Space, Column Space and Nullspace (Algorithm, Example) |
| 4.2 (sl. 27) | dim Col(A) = no. of pivot columns = no. of leading entries = no. of nonzero rows of the RREF = dim Row(A) | added | 4.2 › Dimensions of the Column and Row Spaces (Theorem) |
| 4.2 (sl. 27) | Definition rank(A) = dim Col(A) = dim Row(A) | covered | 4.2 › Matrix Rank |
| 4.2 (sl. 28) | rank(A) = rank(A^T) | covered | 4.2 › Matrix Rank ("two obvious properties") |
| 4.2 (sl. 29) | rank(A) = 0 iff A = 0 | added | 4.2 › Dimensions of the Column and Row Spaces (Corollary, 2) |
| 4.2 (sl. 29) | Computing the rank from the RREF (or any REF) | added | 4.2 › Dimensions of the Column and Row Spaces (paragraph after the Theorem; Example) |
| 4.2 (sl. 30) | Rank and consistency: Ax = b consistent iff rank(A) = rank(A \| b) | covered | 4.2 › Rank and Consistency (Kronecker–Capelli Theorem) |
| 4.2 (sl. 34) | Lemma: Col(AB) is contained in Col(A) | covered | 4.2 › Properties of Rank (proof of Proposition 2) |
| 4.2 (sl. 35) | rank(AB) <= min{rank(A), rank(B)} | covered | 4.2 › Properties of Rank (Proposition 2) |
| 4.2 (sl. 36) | Row-equivalent matrices have equal rank | added | 4.2 › Dimensions of the Column and Row Spaces (Corollary, 1); also 4.2 › Properties of Rank (Proposition 3) |
| 4.2 (sl. 37) | Rank–nullity theorem rank(A) + nullity(A) = n | covered | 4.2 › Homogeneous Linear Systems (Corollary: Rank–Nullity Theorem) |
| 4.2 (sl. 37) | nullity(A) = number of non-pivot columns of the RREF (rank–nullity as a column count) | added | 4.2 › Summary of the Subspaces Associated to a Matrix |
| 4.2 (sl. 38–39) | Summary table of Col(A), Row(A), Null(A): ambient space, basis, dimension | added | 4.2 › Summary of the Subspaces Associated to a Matrix (table, Example) |
| 4.2 (sl. 40) | rank(A + B) <= rank(A) + rank(B) | covered | 4.2 › Properties of Rank (Proposition 1) |
| 4.2 (sl. 41) | rank(A) <= min{m, n} | covered | 4.2 › Matrix Rank; RREF argument in 4.2 › Full Rank |
| 4.2 (sl. 41–42) | Definition of full rank, rank(A) = min{m, n}; examples | added | 4.2 › Full Rank (Definition, Example) |
| 4.2 (sl. 43) | A square matrix is of full rank iff it is invertible | added | 4.2 › Full Rank (Theorem: Equivalent statements for invertibility, item (xii)) |
| 4.2 (sl. 44) | Equivalent statements for invertibility, items (i)–(xiii) (adds rank(A) = n, nullity(A) = 0) | added | 4.2 › Full Rank (Theorem: Equivalent statements for invertibility; (i)–(ix) from Section 2.6) |
| 4.2 (sl. 45) | Lemma: Null(A) = Null(A^T A) | added | 4.2 › Full Rank (Lemma) |
| 4.2 (sl. 46–48) | Full rank equal to the number of columns: (i)–(vi), left inverse (A^T A)^{-1} A^T; example | added | 4.2 › Full Rank (Theorem: Full rank equal to the number of columns; Example: A left inverse) |
| 4.2 (sl. 49–51) | Full rank equal to the number of rows: (i)–(vi), right inverse A^T (A A^T)^{-1}; example | added | 4.2 › Full Rank (Theorem: Full rank equal to the number of rows; Example: A right inverse) |
| 4.2 (sl. 52) | Left inverse and solvability (the flaw in the "challenge" argument) | added | 4.2 › Full Rank (Remark: A left inverse does not produce solutions) |

Pure questions and challenges not inventoried as topics: sl. 4, 6, 12, 17, 18, 19 (insight used in the Remark), 24 (as an exercise), 26, 28, 30, 36, 40, 52 (each is either covered by a row above or is a pure exercise).

## Chapter 5. Orthogonality, Projection, and Least Squares

| Slide section | Topic | Status (covered / added / see-section) | Where in the edition (MA section › subsection) |
|---|---|---|---|
| 5.1 | Recall: dot product, norm, angle θ = cos⁻¹(u·v/‖u‖‖v‖), 0 ≤ θ ≤ π | covered | 3.2 › Norm, Distance and Angle in ℝⁿ; 5.1 › Orthogonality of Vectors (angle) |
| 5.1 | Definition: u, v orthogonal iff u·v = 0 | covered | 5.1 › Orthogonality of Vectors |
| 5.1 | Orthogonal iff one vector is 0 or they are perpendicular (θ = π/2); 0 is orthogonal to every vector; scalar multiples stay orthogonal | added | 5.1 › Orthogonal Vectors and Orthogonal Sets |
| 5.1 | Definition: orthogonal set (pairwise orthogonal, may contain 0) and orthonormal set (v_i·v_j = δ_ij) | added | 5.1 › Orthogonal Vectors and Orthogonal Sets (the book's nonzero-vector form is in 5.2 › Orthogonal and Orthonormal Sets) |
| 5.1 | Normalizing an orthogonal set of nonzero vectors; a set containing 0 cannot be normalized; an orthonormal set never contains 0 | added | 5.1 › Orthogonal Vectors and Orthogonal Sets (with example) |
| 5.1 | Definition: n orthogonal to a subspace V (n ⊥ V); 0 ⊥ V | covered | 5.1 › Orthogonality of Sets (x ⊥ L for any set L); restated for subspaces in 5.1 › Orthogonality to a Subspace; V^⊥ = Null(Aᵀ) |
| 5.1 | Plane or hyperplane {v : v·n = 0} through the origin given by a normal vector n ≠ 0 | added | 5.1 › Orthogonality to a Subspace; V^⊥ = Null(Aᵀ) |
| 5.1 | Theorem: w ⊥ V iff w·u_i = 0 for every vector u_i of a spanning set | added | 5.1 › Orthogonality to a Subspace; V^⊥ = Null(Aᵀ) (Theorem "Orthogonality Test", with proof) |
| 5.1 | Theorem and algorithm: w ⊥ V iff w ∈ Null(Aᵀ), where A = (u_1 ⋯ u_k) | added | 5.1 › Orthogonality to a Subspace; V^⊥ = Null(Aᵀ) (theorem, proof by block multiplication, algorithm, ℝ⁴ example) |
| 5.1 | Definition: orthogonal complement V^⊥ | covered | 5.1 › Orthogonality of Sets (L^⊥, shown to be a subspace); restated in 5.1 › Orthogonality to a Subspace; V^⊥ = Null(Aᵀ) |
| 5.1 | Theorem: V^⊥ = Null(Aᵀ) | added | 5.1 › Orthogonality to a Subspace; V^⊥ = Null(Aᵀ) |
| 5.1 | Row(A)^⊥ = Null(A) (challenge, kept because the course uses it), together with Col(A)^⊥ = Null(Aᵀ) | added | 5.1 › Orthogonality to a Subspace; V^⊥ = Null(Aᵀ) (Corollary) |
| 5.2 | Theorem: an orthogonal set of nonzero vectors is linearly independent | covered | 5.1 › Orthogonal Sum of Subspaces (Corollary 1); a direct proof in the slides' style is in 5.2 › Orthogonal and Orthonormal Bases; Coordinates |
| 5.2 | Corollary: every orthonormal set is linearly independent | added | 5.2 › Orthogonal and Orthonormal Bases; Coordinates |
| 5.2 | Definition: orthogonal basis and orthonormal basis for a subspace V | added | 5.2 › Orthogonal and Orthonormal Bases; Coordinates |
| 5.2 | Derivation: c_i = (v·u_i)/‖u_i‖² relative to an orthogonal basis | added | 5.2 › Orthogonal and Orthonormal Bases; Coordinates (proof of theorem) |
| 5.2 | Theorem: v = Σ (v·u_i)/‖u_i‖² u_i; for an orthonormal basis, v = Σ (v·u_i) u_i; [v]_S formulas | added | 5.2 › Orthogonal and Orthonormal Bases; Coordinates (Theorem "Coordinates Relative to an Orthogonal Basis", example in a plane of ℝ³) |
| 5.2 | Standard basis E is orthonormal and [v]_E = v | added | 5.2 › Orthogonal and Orthonormal Bases; Coordinates |
| 5.2 | Note: the formula fails for a basis that is not orthogonal | added | 5.2 › Orthogonal and Orthonormal Bases; Coordinates (counterexample in ℝ²) |
| 5.2 | QᵀQ has (i, j)-entry u_i·u_j; S orthogonal iff QᵀQ is diagonal; S orthonormal iff QᵀQ = I_k; when k = n, iff Qᵀ = Q⁻¹ | added | 5.2 › Orthogonal Matrices and Orthonormal Columns (the square complex case is already in 5.2 › Orthogonal and Orthonormal Sets) |
| 5.2 | Definition: orthogonal matrix, Aᵀ = A⁻¹, equivalently AᵀA = I = AAᵀ | covered | 5.2 › Cartesian Systems and Orthogonal Matrices (PᵀP = I, P⁻¹ = Pᵀ); the course's form and its equivalence with the book's are in 5.2 › Orthogonal Matrices and Orthonormal Columns |
| 5.2 | Theorem: A orthogonal ⇔ columns form an orthonormal basis for ℝⁿ ⇔ rows form an orthonormal basis for ℝⁿ | added | 5.2 › Orthogonal Matrices and Orthonormal Columns (the book stated this only for unitary matrices, and left rows as "prove this!") |
| 5.2 | Remarks: merely orthogonal columns have no special name; the term "orthonormal matrix"; a non-square Q with QᵀQ = I is not orthogonal | added | 5.2 › Orthogonal Matrices and Orthonormal Columns (Example and Remark) |
| 5.3 | Orthogonal projection theorem: unique w = w_p + w_n with w_p ∈ V, w_n ⊥ V | covered | 5.3 › Orthogonal Projection and Best Approximation (Orthogonal Projection Theorem); restated in course notation in 5.3 › Projection Formula for an Orthogonal Basis |
| 5.3 | Projection formula w_p = Σ (w·u_i)/(u_i·u_i) u_i for an orthogonal basis; Σ (w·u_i) u_i for an orthonormal basis | added | 5.3 › Projection Formula for an Orthogonal Basis (theorem, proof, example) |
| 5.3 | Definition: orthogonal projection of w onto V | covered | 5.3 › Orthogonal Projection and Best Approximation |
| 5.3 | Projection onto a line (w·u)/(u·u) u; w_p does not depend on the choice of orthogonal basis | added | 5.3 › Projection Formula for an Orthogonal Basis |
| 5.3 | Best approximation theorem: ‖w − w_p‖ ≤ ‖w − v‖ for all v ∈ V | covered | 5.3 › Orthogonal Projection and Best Approximation (second part of the theorem, with strict inequality); named and stated in course form in 5.3 › Projection Formula for an Orthogonal Basis |
| 5.3 | If w ∈ V, then w_p = w and w_n = 0 | added | 5.3 › Projection Formula for an Orthogonal Basis |
| 5.3 | Gram–Schmidt process in the course's form (v_j = u_j − Σ (v_i·u_j)/‖v_i‖² v_i, normalize at the end); spans are preserved; the result is an orthonormal basis | added | 5.3 › Gram–Schmidt Process: Orthogonal Form (algorithm, theorem with proof, ℝ³ example); the book's normalized version is in 5.3 › Gram–Schmidt Process |
| 5.3 | Gram–Schmidt on a dependent set: v_j = 0 iff u_j ∈ span{u_1, …, u_(j−1)} | added | 5.3 › Gram–Schmidt Process: Orthogonal Form |
| 5.4 | Derivation: Gram–Schmidt on the columns gives a_j = r_1j q_1 + ⋯ + r_jj q_j, so A = QR | covered | 5.4 › QR Factorization of a Matrix |
| 5.4 | QᵀQ = I_n, r_ii > 0, R invertible (exercise facts used in the theorem) | added | 5.4 › Computing a QR Factorization (proof of theorem) |
| 5.4 | Theorem and definition: QR factorization in the course's form (A with independent columns; QᵀQ = I_n; R invertible upper triangular with positive diagonal) | added | 5.4 › Computing a QR Factorization |
| 5.4 | R = QᵀA | added | 5.4 › Computing a QR Factorization |
| 5.4 | Algorithm for QR factorization | added | 5.4 › Computing a QR Factorization (algorithm and 4 × 3 example) |
| 5.4 | Corollary: if A has independent columns, then AᵀA is invertible and A has a left inverse | added | 5.4 › Computing a QR Factorization (Corollary; a Remark adds Null(AᵀA) = Null(A)) |
| 5.5 | Recall: Col(A) = {b : Ax = b is consistent} = {Au} | covered | 2.3 › Linear Combinations; 4.1 › Examples of Finite-Dimensional Vector Spaces (recalled in 5.5 › Computing Least Squares Solutions) |
| 5.5 | Definition: least squares solution (‖Au − b‖ ≤ ‖Av − b‖ for all v) | covered | 5.5 › Method of Least Squares; course form restated in 5.5 › Computing Least Squares Solutions |
| 5.5 | Theorem: u is a least squares solution iff Au is the projection of b onto Col(A) | covered | 5.5 › Method of Least Squares (proof of Proposition); stated explicitly in 5.5 › Computing Least Squares Solutions (theorem (i) ⇔ (ii)) |
| 5.5 | Theorem: u is a least squares solution iff AᵀAu = Aᵀb | covered | 5.5 › Method of Least Squares (Corollary, normal equation); also 5.5 › Computing Least Squares Solutions (theorem (ii) ⇔ (iii)) |
| 5.5 | Least squares solutions need not be unique, but Au is the same for all of them | covered | 5.5 › Method of Least Squares (Proposition: affine set of dimension n − r); the uniqueness of Au and a non-unique example are added in 5.5 › Computing Least Squares Solutions |
| 5.5 | Unique least squares solution u = (AᵀA)⁻¹Aᵀb when A has independent columns | added | 5.5 › Computing Least Squares Solutions (theorem and example) |
| 5.5 | Projection revisited: w_p = A(AᵀA)⁻¹Aᵀw for a basis of V | added | 5.5 › Computing Least Squares Solutions (theorem and example) |
| 5.5 | For a consistent system, least squares solutions are exactly the solutions | added | 5.5 › Computing Least Squares Solutions |
| 5.5 | Least squares via QR: u = R⁻¹Qᵀb, i.e. solve Rx = Qᵀb by back substitution (exercise) | added | 5.5 › Computing Least Squares Solutions (theorem and example) |
| 5.5 | Projection QQᵀw onto V when the columns of Q are an orthonormal basis (challenge) | added | 5.5 › Computing Least Squares Solutions (second part of the projection theorem) |

## Chapter 6. Eigenanalysis

| Slide section | Topic | Status (covered / added / see-section) | Where in the edition (MA section › subsection) |
|---|---|---|---|
| 6.1 | A square matrix as a map u ↦ Au of ℝⁿ; eigenvectors are the vectors it only scales (geometric examples) | added | 6.1 › Finding Eigenvalues; the Eigenvalue Zero (opening paragraph, example with (1 2; 2 1)) |
| 6.1 | Definition: real eigenvalue λ, eigenvector v ≠ 0 in ℝⁿ with Av = λv | covered | 6.1 › Eigenvalues and Eigenvectors (definition + MA1522 real-case sentence) |
| 6.1 | Remark: why the eigenvector must be nonzero | added | 6.1 › Finding Eigenvalues; the Eigenvalue Zero |
| 6.1 | Definition: characteristic polynomial char(A) = det(xI − A) | covered | 6.1 › The Characteristic Equation |
| 6.1 | Theorem: λ is an eigenvalue ⇔ (λI − A)x = 0 has nontrivial solutions | covered | 6.1 › The Characteristic Equation |
| 6.1 | Theorem: λ is an eigenvalue ⇔ λ is a root of char(A) (finding eigenvalues) | covered (+ worked example added) | 6.1 › The Characteristic Equation; example in 6.1 › Finding Eigenvalues; the Eigenvalue Zero |
| 6.1 | Theorem: A invertible ⇔ 0 is not an eigenvalue | added | 6.1 › Finding Eigenvalues; the Eigenvalue Zero |
| 6.1 | Equivalent statements for invertibility (i)–(xiv), new item (xiv) | added | 6.1 › Finding Eigenvalues; the Eigenvalue Zero (theorem "equivalent statements for invertibility") |
| 6.1 | Definition: algebraic multiplicity r_λ | covered | 6.1 › Algebraic Multiplicity of an Eigenvalue |
| 6.1 | char(A) = Π(x − λᵢ)^{rᵢ} with Σrᵢ = n when it splits; over ℝ fewer real eigenvalues possible (examples: zero matrix, char with x² + 1 factor) | added | 6.1 › Real Eigenvalues and Triangular Matrices |
| 6.1 | Theorem: eigenvalues of a triangular matrix = diagonal entries, multiplicity = number of occurrences | added | 6.1 › Real Eigenvalues and Triangular Matrices |
| 6.1 | Definition: eigenspace E_λ = Null(λI − A); geometric multiplicity dim(E_λ) = nullity(λI − A) | covered | 6.1 › Geometric Multiplicity of an Eigenvalue |
| 6.1 | Computing bases for eigenspaces by RREF (worked example) | added | 6.1 › Computing Eigenspaces |
| 6.1 (challenge, used in appendix) | char(Aᵀ) = char(A); same geometric multiplicities for A and Aᵀ | added | 6.1 › Computing Eigenspaces (proposition) |
| 6.2 | Definition: diagonalizable, P⁻¹AP = D ⇔ A = PDP⁻¹; zero/identity/diagonal matrices are diagonalizable | covered | 6.2 › Diagonalizable Matrices |
| 6.2 | AP = PD: columns of P are eigenvectors, diagonal of D the eigenvalues | covered | 6.1 › Eigenvalues and Eigenvectors (opening and theorem); 6.2 › Diagonalizable Matrices |
| 6.2 | Theorem: A diagonalizable ⇔ A has n linearly independent eigenvectors (basis of ℝⁿ of eigenvectors) | covered | 6.1 › Eigenvalues and Eigenvectors (theorem) |
| 6.2 | Non-diagonalizable examples; algebraic multiplicity exceeds geometric | covered (+ added examples) | 6.1 › Eigenvalues and Eigenvectors ((0 1; 0 0)); 6.2 › Equivalent Statements for Diagonalizability |
| 6.2 / Appendix | Theorem: eigenspaces are linearly independent (union of independent subsets of distinct eigenspaces is independent), with proof | added | 6.2 › Independence of Eigenspaces and the Two Multiplicities |
| 6.2 / Appendix | Theorem: 1 ≤ dim(E_λ) ≤ r_λ, with proof | added | 6.2 › Independence of Eigenspaces and the Two Multiplicities |
| 6.2 | Equivalent statements for diagonalizability (diagonalizable; eigenvector basis; char splits and dim(E_λ) = r_λ for all λ; Σ dim(E_λ) = n) | added | 6.2 › Equivalent Statements for Diagonalizability |
| 6.2 | How to show non-diagonalizability: char does not split, or dim(E_λ) < r_λ for some λ | added | 6.2 › Equivalent Statements for Diagonalizability |
| 6.2 (exercise) | A with a single eigenvalue is diagonalizable ⇔ A = λI | added | 6.2 › Equivalent Statements for Diagonalizability (remark) |
| 6.2 | Theorem: n distinct eigenvalues ⇒ diagonalizable | covered | 6.2 › Eigenvectors for Distinct Eigenvalues (corollary); also derived in 6.2 › Equivalent Statements for Diagonalizability |
| 6.2 | Algorithm for diagonalization (worked example) | added | 6.2 › Algorithm for Diagonalization |
| 6.2 (question) | Non-uniqueness of P and D | added | 6.2 › Algorithm for Diagonalization (closing paragraph) |
| 6.3 | Orthogonal matrix Pᵀ = P⁻¹ | covered (pointer) | 5.2 › Orthogonal Matrices and Orthonormal Columns; recalled with a pointer in 6.3 › Orthogonally Diagonalizable Matrices |
| 6.3 | Definition: orthogonally diagonalizable A = PDPᵀ; orthogonally diagonalizable ⇒ diagonalizable | added | 6.3 › Orthogonally Diagonalizable Matrices |
| 6.3 | Spectral theorem: orthogonally diagonalizable ⇔ symmetric | covered + added | 6.3 › Orthogonal Diagonalization of Real Symmetric Matrices (symmetric ⇒ orth. diag., full proof); 6.3 › Orthogonally Diagonalizable Matrices (theorem with both directions) |
| 6.3 | Equivalent statements: orth. diagonalizable ⇔ orthonormal eigenvector basis of ℝⁿ ⇔ symmetric | added | 6.3 › Orthogonally Diagonalizable Matrices (spectral theorem) |
| 6.3 | Theorem: eigenspaces of a symmetric matrix are orthogonal (v₁ · v₂ = 0), with proof | added | 6.3 › Orthogonally Diagonalizable Matrices |
| 6.3 | Gram–Schmidt is needed only within each eigenspace | added | 6.3 › Orthogonally Diagonalizable Matrices; 6.3 › Algorithm for Orthogonal Diagonalization |
| 6.3 | Algorithm for orthogonal diagonalization (worked example) | added | 6.3 › Algorithm for Orthogonal Diagonalization |
| 6.4 | Theorem: A = PBP⁻¹ ⇒ A^m = PB^mP⁻¹ (B need not be diagonal) | added | 6.4 › Powers of Diagonalizable Matrices |
| 6.4 | Powers of a diagonal matrix | added | 6.4 › Powers of Diagonalizable Matrices |
| 6.4 | Corollary: A^k = P diag(μᵢ^k) P⁻¹; all integers k if A invertible | added | 6.4 › Powers of Diagonalizable Matrices |
| 6.4 | Definitions: probability vector, stochastic matrix, Markov chain, state vector; x_k = P^k x₀ | added | 6.4 › Stochastic Matrices and Markov Chains |
| 6.4 | Long-run behaviour of a Markov chain via diagonalization (worked example) | added | 6.4 › Stochastic Matrices and Markov Chains (commuter example) |
| 6.4 | Definition: equilibrium (steady-state) vector | added | 6.4 › Equilibrium Vectors |
| 6.4 | 1 is an eigenvalue of every stochastic matrix; P v is a probability vector | added | 6.4 › Equilibrium Vectors; 6.4 › Stochastic Matrices and Markov Chains |
| 6.4 | Theorem: a convergent Markov chain converges to an equilibrium vector | added | 6.4 › Equilibrium Vectors |
| 6.4 | PageRank: adjacency matrix, probability transition matrix, random-surfer state vectors | added | 6.4 › Application: Ranking Web Pages |
| 6.4 / Appendix | Definition: regular stochastic matrix | added | 6.4 › Regular Stochastic Matrices |
| 6.4 | Algorithm to compute an equilibrium vector | added | 6.4 › Equilibrium Vectors |
| 6.4 | PageRank example: equilibrium vector and ranking | added | 6.4 › Application: Ranking Web Pages |
| 6.4 (exercise) | Equilibrium vector via the stacked system (P − I; 1ᵀ)x = (0; 1) | added | 6.4 › Equilibrium Vectors (closing paragraph, with nonnegativity/uniqueness qualification) |
| 6.5 | Every m × n A has A = UΣVᵀ with Σ = (D 0; 0 0), D = diag(σ₁, …, σ_r) | covered + added | 6.5 › Singular Value Decomposition of a Matrix; 6.5 › Singular Values and Singular Vectors; block form in 6.5 › Computing a Singular Value Decomposition |
| 6.5 | Lemma: eigenvalues of AᵀA are nonnegative (‖Avᵢ‖² = μᵢ) | covered | 6.5 › Singular Values and Singular Vectors; real-case proof in 6.5 › Computing a Singular Value Decomposition |
| 6.5 | Definition: singular values σᵢ = √μᵢ in decreasing order; r; Σ | covered | 6.5 › Singular Values and Singular Vectors |
| 6.5 (exercise) | Avᵢ ≠ 0 for i ≤ r, Avᵢ = 0 for i > r | covered | 6.5 › Singular Values and Singular Vectors; 6.5 › Computing a Singular Value Decomposition (lemma proof) |
| 6.5 | Lemma: uᵢ = σᵢ⁻¹Avᵢ (i ≤ r) form an orthonormal basis for Col(A); rank(A) = r | covered + added proof | 6.5 › Consequences of the SVD (items 1, 3); proof in 6.5 › Computing a Singular Value Decomposition |
| 6.5 | Theorem: A = UΣVᵀ with V from eigenvectors of AᵀA and U from extending {u₁, …, u_r} (AV = UΣ) | covered | 6.5 › Singular Values and Singular Vectors (real case at its end); restated in 6.5 › Computing a Singular Value Decomposition |
| 6.5 | Algorithm for an SVD (worked example with extension of U) | added | 6.5 › Computing a Singular Value Decomposition |
| Appendix | Similar matrices: definition; diagonalizable = similar to a diagonal matrix | covered | 6.2 › Similarity Transformation; 6.2 › Diagonalizable Matrices; 7.1 › Change of Bases |
| Appendix | Similar matrices have the same characteristic polynomial | covered | 6.1 › Characteristic Polynomial and Similarity |
| Appendix | Lemma: a stochastic matrix with positive entries has dim(E₁) = 1 | added | 6.4 › Regular Stochastic Matrices |
| Appendix | Lemma: an eigenvector of A for λ is an eigenvector of A^k for λ^k | added | 6.4 › Powers of Diagonalizable Matrices |
| Appendix | Lemma: for regular P every Markov chain converges (slides: proof beyond syllabus) | added (elementary proof) | 6.4 › Regular Stochastic Matrices (theorem, 1-norm contraction argument) |
| Appendix | Theorem: regular P has a unique equilibrium vector and every Markov chain converges to it | added | 6.4 › Regular Stochastic Matrices |

## Chapter 7. Linear Transformations

| Slide section | Topic | Status (covered / added / see-section) | Where in the edition (MA section › subsection) |
|---|---|---|---|
| 7.1 | Geometric interpretation of matrix multiplication: an m×n matrix maps ℝⁿ → ℝᵐ (embedding into a plane, projection onto a plane, zero matrix) | added | 7.1 › Linear Transformations from ℝⁿ to ℝᵐ (Example "Matrices as mappings", with rotation and reflection too); the matrix-as-mapping idea also in 7.1 › Linear Transformations and 2.1 › Linear Mappings and Matrices |
| 7.1 | Linearity of matrix multiplication A(αu + βv) = αAu + βAv; the image of a linear combination is that combination of the images | covered (geometric reading added) | 7.1 › Linear Transformations (linearity property); 7.1 › Linear Transformations from ℝⁿ to ℝᵐ (geometric meaning) |
| 7.1 | Definition of a linear transformation T: ℝⁿ → ℝᵐ; domain and codomain | covered (restated for ℝⁿ) | 7.1 › Linear Transformations (Definition, general V, W); 7.1 › Mappings, Functions, Operators (domain, codomain); 7.1 › Linear Transformations from ℝⁿ to ℝᵐ (ℝⁿ form) |
| 7.1 | Equivalent definition: additivity T(u + v) = T(u) + T(v) and homogeneity T(αu) = αT(u) | added | 7.1 › Linear Transformations from ℝⁿ to ℝᵐ (Proposition "Basic properties" (a)) |
| 7.1 | Linear transformations preserve linear combinations of k vectors (induction) | added | 7.1 › Linear Transformations from ℝⁿ to ℝᵐ (Proposition "Basic properties" (b)) |
| 7.1 | Every matrix defines a linear transformation T_A(u) = Au; A ↦ T_A is one-to-one and onto | added | 7.1 › Linear Transformations (T_A); 7.1 › The Standard Matrix (bijective correspondence after the theorem) |
| 7.1 | Examples of verifying linearity | added | 7.1 › Linear Transformations from ℝⁿ to ℝᵐ (Example "Checking linearity") |
| 7.1 | T(0) = 0; T is not linear if T(0) ≠ 0, or T(αu) ≠ αT(u), or T(u + v) ≠ T(u) + T(v) | added | 7.1 › Linear Transformations from ℝⁿ to ℝᵐ (Proposition "Basic properties" (c) and the paragraph after it) |
| 7.1 | Examples of mappings that are not linear | added | 7.1 › Linear Transformations from ℝⁿ to ℝᵐ (Example "Mappings that are not linear") |
| 7.1 | Theorem: T is linear iff T(u) = Au for a unique m×n matrix A, A = (T(e₁) ⋯ T(eₙ)) (with uniqueness) | added | 7.1 › The Standard Matrix (Theorem "Standard Matrix" with proof) |
| 7.1 | Definition: standard matrix (matrix representation) of T | covered | 7.1 › Matrix of a Linear Transformation (A = [T]_E); recalled in 7.1 › The Standard Matrix |
| 7.1 | Examples: finding the standard matrix from a formula for T | added | 7.1 › The Standard Matrix (Example) |
| 7.1 | Definition: representation of T with respect to a basis S, [T]_S = (T(u₁) ⋯ T(uₙ)); A = [T]_E | covered | 7.1 › Matrix of a Linear Transformation ([T]_S = [T]_(S,E)) |
| 7.1 | Theorem: T(v) = [T]_S [v]_S and A = [T]_S P, P the transition matrix from E to S | covered (direct proof added) | 7.1 › Matrix of a Linear Transformation and 7.1 › Change of Bases (after (∗)); direct proof in 7.1 › Recovering a Linear Transformation from the Images of a Basis |
| 7.1 | T is determined by its images on a basis; computing A (and the formula for T) from the images of a basis; examples | added | 7.1 › Recovering a Linear Transformation from the Images of a Basis (P = U⁻¹, Algorithm, Example) |
| 7.1 | Example: images of a linearly dependent set do not determine T | added | 7.1 › Recovering a Linear Transformation from the Images of a Basis (Proposition "When the images determine T", Example "Too little information") |
| 7.2 | Definition: range R(T) = T(ℝⁿ) | covered | 7.2 › Kernel and Range of a Linear Transformation; ℝⁿ form in 7.2 › Range and Kernel via the Standard Matrix |
| 7.2 | Theorem: the range is a subspace; R(T) = Col(A) | added (subspace part covered) | 7.2 › Kernel and Range of a Linear Transformation (Proposition 1); 7.2 › Range and Kernel via the Standard Matrix (zero vector, Proposition 3) |
| 7.2 | Definition: rank(T) = dim R(T); rank(T) = rank(A) | added (definition covered) | 7.2 › Kernel and Range of a Linear Transformation (definition); 7.2 › Range and Kernel via the Standard Matrix (Proposition 3) |
| 7.2 | Definition: kernel ker(T) | covered | 7.2 › Kernel and Range of a Linear Transformation; ℝⁿ form in 7.2 › Range and Kernel via the Standard Matrix |
| 7.2 | Theorem: the kernel is a subspace; ker(T) = Null(A) | added (subspace part covered) | 7.2 › Kernel and Range of a Linear Transformation (Proposition 1); 7.2 › Range and Kernel via the Standard Matrix (Proposition 3) |
| 7.2 | Definition: nullity(T) = dim ker(T); nullity(T) = nullity(A) | added (definition covered) | 7.2 › Kernel and Range of a Linear Transformation (definition); 7.2 › Range and Kernel via the Standard Matrix (Proposition 3) |
| 7.2 | Examples: rank and nullity of a linear transformation | added | 7.2 › Range and Kernel via the Standard Matrix (Example) |
| 7.2 | Definition: injective (one-to-one) | covered | 7.1 › Mappings, Functions, Operators; recalled in 7.2 › Injective and Surjective Linear Transformations |
| 7.2 | Theorem: T injective iff ker(T) = {0}; matrix reading (unique solution of Ax = v iff Ax = 0 has only the trivial solution) | added | 7.2 › Injective and Surjective Linear Transformations (Theorem "Injectivity" and the paragraph after it) |
| 7.2 | Theorem: full rank equals number of columns, (i)–(vii) with "T injective" | added | 7.2 › Injective and Surjective Linear Transformations (Theorem "Full Rank Equals Number of Columns"; (i)–(vi) from 4.2 › Full Rank) |
| 7.2 | Example: deciding injectivity and describing the range by row reducing (A ∣ v) | added | 7.2 › Injective and Surjective Linear Transformations (Example "Injective but not surjective") |
| 7.2 | Exercise: T injective ⇒ n ≤ m | added | 7.2 › Injective and Surjective Linear Transformations (Corollary) |
| 7.2 | Definition: surjective (onto); R(T) = ℝᵐ iff rank(T) = m iff rank(A) = m | added (definition covered) | 7.1 › Mappings, Functions, Operators (definition); 7.2 › Injective and Surjective Linear Transformations (Theorem "Surjectivity") |
| 7.2 | Theorem: full rank equals number of rows, (i)–(vii) with "T surjective" | added | 7.2 › Injective and Surjective Linear Transformations (Theorem "Full Rank Equals Number of Rows"; (i)–(vi) from 4.2 › Full Rank) |
| 7.2 | Exercise: T surjective ⇒ n ≥ m | added | 7.2 › Injective and Surjective Linear Transformations (Corollary) |
| 7.2 | Example: an invertible standard matrix gives a T that is injective and surjective; solving T(x) = v | added | 7.2 › Equivalent Statements for Invertibility (Example) |
| 7.2 | Theorem: equivalent statements for invertibility (i)–(xvi), adding "T injective" and "T surjective" | added | 7.2 › Equivalent Statements for Invertibility (Theorem; (i)–(xiv) from 6.1 › Finding Eigenvalues; the Eigenvalue Zero) |
| 7.2 | Exercise: T bijective iff there is a linear S with T(S(x)) = x and S(T(x)) = x | covered (link to A⁻¹ added) | 7.1 › Mappings, Functions, Operators (invertible iff bijective); 7.2 › The Inverse of a Linear Transformation (the inverse is linear); 7.2 › Equivalent Statements for Invertibility (paragraph: T bijective iff A invertible, [T⁻¹]_E = A⁻¹) |
| Appendix | Proof that the range is a subspace (including 0 ∈ R(T)) | covered (zero-vector step added) | 7.2 › Kernel and Range of a Linear Transformation (Proposition 1, proof); 7.2 › Range and Kernel via the Standard Matrix (T(0) = 0) |
| Appendix | Proof that the kernel is a subspace | covered (zero-vector step added) | 7.2 › Kernel and Range of a Linear Transformation (Proposition 1, proof); 7.2 › Range and Kernel via the Standard Matrix (T(0) = 0) |
| Appendix | Proof that T is injective iff ker(T) = {0} | added | 7.2 › Injective and Surjective Linear Transformations (Theorem "Injectivity", proof) |

All locations above are visible (none lies in a `beyond` subsection).
