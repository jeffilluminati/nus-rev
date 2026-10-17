# MA1522 edition — notes

Selected sections of the English Tyrtyshnikov, arranged by the NUS MA1522 syllabus (AY2026/27,
`~/dev/tex/nus-rev/MA1522 Revision/`) and rewritten in the course's notation and terminology.
All textbook content is kept; subsections outside the syllabus carry the "beyond MA1522" tag.

- Build: `typst compile MA1522_Textbook.typ` (this folder) → `MA1522_Textbook.pdf`.
- Files: `common.typ` (helpers: `bf`, `Col`, `Row`, `Null`, `nullity`, `adj`, `char`, `Rng`, `subsec`,
  `see-section`, `ma-setup`), `ch1.typ`–`ch7.typ` (one per course chapter). Course sections are `#sec`,
  textbook sections are `#subsec(...) // Tyrtyshnikov §x.y`.
- Copied from the Tyrtyshnikov Typst project (`OpenLandau/Tyrtyshnikov`); `template.typ` is its book template.

## Convention decisions worth reviewing

- Ch1: the textbook's Π (permutation) and Z (row modification) matrices are not called "elementary matrices",
  since MA's elementary matrix is narrower; each is noted as a product of MA elementary matrices.
  RREF is named but never defined (the textbook has no definition).
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
- Problem numbers restart at 1 in each course section.
