// Typst template for E. E. Tyrtyshnikov, "Matrix Analysis and Linear Algebra" (English edition)

#let current-lecture = state("current-lecture", "")
#let current-section = state("current-section", "")

// Provenance marker for original PDF page numbers (1..476)
#let source-page(n) = metadata("orig-page-" + str(n))

// ---------------------------------------------------------------------------
// Measures and palette
// ---------------------------------------------------------------------------

#let par-indent = 1.5em

// Muted tints for the environment boxes: statements (theorem family) and
// definitions; remarks, examples and problems carry a rule only.
#let env-kinds = (
  statement: (fill: rgb("#eef2f6"), rule: rgb("#62788f"), label: rgb("#1e3248")),
  definition: (fill: rgb("#f4f2ec"), rule: rgb("#9a8a63"), label: rgb("#4a3f25")),
  note: (fill: none, rule: rgb("#b3b8bd"), label: rgb("#262626")),
)

#let qed-mark = $square.stroked$

// ---------------------------------------------------------------------------
// Display equations
// ---------------------------------------------------------------------------

// Display equation with a right-aligned tag, e.g. #eq($ y = A x. $, $(*)$).
// Uses native equation numbering, so the body stays centred on the full measure
// and the tag sits on the right margin like any other equation number.
#let eq(body, tag) = {
  set math.equation(numbering: (..) => tag, number-align: right + horizon)
  body
}

// ---------------------------------------------------------------------------
// Math operators and symbol aliases (English conventions)
// ---------------------------------------------------------------------------

#let detmat(..args) = math.mat(delim: "|", ..args)
#let rank = math.op("rank")
#let diag = math.op("diag")
#let tr = math.op("tr")
#let span = math.op("span")
#let lin = math.op("lin")
#let cond = math.op("cond")
#let sign = math.op("sign")
#let sgn = math.op("sgn")
#let ind = math.op("ind")
#let Re = math.op("Re")
#let Im = math.op("Im")
#let grad = math.op("grad")
#let conv = math.op("conv")
#let aff = math.op("aff")
#let argmin = math.op("arg min", limits: true)
#let argmax = math.op("arg max", limits: true)

// Inner (scalar) product in an abstract Euclidean or unitary space: $ip(x, y)$ -> ⟨x, y⟩.
// Geometric (bold) vectors use the dot product $bold(a) dot bold(b)$ instead.
#let ip(..args) = $lr(chevron.l #args.pos().join($, $) chevron.r)$

// Explicit first-line indent for a new paragraph that follows a display block.
// Text directly after a display (no blank line) continues the sentence and stays flush left.
#let indent = h(par-indent)

#let notin = sym.in.not
#let subseteq = sym.subset.eq
#let supseteq = sym.supset.eq
#let subsetneq = sym.subset.neq
#let supsetneq = sym.supset.neq
#let oplus = sym.plus.o
#let otimes = sym.times.o
#let odot = sym.dot.o
#let cdots = sym.dots.c
#let ldots = sym.dots.h
#let vdots = sym.dots.v
#let ddots = sym.dots.down
#let iff = sym.arrow.l.r.double
#let implies = sym.arrow.r.double
#let mapsto = sym.arrow.r.bar
#let leq = sym.lt.eq
#let geq = sym.gt.eq
#let neq = sym.eq.not
#let pm = sym.plus.minus
#let mp = sym.minus.plus
#let cdot = sym.dot.op
#let infty = sym.infinity
#let varepsilon = sym.epsilon.alt
#let varphi = sym.phi.alt
#let vartheta = sym.theta.alt
#let cap = sym.inter
#let cup = sym.union
#let sect = sym.inter
#let bigcap = sym.inter.big
#let bigcup = sym.union.big

// ---------------------------------------------------------------------------
// Theorem-like environments
// ---------------------------------------------------------------------------

