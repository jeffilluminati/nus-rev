// cheatsheet.typ: a dense reference-sheet template that stays readable.
//
//   #import "cheatsheet.typ": *
//   #show: cheatsheet.with(title: "MA1522", legend: [notation, conventions, …], size: 8.4pt)
//
//   #section(tag: "1")[Linear systems][
//     *Solve* #s1 reduce $(A | b)$. #s2 Read off the pivots.   // *bold* opens an entry
//     #key[The one result you must not forget.]                // tinted box
//     #warn[the classic trap]   #eg[a two-line example]   $a = b$ #sep $c = d$
//   ]
//
// How it saves space without hurting legibility:
//   - one knob, `size`: all spacing inside the columns is in em, so the whole sheet
//     scales with it. Raise it until the last column is full (a red flag appears on
//     side 1 as soon as the content runs past `sides` pages);
//   - an entry is a paragraph that opens with a *label*. Continuation lines hang, so the
//     labels form a scannable left edge and no bullets or sub-headings eat lines;
//   - steps are inline numbered discs (#s1 … #s9) instead of one list item per line;
//   - lines keep one pitch: the text box already reserves room for sub/superscripts,
//     inline brackets do not grow, and inline fractions are slashed at full size
//     (use dfrac(a, b) or a display equation for a stacked one);
//   - no title bar: the columns start at the top margin, and the legend (notation,
//     conventions) is a footnote in the bottom margin of every side;
//   - hairline rules between columns allow a narrow gutter;
//   - each section has one accent colour (bar, labels, discs, boxes). Colours are dark
//     and tints are pale, so the sheet also prints cleanly in black and white.

// ───────────────────────────────────────────────────────────────── palette ──
#let hue = (
  blue: rgb("#1B5FAA"),
  teal: rgb("#0B7A75"),
  green: rgb("#3A7D22"),
  amber: rgb("#A85A00"),
  plum: rgb("#A02C6E"),
  violet: rgb("#6240A8"),
  slate: rgb("#44546A"),
)
#let ink = rgb("#141B22")
#let alarm = rgb("#C3261B")

#let cs-accent = state("cs-accent", hue.blue)
#let cs-config = state("cs-config", (head: "Helvetica Neue", palette: hue.values()))
#let cs-sections = counter("cs-sections")

// Text whose box is exactly cap-height tall, for bars and chips.
#let cs-tight(body) = {
  set text(top-edge: "cap-height", bottom-edge: "baseline")
  set par(hanging-indent: 0pt)
  body
}

