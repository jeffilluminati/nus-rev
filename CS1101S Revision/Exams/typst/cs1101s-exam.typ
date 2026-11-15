// CS1101S final-assessment layout (Python edition).
//
// Reproduces the layout of the Semester 1 papers (CS1101S-Final-AYxxxx-S1.pdf):
// A4, 2.5cm / 2.2cm margins, Gentium Basic 11pt body, Liberation Sans furniture,
// Liberation Mono 9pt code with the bold/italic highlight theme.
//
// Compile with:  typst compile --font-path fonts <paper>.typ ../<paper>.pdf

#let serif = "Gentium Basic"
#let sans = "Liberation Sans"
#let mono = "Liberation Mono"

#let q-counter = counter("cs1101s-question")
#let s-counter = counter("cs1101s-section")

// ---------------------------------------------------------------------------
// Document setup
// ---------------------------------------------------------------------------

#let exam(ay: "2025/26", sem: 2, body) = {
  set document(title: "CS1101S Final Assessment AY" + ay + " Sem " + str(sem))
  set page(
    paper: "a4",
    margin: (x: 2.5cm, y: 2.2cm),
    header: text(font: sans, size: 9pt)[Final Assessment #h(1fr) #("CS1101S  AY" + ay + "  Sem " + str(sem))],
    footer: context {
      if counter(page).get().first() > 1 {
        align(center, text(font: sans, size: 9pt)[
          Page #counter(page).display() / #counter(page).final().first()
        ])
      }
    },
  )
  set text(font: serif, size: 11pt, lang: "en")
  set par(leading: 0.75em, spacing: 1.2em, justify: true)
  set raw(theme: "python.tmTheme")
  show raw: set text(font: mono, size: 9pt)
  // Spacing is absolute: `em` here would resolve against the 9pt code size.
  show raw.where(block: true): it => block(
    above: 13.2pt,
    below: 13.2pt,
    inset: (left: 10pt, top: 6pt, bottom: 6pt),
    breakable: false,
    it,
  )
  body
}

// ---------------------------------------------------------------------------
// Cover page
// ---------------------------------------------------------------------------