// Run-in label: "Theorem.", "Theorem 2.", "Theorem (Lagrange's Theorem)."
#let env-label(label, number, title, color) = {
  // A bare numeral passed as the title ("1", "2", ...) is the item's number.
  if number == none and type(title) == str and title.match(regex("^[0-9]+$")) != none {
    number = title
    title = none
  }
  let head = if number != none { label + " " + str(number) } else { label }
  text(weight: "bold", fill: color, head)
  if title != none and title != "" { [ (#title)] }
  text(weight: "bold", fill: color)[.]
}

// Colour follows `kind`: statement, definition or note (see env-kinds).
#let styled-box(
  label: "Theorem",
  number: none,
  title: none,
  kind: "statement",
  italic-body: false,
  font-scale: 1em,
  body,
) = {
  let k = env-kinds.at(kind)
  let tinted = k.fill != none
  block(
    width: 100%,
    breakable: true,
    above: 0.95em,
    below: 0.95em,
    inset: if tinted { (left: 9pt, right: 9pt, top: 6pt, bottom: 7pt) } else { (left: 9pt, top: 1pt, bottom: 1pt) },
    fill: k.fill,
    stroke: (left: 1.1pt + k.rule),
    {
      set text(size: font-scale)
      env-label(label, number, title, k.label)
      h(0.5em)
      if italic-body { emph(body) } else { body }
    },
  )
}

#let theorem(number: none, title: none, body) = styled-box(label: "Theorem", number: number, title: title, body)
#let lemma(number: none, title: none, body) = styled-box(label: "Lemma", number: number, title: title, body)
#let proposition(number: none, title: none, body) = styled-box(label: "Proposition", number: number, title: title, body)
#let corollary(number: none, title: none, body) = styled-box(label: "Corollary", number: number, title: title, body)
#let criterion(number: none, title: none, body) = styled-box(label: "Criterion", number: number, title: title, body)

#let definition(number: none, title: none, body) = styled-box(label: "Definition", number: number, title: title, kind: "definition", body)
#let property(number: none, title: none, body) = styled-box(label: "Property", number: number, title: title, kind: "definition", body)
#let properties(title: none, body) = styled-box(label: "Properties", title: title, kind: "definition", body)
#let formula-box(title: none, body) = styled-box(label: "Formula", title: title, kind: "definition", body)
#let rule-box(title: none, body) = styled-box(label: "Rule", title: title, kind: "definition", body)

#let remark(number: none, title: none, body) = styled-box(label: "Remark", number: number, title: title, kind: "note", body)
#let example(number: none, title: none, body) = styled-box(label: "Example", number: number, title: title, kind: "note", body)
#let problem(number: none, title: none, body) = styled-box(label: "Problem", number: number, title: title, kind: "note", font-scale: 0.95em, body)

// Proof with an end-of-proof square. When the proof ends in a display equation the
// square is set on the equation's last line (like amsthm's \qedhere) instead of
// on a line of its own.
#let proof(title: "Proof", body) = {
  let children = if body.func() == [].func() { body.children } else { (body,) }
  while children.len() > 0 and children.last().func() in ([ ].func(), parbreak) {
    children = children.slice(0, -1)
  }
  let last = children.at(-1, default: none)
  let ends-in-display = last != none and last.func() == math.equation and last.block
  block(width: 100%, breakable: true, above: 0.75em, below: 0.95em, {
    emph[#title.]
    h(0.5em)
    if ends-in-display {
      children.slice(0, -1).join()
      {
        set math.equation(numbering: (..) => qed-mark, number-align: right + bottom)
        last
      }
    } else {
      body
      h(1fr)
      sym.wj
      h(0.5em)
      qed-mark
    }
  })
}

#let algorithm(title: none, body) = block(
  width: 100%,
  breakable: true,
  above: 0.9em,
  below: 0.9em,
  inset: (x: 12pt, y: 8pt),
  fill: rgb("#f7f7f5"),
  stroke: 0.5pt + rgb("#c6c6c0"),
  {
    if title != none {
      text(weight: "bold")[Algorithm (#title).]
      v(0.3em)
    }
    body
  },
)

// Supplementary material set in smaller type, as described in the preface.
#let fine-print(body) = block(width: 100%, breakable: true, above: 0.8em, below: 0.8em, {
  set text(size: 9pt)
  set par(leading: 0.55em)
  body
})

// ---------------------------------------------------------------------------
// Headings
// ---------------------------------------------------------------------------

// Opening heading of an unnumbered chapter-level unit (Preface, References, Index).
#let chapter(title) = {
  pagebreak(weak: true)
  current-lecture.update(title)
  current-section.update(title)
  heading(level: 1, title)
}

#let lecture(number) = {
  pagebreak(weak: true)
  let title = "Lecture " + str(number)
  current-lecture.update(title)
  current-section.update(title)
  heading(level: 1, title)
}

#let supplement(number) = {
  pagebreak(weak: true)
  let title = "Supplement to Lecture " + str(number)
  current-lecture.update(title)
  current-section.update(title)
  heading(level: 1, title)
}