// ──────────────────────────────────────────────────────────────── document ──
#let cheatsheet(
  title: none, // PDF metadata only; nothing is printed
  legend: none, // footnote at the foot of every side: notation, conventions
  paper: "a4",
  flipped: false,
  columns: 3,
  size: 8.4pt, // the one knob: tune it until the sheet fills its sides
  sides: 2, // page budget; a red flag appears on side 1 if the content overflows it
  margin: 6mm,
  gutter: 2.8mm,
  rule: true, // hairline between columns
  justify: false,
  font: ("IBM Plex Sans", "Helvetica Neue"),
  math-font: ("STIX Two Math", "IBM Plex Math", "New Computer Modern Math"),
  math-scale: 1.04, // evens out the x-heights of the text and math fonts
  head-font: auto, // labels and bars; auto = same as `font`
  palette: hue.values(), // cycled by sections that do not name an accent
  body,
) = {
  // symbols the text font lacks (⇔ ⇒ → …) come from the math font, not a third face
  let arr(x) = if type(x) == array { x } else { (x,) }
  let font = arr(font) + arr(math-font)
  let head = if head-font == auto { font } else { arr(head-font) + arr(math-font) }
  let ncols = columns
  // the footnote sits in the bottom margin, which grows just enough to hold it
  let bottom = if legend == none { margin } else { margin + 3.4mm }

  set document(title: title) if title != none
  set page(
    paper: paper,
    flipped: flipped,
    margin: (x: margin, top: margin, bottom: bottom),
    columns: ncols,
    background: if rule and ncols > 1 {
      // a page-sized block, so that `top` below means the top of the page
      layout(pg => block(width: pg.width, height: pg.height, {
        let colw = (pg.width - 2 * margin - (ncols - 1) * gutter) / ncols
        for k in range(1, ncols) {
          place(top + left, dx: margin + k * colw + (k - 0.5) * gutter, dy: margin,
            line(angle: 90deg, length: pg.height - margin - bottom, stroke: 0.3pt + luma(180)))
        }
      }))
    },
    footer-descent: 1mm,
    footer: if legend != none {
      set align(left + top)
      set text(font: font, size: 0.76 * size, fill: luma(55), top-edge: "cap-height", bottom-edge: "baseline")
      set par(hanging-indent: 0pt)
      show math.equation: set text(font: math-font, size: math-scale * 1em)
      line(length: 16%, stroke: 0.3pt + luma(110))
      v(1mm, weak: true)
      legend
    },
  )
  set std.columns(gutter: gutter)

  // The text box reserves room for sub/superscripts, so nearly every line has the
  // same pitch (0.84 + 0.25 + leading) whether or not it carries mathematics.
  set text(font: font, size: size, fill: ink, lang: "en", hyphenate: true,
    top-edge: 0.84em, bottom-edge: -0.25em)
  set par(leading: 0.07em, spacing: 0.33em, justify: justify, hanging-indent: 0.8em)

  show math.equation: set text(font: math-font, size: math-scale * 1em)
  show math.equation.where(block: false): set math.frac(style: "horizontal")
  show math.equation.where(block: false): set math.lr(size: 1em)
  show math.equation.where(block: true): set block(above: 0.3em, below: 0.3em)
  set math.mat(delim: "(", column-gap: 0.45em, row-gap: 0.24em)
  set math.vec(delim: "(", gap: 0.24em)
  // matrices keep full-size entries even inside running text
  show math.mat: set text(size: 0.88em)
  show math.vec: set text(size: 0.88em)
  show math.mat: math.display
  show math.vec: math.display

  // *bold* is the run-in label of an entry
  show strong: it => context text(font: head, weight: "bold", fill: cs-accent.get(), it.body)
  set list(indent: 0pt, body-indent: 0.3em, spacing: 0.2em,
    marker: context text(size: 0.62em, fill: cs-accent.get(), baseline: -0.15em)[▶])
  set enum(indent: 0pt, body-indent: 0.3em, spacing: 0.2em)

  cs-config.update((head: head, palette: palette))

  if sides != none {
    context if counter(page).final().first() > sides {
      place(top + right, scope: "parent", float: true, clearance: 0.4em,
        block(fill: alarm, radius: 0.2em, inset: 0.5em, cs-tight(text(font: head, weight: "bold", fill: white)[
          Overflow: #counter(page).final().first() pages for a budget of #sides. Lower `size`.])))
    }
  }

  body
}

// ──────────────────────────────────────────────────────────────── elements ──

// Section: a coloured bar, then entries. `tag` is the small chip on the left
// (a chapter number, say). `accent: auto` takes the next colour of the palette.
// (Not called `sec`: that name would shadow the secant inside formulas.)
#let section(title, body, tag: none, accent: auto) = {
  cs-sections.step()
  context {
    let cfg = cs-config.get()
    let i = cs-sections.get().first()
    let c = if accent == auto { cfg.palette.at(calc.rem(i - 1, cfg.palette.len())) } else { accent }
    cs-accent.update(c)
    block(width: 100%, above: 0.7em, below: 0.4em, sticky: true, fill: c, radius: 0.18em,
      inset: (x: 0.45em, y: 0.42em), cs-tight({
        set text(font: cfg.head, weight: "bold", fill: white)
        if tag != none {
          box(fill: white.transparentize(76%), radius: 0.15em, inset: (x: 0.32em), outset: (y: 0.24em), tag)
          h(0.45em)
        }
        title
      }))
  }
  body
}

// Inline step disc: #step(1), or the ready-made #s1 … #s9. The disc overhangs its
// box, so it never pushes lines apart.
#let step(n) = context {
  let cfg = cs-config.get()
  h(0.1em)
  box(width: 0.96em, height: 0.66em, outset: (y: 0.15em), radius: 50%, fill: cs-accent.get(),
    align(center + horizon, text(font: cfg.head, weight: "bold", fill: white, size: 0.7em,
      top-edge: "cap-height", bottom-edge: "baseline", str(n))))
  h(0.25em)
}
#let (s1, s2, s3, s4, s5, s6, s7, s8, s9) = range(1, 10).map(step)

// Must-know result: tinted box with an accent edge.
#let key(body) = context {
  let c = cs-accent.get()
  block(width: 100%, breakable: false, above: 0.42em, below: 0.42em, fill: c.lighten(91%),
    stroke: (left: 0.16em + c), radius: (right: 0.18em),
    inset: (left: 0.5em, right: 0.35em, top: 0.12em, bottom: 0.08em), body)
}

// Trap or false friend, inline.
#let warn(body) = text(fill: alarm, weight: "semibold", body)

// Separator for a run of formulas: a small square that cannot be mistaken for a
// multiplication dot. Write it with spaces around: `$a$ #sep $b$`.
#let sep = context box(inset: (x: 0.08em), baseline: -0.17em,
  rect(width: 0.3em, height: 0.3em, fill: cs-accent.get().lighten(25%)))

// Plain bold emphasis (since *…* is taken by labels).
#let b(body) = text(weight: "bold", body)

// Stacked fraction inside running text.
#let dfrac(num, den) = math.frac(num, den, style: "vertical")

// Micro-example, flagged "EG".
#let eg(body) = context {
  let cfg = cs-config.get()
  box(fill: luma(225), radius: 0.15em, inset: (x: 0.25em), height: 0.66em, outset: (y: 0.14em),
    align(horizon, text(font: cfg.head, weight: "bold", size: 0.7em, fill: luma(60),
      top-edge: "cap-height", bottom-edge: "baseline")[EG]))
  h(0.3em)
  body
}

// Compact table: tinted header row, hairlines between rows, no verticals.
// Takes the arguments of `table` (columns: …, then the cells).
#let tbl(head: true, ..args) = context {
  let c = cs-accent.get()
  set par(hanging-indent: 0pt)
  block(width: 100%, above: 0.42em, below: 0.42em,
    table(
      stroke: (x, y) => if y > 0 { (top: 0.3pt + c.lighten(50%)) },
      fill: (x, y) => if head and y == 0 { c.lighten(88%) },
      inset: (x: 0.35em, top: 0.06em, bottom: 0.04em),
      align: horizon + left,
      ..args,
    ))
}
