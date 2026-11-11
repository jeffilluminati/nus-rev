// Shared style for the exercise sets (same file as MA1522 Revision/ExerciseSet/exset.typ, plus answer boxes): A4, one column, a ruled working panel after
// every free-response question. The panels stretch so that each page is filled.

#let blue = rgb("#00558C")
#let deep = rgb("#003A62")
#let tint = rgb("#E9F1F7")
#let rulegray = rgb("#B9C4CC")
#let workgray = rgb("#C9D0D6")
#let soft = rgb("#6A7378")
#let sans = "Helvetica Neue"

#let part-title = state("part-title", "Front Matter")
#let prob-n = counter("prob")

#let exset(module: "", running: "", body) = {
  set page(
    paper: "a4",
    margin: (x: 2.3cm, top: 2.35cm, bottom: 2.3cm),
    header: context {
      set text(font: sans, size: 8pt, fill: soft)
      grid(columns: (1fr, auto), [#module | #running], part-title.get())
    },
    header-ascent: 0.55cm,
    footer: context align(center, text(font: sans, size: 8pt, fill: soft)[
      #counter(page).display() of #counter(page).final().first()
    ]),
  )
  set text(font: "Libertinus Serif", size: 10.8pt, lang: "en")
  show math.equation: set text(font: "Libertinus Math")
  set par(leading: 0.62em, spacing: 0.75em, justify: false)
  set enum(numbering: n => strong[(#numbering("a", n))], indent: 0pt, body-indent: 0.5em, spacing: 0.7em)
  set math.mat(delim: "(", column-gap: 0.7em, row-gap: 0.35em)
  set math.vec(delim: "(", gap: 0.35em)
  show math.mat: math.display
  show math.vec: math.display
  body
}

// PART banner
#let parthead(letter, title, blurb, tag) = {
  part-title.update(title)
  pagebreak(weak: true)
  line(length: 100%, stroke: 2.6pt + blue)
  v(-8pt)
  line(length: 100%, stroke: 0.5pt + rulegray)
  v(-2pt)
  grid(columns: (1fr, auto), align: (left + bottom, right + bottom),
    text(font: sans, weight: "bold", size: 15pt, fill: deep)[PART #letter],
    text(font: sans, size: 9pt, fill: soft, tag))
  v(-5pt)
  text(font: sans, weight: "bold", size: 21pt, fill: blue, title)
  v(-6pt)
  text(style: "italic", size: 10pt, fill: soft, blurb)
  v(-5pt)
  line(length: 100%, stroke: 1.1pt + blue)
  v(4pt)
}

// Category sub-head
#let topichead(t) = block(above: 16pt, below: 9pt, sticky: true, width: 100%)[
  #text(font: sans, weight: "bold", size: 11.3pt, fill: blue, t)
  #v(-7pt)
  #line(length: 100%, stroke: 0.5pt + rulegray)
]

// Tinted DEFINITION / THEOREM panel
#let panel(title, body) = block(width: 100%, breakable: false, above: 12pt, below: 12pt,
  fill: tint, stroke: (top: 1.1pt + blue, bottom: 0.5pt + rulegray), inset: (x: 7pt, y: 7pt))[
  #text(font: sans, weight: "bold", size: 9pt, fill: deep, title)
  #v(-3pt)
  #set text(size: 10pt)
  #body
]

#let pts(m) = text(font: sans, size: 8.5pt, fill: soft)[\[#m\]]

// Working panel: a fixed minimum height that travels with the question, plus a
// stretchable tail that shares whatever is left on the page.
#let boxtop(h) = block(width: 100%, height: h, above: 8pt, below: 0pt,
  stroke: (top: 0.4pt + workgray, left: 0.4pt + workgray, right: 0.4pt + workgray))[]
#let boxtail(h) = block(width: 100%, height: (h / 1cm) * 1fr, above: 0pt, below: 15pt,
  stroke: (bottom: 0.4pt + workgray, left: 0.4pt + workgray, right: 0.4pt + workgray))[]

#let indent = 2.1em