// Section numbers are carried by the heading's numbering, so the outline can hang
// wrapped titles after the number.
#let sec(num, title) = {
  current-section.update([#num. #title])
  heading(level: 2, numbering: (..) => num + ".", title)
}

#let dsec(num, title) = {
  current-section.update([$cal(D)$ #num. #title])
  heading(level: 2, numbering: (..) => [$cal(D)$ #num.], title)
}

#let heading-number(h) = if h.numbering != none { numbering(h.numbering, 1) }

#let contents() = {
  pagebreak(weak: true)
  heading(level: 1, outlined: false, bookmarked: true)[Contents]
  set par(first-line-indent: 0pt, justify: false, leading: 0.5em)
  show outline.entry.where(level: 1): it => {
    set block(above: 0.95em, below: 0.3em)
    link(it.element.location(), it.indented(none, strong(it.inner())))
  }
  show outline.entry.where(level: 2): set block(above: 0.32em, below: 0.32em)
  outline(title: none, depth: 2, indent: 1.1em)
}

// ---------------------------------------------------------------------------
// Subject index
// ---------------------------------------------------------------------------

#let index-letter(letter) = block(above: 1em, below: 0.4em, sticky: true, text(size: 10pt, weight: "bold", letter))
#let index-entry(body) = par(hanging-indent: 1.2em, body)
// A heading with sub-entries is kept with its first sub-entry.
#let index-head(body) = block(above: 0.3em, below: 0.3em, sticky: true, par(hanging-indent: 1.2em, body))
#let index-sub(body) = par(hanging-indent: 2.2em)[#h(1em)#body]

// ---------------------------------------------------------------------------
// Book setup
// ---------------------------------------------------------------------------

#let running-head(body) = text(size: 8.8pt, style: "italic", body)

#let book-project(body) = {
  set document(
    title: "Matrix Analysis and Linear Algebra",
    author: "E. E. Tyrtyshnikov",
  )

  set page(
    width: 155mm,
    height: 235mm,
    margin: (top: 20mm, bottom: 20mm, inside: 19mm, outside: 17mm),
    header-ascent: 35%,
    header: context {
      let pg = counter(page).get().first()
      if pg <= 2 { return }
      let lec = current-lecture.get()
      if lec == "" { return }
      let here-page = here().page()
      // No running head on a page that opens a lecture or chapter.
      if query(heading.where(level: 1)).any(h => h.location().page() == here-page) { return }
      set text(size: 8.8pt)
      if calc.even(pg) {
        grid(columns: (auto, 1fr, auto), align: (left, center, right), [#pg], running-head(lec), [])
      } else {
        // Right-hand head: the first section that starts on this page, else the one in force.
        let starts = query(heading.where(level: 2)).filter(h => h.location().page() == here-page)
        let title = if starts.len() > 0 {
          [#heading-number(starts.first()) #starts.first().body]
        } else {
          current-section.get()
        }
        grid(columns: (auto, 1fr, auto), align: (left, center, right), [], running-head(title), [#pg])
      }
      v(-0.5em)
      line(length: 100%, stroke: 0.4pt)
    },
    footer: context {
      let pg = counter(page).get().first()
      let here-page = here().page()
      if pg > 2 and query(heading.where(level: 1)).any(h => h.location().page() == here-page) {
        align(center, text(size: 8.8pt)[#pg])
      }
    },
  )

  set text(font: "New Computer Modern", size: 10pt, lang: "en", region: "us")
  // Em dashes are closed up (English style); never start a line with one.
  show "—": sym.wj + "—"

  set par(
    justify: true,
    leading: 0.6em,
    spacing: 0.6em,
    first-line-indent: (amount: par-indent, all: false),
  )

  // Matrices: square brackets as in the original, with room between columns.
  set math.mat(delim: "[", column-gap: 0.75em, row-gap: 0.32em)
  set math.cases(gap: 0.45em)
  show math.equation.where(block: true): set block(above: 0.75em, below: 0.75em)

  set list(indent: 0.4em, body-indent: 0.55em, spacing: 0.45em)
  set enum(indent: 0.4em, body-indent: 0.55em, spacing: 0.45em)

  set footnote.entry(
    separator: line(length: 28%, stroke: 0.4pt),
    clearance: 0.9em,
    gap: 0.5em,
    indent: 0.8em,
  )
  show footnote.entry: set text(size: 8.5pt)
  show footnote.entry: set par(leading: 0.5em)

  // Lecture and chapter openings.
  show heading.where(level: 1): it => {
    set par(first-line-indent: 0pt, justify: false)
    set text(hyphenate: false)
    block(width: 100%, above: 0pt, below: 2.2em, breakable: false, {
      v(14mm)
      align(center, text(size: 15pt, weight: "regular", tracking: 0.12em, it.body))
    })
  }

  // Sections: centred bold run of number and title, kept with what follows.
  show heading.where(level: 2): it => block(width: 100%, above: 1.6em, below: 0.9em, sticky: true, breakable: false, {
    set par(first-line-indent: 0pt, justify: false, leading: 0.5em)
    set text(size: 11pt, weight: "bold", hyphenate: false)
    align(center)[#heading-number(it)#h(0.4em)#it.body]
  })

  body
}
