// Shared style for the CS1231S Exam Condensed and its addendum.
// Box, proof and diagram helpers match CS1231S_Midterm_Condensed.typ.

#let accent = rgb("#1d4e89")
#let ink    = rgb("#1b1d21")
#let muted  = rgb("#5f6670")

// ---- math shorthands ---------------------------------------------------------
#let lnot  = math.class("unary", sym.tilde.op)        // ~p
#let simq  = math.class("normal", sym.tilde.op)       // A/~ , [x]_~
#let pleq  = sym.prec.curly.eq                        // ≼
#let plin  = math.attach(sym.prec.curly.eq, tr: $*$)  // ≼*
#let dv    = sym.divides
#let ndv   = sym.divides.not
#let PP    = $cal(P)$

// ---- boxes ------------------------------------------------------------------
#let kbox(label, col, bg, title, body, split: false) = block(
  width: 100%, inset: (x: 9pt, y: 6pt), radius: 1.5pt, fill: bg,
  stroke: (left: 2.2pt + col), above: 0.65em, below: 0.65em, breakable: split,
  {
    set par(justify: false)
    block(sticky: true, below: 0.55em, {
      text(size: 7.2pt, weight: "bold", fill: col, tracking: 0.4pt, upper(label))
      if title != none { h(6pt); text(weight: "bold", title) }
    })
    body
  })
#let defn(title, body) = block(
  width: 100%, inset: (x: 10pt, y: 7pt), radius: 2pt, fill: rgb("#e7eff9"),
  stroke: (left: 4pt + accent, top: 0.7pt + accent, right: 0.7pt + accent, bottom: 0.7pt + accent),
  above: 0.75em, below: 0.75em, breakable: false,
  {
    set par(justify: false, leading: 0.7em)
    block(sticky: true, below: 0.5em, {
      text(size: 7.8pt, weight: "bold", fill: accent, tracking: 0.6pt, "DEFINITION")
      if title != none { h(7pt); text(size: 12pt, weight: "bold", fill: accent, title) }
    })
    set text(size: 11.2pt)
    body
  })
#let thm(title, body)   = kbox("Theorem", rgb("#1f6f43"), rgb("#edf6f0"), title, body)
#let proofb(title, body)= kbox("Proof", rgb("#44484f"), rgb("#f6f6f7"), title, body, split: true)
#let trap(title, body)  = kbox("Trap", rgb("#a23a2a"), rgb("#fbefec"), title, body)
#let exam(title, body)  = kbox("Past paper", rgb("#8a5a00"), rgb("#fdf5e3"), title, body)
#let tip(title, body)   = kbox("Method", rgb("#5b3f8c"), rgb("#f3effa"), title, body)
#let example(title, body) = kbox("Worked example", rgb("#44484f"), rgb("#f6f6f7"), title, body, split: true)
#let drill(title, body) = kbox("Drill", rgb("#3d5a73"), rgb("#eef2f5"), title, body)

#let dtable(..cells) = {
  show table.cell.where(y: 0): set text(weight: "regular")
  table(columns: (1fr, auto), stroke: none, column-gutter: 14pt, inset: (x: 2pt, y: 2.6pt), ..cells)
}
#let j(it) = h(0.3em) + text(size: 8.2pt, fill: muted, style: "italic")[(#it)]
#let qed = h(1fr) + $square.filled$
#let ans(it) = text(fill: rgb("#1f6f43"), weight: "bold", it)

// ---- Hasse diagrams: nodes = ((label, x, y), ...), edges = ((i, j), ...) ------
#let hasse(nodes, edges, w: 4cm, h: 3cm, u: 1cm, size: 8pt) = box(width: w, height: h, {
  for (a, b) in edges {
    let (_, xa, ya) = nodes.at(a)
    let (_, xb, yb) = nodes.at(b)
    place(line(start: (xa * u, h - ya * u), end: (xb * u, h - yb * u), stroke: 0.55pt + ink))
  }
  for (lbl, x, y) in nodes {
    context {
      let c = box(fill: white, inset: 1.2pt, text(size: size, lbl))
      let s = measure(c)
      place(dx: x * u - s.width / 2, dy: h - y * u - s.height / 2, c)
    }
  }
})

// ============================================================================

