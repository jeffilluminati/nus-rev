// Helpers for the MA1522 edition: selected sections of the book, written in the
// notation and terminology of NUS MA1522 Linear Algebra for Computing.
// Every file in ma1522/ begins with  #import "common.typ": *

#import "../template.typ": *

// Vectors and matrices are bold upright, as in the course: $bf(A) bf(x) = bf(b)$.
#let bf(x) = math.upright(math.bold(x))

// Subspaces associated with a matrix, and related functions.
#let Col = math.op("Col")
#let Row = math.op("Row")
#let Null = math.op("Null")
#let nullity = math.op("nullity")
#let adj = math.op("adj")
#let char = math.op("char")
// Range of a linear transformation, upright as in the course: $Rng(T)$.
#let Rng = math.op("R")

#let beyond-tag = text(size: 7.5pt, weight: "regular", fill: rgb("#8a8f96"), tracking: 0.04em, smallcaps[beyond MA1522])

// A subsection drawn from one section of the book. `beyond: true` marks material
// outside the MA1522 syllabus; it is kept for further reading.
#let subsec(title, beyond: false) = heading(level: 3, if beyond [#title #h(0.4em) #beyond-tag] else [#title])

// Pointer to material printed in another section of this edition.
#let see-section(num, what) = block(above: 0.8em, below: 0.8em, {
  set par(first-line-indent: 0pt)
  set text(size: 9pt, style: "italic")
  [#what is treated in Section #num.]
})

// Document-level settings for the MA1522 edition; apply after `book-project`.
#let ma-setup(body) = {
  // Matrices in round brackets, as in the course; determinants keep vertical bars (detmat).
  set math.mat(delim: "(")
  // Matrices in running text are set at full size, as in LaTeX.
  show math.mat: it => math.display(it)
  show heading.where(level: 3): it => block(above: 1.35em, below: 0.6em, sticky: true, breakable: false, {
    set par(first-line-indent: 0pt, justify: false)
    set text(size: 10pt, weight: "bold", hyphenate: false)
    it.body
  })
  body
}