#let cover(ay: "2025/26", sem: 2, year: "2026", instructions) = {
  set text(font: sans)
  set par(justify: false)
  let tight(b) = block(above: 0pt, below: 0pt, width: 100%, b)
  tight(align(center, text(size: 14pt)[NATIONAL UNIVERSITY OF SINGAPORE]))
  v(38.81pt)
  tight(align(center, {
    set text(size: 14pt)
    set par(leading: 3pt)
    [SCHOOL OF COMPUTING \ FINAL ASSESSMENT FOR \ Semester #sem AY#ay]
  }))
  v(25.4pt)
  tight(align(center, text(size: 12pt)[CS1101S Programming Methodology]))
  v(19.9pt)
  tight(align(center, text(size: 10pt)[#year #h(5cm) Time Allowed: 2 hours]))
  v(18.7pt)
  tight(align(center, line(length: 94%, stroke: 3.5pt)))
  v(22.3pt)
  tight(text(size: 14pt)[INSTRUCTIONS TO CANDIDATES])
  v(25.3pt)
  {
    set text(font: serif, size: 11pt)
    set par(justify: true)
    set enum(indent: 0.5em, body-indent: 0.5em)
    tight(instructions)
  }
  pagebreak()
}

// Totals for the first instruction.
#let total-questions = context q-counter.final().first()
#let total-sections = context s-counter.final().first()
#let total-pages = context counter(page).final().first()

// The standard instruction list of the Semester 1 papers.
#let standard-instructions(answer-pages: 8, marks: 100, chapter: "3") = [
  + This question paper contains #total-questions questions in #total-sections sections, and comprises #total-pages printed pages, including this page.
  + The answer sheet comprises #answer-pages printed pages.
  + Use a pen or pencil to write your Student Number in the designated space on the front page of the answer sheet, and shade the corresponding circle completely in the grid for each digit or letter. *DO NOT WRITE YOUR NAME.*
  + You must submit only the answer sheet and no other documents. Do not tear off any pages from the answer sheet.
  + All questions must be answered in the space provided in the answer sheet; no extra sheets will be accepted as answers.
  + Write legibly with a pen or pencil. Untidiness will be penalized.
  + For multiple choice questions, shade in the circle of the correct answer completely.
  + The full score of this assessment is *#marks marks*.
  + This is a *closed-book* assessment, but you are allowed to bring one double-sided A4 / letter-sized sheet of handwritten or printed notes.
  + Where programs are required, write them in the Python §#chapter language. A reference of some of the pre-declared functions is given in Appendix A.
  + Unless otherwise stated, all programs use the Python §#chapter language.
  + In any question, unless it is specifically allowed, your answer must not use functions given in, or written by you for, other questions.
]

// ---------------------------------------------------------------------------
// Sections and questions
// ---------------------------------------------------------------------------

// `preamble` (optional) is set off below a hairline, as in the reference.
#let section(title, ..preamble) = {
  s-counter.step()
  block(above: 0pt, below: 0pt, sticky: true, strong[
    Section #context s-counter.display("A"): #title
  ])
  if preamble.pos().len() == 0 {
    v(0.1em)
  } else {
    v(1em)
    block(above: 0pt, below: 0pt, sticky: true, line(length: 100%, stroke: 0.5pt + luma(160)))
    v(1.6em)
    block(
      above: 0pt,
      below: 0pt,
      width: 100%,
      inset: (left: 10pt, right: 8pt, top: 8pt, bottom: 8pt),
      preamble.pos().first(),
    )
  }
}

#let question(marks: none, breakable: false, body) = {
  q-counter.step()
  v(0.8em, weak: true)
  block(above: 0pt, below: 0pt, width: 100%, breakable: breakable, grid(
    columns: (2.2em, 1fr),
    strong(context q-counter.display("1.")),
    {
      if marks != none [[#marks marks] ]
      body
    },
  ))
  v(0.8em)
}

// Multiple-choice options, labelled (a.), (b.), ...
#let choices(..options) = {
  show regex("\d+"): set text(font: mono)
  block(above: 1.3em, below: 1.2em, inset: (left: 2.4em), {
    for (i, opt) in options.pos().enumerate() {
      par[(#numbering("a", i + 1).) #opt]
    }
  })
}

// The eight orders of growth offered in the "Orders of Growth" sections.
#let growth-choices = choices(
  $Theta(1)$,
  $Theta(log N)$,
  $Theta(N)$,
  $Theta(N log N)$,
  $Theta(N^2)$,
  $Theta(N^2 log N)$,
  $Theta(N^3)$,
  [$Theta(k^N)$ where $k$ is some constant greater than 1],
)

#let end-of-paper(gap: 1em) = {
  v(gap, weak: true)
  block(above: 0pt, below: 0pt, width: 100%, align(center, strong[END OF PAPER]))
}

// ---------------------------------------------------------------------------
// Appendices
// ---------------------------------------------------------------------------

#let ink = luma(20)

#let appendix-title(letter, title, subtitle) = {
  set par(justify: false)
  let tight(b) = block(above: 0pt, below: 0pt, width: 100%, b)
  tight(text(font: sans, weight: "bold", size: 8pt, fill: luma(65), tracking: 0.1em)[APPENDIX #letter])
  v(22.39pt)
  tight(text(font: sans, weight: "bold", size: 17pt, fill: ink, title))
  v(22.4pt)
  tight(text(font: sans, size: 8.7pt, fill: luma(75), subtitle))
  v(20.2pt)
  tight(line(length: 100%, stroke: 1.1pt + ink))
  v(20.35pt, weak: true)
}

#let ref-heading(title) = {
  block(above: 0.9em, below: 0pt, sticky: true, text(font: sans, weight: "bold", size: 12pt, fill: ink, title))
  v(16.4pt)
  block(above: 0pt, below: 0.5em, sticky: true, line(length: 100%, stroke: 0.8pt + ink))
}

// One reference row: signature on the left, description on the right.
#let ref-row(left-width, sig, desc) = block(
  above: 0.42em,
  below: 0.42em,
  width: 100%,
  breakable: false,
  inset: (bottom: 1.2em + 3.2pt),
  stroke: (bottom: 0.35pt + luma(222)),
  grid(
    columns: (left-width, 1fr),
    column-gutter: 185pt - left-width,
    text(font: mono, weight: "bold", size: 0.85em, fill: ink, sig), desc,
  ),
)

// Compact rows (first half of the reference appendix).
#let ref-compact(body) = {
  set text(size: 9.1pt)
  set par(leading: 0.52em, justify: false)
  show raw: set text(size: 7.02pt)
  body
}