// Free-response problem: statement, then working space of at least `space`.
// With space: none the statement stands alone (used when the parts carry the space).
#let ansbox = align(right, block(above: 8pt, below: 0pt, breakable: false)[
  #text(font: sans, size: 8.5pt, fill: soft)[Answer#h(0.6em)]
  #box(width: 4.8cm, height: 1.05cm, stroke: 0.6pt + blue, baseline: 40%)
])
#let prob(space: 4cm, answer: false, body) = {
  prob-n.step()
  block(breakable: false, width: 100%, above: 13pt, below: if space == none { 9pt } else { 0pt },
    sticky: space == none)[
    #pad(left: indent)[
      #h(-indent)#box(width: indent, context text(weight: "bold", fill: deep)[#prob-n.display().])#body
    ]
    #if space != none { boxtop(space) }
  ]
  if space != none {
    if answer {
      block(width: 100%, height: (space / 1cm) * 1fr, above: 0pt, below: 0pt,
        stroke: (bottom: 0.4pt + workgray, left: 0.4pt + workgray, right: 0.4pt + workgray))[]
      ansbox
      v(15pt, weak: true)
    } else { boxtail(space) }
  }
}

// Source attribution and answer-format lines
#let src(body) = align(right, text(font: sans, size: 8pt, fill: soft)[\[#body\]])
#let fmt(body) = block(above: 5pt, below: 0pt, text(style: "italic", size: 9.6pt, body))

// One part of a multi-part problem, with its own working space.
#let subpart(label, space: 3.5cm, body) = {
  block(breakable: false, width: 100%, above: 9pt, below: 0pt)[
    #pad(left: indent)[
      #h(-1.75em)#box(width: 1.75em, strong[(#label)])#body
    ]
    #boxtop(space)
  ]
  boxtail(space)
}

// Multiple-choice problem: no working panel.
#let mcq(body, ..opts) = {
  prob-n.step()
  block(breakable: false, width: 100%, above: 15pt, below: 15pt)[
    #pad(left: indent)[
      #h(-indent)#box(width: indent, context text(weight: "bold", fill: deep)[#prob-n.display().])#body
      #v(1pt)
      #grid(columns: (1fr, 1fr), column-gutter: 1em, row-gutter: 0.75em,
        ..opts.pos().enumerate().map(((i, o)) => [#strong[(#"ABCD".at(i))]#h(0.5em)#o]))
    ]
  ]
}

// Roman-numbered statements inside a question
#let stmts(..items) = pad(left: 0.4em, y: 1pt, grid(columns: (2.2em, 1fr), row-gutter: 0.6em,
  ..items.pos().enumerate().map(((i, s)) => (align(right)[(#numbering("I", i + 1))#h(0.5em)], s)).flatten()))

// Filler that keeps the last page of a part from over-stretching its panels
#let endpart(w: 6) = v(w * 1fr)

// Answers
#let ans(n, body) = block(width: 100%, above: 0.75em, below: 0.75em, breakable: true)[
  #text(weight: "bold", fill: deep)[#n.]#h(0.45em)#body
]

// ---------------------------------------------------------------- notation --
#let tp = math.upright("T")
#let bA = $bold(A)$
#let bB = $bold(B)$
#let bC = $bold(C)$
#let bD = $bold(D)$
#let bE = $bold(E)$
#let bI = $bold(I)$
#let bJ = $bold(J)$
#let bL = $bold(L)$
#let bM = $bold(M)$
#let bP = $bold(P)$
#let bQ = $bold(Q)$
#let bR = $bold(R)$
#let bU = $bold(U)$
#let bV = $bold(V)$
#let bX = $bold(X)$
#let bSig = $bold(Sigma)$
#let ba = $bold(a)$
#let bb = $bold(b)$
#let bc = $bold(c)$
#let be = $bold(e)$
#let bn = $bold(n)$
#let bp = $bold(p)$
#let bq = $bold(q)$
#let bu = $bold(u)$
#let bv = $bold(v)$
#let bw = $bold(w)$
#let bx = $bold(x)$
#let by = $bold(y)$
#let bz = $bold(0)$
#let rank = math.op("rank")
#let nullity = math.op("nullity")
#let Col = math.op("Col")
#let Row = math.op("Row")
#let Null = math.op("Null")
#let span = math.op("span")
#let proj = math.op("proj")
#let adj = math.op("adj")
#let tr = math.op("tr")
#let Rg = math.op("R")