// ---- graphs: nodes = ((label, x, y), ...), edges = ((i, j) or (i, j, weight), ...) ----
#let gdraw(nodes, edges, w: 4cm, h: 3cm, u: 1cm, size: 7.5pt, r: 6.5pt, bold: ()) = box(width: w, height: h, {
  for (k, e) in edges.enumerate() {
    let (_, xa, ya) = nodes.at(e.at(0))
    let (_, xb, yb) = nodes.at(e.at(1))
    let thick = if k in bold { 1.5pt + accent } else { 0.55pt + ink }
    place(line(start: (xa * u, h - ya * u), end: (xb * u, h - yb * u), stroke: thick))
    if e.len() > 2 {
      context {
        let c = box(fill: white, inset: 1.2pt, text(size: size, fill: ink, [#e.at(2)]))
        let s = measure(c)
        place(dx: (xa + xb) / 2 * u - s.width / 2, dy: h - (ya + yb) / 2 * u - s.height / 2, c)
      }
    }
  }
  for (lbl, x, y) in nodes {
    place(dx: x * u - r, dy: h - y * u - r,
      circle(radius: r, fill: white, stroke: 0.55pt + ink,
        align(center + horizon, text(size: size, lbl))))
  }
})

// ---- page and text setup -------------------------------------------------------
#let setup(doc-title: "CS1231S Exam Condensed", running: [CS1231S · Exam Condensed], body) = {
  set document(title: doc-title, author: "CS1231S revision")
  set page(
    paper: "a4",
    margin: (x: 12mm, top: 12mm, bottom: 12mm),
    header: context {
      let pg = here().page()
      if pg > 1 {
        let hs = query(heading.where(level: 1)).filter(h => h.location().page() <= pg)
        let part = if hs.len() > 0 { hs.last().body } else { [] }
        set text(size: 7.5pt, fill: muted)
        stack(spacing: 3pt,
          grid(columns: (1fr, auto), running, part),
          line(length: 100%, stroke: 0.4pt + luma(200)),
        )
      }
    },
    footer: context {
      set text(size: 7.5pt, fill: muted)
      align(center)[#counter(page).display()]
    },
  )
  set text(font: "New Computer Modern", size: 10.3pt, fill: ink, lang: "en")
  set par(justify: true, leading: 0.6em, spacing: 0.65em)
  set enum(numbering: "1.1.", full: true, spacing: 0.4em, indent: 0.3em, body-indent: 0.55em)
  set list(spacing: 0.4em, indent: 0.3em, body-indent: 0.55em)
  set table(stroke: 0.4pt + luma(190), inset: (x: 6pt, y: 4pt))
  show table.cell.where(y: 0): set text(weight: "bold")
  show table: set par(justify: false)

  // Allow inline equations to wrap only before a relation operator.
  show math.equation.where(block: false): it => {
    // Guard the complete terms generated by this rule.
    if it.has("label") and it.label == <math-term> { return box(it) }
    let children = if it.body.has("children") { it.body.children } else { (it.body,) }
    let chunks = ()
    let term = []
    let has-term = false
    for child in children {
      let literal = if child.has("text") and type(child.text) == str { child.text } else { none }
      let relation = literal in ("=", "≡", "↔", "⇔", "⇒")
      if relation and has-term {
        chunks.push(term)
        term = []
      }
      term += child
      if literal == none or literal.trim() != "" { has-term = true }
    }
    chunks.push(term)
    chunks.map(term => box([#math.equation(term) <math-term>])).join(h(0.2em))
  }

  show heading.where(level: 1): it => {
    v(0pt)
    block(width: 100%, above: 1.5em, below: 0.8em, sticky: true, {
      set text(size: 15pt, weight: "bold", fill: accent)
      it.body
      v(-7pt)
      line(length: 100%, stroke: 1.1pt + accent)
    })
  }
  show heading.where(level: 2): it => block(above: 1.0em, below: 0.55em,
    text(size: 11pt, weight: "bold", fill: accent, it.body))
  show heading.where(level: 3): it => block(above: 0.8em, below: 0.4em,
    text(size: 9.8pt, weight: "bold", it.body))
  body
}

// ---- extra math shorthands for Lectures 7–13 ---------------------------------
#let idf = math.op("id")
#let deg = math.op("deg")
#let zn(n) = $ZZ_#n$
