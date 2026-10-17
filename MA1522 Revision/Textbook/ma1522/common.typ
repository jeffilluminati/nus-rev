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
#let added-tag = text(size: 7.5pt, weight: "regular", fill: rgb("#5f8a7a"), tracking: 0.04em, smallcaps[added for MA1522])

// A subsection. Drawn from the book unless `added: true`, which marks material written
// for this edition to cover a course topic the book lacks. `beyond: true` marks book
// material outside the MA1522 syllabus; such subsections carry the label <beyond> so the
// driver can leave them out (see `filter-beyond`).
#let subsec(title, beyond: false, added: false) = {
  let h = heading(level: 3, {
    title
    if beyond [#h(0.4em)#beyond-tag]
    if added [#h(0.4em)#added-tag]
  })
  if beyond [#h <beyond>] else { h }
}

// Content between a `beyond` subsection heading and the next section or subsection
// heading belongs to that subsection. `filter-beyond` drops it from a chapter's content.
#let heading-kind(c) = {
  if c.func() == heading {
    if c.at("label", default: none) == <beyond> { "beyond" } else if c.level <= 3 { "boundary" }
  } else if c.func() == [].func() {
    for x in c.children {
      let k = heading-kind(x)
      if k != none { return k }
    }
  } else if c.has("child") { heading-kind(c.child) }
}

#let filter-beyond(body) = {
  if body.func() != [].func() { return body }
  let skipping = false
  let kept = ()
  for c in body.children {
    let k = heading-kind(c)
    if k == "beyond" { skipping = true } else if k == "boundary" { skipping = false }
    if not skipping { kept.push(c) }
  }
  kept.join()
}

// Problems are numbered afresh in each course section, counting only printed problems
// (so hiding `beyond` subsections leaves no gaps). The `number:` argument is ignored.
#let problem-counter = counter("ma1522-problem")
#let problem(number: none, title: none, body) = {
  problem-counter.step()
  context styled-box(label: "Problem", number: problem-counter.get().first(), title: title, kind: "note", font-scale: 0.95em, body)
}

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
  show heading.where(level: 2): it => { problem-counter.update(0); it }
  show heading.where(level: 3): it => block(above: 1.35em, below: 0.6em, sticky: true, breakable: false, {
    set par(first-line-indent: 0pt, justify: false)
    set text(size: 10pt, weight: "bold", hyphenate: false)
    it.body
  })
  body
}
