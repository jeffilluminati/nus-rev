# MA1522 edition — notes

Selected sections of the English Tyrtyshnikov, arranged by the NUS MA1522 syllabus (AY2026/27,
`~/dev/tex/nus-rev/MA1522 Revision/`) and rewritten in the course's notation and terminology.
Every topic of the course's lecture slides is covered (see `COVERAGE.md`): where the book lacks one, a subsection
tagged "added for MA1522" supplies it. The book's subsections outside the syllabus are tagged `beyond: true`; they stay
in the sources but are hidden from the printed edition. Set `show-beyond = true` in the driver to print them.
Problems are numbered automatically within each course section, counting only printed problems.

- Build: `typst compile MA1522_Textbook.typ` (this folder) → `MA1522_Textbook.pdf`.
- Files: `common.typ` (helpers: `bf`, `Col`, `Row`, `Null`, `nullity`, `adj`, `char`, `Rng`, `subsec`,
  `see-section`, `filter-beyond`, `problem`, `ma-setup`), `COVERAGE.md` (slide topic → location), `ch1.typ`–`ch7.typ` (one per course chapter). Course sections are `#sec`,
  textbook sections are `#subsec(...) // Tyrtyshnikov §x.y`.
- Copied from the Tyrtyshnikov Typst project (`OpenLandau/Tyrtyshnikov`); `template.typ` is its book template.

## Convention decisions worth reviewing

- Ch1: the textbook's Π (permutation) and Z (row modification) matrices are not called "elementary matrices",
  since MA's elementary matrix is narrower; each is noted as a product of MA elementary matrices.
  RREF (not defined in the textbook) is defined in an added subsection of Section 1.2.
- Ch2: the determinant keeps the textbook's development (linear dependence indicator, Leibniz formula) with
  MA notation (matrix minor M_ij as a submatrix, cofactor A_ij, adj(A)); a bridging paragraph shows that
  Laplace's theorem with k = 1 is MA's cofactor-expansion definition. "Nonsingular" became "det(A) ≠ 0" where
  the textbook defines it that way, "invertible" elsewhere.
- Ch3: "system of vectors" is kept in the linear-dependence lemmas (they depend on order and repeats), with a
  note that MA speaks of sets. The zero space: the textbook says it has no basis; MA's ∅-basis is noted.
  Transition matrices use MA naming ([v]_S = P[v]_T, "from T to S") with one remark on the reversed name.
- Ch4: rank is defined MA's way (dim Col = dim Row); the minor-based characterisation follows as a corollary.
  The skeleton-decomposition subsection is marked beyond although it contains dim Col = dim Row (restated later).
- Ch5: Sections 5.1–5.3 use the ℝⁿ dot product, with one sentence that the results hold in any Euclidean or
  unitary space. The textbook's orthogonal sets exclude the zero vector, and its QR is broader than MA's;
  both are footnoted rather than narrowed.
- Ch6: characteristic polynomial is char(A) = det(xI − A) with all dependent signs adjusted; SVD letters are
  swapped to MA's A = UΣVᵀ (V holds right singular vectors) in Chapters 5 and 6 alike.
- Ch7: operators are T, S (T₁, T₂ for products); the two-basis matrix is [T]_(S,C), and the course's [T]_S is
  identified as [T]_(S,E) (not [T]_(S,S)). The textbook's "one-to-one" (meaning bijective) is called bijective.
- Hiding beyond material: un-hidden because visible text needs them — Ch2 "Parity of a Permutation" (sign of a
  permutation in the determinant definition) and Ch3 "Basis and Dimension of an Abstract Vector Space" (used by
  coordinates and transition matrices). Visible proofs that relied on hidden lemmas restate them with a pointer
  "(proved in Tyrtyshnikov, §x.y)".
- Equivalent statements of invertibility grow along the course: Section 2.6 (i)–(ix), 3.6 (i)–(xi), 4.2 (i)–(xiii),
  6.1 (i)–(xiv), 7.2 (i)–(xvi); later lists cite the earlier ones by item number.
- Added material goes slightly beyond the slides where needed for correctness, e.g. existence of an equilibrium vector
  for every stochastic matrix, and an elementary convergence proof for regular stochastic matrices.
