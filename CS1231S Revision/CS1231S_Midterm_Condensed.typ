// ============================================================================
//  CS1231S Midterm: Condensed Textbook
//  Epp, Discrete Mathematics with Applications (5th ed.), as scoped by
//  CS1231S Lectures 1-6, weighted by the AY23/24, AY24/25, AY25/26 midterms.
//  Compile:  typst compile CS1231S_Midterm_Condensed.typ
// ============================================================================

#let accent = rgb("#1d4e89")
#let ink    = rgb("#1b1d21")
#let muted  = rgb("#5f6670")

#set document(title: "CS1231S Midterm: Condensed Textbook", author: "CS1231S revision")
#set page(
  paper: "a4",
  margin: (x: 12mm, top: 12mm, bottom: 12mm),
  header: context {
    let pg = here().page()
    if pg > 1 {
      let hs = query(heading.where(level: 1)).filter(h => h.location().page() <= pg)
      let part = if hs.len() > 0 { hs.last().body } else { [] }
      set text(size: 7.5pt, fill: muted)
      grid(columns: (1fr, auto), [CS1231S · Midterm Condensed], part)
      v(-5pt)
      line(length: 100%, stroke: 0.4pt + luma(200))
    }
  },
  footer: context {
    set text(size: 7.5pt, fill: muted)
    align(center)[#counter(page).display()]
  },
)
#set text(font: "New Computer Modern", size: 10.3pt, fill: ink, lang: "en")
#set par(justify: true, leading: 0.66em, spacing: 0.88em)
#set enum(numbering: "1.1.", full: true, spacing: 0.58em, indent: 0.3em, body-indent: 0.55em)
#set list(spacing: 0.58em, indent: 0.3em, body-indent: 0.55em)
#set table(stroke: 0.4pt + luma(190), inset: (x: 6pt, y: 4pt))
#show table.cell.where(y: 0): set text(weight: "bold")
#show table: set par(justify: false)

#show heading.where(level: 1): it => {
  v(0pt)
  block(width: 100%, above: 2.2em, below: 1.2em, sticky: true, {
    set text(size: 15pt, weight: "bold", fill: accent)
    it.body
    v(-7pt)
    line(length: 100%, stroke: 1.1pt + accent)
  })
}
#show heading.where(level: 2): it => block(above: 1.45em, below: 0.75em,
  text(size: 11pt, weight: "bold", fill: accent, it.body))
#show heading.where(level: 3): it => block(above: 1.1em, below: 0.6em,
  text(size: 9.8pt, weight: "bold", it.body))

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
  width: 100%, inset: (x: 10pt, y: 7.5pt), radius: 1.5pt, fill: bg,
  stroke: (left: 2.2pt + col), above: 0.95em, below: 0.95em, breakable: split,
  {
    set par(justify: false)
    block(sticky: true, below: 0.55em, {
      text(size: 7.2pt, weight: "bold", fill: col, tracking: 0.4pt, upper(label))
      if title != none { h(6pt); text(weight: "bold", title) }
    })
    body
  })
#let defn(title, body) = block(
  width: 100%, inset: (x: 12pt, y: 10pt), radius: 2pt, fill: rgb("#e7eff9"),
  stroke: (left: 4pt + accent, top: 0.7pt + accent, right: 0.7pt + accent, bottom: 0.7pt + accent),
  above: 1.15em, below: 1.15em, breakable: false,
  {
    set par(justify: false, leading: 0.7em)
    block(sticky: true, below: 0.7em, {
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
#let prob(title, body)  = kbox("Practice", rgb("#0f6b73"), rgb("#eaf5f6"), title, body)
#let example(title, body) = kbox("Worked example", rgb("#3d5a73"), rgb("#eef2f5"), title, body)
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
//  TITLE PAGE
// ============================================================================
#page(header: none)[
  #v(8mm)
  #text(size: 9pt, fill: muted, tracking: 1pt)[CS1231S DISCRETE STRUCTURES · MIDTERM]
  #v(1mm)
  #text(size: 25pt, weight: "bold", fill: accent)[The Condensed Textbook]
  #v(-2mm)
  #text(size: 12pt, fill: muted)[Definitions and model proofs from Epp, _Discrete Mathematics with Applications_ (5th ed.), scoped to Lectures 1–6]
  #v(1mm)
  #line(length: 100%, stroke: 1.4pt + accent)
  #v(2mm)

  #grid(columns: (1fr, 1fr), gutter: 7mm,
  [
    === About this book
    Definitions follow the wording of the lecture slides. Proofs follow the lecture format: numbered steps, each with its justification in brackets. Worked problems come from the AY23/24, AY24/25 and AY25/26 midterms, and the answers agree with the official answer sheets.

    === Box types
    #defn(none)[A definition, in the lecture wording.]
    #v(-2mm)
    #thm(none)[A result that may be cited in a proof.]
    #v(-2mm)
    #proofb(none)[A model proof in exam format.]
    #v(-2mm)
    #exam(none)[A past midterm question with its solution.]
    #v(-2mm)
    #trap(none)[A common error.]
    #v(-2mm)
    #tip(none)[A procedure for a question type.]
    #v(-2mm)
    #prob(none)[A new exam-style problem; its model solution follows.]
    #v(-2mm)
    #example(none)[A lecture or Epp example; *Drill* boxes are quick self-checks.]
  ],
  [
    === Format of the test
    - 90 minutes, *open book*, 50 marks.
    - *Part A:* 15 MCQs × 2 marks = 30. One answer each; many are "which of (i)–(iv) are true".
    - *Part B:* 20 marks written: set and relation computations, a short proof or two, occasionally a logic puzzle.

    === Topics in the last three papers
    #table(columns: (1fr, auto, auto, auto),
      [Topic], [AY23], [AY24], [AY25],
      [Propositional logic, arguments], [2], [3], [3],
      [Quantified statements], [3], [1], [2],
      [Number theory], [0], [0], [1],
      [Sets, power sets, partitions], [4], [4], [3],
      [Relations: composition, properties, closures], [3], [6], [5],
      [Equivalence relations, $A slash simq$], [2], [1], [5],
      [Partial orders, Hasse, chains], [4], [7], [1],
      [*Items counted*], [*18*], [*22*], [*20*],
    )
    #text(size: 8pt, fill: muted)[Each MCQ and each Part B sub-part is counted once, under its main topic; the course-trivia Q1s are excluded. Relations and partial orders appear in Part B every year.]

    === CS1231S conventions (differ from Epp)
    #table(columns: (auto, 1fr),
      [Here], [Meaning / Epp equivalent],
      [$NN$], [$\{0, 1, 2, ...\}$, *including 0*],
      [$overline(A)$], [complement (Epp: $A^c$)],
      [$A without B$], [difference (Epp: $A - B$)],
      [$A subset.eq B$], [subset; avoid $subset$],
      [largest / smallest], [Epp: greatest / least],
      [$lnot$, $->$, $<->$], [not, implies, iff],
    )
  ])

  #v(2mm)
  #line(length: 100%, stroke: 0.5pt + luma(200))
  #text(size: 8.3pt, fill: muted)[*Contents.* Part I Propositional Logic (Epp Ch. 2) · Part II Quantified Statements (Ch. 3) · Part III Number Theory and Methods of Proof (Ch. 1, 4) · Part IV Set Theory (Ch. 1.2, 6) · Part V Relations (Ch. 1.3, 8, plus the lecture-only material) · Part VI Practice with Model Solutions · Part VII Exam Playbook and Definition Index.]
]

// ============================================================================
= Part I · Propositional Logic
// ============================================================================

== 1 · Statements, connectives, truth tables

#defn[Statement (2.1.1) · Statement form (2.1.5)][
A *statement* (proposition) is a sentence that is true or false, but not both. A *statement form* is an expression built from statement variables and connectives that becomes a statement when statements are substituted for its variables.]

#defn[Negation (2.1.2) · Conjunction (2.1.3) · Disjunction (2.1.4)][
For statement variables $p$ and $q$: the *negation* of $p$ is "not $p$" or "it is not the case that $p$", denoted $lnot p$; the *conjunction* of $p$ and $q$ is "$p$ and $q$", denoted $p and q$; the *disjunction* of $p$ and $q$ is "$p$ or $q$", denoted $p or q$ (inclusive: true when either or both are true).]

#grid(columns: (auto, 1fr), gutter: 16pt,
  table(columns: 8, align: center,
    $p$, $q$, $lnot p$, $p and q$, $p or q$, $p -> q$, $p <-> q$, $p xor q$,
    [T], [T], [F], [T], [T], [T], [T], [F],
    [T], [F], [F], [F], [T], [F], [F], [T],
    [F], [T], [T], [F], [T], [T], [F], [T],
    [F], [F], [T], [F], [F], [T], [T], [F],
  ),
  [
    *Order of operations.* $lnot$ first; then $and$ and $or$, which are *coequal*, so $p and q or r$ is ambiguous and must be bracketed; then $->, <->$ last. (CS2100 puts $and$ before $or$; CS1231S does not.)

    *Exclusive or:* $p xor q equiv (p or q) and lnot(p and q)$.

    A $->$ is false in exactly one row: *T → F*.
  ])

#defn[Tautology, contradiction (2.1.7–8) · Logical equivalence (2.1.6)][
A *tautology* is a statement form that is true for every assignment; a *contradiction* is false for every assignment. A statement whose form is a tautology (contradiction) is a *tautological* (*contradictory*) statement. $P equiv Q$ iff $P$ and $Q$ have identical truth values under every assignment; equivalently, iff $P <-> Q$ is a tautology.]

== 2 · Logical equivalences and set identities

Theorem 2.1.1 (logic) and Theorem 6.2.2 (sets) side by side, as in Epp's Table 6.4.1. Read $and$ as $inter$, $or$ as $union$, $lnot$ as complement, $bold(t)$ as $U$, $bold(c)$ as $nothing$. Cite laws *by name*.

#table(columns: (auto, 1fr, 1fr), align: (left, center, center),
  [Law], [Logic (for statement variables)], [Sets (subsets of $U$)],
  [Commutative], $p and q equiv q and p quad p or q equiv q or p$, $A inter B = B inter A quad A union B = B union A$,
  [Associative], $(p and q) and r equiv p and (q and r)$, $(A inter B) inter C = A inter (B inter C)$,
  [Distributive], $p and (q or r) equiv (p and q) or (p and r)$, $A inter (B union C) = (A inter B) union (A inter C)$,
  [], $p or (q and r) equiv (p or q) and (p or r)$, $A union (B inter C) = (A union B) inter (A union C)$,
  [Identity], $p and bold(t) equiv p quad p or bold(c) equiv p$, $A inter U = A quad A union nothing = A$,
  [Negation / Complement], $p or lnot p equiv bold(t) quad p and lnot p equiv bold(c)$, $A union overline(A) = U quad A inter overline(A) = nothing$,
  [Double negation / complement], $lnot(lnot p) equiv p$, $overline(overline(A)) = A$,
  [Idempotent], $p and p equiv p quad p or p equiv p$, $A inter A = A quad A union A = A$,
  [Universal bound], $p or bold(t) equiv bold(t) quad p and bold(c) equiv bold(c)$, $A union U = U quad A inter nothing = nothing$,
  [De Morgan's], $lnot(p and q) equiv lnot p or lnot q$, $overline(A inter B) = overline(A) union overline(B)$,
  [], $lnot(p or q) equiv lnot p and lnot q$, $overline(A union B) = overline(A) inter overline(B)$,
  [Absorption], $p or (p and q) equiv p quad p and (p or q) equiv p$, $A union (A inter B) = A quad A inter (A union B) = A$,
  [Negations of $bold(t)$, $bold(c)$], $lnot bold(t) equiv bold(c) quad lnot bold(c) equiv bold(t)$, $overline(U) = nothing quad overline(nothing) = U$,
  [Set difference], [—], $A without B = A inter overline(B)$,
)

#thm[Further equivalences][
#grid(columns: (1fr, 1fr), gutter: 12pt,
[- *Implication law:* $p -> q equiv lnot p or q$
 - *Contrapositive:* $p -> q equiv lnot q -> lnot p$
 - *Negated conditional:* $lnot(p -> q) equiv p and lnot q$
 - *Biconditional:* $p <-> q equiv (p -> q) and (q -> p)$],
[- *Variant absorption:* $p and (lnot p or q) equiv p and q$
 - *Variant absorption:* $p or (lnot p and q) equiv p or q$
 - *Exportation:* $(p and q) -> r equiv p -> (q -> r)$
 - *Cases:* $(p or q) -> r equiv (p -> r) and (q -> r)$
 - $p -> (q or r) equiv (p and lnot q) -> r$])
The left column is proved in Lecture 2. The right column comes from tutorials and assignments; each follows from the table in a line or two, so derive it if a question says "use the laws" (the AY24 answer key cites variant absorption as an assignment result).]

#exam[AY24 Q4 · Simplify $(((p->q)->(q->r))->(r->s)) or p) and (p->(p->q)) and p$][
Call the long first conjunct $X or p$. Answer: *$p and q$* (option C).
#dtable(
  $(X or p) and (p -> (p -> q)) and p$, [],
  $equiv (X or p) and (p and (p -> (p -> q)))$, j[associative, commutative],
  $equiv ((X or p) and p) and (p -> (p -> q))$, j[associative],
  $equiv p and (p -> (p -> q))$, j[commutative ×2, absorption],
  $equiv p and (lnot p or (lnot p or q))$, j[implication law ×2],
  $equiv p and (lnot p or q)$, j[associative, idempotent],
  $equiv p and q$, j[variant absorption],
)]

#tip[Checking tautologies and equivalences][
*To test whether $P -> Q$ is a tautology,* try to make it false: set $Q$ false and $P$ true, and follow the consequences. If this forces a contradiction, $P -> Q$ is a tautology.
*AY24 Q3(iii)* $(p or q or lnot r) and (s or lnot(p or q)) -> (s or lnot r)$: falsifying needs $s = F, r = T$; the premise becomes $(p or q) and lnot(p or q)$, a contradiction, so the statement is a tautology.
*To show $P equiv.not Q$,* one row is enough. AY23 Q3(i): $lnot(p -> q) equiv p or (p -> lnot q)$? At $p = q = T$ the left side is F and the right side is T, so they are not equivalent.]

== 3 · Conditional statements

#defn[Conditional (2.2.1) and its relatives (2.2.2–4)][
$p -> q$ ("if $p$ then $q$", "$p$ implies $q$") is false only when $p$ is true and $q$ is false; when $p$ is false it is *vacuously true*. $p$ is the *hypothesis* (antecedent) and $q$ the *conclusion* (consequent). From $p -> q$ form the *contrapositive* $lnot q -> lnot p$, the *converse* $q -> p$, and the *inverse* $lnot p -> lnot q$.]

#thm[][A conditional $equiv$ its contrapositive. Its converse $equiv$ its inverse (they are contrapositives of each other). A conditional is *not* equivalent to its converse or its inverse.]

#defn[Only if (2.2.5) · Biconditional (2.2.6) · Necessary and sufficient (2.2.7)][
"$p$ only if $q$" means $lnot q -> lnot p$, i.e. $p -> q$. $quad$ "$p$ iff $q$" is $p <-> q$, true exactly when $p$, $q$ agree. \
"$r$ is *sufficient* for $s$" means $r -> s$. $quad$ "$r$ is *necessary* for $s$" means $lnot r -> lnot s$, i.e. $s -> r$.]

#table(columns: (1fr, auto, 1fr, auto),
  [English], [Symbolic], [English], [Symbolic],
  [if $p$ then $q$; $p$ implies $q$], $p -> q$, [$p$ only if $q$], $p -> q$,
  [$q$ if $p$; $q$ whenever $p$], $p -> q$, [$p$ unless $q$], $lnot q -> p equiv p or q$,
  [$p$ is sufficient for $q$], $p -> q$, [$p$ is necessary for $q$], $q -> p$,
  [$p$ if and only if $q$], $p <-> q$, [neither $p$ nor $q$], $lnot p and lnot q$,
)

#trap[Everyday "if" is often an "iff"][
"If you behave, you will get ice-cream" is usually understood as a biconditional. In mathematics it is only $b -> i$; misbehaving and still getting ice-cream does not make it false.]

== 4 · Arguments and rules of inference

#defn[Argument, validity (2.3.1) · Critical row · Syllogism · Sound, unsound (2.3.2)][
An *argument* (*argument form*) is a sequence of statements (statement forms); all but the last are *premises* (assumptions, hypotheses), the last (after $therefore$) is the *conclusion*. An argument form is *valid* iff, whatever statements are substituted for its variables, if the premises are all true then the conclusion is true. A *critical row* is a truth-table row in which all premises are T: the form is valid iff the conclusion is T in every critical row. A *syllogism* is an argument form with two premises and a conclusion (e.g. modus ponens). An argument is *sound* iff it is valid *and* all its premises are true; otherwise it is *unsound*.]

#table(columns: (auto, 1fr, auto, 1fr), align: (left, center, left, center),
  [Rule], [Form], [Rule], [Form],
  [Modus ponens], $p -> q, thick p thick therefore q$, [Generalization], $p therefore p or q$,
  [Modus tollens], $p -> q, thick lnot q thick therefore lnot p$, [Specialization], $p and q therefore p$,
  [Conjunction], $p, thick q thick therefore p and q$, [Elimination], $p or q, thick lnot q thick therefore p$,
  [Transitivity], $p -> q, thick q -> r thick therefore p -> r$, [Contradiction rule], $lnot p -> bold(c) thick therefore p$,
  [Division into cases], table.cell(colspan: 3, $p or q, thick p -> r, thick q -> r thick therefore r$),
)
*Fallacies (invalid):* _converse error_ $p -> q, q therefore p$; $quad$ _inverse error_ $p -> q, lnot p therefore lnot q$.

#exam[AY24 Q5 · Which conclusions follow from $p -> (q and r)$, $lnot p -> lnot r$, $lnot p and (r -> lnot p)$?][
+ $lnot p$ #j[specialization, premise 3]; then $lnot r$ #j[modus ponens with premise 2].
+ So every critical row has $p = r = F$ ($q$ free). Then (i) $p -> q$ is T (vacuous); (ii) $lnot p or lnot r$ is T; (iii) $q -> (p -> r)$ is T since $p -> r$ is T; (iv) $lnot p and lnot q and r$ is F since $r = F$.
Valid: *(i), (ii), (iii)*. Answer C.]

#exam[AY25 Q13 · Sound vs valid][
Sound $=>$ valid by definition, so "$forall x (S o u n d(x) -> V a l i d(x))$" is *true*; the converse fails (valid with a false premise), so "$exists x (lnot S o u n d(x) and V a l i d(x))$" is *true*; the other two are false. Answer: *only I and IV*.]

#exam[AY23 Q4 · Knights and knaves][
*Method:* let $A, D, N$ mean "is a knight". A statement $S$ made by $X$ gives $X <-> S$. Here: $A <-> D$; $D <-> lnot N$; "Aiken is not my type" gives $N <-> lnot(A <-> N)$; "Aiken lies" gives $N <-> lnot A$.
From $N <-> lnot A$, $A$ and $N$ differ, so $lnot(A <-> N)$ is T, hence $N$ is T. Then $A = F$, $D = A = F$, and $D <-> lnot N$ checks out. *Aiken and Dueet are knaves; Noasu is a knight.* Answer B.]

#exam[AY25 Q16 (6 marks) · Four animals, four colours, nine clues][
Names: cat (3 letters), sheep (5), rabbit (6), penguin (7).
+ (2) six letters $<->$ black: *rabbit* is black; cat, sheep, penguin are not.
+ (3) an "e" $->$ white: *sheep* and *penguin* are white.
+ (4) a repeated letter $->$ not grey: sheep (ee), rabbit (bb), penguin (nn) are not grey. (5) brown $->$ has an "i": cat and sheep are not brown.
+ (7) sheep has exactly one colour: *sheep = {white}*. (9) someone is grey, and only the cat can be: *cat = {grey}* (exactly one, by (7)).
+ (6) penguin has exactly two colours: white, and not black or grey, so *penguin = {white, brown}*.
+ (8) some animal is exactly {brown, black}; only the rabbit is black: *rabbit = {brown, black}*. (1) holds.]


=== Model derivations

#proofb[Simplify $lnot(lnot p and q) and (p or q)$ using the laws (Epp 2.1)][
#dtable(
  $lnot(lnot p and q) and (p or q) equiv (lnot lnot p or lnot q) and (p or q)$, j[De Morgan's law],
  $equiv (p or lnot q) and (p or q)$, j[double negative law],
  $equiv p or (lnot q and q)$, j[distributive law],
  $equiv p or (q and lnot q) equiv p or bold(c)$, j[commutative law; negation law],
  $equiv p$, j[identity law]) #qed]

#proofb[Derive variant absorption $p and (lnot p or q) equiv p and q$ from the table][
$p and (lnot p or q) equiv (p and lnot p) or (p and q)$ #j[distributive] $equiv bold(c) or (p and q)$ #j[negation] $equiv (p and q) or bold(c)$ #j[commutative] $equiv p and q$ #j[identity]. #qed]

#proofb[A deduction with named rules: from $p or q$, $q -> r$, $(p and s) -> t$, $lnot r$, $lnot q -> (u and s)$, conclude $t$][
+ $lnot q$ #j[from $q -> r$ and $lnot r$, by modus tollens]
+ $u and s$ #j[from $lnot q -> (u and s)$ and step 1, by modus ponens]; so $s$ #j[specialization]
+ $p$ #j[from $p or q$ and step 1, by elimination]
+ $p and s$ #j[steps 2, 3, by conjunction]; so $t$ #j[from $(p and s) -> t$, by modus ponens]. #qed]



#block(breakable: false, grid(columns: (auto, 1fr), gutter: 16pt,
  text(size: 9.4pt, table(columns: 6, align: center, inset: (x: 5pt, y: 3pt),
    $p$, $q$, $r$, $p -> q$, $q -> r$, $p -> r$,
    [T],[T],[T],[*T*],[*T*],[*T*],
    [T],[T],[F],[T],[F],[F],
    [T],[F],[T],[F],[T],[T],
    [T],[F],[F],[F],[T],[F],
    [F],[T],[T],[*T*],[*T*],[*T*],
    [F],[T],[F],[T],[F],[T],
    [F],[F],[T],[*T*],[*T*],[*T*],
    [F],[F],[F],[*T*],[*T*],[*T*],
  )),
  [
    #tip[Validity by critical rows][
    For $p -> q, thin q -> r thin therefore thin p -> r$ (transitivity): the *critical rows* are those where every premise is T: rows 1, 5, 7 and 8 (bold). The conclusion is T in each, so the argument is *valid*. A critical row with a false conclusion would make the argument invalid; that row is a counterexample.]
    #trap[$->$ is not associative][
    $(p -> q) -> r equiv.not p -> (q -> r)$: at $p = q = r = F$ the left is $T -> F = F$, the right is $T$. Always bracket chains of $->$.]
  ]))

// ============================================================================
= Part II · Quantified Statements
// ============================================================================

== 5 · Predicates and quantifiers

#defn[Predicate (3.1.1) · Truth set (3.1.2)][
A *predicate* is a sentence with finitely many variables that becomes a statement when values are substituted. The *domain* of a variable is the set of values that may be substituted for it (also called the domain of discourse, universe of discourse, universal set, or universe). The *truth set* of $P(x)$, $x in D$, is the set of all elements of $D$ that make $P(x)$ true: ${x in D : P(x)}$ (also written ${x in D | P(x)}$).]

#defn[Kinds of mathematical statements (Lecture 1)][
A *universal statement* says a property holds for *all* elements of a set ($forall$; "all", "every", "any"). A *conditional statement* says that if one thing is true then another must be ($->$; "if … then"). An *existential statement* says there is *at least one* thing with the property ($exists$; "there exists", "some"). \
A *universal conditional statement* is both universal and conditional: $forall x thin (P(x) -> Q(x))$, e.g. "for all animals $a$, if $a$ is a dog then $a$ is a mammal". \
A *universal existential statement* has the form $forall x thin exists y thin ...$: "every real number has an additive inverse". \
An *existential universal statement* has the form $exists x thin forall y thin ...$: "there is a positive integer that is $<=$ every positive integer".]

#defn[Universal (3.1.3) and existential (3.1.4) statements · Uniqueness][
$forall x in D, Q(x)$ is true iff $Q(x)$ is true for *every* $x in D$, and false iff $Q(x)$ is false for at least one $x$, called a *counterexample*. \
$exists x in D$ such that $Q(x)$ is true iff $Q(x)$ is true for *at least one* $x in D$, and false iff $Q(x)$ is false for all $x in D$. \
$exists! x in D, Q(x) quad equiv quad exists x in D thin (Q(x) and forall y in D thin (Q(y) -> y = x))$, read "there is exactly one".]

#tip[Translating English][
*Use $->$ under $forall$ and $and$ under $exists$.* "All $A$ are $B$" is $forall x (A(x) -> B(x))$; "some $A$ is $B$" is $exists x (A(x) and B(x))$. Writing $forall x (A(x) and B(x))$ claims *everything* is an $A$; writing $exists x (A(x) -> B(x))$ is true as soon as one non-$A$ exists. \
*Implicit quantification:* "If $x > 2$ then $x^2 > 4$" in a real-number context means $forall x in RR (x > 2 -> x^2 > 4)$.]

#exam[AY24 Q2 · "All birds cannot fly"][
$forall x (B i r d(x) -> lnot F l y(x))$, option C. Option B, $forall x (B i r d(x) and lnot F l y(x))$, asserts that everything is a bird; D quantifies a second, unrelated $y$.]

== 6 · Negation, vacuous truth, variants

#thm[Negation of quantified statements (3.2.1–2)][
$lnot (forall x in D, P(x)) equiv exists x in D, lnot P(x) quad quad lnot (exists x in D, P(x)) equiv forall x in D, lnot P(x)$ \
Universal conditional: $lnot forall x in D (P(x) -> Q(x)) equiv exists x in D (P(x) and lnot Q(x))$. \
Nested: push $lnot$ inward, flipping each quantifier: $lnot forall x exists y thin P(x,y) equiv exists x forall y lnot P(x,y)$.]

#defn[Vacuous truth][
$forall x in D (P(x) -> Q(x))$ is *vacuously true* when no $x in D$ satisfies $P(x)$. In particular, every universal statement over an *empty* domain is true, and every existential statement over an empty domain is false.]

#defn[Variants (3.2.1) · Necessary, sufficient, only if (3.2.2)][
For $forall x in D (P(x) -> Q(x))$: *contrapositive* $forall x (lnot Q(x) -> lnot P(x))$ (equivalent), *converse* $forall x (Q(x) -> P(x))$, *inverse* $forall x (lnot P(x) -> lnot Q(x))$. \
"$r(x)$ is sufficient for $s(x)$": $forall x (r(x) -> s(x))$. "$r(x)$ is necessary for $s(x)$": $forall x (s(x) -> r(x))$. "$r(x)$ only if $s(x)$": $forall x (r(x) -> s(x))$.]

#exam[AY23 Q2 · Given $forall x in S (S o C(x) and C S 1231(x))$ is true][
(i) All computing students took CS1231S: *true*. (ii) Every student is a computing student: *true*, because of the $and$. (iii) $S != nothing$: *false*, since the statement is vacuously true when $S = nothing$. (iv) Some non-computing student took it: *false*, as there is no such student. Only (i) and (ii) hold; no option lists this, so the answer is *E*.]

#exam[AY25 Q2 · $forall x in D (R e d(x) and F l y i n g(x))$ for the objects in LT11][
A: if the statement is true, every object is red. True. B: if true, every object flies. True. C: it is true when LT11 is empty. True, vacuously. D: if it is false, there is a counterexample object, so LT11 is non-empty. True. Options A–D are all correct, so the false option is *E*.]

== 7 · Multiple quantifiers

#thm[Order of quantifiers][
Adjacent quantifiers *of the same kind* commute: $forall x forall y equiv forall y forall x$ and $exists x exists y equiv exists y exists x$. Swapping a $forall$ past an $exists$ usually changes the meaning: in $forall x exists y thin P(x, y)$ the witness $y$ *may depend on* $x$; in $exists y forall x thin P(x,y)$ one $y$ must work for all $x$. $quad exists y forall x thin P => forall x exists y thin P$, never conversely in general.]

#tip[Evaluating and proving nested statements][
Read the quantifiers from left to right. A $forall$ variable may take any value; an $exists$ variable is chosen afterwards and may depend on the values chosen before it. \
To *prove* $forall x exists y thin P$: "Let $x$ be arbitrary. Let $y = f(x)$. Then $P(x, f(x))$ because …". To *disprove* it, prove the negation $exists x forall y lnot P$: give one $x$ and show that every $y$ fails for it.]

#exam[AY23 Q5 · Domain $RR$][
(i) $forall x exists y (x y = 1)$ is *false*: at $x = 0$, $0 dot y = 0 != 1$ for every $y$. \
(ii) $exists x forall y (x^2 >= y^2)$ is *false*: for any $x$, $y = |x| + 1$ gives $y^2 > x^2$. \
(iii) $exists x forall y exists z (x y^2 = y z)$ is *true*: take $x = 0$; for any $y$ choose $z = 0$. (Or $x = 1$, $z = y$.) Answer *B*.]

#exam[AY23 Q16 (6 marks) · Solving for the witnesses][
*(a)* $A = {1,2,3}$, $B = {4,5,6}$; smallest positive integer that can lie in $C$ with $forall x in A thin forall y in B thin forall z in C thin (|x - y| <= |y - z|)$. For each $y$ the worst $x$ is 1, so we need $|y - z| >= y - 1$ for $y = 4, 5, 6$: at $z = 1$, $|y - 1| = y - 1$. So *$z = 1$*. \
*(b)* $exists y in ZZ^+ thin forall x in {10, ..., 50} thin forall z in {3,5,7,9} thin (x <= y^2 and y <= z^2)$: need $y^2 >= 50$, so $y >= 8$, and $y <= 3^2 = 9$. So *$y in {8, 9}$*. \
*(c)* $forall x in ZZ thin exists y in RR without {0} thin (x y < 1)$: take *$y = -1$ if $x >= 0$, $y = 1$ if $x < 0$*; then $x y = -x <= 0$ or $x y = x < 0$, both $< 1$. (The key lists several others, e.g. $y = 1$ at $x = 0$ and $y = -x$ otherwise.)]

#trap[Hidden domain changes][
$forall x in ZZ^+ thin exists y in ZZ (x + y = 0)$ is true but becomes false over $y in ZZ^+$. Check every domain again after negating or reordering quantifiers.]

== 8 · Arguments with quantified statements

#defn[Valid argument form (3.4.1)][
An argument form is *valid* iff, no matter what particular predicates are substituted for the predicate symbols in its premises, if the resulting premise statements are all true then the conclusion is also true. An argument is *valid* iff its form is valid.]

#table(columns: (auto, 1fr, auto, 1fr),
  [Rule], [Form], [Rule], [Form],
  [Universal instantiation], $forall x in D thin P(x); thick a in D therefore P(a)$,
  [Universal generalization], [$P(a)$ for an *arbitrary* $a in D$ $therefore forall x in D thin P(x)$],
  [Universal modus ponens], $forall x (P(x) -> Q(x)); thick P(a) therefore Q(a)$,
  [Universal modus tollens], $forall x (P(x) -> Q(x)); thick lnot Q(a) therefore lnot P(a)$,
  [Existential instantiation], [$exists x thin P(x)$ $therefore P(c)$ for some *new* $c$],
  [Existential generalization], $P(a); thick a in D therefore exists x in D thin P(x)$,
)
*Invalid:* quantified *converse error* $forall x (P(x) -> Q(x)); thick Q(a) therefore P(a)$ and *inverse error* $forall x (P(x) -> Q(x)); thick lnot P(a) therefore lnot Q(a)$. \
*Validity with diagrams:* draw "all $P$ are $Q$" as the $P$-disc inside the $Q$-disc; the argument is valid iff *every* consistent drawing forces the conclusion.

#exam[AY25 Q6 (number theory in quantifier form) · $n$ a perfect square][
(i) "$n$ is prime" is false ($4 = 2^2$). (ii) "$n$ has an odd number of positive factors" is true for $n >= 1$ (divisors pair up as $d <-> n slash d$, except $d = sqrt(n)$), but *$n = 0$ is a perfect square with infinitely many factors*, so the key accepted both C and D. (iii) "$p dv n => p^2 dv n$" is true: if $n = m^2$ and $p dv m^2$ then $p dv m$ (unique factorization), so $p^2 dv m^2$.]


=== Model solutions with nested quantifiers

#proofb[Negating the definition of a limit (Lecture 1)][
$lim_(n -> oo) a_n = L$ means $forall epsilon in RR^+ thin exists N in ZZ thin forall n in ZZ thin (n > N -> L - epsilon < a_n < L + epsilon)$. \
Its negation, one quantifier at a time: $exists epsilon in RR^+ thin forall N in ZZ thin exists n in ZZ thin (n > N and (a_n <= L - epsilon or a_n >= L + epsilon))$. #qed]

#proofb[$forall x in ZZ thin exists y in ZZ thin (x + y = 0)$ is true; $exists y in ZZ thin forall x in ZZ thin (x + y = 0)$ is false][
+ Let $x$ be an arbitrary integer and let $y = -x$. Then $y in ZZ$ #j[closure] and $x + y = 0$.
+ For the second, prove the negation $forall y in ZZ thin exists x in ZZ thin (x + y != 0)$: given any $y$, take $x = 1 - y$; then $x + y = 1 != 0$. #qed]

#table(columns: (1fr, 1fr),
  [English], [Symbolic ($L(x, y)$: $x$ loves $y$)],
  [Everybody loves somebody.], $forall x thin exists y thin L(x, y)$,
  [Somebody is loved by everybody.], $exists y thin forall x thin L(x, y)$,
  [Nobody loves everybody.], $lnot exists x thin forall y thin L(x, y) equiv forall x thin exists y thin lnot L(x, y)$,
  [There is exactly one person everybody loves.], $exists! y thin forall x thin L(x, y)$,
)


#proofb[Formal negation of a nested quantified conditional (Lecture 3, Tarski's world)][
"There is a square $x$ such that for all triangles $y$, $x$ is to the right of $y$":
$exists x thin (S q u a r e(x) and forall y thin (T r i a n g l e(y) -> R i g h t O f(x, y)))$. Negate step by step:
#dtable(
  $lnot exists x thin (S q u a r e(x) and forall y thin (T r i a n g l e(y) -> R i g h t O f(x, y)))$, [],
  $equiv forall x thin lnot (S q u a r e(x) and forall y thin (T r i a n g l e(y) -> R i g h t O f(x, y)))$, j[negation of $exists$],
  $equiv forall x thin (lnot S q u a r e(x) or lnot forall y thin (T r i a n g l e(y) -> R i g h t O f(x, y)))$, j[De Morgan],
  $equiv forall x thin (lnot S q u a r e(x) or exists y thin lnot (T r i a n g l e(y) -> R i g h t O f(x, y)))$, j[negation of $forall$],
  $equiv forall x thin (lnot S q u a r e(x) or exists y thin (T r i a n g l e(y) and lnot R i g h t O f(x, y)))$, j[negated conditional],
) "Every object is either not a square, or has some triangle it is not to the right of." #qed]

#proofb[Universal modus ponens inside an ordinary proof (Lecture 3.4.3)][
In "the sum of two even integers is even", each step is an instance of universal modus ponens:
+ "If an integer is even, it equals twice some integer; $m$ is a particular even integer; $therefore$ $m = 2r$ for some integer $r$."
+ "For all $u, v$: if $u, v$ are integers then $u + v$ is an integer; $r, s$ are integers; $therefore$ $r + s$ is an integer."
+ "If a number equals twice some integer, it is even; $2(r + s)$ is such a number; $therefore$ $m + n$ is even." #qed
Writing "by definition of even" or "by closure" is shorthand for exactly these instantiations.]

#drill[Translate, then negate (answers after the arrow)][
- "Every student has a friend": $forall s thin exists f thin F(s, f)$ $->$ negation $exists s thin forall f thin lnot F(s, f)$.
- "No integer is both even and odd": $forall n thin lnot(E(n) and O(n))$ $->$ negation $exists n thin (E(n) and O(n))$.
- "All primes greater than 2 are odd": $forall p thin (P(p) and p > 2 -> O(p))$ $->$ $exists p thin (P(p) and p > 2 and lnot O(p))$.
- "$x$ is a *minimal* element": $forall y thin (y pleq x -> y = x)$ $->$ $exists y thin (y pleq x and y != x)$.]

// ============================================================================
= Part III · Number Theory and Methods of Proof
// ============================================================================


== 9 · Writing proofs

#grid(columns: (1fr, 1fr), gutter: 14pt,
  table(columns: (auto, 1fr),
    [Term], [Meaning (Lecture 1)],
    [Definition], [precise meaning of a term: all and only the required properties],
    [Axiom / postulate], [assumed true without proof (Peano, Euclid's postulates)],
    [Theorem], [a major result, proved rigorously],
    [Lemma], [a small result used to prove a theorem],
    [Corollary], [a simple deduction from a theorem],
    [Conjecture], [believed true, unproved (Goldbach)],
  ),
  [
    #tip[Proof format][
    - *Number the steps;* nest sub-arguments ($1.1, 1.2, ...$).
    - *Justify every step* in brackets: "by definition of odd", "by closure of integers under $+$", "by basic algebra", "by Theorem 4.4.3".
    - Open a universal proof with "Let $x$ be a *particular but arbitrarily chosen* element of $D$".
    - Give each existential witness a *fresh* name.
    - End with the claim, restated, then $square.filled$.]
  ])

#defn[Basic properties of integers (Lecture 1, Appendix A)][
For all $x, y, z in ZZ$: *closure* ($x + y, x y in ZZ$), *commutativity*, *associativity*, *distributivity*, *trichotomy* (exactly one of $x < y$, $x = y$, $x > y$). Appendix A's field and order axioms for $RR$ may also be cited. \
*Assumption 1:* every integer is even or odd, but not both. $quad$ *Assumption 2:* every rational number can be reduced to lowest terms.]

#trap[Common mistakes in proofs (Epp 4.2)][
Arguing from examples · reusing a letter ($m = 2r$ and $n = 2r$ makes $m = n$) · assuming what is to be proved · "therefore" without a reason · writing "$a dv b = 3$" ($a dv b$ is a statement, not a number).]

== 10 · Definitions and results in number theory

#defn[Even, odd · Prime, composite][
$n in ZZ$ is *even* $<=> exists k in ZZ thin (n = 2k)$; $quad$ *odd* $<=> exists k in ZZ thin (n = 2k + 1)$. \
$n$ is *prime* iff $n > 1$ and $forall r, s in ZZ^+ thin (n = r s -> (r = 1 and s = n) or (r = n and s = 1))$. \
$n$ is *composite* iff $n > 1$ and $exists r, s in ZZ^+ thin (n = r s and 1 < r < n and 1 < s < n)$. $quad$ 1 is neither. \
An equivalent definition of prime: $n > 1 and forall r, s in ZZ thin (r > 1 and s > 1 -> r s != n)$.]

#defn[Rational, irrational · Lowest terms][
$r in RR$ is *rational* $<=> exists a, b in ZZ thin (r = a slash b and b != 0)$; otherwise *irrational*. A fraction $a slash b$ is in *lowest terms* if the largest integer dividing both $a$ and $b$ is 1.]

#defn[Divisibility][
For $n, d in ZZ$: $quad d dv n <=> exists k in ZZ thin (n = d k)$. $quad$ Read: $d$ divides $n$; $n$ is a multiple of $d$; $d$ is a factor/divisor of $n$. \
Consequences: every $d$ divides 0; 0 divides only 0; $1 dv n$ and $n dv n$ for all $n$. No division is performed: $3 dv 12$ is *true* and $3 dv 10$ is *false*.]

#defn[Absolute value (Lecture 1) · Colorful (Lecture 1, CS1231S only)][
For $x in RR$, the *absolute value* of $x$ is $|x| = x$ if $x >= 0$, and $|x| = -x$ if $x < 0$. \
An integer $n$ is *colorful* iff there exists some integer $k$ such that $n = 3k$. (Non-standard term, used only in the lecture: $-1353 = 3 dot (-451)$ and $0 = 3 dot 0$ are colorful; 7 is not.)]

#thm[Quotient–Remainder Theorem (4.5.1) · div and mod][
For $n in ZZ$ and $d in ZZ^+$ there exist *unique* $q, r in ZZ$ with $n = d q + r$ and $0 <= r < d$. We write $n "div" d = q$ and $n mod d = r$. Hence every integer is of exactly one form $d q, d q + 1, ..., d q + (d - 1)$. This is the basis for *division into cases*.]

#thm[Results that may be cited][
#grid(columns: (1fr, 1fr), gutter: 12pt,
[- *4.3.1* Every integer is rational.
 - *4.3.2* The sum of two rationals is rational; *Cor. 4.3.3* the double of a rational is rational.
 - *4.4.1* $a, b in ZZ^+, a dv b => a <= b$.
 - *4.4.2* The only divisors of 1 are $1$ and $-1$.
 - *4.4.3* $a dv b and b dv c => a dv c$.
 - *4.4.4* Every integer $n > 1$ is divisible by a prime.],
[- *4.4.5* Unique factorization: $n > 1$ is $p_1^(e_1) dots.c p_k^(e_k)$, unique up to order.
 - *4.5.2* Consecutive integers have opposite parity.
 - *4.5.4* $-|r| <= r <= |r|$; *4.5.6* $|x + y| <= |x| + |y|$.
 - *4.7.1* There is no greatest integer.
 - *4.7.4* $n^2$ even $=> n$ even.
 - *4.8.1* $sqrt(2)$ is irrational; *4.8.4* there are infinitely many primes.])
#v(2pt)
#text(size: 8.3pt, fill: muted)[Numbers follow Epp's 5th edition. The slides quote 4th-edition numbers first: the slides' 4._k_._x_ is 4.(_k_+1)._x_ in the 5th edition for sections 4.2–4.7; for example, the slides' "Theorem 4.3.3" is 4.4.3.]]

== 11 · Choosing the method

#table(columns: (auto, auto, 1fr),
  [To show], [Method], [Skeleton],
  [$exists x in D thin P(x)$], [Construction], [Name a witness $x = ...$; verify $x in D$ and $P(x)$. There is no need to explain how it was found.],
  [$lnot forall x in D (P(x) -> Q(x))$], [Counterexample], [One $x$ with $P(x)$ true and $Q(x)$ false. One suffices.],
  [$forall x in D thin P(x)$, $D$ finite], [Exhaustion], [Check every case explicitly.],
  [$forall x in D (P(x) -> Q(x))$], [Direct (generic particular)], [Let $x in D$ be arbitrary with $P(x)$. Unpack definitions; rebuild $Q(x)$.],
  [same], [Division into cases], [Split by parity / by $x mod d$ (QR theorem) / by sign; prove each case.],
  [same], [Contraposition], [Prove $forall x (lnot Q(x) -> lnot P(x))$ directly.],
  [any statement $S$], [Contradiction], [Suppose $lnot S$. Derive a contradiction. Conclude $S$.],
  [$P <=> Q$], [Two directions], [Prove $P => Q$ and $Q => P$ separately.],
  [$exists! x thin P(x)$], [Existence + uniqueness], [Give $x$ with $P(x)$; then if $P(y)$, show $y = x$.],
)

#tip[Contradiction or contraposition?][
Use *contraposition* when the negated conclusion is easier to work with; "$n$ is odd" is easier to use than "$n^2$ is not odd". Use *contradiction* for statements such as "there is no …", "there are infinitely many …" and "… is irrational", whose negations assert that some object exists.]

== 12 · Model proofs

#proofb[Sum of two even integers is even (Lecture 4, Ex. 4)][
+ Let $m$ and $n$ be particular but arbitrarily chosen even integers.
  + Then $m = 2 r$ and $n = 2 s$ for some integers $r$ and $s$ #j[by definition of even].
  + $m + n = 2 r + 2 s = 2(r + s)$ #j[by basic algebra].
  + $r + s$ is an integer #j[by closure of integers under $+$], so $m + n$ is even #j[by definition of even].
+ Therefore the sum of any two even integers is even. #qed]

#proofb[The product of two consecutive odd integers is odd (Lecture 1, Ex. 1)][
+ Let $a$ and $b$ be two consecutive odd integers.
  + WLOG $a < b$, hence $b = a + 2$.
  + $a = 2 k + 1$ for some integer $k$ #j[by definition of odd], so $b = 2 k + 3$.
  + $a b = (2k + 1)(2k + 3) = 4k^2 + 8k + 3 = 2(2k^2 + 4k + 1) + 1$ #j[by basic algebra].
  + Let $m = 2k^2 + 4k + 1$, an integer #j[by closure under $times$ and $+$]. Then $a b = 2m + 1$ is odd #j[by definition of odd].
+ Therefore the product of two consecutive odd integers is odd. #qed]

#proofb[Theorem 4.3.2 · The sum of any two rational numbers is rational][
+ Let $r$ and $s$ be particular but arbitrarily chosen rational numbers.
  + Then $r = a slash b$ and $s = c slash d$ for some integers $a, b, c, d$ with $b != 0$, $d != 0$ #j[by definition of rational].
  + $r + s = (a d + b c) slash (b d)$ #j[by basic algebra].
  + $a d + b c$ and $b d$ are integers #j[by closure under $+$ and $times$], and $b d != 0$ #j[zero product property], so $r + s$ is rational #j[by definition of rational].
+ Therefore the sum of any two rational numbers is rational. #qed]

#proofb[Theorem 4.4.1 · For all $a, b in ZZ^+$, if $a dv b$ then $a <= b$][
+ Let $a, b$ be positive integers with $a dv b$.
  + Then $b = a k$ for some integer $k$ #j[by definition of divisibility].
  + Since $a$ and $b$ are positive, $k$ is positive, i.e. $k >= 1$.
  + Therefore $a <= a k = b$. #qed]

#proofb[Theorem 4.4.2 · The only divisors of 1 are 1 and −1 (division into cases)][
+ Let $m$ be any integer with $m dv 1$. Then $1 = m k$ for some integer $k$ #j[by definition of divisibility].
  + Since $m k > 0$, $m$ and $k$ are both positive or both negative.
  + *Case 1:* both positive. Then $m <= 1$ #j[by Theorem 4.4.1], so $m = 1$.
  + *Case 2:* both negative. Then $1 = (-m)(-k)$, so $-m$ is a positive divisor of 1; as in Case 1, $-m = 1$, i.e. $m = -1$.
+ Therefore the only divisors of 1 are 1 and −1. #qed]

#proofb[Theorem 4.4.3 · Transitivity of divisibility][
+ Suppose $a, b, c$ are integers with $a dv b$ and $b dv c$.
  + Then $b = a r$ and $c = b s$ for some integers $r, s$ #j[by definition of divisibility].
  + $c = b s = (a r) s = a (r s)$ #j[by substitution and associativity].
  + $r s$ is an integer #j[by closure under $times$], so $a dv c$ #j[by definition of divisibility]. #qed]

#proofb[Every integer $n$ has $n^2 mod 4 in {0, 1}$ (division into cases, via parity)][
+ Let $n$ be any integer. $n$ is even or odd #j[Assumption 1].
  + *Case 1:* $n = 2k$ for some integer $k$. Then $n^2 = 4k^2 = 4(k^2) + 0$, and $k^2 in ZZ$ #j[closure].
  + *Case 2:* $n = 2k + 1$. Then $n^2 = 4k^2 + 4k + 1 = 4(k^2 + k) + 1$, and $k^2 + k in ZZ$ #j[closure].
+ In either case $n^2 = 4q + r$ with $r in {0, 1}$, so $n^2 mod 4 in {0, 1}$ #j[by the quotient–remainder theorem, $r$ is unique]. #qed]

#proofb[Theorem 4.7.1 · There is no greatest integer (contradiction)][
+ Suppose not; that is, there is a greatest integer $g$, so $g >= n$ for every integer $n$.
  + Let $G = g + 1$. Then $G$ is an integer #j[by closure under $+$] and $G > g$.
  + This contradicts that $g$ is the greatest integer.
+ Hence the supposition is false, and there is no greatest integer. #qed]

#proofb[Proposition 4.7.4 · For all integers $n$, if $n^2$ is even then $n$ is even (contraposition)][
+ Contrapositive: for all integers $n$, if $n$ is odd then $n^2$ is odd.
+ Let $n$ be an arbitrarily chosen odd integer.
  + Then $n = 2k + 1$ for some integer $k$ #j[by definition of odd].
  + $n^2 = 4k^2 + 4k + 1 = 2(2k^2 + 2k) + 1$ #j[by basic algebra].
  + Let $m = 2k^2 + 2k$, an integer #j[by closure]. Then $n^2 = 2m + 1$ is odd #j[by definition of odd].
+ Therefore, for all integers $n$, if $n^2$ is even then $n$ is even. #qed]

#proofb[Theorem 4.8.1 · $sqrt(2)$ is irrational (contradiction)][
+ Suppose not; that is, $sqrt(2)$ is rational.
  + Then $sqrt(2) = a slash b$ for some integers $a, b$ with $b != 0$ #j[by definition of rational].
  + Reduce $a slash b$ to lowest terms $m slash n$ #j[Assumption 2]; then $m^2 = 2 n^2$ #j[by basic algebra].
  + So $m^2$ is even #j[by definition of even, as $n^2 in ZZ$], hence $m$ is even #j[by Proposition 4.7.4].
  + Let $m = 2k$. Then $4k^2 = 2n^2$, so $n^2 = 2k^2$ is even, hence $n$ is even #j[by Proposition 4.7.4].
  + So 2 divides both $m$ and $n$, contradicting that $m slash n$ is in lowest terms.
+ Therefore $sqrt(2)$ is irrational. #qed]

#proofb[Theorem 4.7.3 · rational + irrational is irrational (contradiction)][
+ Suppose not: some rational $r$ and irrational $s$ have $r + s$ rational.
  + Then $r = a slash b$ and $r + s = c slash d$ with $a, b, c, d in ZZ$, $b, d != 0$ #j[by definition of rational].
  + So $s = c slash d - a slash b = (b c - a d) slash (b d)$, with $b c - a d, b d in ZZ$ and $b d != 0$ #j[closure; zero product property].
  + Hence $s$ is rational #j[by definition of rational], contradicting that $s$ is irrational. #qed]

#proofb[Theorem 4.8.4 · The set of primes is infinite (contradiction)][
+ Suppose not: the primes are exactly $p_1, p_2, ..., p_n$. Let $N = p_1 p_2 dots.c p_n + 1$.
  + $N > 1$, so some prime $p$ divides $N$ #j[by Theorem 4.4.4]; $p = p_i$ for some $i$ #j[the list is complete].
  + $p_i$ divides $p_1 dots.c p_n = N - 1$ as well. But a prime dividing $a$ cannot divide $a + 1$ #j[Proposition 4.8.3]. Contradiction.
+ Hence there are infinitely many primes. #qed]

#proofb[There exist irrational $p, q$ with $p^q$ rational (Lecture 1, Ex. 7; non-constructive proof by cases)][
+ $sqrt(2)$ is irrational #j[Theorem 4.8.1]. Consider $sqrt(2)^sqrt(2)$: it is rational or irrational.
  + *Case 1:* rational. Take $p = q = sqrt(2)$.
  + *Case 2:* irrational. Take $p = sqrt(2)^sqrt(2)$, $q = sqrt(2)$: then $p^q = sqrt(2)^(sqrt(2) dot sqrt(2)) = sqrt(2)^2 = 2$, rational.
+ In either case the required $p$ and $q$ exist. #qed]


=== More model proofs

#proofb[Theorem 4.5.2 · Any two consecutive integers have opposite parity][
+ Let $m$ and $m + 1$ be two particular but arbitrarily chosen consecutive integers. $m$ is even or odd #j[Assumption 1].
  + *Case 1:* $m = 2k$ for some $k in ZZ$. Then $m + 1 = 2k + 1$ is odd #j[by definition of odd].
  + *Case 2:* $m = 2k + 1$. Then $m + 1 = 2(k + 1)$ with $k + 1 in ZZ$ #j[closure], so $m + 1$ is even.
+ In both cases $m$ and $m + 1$ have opposite parity. #qed]

#proofb[Theorem 4.5.3 · The square of any odd integer has the form $8m + 1$ (division into cases via QR)][
+ Let $n$ be a particular but arbitrarily chosen odd integer. By the QR theorem with $d = 4$, $n = 4q$, $4q + 1$, $4q + 2$ or $4q + 3$ for some $q in ZZ$; as $n$ is odd, $n = 4q + 1$ or $n = 4q + 3$.
  + *Case 1:* $n^2 = 16q^2 + 8q + 1 = 8(2q^2 + q) + 1$.
  + *Case 2:* $n^2 = 16q^2 + 24q + 9 = 8(2q^2 + 3q + 1) + 1$.
+ In both cases $n^2 = 8m + 1$ for an integer $m$ #j[closure]. #qed]

#proofb[Theorem 4.5.6 · Triangle inequality $|x + y| <= |x| + |y|$ for all $x, y in RR$][
+ By Lemma 4.5.4, $-|x| <= x <= |x|$ and $-|y| <= y <= |y|$; adding, $-(|x| + |y|) <= x + y <= |x| + |y|$.
  + *Case 1:* $x + y >= 0$. Then $|x + y| = x + y <= |x| + |y|$ #j[definition of absolute value].
  + *Case 2:* $x + y < 0$. Then $|x + y| = -(x + y) <= |x| + |y|$ #j[from the left inequality].
+ So $|x + y| <= |x| + |y|$ in all cases. #qed]

#proofb[Proposition 4.8.3 · For any integer $a$ and prime $p$: if $p dv a$ then $p ndv (a + 1)$ (contradiction)][
+ Suppose not: $p dv a$ and $p dv (a + 1)$ for some integer $a$ and prime $p$.
  + Then $a = p r$ and $a + 1 = p s$ for some $r, s in ZZ$ #j[definition of divisibility], so $1 = p s - p r = p(s - r)$.
  + So $p dv 1$ #j[as $s - r in ZZ$], hence $p = 1$ or $p = -1$ #j[Theorem 4.4.2]. This is a contradiction, since a prime is greater than 1. #qed]

#proofb[If $a dv b$ and $a dv c$ then $a dv (m b + n c)$ for all integers $m, n$][
+ Suppose $a dv b$ and $a dv c$: $b = a r$ and $c = a s$ for some $r, s in ZZ$ #j[definition of divisibility].
+ Then $m b + n c = a(m r + n s)$ #j[basic algebra], and $m r + n s in ZZ$ #j[closure], so $a dv (m b + n c)$. #qed]

#proofb[Lecture 1 · If $x$ and $y$ are "colorful" ($n$ colorful $<-> exists k in ZZ thin (n = 3k)$), so is $x + 2y$][
_Work backwards first:_ the goal "$x + 2y$ is colorful" means we need an integer $c$ with $x + 2y = 3c$.
+ Let $x, y$ be colorful integers. Then $x = 3a$ and $y = 3b$ for some $a, b in ZZ$ #j[by definition of colorful].
+ $x + 2y = 3a + 6b = 3(a + 2b)$ #j[basic algebra]. Let $c = a + 2b$, an integer #j[closure].
+ So $x + 2y = 3c$, and $x + 2y$ is colorful #j[by definition of colorful]. #qed]

#example[Disproof by counterexample][
- "$forall a, b, c in ZZ thin (a dv b c -> a dv b or a dv c)$" is false: $4 dv 2 dot 2$ but $4 ndv 2$.
- "$forall a, b in ZZ thin (a dv b and b dv a -> a = b)$" is false: take $a = 1$, $b = -1$. (True on $ZZ^+$: Theorem 4.4.1.)
- "The product of two irrational numbers is irrational" is false: $sqrt(2) dot sqrt(8) = 4$ (Lecture 1).
- "$forall a, b in RR thin (a^2 = b^2 -> a = b)$" is false: take $a = 1$, $b = -1$ (Lecture 4).
- "There is no integer that is both even and odd" (4.7.2) is *true*: if $n = 2a = 2b + 1$ then $1 = 2(a - b)$, so $1 slash 2 in ZZ$, a contradiction.]


#proofb[Theorem 4.3.1 · Every integer is a rational number][
+ Let $a$ be a particular but arbitrarily chosen integer. Then $a = a slash 1$, a quotient of integers with non-zero denominator.
+ Hence $a$ is rational #j[by definition of rational]. #qed]

#proofb[Proof by exhaustion (Lecture 4, Ex. 3) · every even $n$ with $4 <= n <= 26$ is a sum of two primes][
$4 = 2+2$, $6 = 3+3$, $8 = 3+5$, $10 = 5+5$, $12 = 5+7$, $14 = 3+11$, $16 = 5+11$, $18 = 7+11$, $20 = 7+13$, $22 = 5+17$, $24 = 5+19$, $26 = 7+19$. Every case is checked. #qed]

#proofb[For every integer $n$, $3 dv (n^3 - n)$ (division into cases, QR with $d = 3$)][
+ Let $n in ZZ$. By the QR theorem, $n = 3q$, $3q + 1$ or $3q + 2$ for some $q in ZZ$. Note $n^3 - n = (n - 1) n (n + 1)$ #j[basic algebra].
  + *Case $n = 3q$:* the factor $n = 3q$, so $n^3 - n = 3 dot q(n-1)(n+1)$.
  + *Case $n = 3q + 1$:* the factor $n - 1 = 3q$, so $n^3 - n = 3 dot q n(n+1)$.
  + *Case $n = 3q + 2$:* the factor $n + 1 = 3(q + 1)$, so $n^3 - n = 3 dot (q+1)(n-1)n$.
+ In each case the cofactor is an integer #j[closure], so $3 dv (n^3 - n)$ #j[definition of divisibility]. #qed]

#proofb[Every prime $p > 3$ has the form $6k + 1$ or $6k + 5$ (Epp 4.5, exercise 39)][
+ Let $p > 3$ be prime. By the QR theorem, $p = 6k + r$ with $r in {0, 1, 2, 3, 4, 5}$.
  + If $r in {0, 2, 4}$, then $p = 2(3k + r slash 2)$ is even and $> 2$, so not prime.
  + If $r = 3$, then $p = 3(2k + 1)$ with $p > 3$, so not prime.
+ Hence $r = 1$ or $r = 5$. #qed]


#proofb[Theorem 4.4.4 · Every integer $n > 1$ is divisible by a prime (via well-ordering)][
+ Let $n > 1$ be an integer, and let $D = {d in ZZ : d > 1 and d dv n}$. $D != nothing$, since $n in D$.
+ $D$ has a smallest element $p$ #j[$(NN, <=)$ is well-ordered].
+ $p$ is prime: suppose instead $p = r s$ with $1 < r < p$. Then $r dv p$ and $p dv n$, so $r dv n$ #j[Theorem 4.4.3], so $r in D$ with $r < p$, contradicting the minimality of $p$.
+ Hence the prime $p$ divides $n$. #qed]

#proofb[Lemma 4.5.4 · For every real $r$: $-|r| <= r <= |r|$ (division into cases)][
+ *Case $r >= 0$:* $|r| = r$ #j[definition of absolute value], and $-|r| = -r <= 0 <= r$. So $-|r| <= r = |r|$.
+ *Case $r < 0$:* $|r| = -r > 0$, so $-|r| = r$ and $r < 0 < |r|$. So $-|r| = r <= |r|$. #qed]

#exam[Using unique factorization (Theorem 4.4.5) · AY25 Q6(iii) in full][
*Claim:* if $n = m^2$ is a perfect square and a prime $p$ divides $n$, then $p^2 dv n$. \
If $m = 0$, then $n = 0$ and $p^2 dv 0$. Otherwise write $|m| = p_1^(e_1) dots.c p_k^(e_k)$ #j[Theorem 4.4.5]; then $n = p_1^(2e_1) dots.c p_k^(2e_k)$. A prime dividing $n$ is some $p_i$ (uniqueness of the factorization), and its exponent $2e_i >= 2$, so $p_i^2 dv n$. #qed \
In a perfect square every prime appears to an even power.]

// ============================================================================
= Part IV · Set Theory
// ============================================================================

== 13 · Describing sets

#defn[Set · Membership · Cardinality][
A *set* is an unordered collection of objects, its *members* or *elements*; order and repetition do not matter: ${9, 8, 7} = {7, 8, 7, 9, 9}$. $x in S$ means $x$ is an element of $S$; $x in.not S$ means it is not. The *cardinality* $|S|$ is the size of $S$, the number of elements of $S$.]

#defn[Set-roster, set-builder and replacement notation][
*Set-roster:* list all the elements between braces, e.g. ${1, 2, 3}$, ${1, 2, ..., 100}$, ${1, 2, 3, ...}$ (the ellipsis "…" reads "and so forth"). \
*Set-builder:* ${x in U : P(x)}$ is the set of all $x in U$ for which $P(x)$ is true. $z$ is a member iff $z in U$ *and* $P(z)$. \
*Replacement:* ${t(x) : x in A}$ is the set of all objects $t(x)$ as $x$ ranges over $A$. $z$ is a member iff $t(x) = z$ for *some* $x in A$. \
E.g. ${x + 1 : x in ZZ_(>= 0)} = ZZ^+$; $quad$ ${x in ZZ : -2 < x < 5} = {-1, 0, 1, 2, 3, 4}$.]

#defn[Interval notation (Lecture 5)][
For real numbers $a <= b$: $quad (a, b) = {x in RR : a < x < b}$, $quad [a, b] = {x in RR : a <= x <= b}$, $quad (a, b] = {x in RR : a < x <= b}$, $quad [a, b) = {x in RR : a <= x < b}$. \
Unbounded: $(a, oo) = {x in RR : x > a}$, $quad [a, oo) = {x in RR : x >= a}$, $quad (-oo, b) = {x in RR : x < b}$, $quad (-oo, b] = {x in RR : x <= b}$. \
The interval $(a, b)$ and the ordered pair $(a, b)$ look the same; context tells them apart.]

#grid(columns: (1.1fr, 1fr), gutter: 14pt,
  table(columns: (auto, 1fr),
    [Symbol], [Set],
    $NN$, [natural numbers ${0, 1, 2, ...}$, *including 0*],
    $ZZ, QQ, RR$, [integers, rationals, reals],
    $ZZ^+, ZZ^-, ZZ_(>= 0)$, [positive, negative, non-negative integers (0 is neither positive nor negative)],
    $(a, b), [a, b]$, [open / closed real intervals; also $(a, b], [a, oo)$ …],
  ),
  exam[AY25 Q17(b) · Name these subsets of $NN$][
  $A = {0, 1, 3, 7, 15, 31, ...}$ in replacement notation: $A = {2^n - 1 : n in NN}$. \
  $B = {3, 9, 15, 21, 27, ...}$ in set-builder notation: $B = {n in NN : 3 dv n and n "is odd"}$. \
  (Many correct answers; check the first few terms.)])

== 14 · Subsets, equality and the empty set

#defn[Subset, superset · Proper subset · Set equality · Empty set, singleton][
$A subset.eq B <=> forall x (x in A -> x in B)$: every element of $A$ is in $B$ ("$A$ is contained in $B$"). $quad A subset.eq.not B <=> exists x (x in A and x in.not B)$. \
If $A subset.eq B$ we may write $B supset.eq A$: "$B$ contains / includes $A$", "$B$ is a *superset* of $A$". \
$A subset.neq B$ (proper, or strict, inclusion) iff $A subset.eq B$ and $A != B$. $quad$ $A = B <=> A subset.eq B and B subset.eq A <=> forall x (x in A <-> x in B)$. \
The *empty set* $nothing = {}$ is the set with no elements. A set with exactly one element is a *singleton*.]

#thm[6.2.4 · The empty set][
$nothing subset.eq A$ for every set $A$ (and $nothing$ is unique). *Proof:* $forall x (x in nothing -> x in A)$ is vacuously true, as $x in nothing$ is always false.]

#grid(columns: (1fr, 1fr), gutter: 14pt,
[
  #table(columns: (auto, auto, 1fr),
    [Claim], [], [Why],
    $nothing in {1, 2, 3}$, [F], [$nothing$ is not listed],
    $nothing subset.eq {1, 2, 3}$, [T], [Thm 6.2.4],
    ${2} in {1, 2, 3}$, [F], [elements are numbers],
    ${2} subset.eq {1, 2, 3}$, [T], [$2$ is an element],
    ${2} in {{1}, {2}, {3}}$, [T], [${2}$ is listed],
    ${2} subset.eq {{1}, {2}, {3}}$, [F], [$2$ is not listed],
    ${9} = {{9}}$, [F], [different elements],
  )
],
[
  #table(columns: (1fr, auto),
    [The $nothing$ ladder], [$|dot|$],
    $nothing = {}$, [0],
    ${nothing} = PP(nothing)$, [1],
    ${nothing, {nothing}} = PP(PP(nothing))$, [2],
    $PP(PP(PP(nothing)))$, [4],
    $PP^4(nothing)$, [16],
  )
  #text(size: 8.3pt)[$nothing != {nothing}$: the first is empty, the second has one element. $nothing in {nothing}$ and $nothing subset.eq {nothing}$ are both true.]
])

#trap[$subset.eq$ is transitive but $in$ is not · AY23 Q8][
Which hold for all sets? (i) $A in B and B subset.eq C => A in C$ is *true*, since $A$ is an element of $B$ and hence of $C$. \
(ii) $A in B and B subset.eq C => A subset.eq C$ is false: take $A = {1}$, $B = C = {{1}}$, but $1 in.not C$. \
(iii), (iv) $A subset.eq B and B in C => A in C$ or $A subset.eq C$ are false: take $A = {x}$, $B = {x, y}$, $C = {{x, y}}$. $quad$ Only (i): *A*.]

== 15 · Ordered pairs and Cartesian products

#defn[Ordered pair, $n$-tuple · Cartesian product][
$(a, b) = (c, d) <=> a = c and b = d$; likewise for $n$-tuples componentwise. $quad (1, 2) != (2, 1)$ though ${1, 2} = {2, 1}$. \
$A times B = {(a, b) : a in A and b in B}$; $A_1 times dots.c times A_n = {(a_1, ..., a_n) : a_i in A_i}$; $A^n = A times dots.c times A$.]

*Facts.* $|A times B| = |A| dot |B|$. $A times nothing = nothing times A = nothing$. $A times B != B times A$ in general. $(A times B) times C != A times B times C$: elements $((a, b), c)$ versus $(a, b, c)$. $A times (B union C) = (A times B) union (A times C)$, and likewise for $inter$ and $without$.

#exam[AY24 Q6 · Which hold for *all* sets $A, B, C$?][
(i) $PP(A) subset.eq PP(B) -> A subset.eq B$ is *true* (proof in §17). (ii) $A without (B inter C) = (A without B) union (A without C)$ is *true* (proof in §17). (iii) $A times B subset.eq B times C -> A subset.eq C$ is *false*: take $B = nothing$; then $A times nothing = nothing$ is a subset of every set, whatever $A$ is. Answer *A*.]

== 16 · Operations on sets

#defn[Universal set · Union, intersection, difference, complement][
A *universal set* (universe of discourse) $U$ is the set containing every object under discussion, e.g. $RR$ when all sets considered are sets of reals. \
For $A, B subset.eq U$: $quad A union B = {x in U : x in A or x in B}$, $quad A inter B = {x in U : x in A and x in B}$, \
$B without A = {x in U : x in B and x in.not A}$ (the *relative complement* of $A$ in $B$), $quad overline(A) = {x in U : x in.not A} = U without A$. \
*Procedural versions* (the steps in element proofs): $a in X union Y <=> a in X or a in Y$; $a in X inter Y <=> a in X and a in Y$; $a in X without Y <=> a in X and a in.not Y$; $a in overline(X) <=> a in.not X$; $(a, b) in X times Y <=> a in X and b in Y$.]

#defn[Symmetric difference (Tutorial 3) · Disjoint][
$A xor B = (A without B) union (B without A)$, the set of elements in exactly one of $A$ and $B$. $A$ and $B$ are *disjoint* iff $A inter B = nothing$; $A_1, A_2, ...$ are *mutually disjoint* iff $A_i inter A_j = nothing$ whenever $i != j$. $union.big_(i=0)^n A_i$, $inter.big_(i=0)^n A_i$ extend $union, inter$.]

#thm[6.2.1 · Subset relations][
$A inter B subset.eq A$, $A inter B subset.eq B$ #h(0.8em) (inclusion of intersection); $quad A subset.eq A union B$, $B subset.eq A union B$ #h(0.8em) (inclusion in union); $quad A subset.eq B and B subset.eq C => A subset.eq C$ #h(0.8em) (transitivity). The *set identities* (Theorem 6.2.2) are the right column of the table in §2.]

#exam[AY23 Q7 · For which can *no* non-empty $A, B$ exist?][
(i) $A without B = A inter B$: these two sets are disjoint, so both must be $nothing$; then $A = (A without B) union (A inter B) = nothing$. *Impossible.* \
(ii) $A without B = A union B$: then $B subset.eq A union B = A without B$, so every element of $B$ is not in $B$; $B = nothing$. *Impossible.* \
(iii) $A union B = A inter B$: take $A = B$. $quad$ (iv) $A xor B = A union B$: take $A inter B = nothing$. $quad$ Answer *B* (only (i), (ii)).]

== 17 · Proving and disproving set statements

#tip[Three methods][
*Element method.* To show $X subset.eq Y$: "Let $z in X$ … so $z in Y$". To show $X = Y$: prove both inclusions, or one chain of $<=>$ steps each justified by a definition or a logic law. \
*Algebraic method.* Rewrite using the set identities (§2), one named law per line. \
*Disproof.* Give one concrete counterexample with every set written out. A Venn diagram helps in finding one.]

#proofb[${x in ZZ : x^2 = 1} = {1, -1}$ (two inclusions, Lecture 5)][
+ ($subset.eq$) Take any $z in {x in ZZ : x^2 = 1}$.
  + Then $z in ZZ$ and $z^2 = 1$, so $(z - 1)(z + 1) = 0$ #j[by basic algebra].
  + So $z = 1$ or $z = -1$, i.e. $z in {1, -1}$.
+ ($supset.eq$) Take any $z in {1, -1}$. Then $z in ZZ$ and $z^2 = 1$, so $z in {x in ZZ : x^2 = 1}$.
+ Therefore the sets are equal #j[by definition of set equality, from 1 and 2]. #qed]

#proofb[De Morgan: $overline(A union B) = overline(A) inter overline(B)$ (chain of $<=>$)][
+ Let $z in U$. Then
  + $z in overline(A union B) <=> lnot(z in A union B)$ #j[by definition of complement]
  + $<=> lnot(z in A or z in B)$ #j[by definition of $union$]
  + $<=> z in.not A and z in.not B$ #j[by De Morgan's law for logic]
  + $<=> z in overline(A) and z in overline(B) <=> z in overline(A) inter overline(B)$ #j[by definitions of complement, $inter$]. #qed]

#proofb[$(A inter B) union (A without B) = A$ (algebraic, Lecture 5)][
#dtable(
  $(A inter B) union (A without B) = (A inter B) union (A inter overline(B))$, j[set difference law],
  $= A inter (B union overline(B))$, j[distributive law],
  $= A inter U = A$, j[complement law; identity law]) #qed]

#proofb[$A without (B inter C) = (A without B) union (A without C)$ (algebraic)][
$A without (B inter C) = A inter overline(B inter C)$ #j[set difference] $= A inter (overline(B) union overline(C))$ #j[De Morgan] $= (A inter overline(B)) union (A inter overline(C))$ #j[distributive] $= (A without B) union (A without C)$ #j[set difference ×2]. #qed]

#proofb[For all sets $A, B$: $A subset.eq B <=> PP(A) subset.eq PP(B)$][
+ ($=>$) Suppose $A subset.eq B$. Let $X in PP(A)$; then $X subset.eq A$ #j[definition of power set], so $X subset.eq B$ #j[transitivity of $subset.eq$], so $X in PP(B)$.
+ ($arrow.l.double$) Suppose $PP(A) subset.eq PP(B)$. $A subset.eq A$, so $A in PP(A)$, hence $A in PP(B)$, i.e. $A subset.eq B$ #j[definition of power set]. #qed]

== 18 · Partitions and power sets

#defn[Partition (Lecture 6)][
$cal(C)$ is a *partition* of $A$ iff (1) every element of $cal(C)$ is a *non-empty* subset of $A$, and (2) every element of $A$ lies in *exactly one* element of $cal(C)$: $quad forall x in A thin exists! S in cal(C) thin (x in S)$. The elements of $cal(C)$ are its *components*. (Equivalently: non-empty, mutually disjoint, union is $A$.)]

#defn[Power set · Theorem 6.3.1][
$PP(A)$ is the set of all subsets of $A$. $quad$ If $|A| = n$ then $|PP(A)| = 2^n$. Always $nothing in PP(A)$ and $A in PP(A)$. \
$PP(A) inter PP(B) = PP(A inter B)$, but only $PP(A) union PP(B) subset.eq PP(A union B)$.]

#exam[AY24 Q7 and Q8 · Partitions, power sets][
*Q7.* (i) ${{2,3},{4},{3,2},{1}} = {{2,3},{4},{1}}$ *is* a partition of ${1,2,3,4}$, because repeated elements count once. (ii) ${ZZ}$ *is* a partition of $ZZ$ (one component). (iii) $ZZ$ is *not*: its elements are numbers, not subsets. *C.* \
*Q8.* (i) $|PP(S) without PP(nothing)| = 2^(|S|) - 1$ is true, as $PP(nothing) = {nothing}$. (ii) $|S inter PP(S)| = 0$ is false: $S = {a, {a}}$ gives $S inter PP(S) = {{a}}$. (iii) $|S| dot |PP(S)| = |S times PP(S)|$ is true. *D.*]

#exam[AY25 Q7, Q8 · Counting][
*Q7.* $A, B, C$ pairwise share exactly one element; $D = PP(A) inter PP(B) inter PP(C) = PP(A inter B inter C)$. The triple intersection lies inside each one-element pairwise intersection, so it has 0 or 1 elements: $|D| in {1, 2}$. *B.* \
*Q8.* $|A| = 2|B|$, $|B| = |C| + 2$, and ${B, C, D}$ partitions $A$, so $|A| = |B| + |C| + |D|$: $2|B| = |B| + (|B| - 2) + |D|$, giving $|D| = 2$. *C.*]

#exam[AY24 Q16 (5 marks) · $A = {nothing, x}$][
$PP(A) = {nothing, {nothing}, {x}, {nothing, x}}$ and $PP(nothing) = {nothing}$, $PP(PP(nothing)) = {nothing, {nothing}}$.
- (a) $PP(A) without PP(PP(nothing)) = {{x}, {nothing, x}}$.
- (b) $(PP(A) without PP(nothing)) without {A} = {{nothing}, {x}}$, so its power set is ${nothing, {{nothing}}, {{x}}, {{nothing}, {x}}}$.
- (c) $PP(nothing) times PP(A) = {(nothing, S) : S in PP(A)}$ and $PP(A) times PP(nothing) = {(S, nothing) : S in PP(A)}$ share only $(nothing, nothing)$, so the answer is ${(nothing, {nothing}), (nothing, {x}), (nothing, {nothing, x})}$.]

#exam[AY23 Q6 and Q17 · $A_1 = {nothing}$, $A_2 = {a}$, $A_3 = {a, {a}}$][
*Q6.* Target $nothing union PP(nothing) = {nothing}$. $nothing times {nothing} = nothing$ ✗; $PP(nothing union PP(nothing)) = {nothing, {nothing}}$ ✗; $PP(nothing) without nothing = {nothing}$ ✓; $(nothing inter {nothing}) union (nothing union {nothing}) = {nothing}$ ✓. *D.* \
*Q17.* (a) $(A_1 inter A_2) without A_3 = nothing$. (b) $(A_1 union A_2) without A_3 = {nothing}$. (c) $(A_1 times A_2) union A_3 = {(nothing, a), a, {a}}$. (d) $(A_1 union A_2) times A_3 = {(nothing, a), (nothing, {a}), (a, a), (a, {a})}$.]


=== More model proofs for sets

#proofb[Distributive law $A union (B inter C) = (A union B) inter (A union C)$, by the element method with cases (Epp 6.2)][
+ ($subset.eq$) Let $x in A union (B inter C)$. Then $x in A$ or $x in B inter C$ #j[definition of $union$].
  + *Case $x in A$:* then $x in A union B$ and $x in A union C$ #j[definition of $union$], so $x in (A union B) inter (A union C)$.
  + *Case $x in B inter C$:* then $x in B$ and $x in C$, so again $x in A union B$ and $x in A union C$.
+ ($supset.eq$) Let $x in (A union B) inter (A union C)$, so $x in A union B$ and $x in A union C$.
  + *Case $x in A$:* then $x in A union (B inter C)$.
  + *Case $x in.not A$:* then $x in B$ and $x in C$ #j[as $x in A union B$, $x in A union C$], so $x in B inter C subset.eq A union (B inter C)$.
+ Hence the two sets are equal #j[definition of set equality]. #qed]

#proofb[For all sets $A, B$: $A subset.eq B <-> A union B = B$][
+ ($->$) Suppose $A subset.eq B$. $B subset.eq A union B$ #j[inclusion in union]. Conversely let $x in A union B$: if $x in A$ then $x in B$ #j[as $A subset.eq B$]; if $x in B$, done. So $A union B = B$.
+ ($<-$) Suppose $A union B = B$. Let $x in A$; then $x in A union B$ #j[inclusion in union] $= B$. So $A subset.eq B$. #qed]

#proofb[For every set $A$, $A times nothing = nothing$ (proof by contradiction)][
+ Suppose not: some $z in A times nothing$. Then $z = (a, b)$ with $a in A$ and $b in nothing$ #j[definition of $times$].
+ But $nothing$ has no elements, a contradiction. So $A times nothing$ has no elements: $A times nothing = nothing$. #qed]

#proofb[$A times (B union C) = (A times B) union (A times C)$ (chain of $<->$)][
$(x, y) in A times (B union C) <-> x in A and (y in B or y in C)$ #j[definitions of $times$, $union$] $<-> (x in A and y in B) or (x in A and y in C)$ #j[distributive law of logic] $<-> (x, y) in (A times B) union (A times C)$ #j[definitions of $times$, $union$]. #qed]

#proofb[$(A union B) without C = (A without C) union (B without C)$ (algebraic)][
$(A union B) without C = (A union B) inter overline(C)$ #j[set difference law] $= (A inter overline(C)) union (B inter overline(C))$ #j[distributive, commutative] $= (A without C) union (B without C)$ #j[set difference law]. #qed]

#example[Disproving a set identity (Epp 6.3) · "$(A without B) union (B without C) = A without C$ for all sets"][
*False.* Counterexample: $A = nothing$, $B = {1}$, $C = nothing$. Then $(A without B) union (B without C) = nothing union {1} = {1}$, while $A without C = nothing$. Write out every set and compute both sides.]


#drill[Nested sets and power sets (answers after the arrow)][
#grid(columns: (1fr, 1fr), gutter: 16pt,
[- $|{nothing, {nothing}, {nothing, {nothing}}}|$ $->$ *3*
 - $PP({nothing})$ $->$ ${nothing, {nothing}}$
 - ${nothing} times {nothing}$ $->$ ${(nothing, nothing)}$
 - $nothing times {nothing}$ $->$ $nothing$
 - $PP({a, b}) without {nothing}$ $->$ ${{a}, {b}, {a, b}}$
 - ${1, {1}} inter PP({1})$ $->$ ${{1}}$],
[- $|PP(A times B)|$ with $|A| = 2$, $|B| = 3$ $->$ $2^6 = 64$
 - ${x in ZZ : x^2 < 5}$ $->$ ${-2, -1, 0, 1, 2}$
 - ${2n + 1 : n in {0, 1, 2}}$ $->$ ${1, 3, 5}$
 - ${{1,2},{3}}$ a partition of ${1,2,3}$? $->$ *yes*; ${{1,2},{2,3}}$ $->$ *no* (2 twice); ${{1,2},{3},nothing}$ $->$ *no* ($nothing$ component)
 - $A = {nothing, {nothing}}$: $A inter PP(A)$ $->$ $A$ itself, so $A subset.eq PP(A)$])]


#proofb[The empty set is unique (Corollary 6.2.5)][
+ Suppose $nothing_1$ and $nothing_2$ are both sets with no elements.
+ $nothing_1 subset.eq nothing_2$ and $nothing_2 subset.eq nothing_1$ #j[Theorem 6.2.4, applied to each as "the" empty set].
+ So $nothing_1 = nothing_2$ #j[definition of set equality]. #qed]

#proofb[If $A subset.eq B$ then $A inter C subset.eq B inter C$ and $A union C subset.eq B union C$][
+ Let $x in A inter C$: $x in A$ and $x in C$ #j[definition of $inter$]; $x in B$ #j[as $A subset.eq B$]; so $x in B inter C$.
+ Let $x in A union C$: if $x in A$ then $x in B subset.eq B union C$; if $x in C$ then $x in B union C$ #j[inclusion in union]. #qed]
#text(size: 8.4pt, fill: muted)[*Reading only (Lecture 5.3).* Unrestricted comprehension breaks: Russell's $R = {x : x in.not x}$ gives $R in R <-> R in.not R$; a set of "everything" $cal(D)$ contradicts $|PP(cal(D))| > |cal(D)|$ (Cantor). Zermelo (1908), later Fraenkel and Skolem, fixed this with the ZF axioms. Cantor, Russell, Zermelo and Fraenkel contributed to modern set theory; Gauss did not (AY25 Q1).]

// ============================================================================
= Part V · Relations
// ============================================================================

== 19 · Relations and inverses

#defn[Relation · Domain, co-domain, range][
A (binary) *relation from $A$ to $B$* is a subset $R subset.eq A times B$; $x R y$ ("$x$ is $R$-related to $y$") means $(x, y) in R$, and $x cancel(R) y$ means $(x, y) in.not R$. A *relation on $A$* is a relation from $A$ to $A$, i.e. a subset of $A times A = A^2$ (generally $A^n = A times dots.c times A$). Its *directed graph* draws each element of $A$ once, with an arrow $x -> y$ whenever $x R y$ and a loop at $x$ when $x R x$. \
$D o m(R) = {a in A : a R b "for some" b in B}$, $quad c o D o m(R) = B$, $quad R a n g e(R) = {b in B : a R b "for some" a in A}$. \
An *$n$-ary relation* on $A_1 times dots.c times A_n$ is a subset of it (binary, ternary, quaternary for $n = 2, 3, 4$). Relational databases are built on $n$-ary relations.]

#defn[Inverse relation][
$R^(-1) = {(y, x) in B times A : (x, y) in R}$, i.e. $forall x in A, y in B thin ((y, x) in R^(-1) <-> (x, y) in R)$. Reverse every arrow.]

#exam[AY25 Q9, Q10 · Relations are sets of pairs][
*Q9.* $A = {1,2,3}$, $B = {2, 5}$. $S_2 = PP(A times B)$ is *exactly* the set $S_3$ of relations from $A$ to $B$; $S_1 = PP(A) times PP(B)$ holds *pairs of sets*, a different kind of object. So $S_4 subset.eq S_3 subset.eq S_2$. Answer *A*. \
*Q10.* The relation "$p -> q$" on ${T, F}$ is $R = {(T,T), (F,T), (F,F)}$. $R^(-1) = {(T,T), (T,F), (F,F)}$ is "$q -> p$", the *converse*. The converse is equivalent to the inverse, so the answer key accepted *B or D*.]

== 20 · Composition of relations #text(size: 8pt, fill: muted, weight: "regular")[(lecture-only; not in Epp)]

#defn[Composition (Lecture 6.1.4)][
For $R subset.eq A times B$ and $S subset.eq B times C$, the *composition* $S compose R$ is the relation from $A$ to $C$ with
$ forall x in A, forall z in C thin (x (S compose R) z <-> exists y in B thin (x R y and y S z)). $
$x$ and $z$ are related iff there is a path $x ->^R y ->^S z$. *$S compose R$ applies $R$ first.*]

#thm[Associativity · Inverse of a composition][
$T compose (S compose R) = (T compose S) compose R = T compose S compose R$. $quad (S compose R)^(-1) = R^(-1) compose S^(-1)$ (order reverses). \
Stated without proof in the lecture; the second follows by chasing the definition: $(z, x) in (S compose R)^(-1) <-> exists y (x R y and y S z) <-> exists y (z S^(-1) y and y R^(-1) x)$.]

#tip[Computing $S compose R$ by hand][
For each pair $(x, y) in R$, list every $(y, z) in S$ that *starts where it ends*, and record $(x, z)$. For $R compose R compose R$, compute $R_2 = R compose R$ first, then $R compose R_2$. Stop and re-check pairs that could join through two different middles.]

#exam[AY25 Q17(a) (4 marks) · $S = {(1,3), (3,6), (6,9), (9,12)}$, $R = {(6,6), (9,9)}$][
$R compose S$ (apply $S$ then $R$): $(3,6)(6,6) -> (3,6)$; $(6,9)(9,9) -> (6,9)$. So $R compose S = {(3,6), (6,9)}$. \
$S compose R$ (apply $R$ then $S$): $(6,6)(6,9) -> (6,9)$; $(9,9)(9,12) -> (9,12)$. So $S compose R = {(6,9), (9,12)}$. \
(i) $(R compose S) without (S compose R) = bold({(3, 6)})$. \
(ii) $(R^(-1) compose S^(-1)) compose (S compose R) = (S compose R)^(-1) compose (S compose R)$; with $(S compose R)^(-1) = {(9,6), (12,9)}$ this is $bold({(6,6), (9,9)})$.]

#exam[AY24 Q11, Q17(e), Q12 · Powers and formula relations][
*Q11.* $R = {(a,a), (a,b), (b,c), (c,a), (c,b)}$ on ${a, b, c}$. $R compose R$ is all of $A times A$ except $(b, c)$; then $b R c$ and $c (R compose R) c$ put $(b,c)$ into $R compose R compose R$, which is *$A times A$*. Answer B. \
*Q17(e).* $x R_1 y <-> y = 2x$, $x R_2 y <-> x = y^2$ on $ZZ^+$. $x (R_1 compose R_2) z <-> exists y (x = y^2 and z = 2y)$, so *$x = z^2 slash 4$* (with $z$ even). \
*Q12.* $|R compose R|$ has no fixed relation to $|R|$: on ${a, b}$, $R = {(a,a),(a,b),(b,a)}$ gives $|R compose R| = 4 > 3$; ${(a,a),(a,b)}$ gives $2 = 2$ but $!= 2^2$; ${(a,a)}$ gives $1 = 1^2$. None of (i)–(iii) always holds. Answer *E*.]

#proofb[$(S compose R)^(-1) = R^(-1) compose S^(-1)$ (chain of $<->$)][
For all $z in C$, $x in A$: $(z, x) in (S compose R)^(-1) <-> (x, z) in S compose R$ #j[definition of inverse] $<-> exists y in B thin (x R y and y S z)$ #j[definition of $compose$] $<-> exists y in B thin (z S^(-1) y and y R^(-1) x)$ #j[definition of inverse; commutative law] $<-> (z, x) in R^(-1) compose S^(-1)$ #j[definition of $compose$]. #qed]

#proofb[Composition is associative: $(T compose S) compose R = T compose (S compose R)$][
$x ((T compose S) compose R) w <-> exists y (x R y and exists z (y S z and z T w))$ $<-> exists z exists y (x R y and y S z and z T w)$ #j[$z$ is not free in $x R y$; same-kind quantifiers commute; associative law] $<-> exists z (exists y (x R y and y S z) and z T w)$ #j[$y$ is not free in $z T w$] $<-> exists z (x (S compose R) z and z T w) <-> x (T compose (S compose R)) w$. #qed]

== 21 · Properties of relations on a set $A$

#defn[Reflexive, symmetric, transitive (Lecture 6.2) · Antisymmetric (6.4) · Asymmetric (Tutorial 5)][
#table(columns: (auto, 1fr, 1fr), stroke: none, inset: (x: 3pt, y: 2pt),
  [], [*$R$ has the property iff*], [*$R$ fails it iff*],
  [Reflexive], $forall x in A thin (x R x)$, $exists x in A thin (x cancel(R) x)$,
  [Symmetric], $forall x, y in A thin (x R y -> y R x)$, $exists x, y thin (x R y and y cancel(R) x)$,
  [Transitive], $forall x, y, z in A thin (x R y and y R z -> x R z)$, $exists x, y, z thin (x R y and y R z and x cancel(R) z)$,
  [Antisymmetric], $forall x, y in A thin (x R y and y R x -> x = y)$, $exists x, y thin (x R y and y R x and x != y)$,
  [Asymmetric], $forall x, y in A thin (x R y -> y cancel(R) x)$, $exists x, y thin (x R y and y R x)$,
)]

#thm[Useful facts][
#grid(columns: (1fr, 1fr), gutter: 12pt,
[- $R$ symmetric $<=> R = R^(-1)$ (Tutorial 4).
 - $R$ transitive $<=> R compose R subset.eq R$.
 - $R$ reflexive $=> R subset.eq R compose R$.
 - Asymmetric $=>$ antisymmetric (and irreflexive).
 - *Antisymmetric is not "not symmetric":* any $R subset.eq {(x, x) : x in A}$ is both.],
[- "$=$" is an equivalence relation *and* a partial order (AY23 Q10, AY24 Q9).
 - The empty relation on $A != nothing$ is symmetric, transitive, antisymmetric and asymmetric, but not reflexive.
 - If $R, S$ *both* have the property: reflexivity survives $union, inter, compose$; symmetry survives $union, inter$ but not $compose$; transitivity and antisymmetry survive only $inter$.
 - Write "0 is related to itself", not "0 is reflexive".])]

#tip[Proof skeletons for the properties][
*Reflexive:* "Let $x in A$. … so $x R x$." $quad$ *Symmetric:* "Let $x, y in A$ with $x R y$. … so $y R x$." \
*Transitive:* "Let $x, y, z in A$ with $x R y$ and $y R z$. … so $x R z$." $quad$ *Antisymmetric:* "Let $x R y$ and $y R x$. … so $x = y$." \
*Disproof:* one explicit counterexample, named elements, each membership checked.]

#exam[AY23 Q9 and Q10 · Counterexamples on small sets][
*Q9* ($R$ reflexive, $S$ symmetric). On ${a, b, c}$ take $R = {(a,a),(b,b),(c,c),(a,c)}$, $S = {(a,b),(b,a)}$: $R compose S = {(a,b),(b,a),(b,c)}$ is not symmetric; $R union S$ is not symmetric; $(R compose S)^(-1)$ is not transitive. Only "$R union S$ is reflexive" survives: *A*. \
*Q10.* Asymmetric $=>$ antisymmetric: true. "Not reflexive $=>$ not asymmetric": false ($R = {(a,b)}$). "Not reflexive $=>$ asymmetric": false ($R = {(a, a)}$ on ${a, b}$). "No relation is both an equivalence relation and a partial order": false ($=$). Only (i): *A*.]

#exam[AY24 Q10, AY25 Q11, AY25 Q14][
*AY24 Q10.* $p R q <-> (p -> q)$ on ${T, F}$: $R = {(T,T),(F,F),(F,T)}$ is reflexive, antisymmetric, transitive, not symmetric: *D*. \
*AY25 Q11.* $A R B <-> |A inter B| = 1$ on $PP(ZZ)$: symmetric; not reflexive ($|nothing inter nothing| = 0$); not transitive. *Symmetric but not an equivalence relation.* Answer B. \
*AY25 Q14.* Reflexive $R$ on ${1,2,3,4}$ with $(x R y and x R z) -> y = z$: reflexivity forces $x R x$, so each $x$ is related to *nothing else*. Only the identity relation qualifies, so $|cal(F)| = 1$. Answer B.]

#proofb[$R$ is symmetric $<->$ $R = R^(-1)$ (Tutorial 4)][
+ ($->$) Suppose $R$ symmetric. $(x, y) in R -> (y, x) in R$ #j[symmetry] $-> (x, y) in R^(-1)$ #j[definition of inverse], so $R subset.eq R^(-1)$. Conversely $(x, y) in R^(-1) -> (y, x) in R -> (x, y) in R$ #j[symmetry], so $R^(-1) subset.eq R$.
+ ($<-$) Suppose $R = R^(-1)$ and $x R y$. Then $(y, x) in R^(-1) = R$, i.e. $y R x$. #qed]

#proofb[$R$ is transitive $<->$ $R compose R subset.eq R$ (AY23 Q12 model answer, extended)][
+ ($->$) Let $(x, z) in R compose R$. There is some $y$ with $x R y$ and $y R z$ #j[definition of composition]; so $x R z$ #j[transitivity], i.e. $(x, z) in R$.
+ ($<-$) Let $x R y$ and $y R z$. Then $(x, z) in R compose R$ #j[definition of composition] $subset.eq R$, so $x R z$. #qed
Similarly, *reflexive $=> R subset.eq R compose R$*: given $(x, z) in R$, use $x R x$ and $x R z$ with middle $y = x$.]

== 22 · Closures

#defn[Transitive closure (Lecture 6.2.2); reflexive and symmetric closures][
The *transitive closure* of $R$ on $A$ is the relation $R^t$ such that (1) $R^t$ is transitive, (2) $R subset.eq R^t$, (3) $R^t subset.eq S$ for every transitive $S supset.eq R$. It is the *smallest* transitive relation containing $R$. Likewise the *reflexive closure* $R^r = R union {(x, x) : x in A}$ and the *symmetric closure* $R^s = R union R^(-1)$.]

#tip[Computing $R^t$][
$R^t = R union R^2 union R^3 union dots.c$ where $R^2 = R compose R$; on a finite set stop once a power adds nothing new (at most $|A|$ powers). On the digraph: draw $x -> z$ whenever some path leads from $x$ to $z$. A cycle back to the starting point creates a loop.]

#exam[AY24 Q17(a), (b) (5 marks)][
*(a)* $R = {(a,b), (a,c)}$ on ${a,b,c}$: $|R^r| = 2 + 3 = bold(5)$; $|R^s| = |{(a,b),(a,c),(b,a),(c,a)}| = bold(4)$; $|R^t| = bold(2)$, since no pair ends where another begins, so $R$ is already transitive. \
*(b)* $S = {(a,b),(b,a),(b,d),(d,c),(b,b),(d,d)}$; $T = S^t without S$ consists of the new pairs obtained from paths: $a -> b -> a$ gives $(a,a)$; $a -> b -> d$ gives $(a,d)$; $a -> b -> d -> c$ gives $(a,c)$; $b -> d -> c$ gives $(b,c)$. *$T = {(a,a),(a,c),(a,d),(b,c)}$.*]

== 23 · Equivalence relations

#defn[Relation induced by a partition · Equivalence relation][
Given a partition $cal(C)$ of $A$, the *induced relation* is $x R y <-> x, y$ lie in the same component; it is reflexive, symmetric and transitive (Theorem 8.3.1). \
$R$ on $A$ is an *equivalence relation* iff it is *reflexive, symmetric and transitive*. Notation: $tilde.op$.]

#defn[Equivalence class · Quotient $A slash simq$][
For an equivalence relation $tilde.op$ on $A$ and $a in A$, the *equivalence class* of $a$ (the *class of $a$*) is $[a]_simq = {x in A : a tilde.op x}$; procedurally, $forall x in A thin (x in [a]_simq <-> a tilde.op x)$. \
$A slash simq = {[x]_simq : x in A}$, the set of all equivalence classes, read "the quotient of $A$ by $tilde.op$". Its *elements* are the equivalence classes.]

#defn[Congruence modulo $n$ (Lecture 6.3.4)][
Let $a, b in ZZ$ and $n in ZZ^+$. $a$ is *congruent to $b$ modulo $n$*, written $a equiv b space (mod n)$, iff $a - b = n k$ for some $k in ZZ$; in other words, $n dv (a - b)$. \
E.g. $7 equiv 1 space (mod 2)$; $-3 equiv 12 space (mod 5)$; $-4 equiv.not 5 space (mod 7)$. The classes are $[x] = {x + n k : k in ZZ}$, and $ZZ slash #math.class("normal", math.attach(sym.tilde.op, br: $n$)) = {[0], [1], ..., [n - 1]}$.]

#thm[Lemma Rel.1 · Theorem Rel.2 (Epp 8.3.4)][
For an equivalence relation $tilde.op$ on $A$ and $x, y in A$ the following are equivalent: (i) $x tilde.op y$; (ii) $[x] = [y]$; (iii) $[x] inter [y] != nothing$. \
Hence $A slash simq$ *is a partition of $A$*, and equivalence relations on $A$ correspond one-to-one with partitions of $A$. The number of equivalence relations on an $n$-set is therefore the number of partitions (Bell numbers): $1, 2, 5, 15, 52$ for $n = 1, ..., 5$. For AY25 Q4 the answer is *5* on ${1,2,3}$.]

#proofb[Lemma Rel.1 (Lecture 6)][
+ ((i) $=>$ (ii)) Suppose $x tilde.op y$; then $y tilde.op x$ #j[symmetry].
  + For every $z in [x]$: $x tilde.op z$ #j[definition of $[x]$], so $y tilde.op z$ #j[transitivity, as $y tilde.op x$], so $z in [y]$. Thus $[x] subset.eq [y]$.
  + Symmetrically $[y] subset.eq [x]$, so $[x] = [y]$.
+ ((ii) $=>$ (iii)) Suppose $[x] = [y]$. $x tilde.op x$ #j[reflexivity], so $x in [x] = [x] inter [y]$ #j[idempotent law]; hence $[x] inter [y] != nothing$.
+ ((iii) $=>$ (i)) Take $z in [x] inter [y]$. Then $x tilde.op z$ and $y tilde.op z$ #j[definitions of $[x], [y]$]; so $z tilde.op y$ #j[symmetry] and $x tilde.op y$ #j[transitivity]. #qed]

#proofb[Congruence mod $n$ is an equivalence relation on $ZZ$ ($a equiv b space (mod n) <-> n dv (a - b)$)][
+ (Reflexive) For all $a in ZZ$: $a - a = 0 = n dot 0$, so $a equiv a space (mod n)$ #j[definition of congruence].
+ (Symmetric) Let $a equiv b space (mod n)$: $a - b = n k$ for some $k in ZZ$. Then $b - a = n(-k)$ with $-k in ZZ$ #j[closure], so $b equiv a space (mod n)$.
+ (Transitive) Let $a equiv b$ and $b equiv c space (mod n)$: $a - b = n k$, $b - c = n l$. Then $a - c = n(k + l)$ with $k + l in ZZ$, so $a equiv c space (mod n)$. #qed]

#exam[AY23 Q19 (6 marks) · $a S b <-> exists k in ZZ thin (a - b = k slash 2)$ on $QQ$][
*(a) Prove $S$ transitive* (official model answer):
+ Let $a, b, c in QQ$ such that $a S b$ and $b S c$.
+ There exist $m, n in ZZ$ such that $a - b = m slash 2$ and $b - c = n slash 2$ #j[by definition of $S$].
+ Now $a - c = (a - b) + (b - c) = m slash 2 + n slash 2 = (m + n) slash 2$ #j[by basic algebra].
+ $m + n in ZZ$ #j[by closure of integers under addition].
+ Therefore $a S c$ #j[by definition of $S$]. #qed
*(b)* Two distinct classes: $[0] = {k slash 2 : k in ZZ}$ and $[0.1]$. $quad$ *(c)* $QQ slash S = {[x] : x in QQ and 0 <= x < 1 slash 2}$. Each class has exactly one representative in $[0, 1 slash 2)$, so there are no duplicates.]

#exam[AY25 Q17(c), (d), Q15 · AY24 Q9 · AY23 Q12][
*AY25 Q17(c).* "Same biological father *and* mother": *yes*, an equivalence relation. "Share *a* biological parent": *no*, because it is not transitive (half-siblings). \
*AY25 Q17(d).* $x tilde.op y <-> exists d in ZZ^+ (d dv x and d dv y)$: $d = 1$ always works, so everything is related: $ZZ^+ slash simq = {ZZ^+} = {[1]}$. \
*AY25 Q15.* "$forall x in A thin ([x] subset.eq A slash simq)$" is *false*: classes are *elements* of $A slash simq$, not subsets. "$exists x in A slash simq thin forall y in x thin (y in A)$" and "$|A| = sum_(x in A slash simq) |x|$" are true: *E*. \
*AY24 Q9.* Divisibility on 10 primes is the identity relation: 10 classes *and* 10 minimal elements. Answer *C*. \
*AY23 Q12.* For an equivalence relation $R$, all four hold: $R = R^(-1)$ (symmetry), so $R^(-1) compose R = R compose R^(-1) = R compose R$; $R compose R subset.eq R$ (transitivity: $x R y and y R z => x R z$); $R subset.eq R compose R$ (reflexivity: take the middle $y = x$). Hence $R compose R^(-1) = R$: *D*.]

#proofb[Theorem Rel.2 · If $tilde.op$ is an equivalence relation on $A$, then $A slash simq$ is a partition of $A$ (Lecture 6)][
+ $A slash simq$ is a set #j[by definition].
+ Every element is a non-empty subset of $A$: $[x] = {y in A : x tilde.op y} subset.eq A$, and $x in [x]$ #j[reflexivity].
+ Every $x in A$ is in exactly one class:
  + $x in [x]$, so $x$ is in at least one class.
  + If $x in [y]$ and $x in [z]$, then $[y] inter [z] != nothing$, so $[y] = [z]$ #j[Lemma Rel.1, (iii) $=>$ (ii)]. #qed]

#proofb[Theorem 8.3.1 · The relation induced by a partition $cal(C)$ of $A$ is an equivalence relation][
+ (Reflexive) Let $x in A$. $x$ lies in some component $S$ #j[definition of partition], so $x, x in S$ and $x R x$.
+ (Symmetric) If $x R y$, then $x, y$ lie in one component $S$, so $y, x in S$ and $y R x$.
+ (Transitive) Let $x R y$ and $y R z$: $x, y in S_1$ and $y, z in S_2$ for components $S_1, S_2$. Then $y in S_1 inter S_2$, so $S_1 = S_2$ #j[each element lies in exactly one component], hence $x, z in S_1$ and $x R z$. #qed]

#proofb[Epp 8.3 · On $A = ZZ times (ZZ without {0})$, $(a, b) tilde.op (c, d) <-> a d = b c$ is an equivalence relation][
+ (Reflexive) $a b = b a$ #j[commutativity], so $(a, b) tilde.op (a, b)$.
+ (Symmetric) If $a d = b c$ then $c b = d a$ #j[commutativity], so $(c, d) tilde.op (a, b)$.
+ (Transitive) Let $a d = b c$ and $c f = d e$, with $b, d, f != 0$.
  + Multiply: $a d f = b c f = b d e$, so $d(a f - b e) = 0$ #j[basic algebra].
  + $d != 0$, so $a f = b e$ #j[zero product property], i.e. $(a, b) tilde.op (e, f)$. #qed
Each class is one rational number: $[(1, 2)] = {(1,2), (2,4), (-3,-6), ...}$; $A slash simq$ "is" $QQ$.]

#tip[Writing $A slash simq$ without duplicates][
Pick *one representative per class* from a region that meets every class exactly once, then write ${[x] : x in "that region"}$.
- Congruence mod 3: $ZZ slash #math.class("normal", math.attach(sym.equiv, br: $3$)) = {[0], [1], [2]}$, with $[r] = {3k + r : k in ZZ}$.
- AY23 Q19: $QQ slash S = {[x] : x in QQ and 0 <= x < 1 slash 2}$.
- Lecture Ex. 15: nonempty $A subset.eq {1,2,3}$, related iff they have the same least element: $[{1}] = {{1},{1,2},{1,3},{1,2,3}}$, $[{2}] = {{2},{2,3}}$, $[{3}] = {{3}}$, three classes.]

== 24 · Partial orders

#defn[Partial order (Lecture 6.4.2) · Poset][
$R$ on $A$ is a *partial order* iff it is *reflexive, antisymmetric and transitive*; then $(A, R)$ is a *partially ordered set* (poset). A general partial order is written $pleq$ ("curly less than or equal to"). \
Examples: $<=$ on $RR$; $subset.eq$ on any set of sets; $dv$ on $ZZ^+$. Non-examples: $<$ (not reflexive); congruence mod $n$ (not antisymmetric); $dv$ on $ZZ$ ($2 dv -2$ and $-2 dv 2$, but $2 != -2$).]

#proofb[$dv$ is a partial order on any set $A subset.eq ZZ^+$ (Lecture 6, Ex. 20)][
+ (Reflexive) Let $a in A$. $a = 1 dot a$, so $a dv a$ #j[by definition of divisibility].
+ (Antisymmetric) Let $a, b in A$ with $a dv b$ and $b dv a$. Then $a <= b$ and $b <= a$ #j[by Theorem 4.4.1, as $a, b in ZZ^+$], so $a = b$.
+ (Transitive) Let $a dv b$ and $b dv c$. Then $a dv c$ #j[by Theorem 4.4.3]. #qed]

#grid(columns: (1fr, auto), gutter: 16pt,
  defn[Hasse diagram (Lecture 6.4.3)][
  For a partial order $pleq$ on a finite $A$ and distinct $x, y$: *if $x pleq y$ and no $m in A$ has $x pleq m pleq y$ (with $m != x, y$), draw $x$ below $y$ joined by a line; otherwise no line.* \
  *From the digraph:* place arrows pointing up; delete (1) loops, (2) arrows implied by transitivity, (3) arrowheads. \
  *Reading it:* $x pleq y$ iff you can climb from $x$ to $y$ along lines.],
  align(center + horizon, hasse(
    (($nothing$, 1.5, 0.1), (${1}$, 0.3, 1), (${2}$, 1.5, 1), (${3}$, 2.7, 1),
     (${1,2}$, 0.3, 2), (${1,3}$, 1.5, 2), (${2,3}$, 2.7, 2), (${1,2,3}$, 1.5, 2.9)),
    ((0,1),(0,2),(0,3),(1,4),(1,5),(2,4),(2,6),(3,5),(3,6),(4,7),(5,7),(6,7)),
    w: 3.3cm, h: 3.25cm, u: 1cm, size: 7.5pt)))

#defn[Comparable · Compatible (AY24 paper) · Chain, antichain (AY24 paper) · Total order][
$a, b$ are *comparable* iff $a pleq b$ or $b pleq a$; otherwise *noncomparable*. $quad$ $a, b$ are *compatible* iff $exists c in A thin (a pleq c and b pleq c)$. \
A *chain* is a subset $C$ in which every two elements are comparable; a *maximal chain* $M$ has no $t in.not M$ with $M union {t}$ a chain; the *length* of a chain is one less than its number of elements. An *antichain* is a subset in which no two distinct elements are comparable. \
$pleq$ is a *total (linear) order* iff it is a partial order and $forall x, y in A thin (x pleq y or y pleq x)$; its Hasse diagram is a single chain. $dv$ on $ZZ^+$ is partial, not total ($3 ndv 5$, $5 ndv 3$); $<=$ on $QQ$ is total.]

#defn[Maximal, minimal, largest, smallest (Lecture 6.4.5)][
For a poset $(A, pleq)$ and $c in A$:
#grid(columns: (1fr, 1fr), gutter: 14pt,
[- $c$ *maximal* $<=> forall x in A thin (c pleq x -> c = x)$: nothing lies strictly above $c$. Equivalently, every $x in A$ has $x pleq c$ or is not comparable with $c$.
 - $c$ *minimal* $<=> forall x in A thin (x pleq c -> c = x)$: nothing lies strictly below $c$. Equivalently, every $x in A$ has $c pleq x$ or is not comparable with $c$.],
[- $c$ *largest* $<=> forall x in A thin (x pleq c)$: every element lies below $c$.
 - $c$ *smallest* $<=> forall x in A thin (c pleq x)$: every element lies above $c$.])
Largest = greatest = maximum; smallest = least = minimum. On a Hasse diagram: maximal = no line going up; minimal = no line going down.]

#defn[Well-ordered set (Lecture 6.4.7)][
Let $pleq$ be a total order on a set $A$. $A$ is *well-ordered* iff every non-empty subset of $A$ contains a smallest element. Symbolically,
$ forall S in PP(A) thin (S != nothing -> exists x in S thin forall y in S thin (x pleq y)). $
$(NN, <=)$ is well-ordered. $(ZZ, <=)$ is not: $ZZ$ itself (or $ZZ^-$) is a non-empty subset with no smallest element.]

#thm[Extremal-element facts][
#grid(columns: (1fr, 1fr), gutter: 12pt,
[- Smallest $=>$ minimal; largest $=>$ maximal.
 - A largest (smallest) element, if it exists, is *unique*, and is then the *only* maximal (minimal) element.
 - Conversely, in a *finite* poset a unique maximal element is largest. This fails for infinite posets.
 - A finite non-empty poset has at least one maximal and one minimal element.],
[- Distinct maximal elements are noncomparable (so are distinct minimal ones).
 - An element can be both maximal and minimal: an isolated point.
 - Infinite posets may have none: $(ZZ, <=)$.
 - Every total order on a finite set is well-ordered: a non-empty subset has a minimal element, and in a total order a minimal element is smallest.])]

#proofb[A smallest element is minimal (Lecture 6)][
+ Let $c$ be a smallest element, and take any $x in A$ with $x pleq c$.
+ By smallestness, $c pleq x$ too. So $c = x$ #j[by antisymmetry]. Hence $c$ is minimal. #qed]

#proofb[A largest element is unique][
+ Suppose $c$ and $c'$ are both largest. Then $c' pleq c$ #j[$c$ largest] and $c pleq c'$ #j[$c'$ largest].
+ So $c = c'$ #j[by antisymmetry]. #qed]

#exam[AY23 Q13, Q14 · Facts about partial orders][
(i) "No element is both smallest and largest" is false: $({a}, {(a,a)})$. (ii) "An element can be maximal and minimal but neither largest nor smallest" is true: $({a, b}, {(a,a),(b,b)})$. (iii) "Distinct maximal elements are comparable" is false, as it would contradict maximality. (iv) "There may be no maximal or minimal element" is true: $(ZZ, <=)$. *C*. \
*Q14.* On ${1,2,3}$: $P = {(1,1),(1,2),(2,2)}$ is not reflexive ($(3,3)$ missing); $Q = {(1,1),(1,2),(1,3),(2,2),(3,2),(3,3)}$ *is* a partial order; $R = {(1,1),(1,2),(2,2),(2,3),(3,3),(3,1)}$ is not transitive ($1 R 2$, $2 R 3$, not $1 R 3$), and $R^t = A times A$ is not antisymmetric. Only $Q$: *B*.]

== 25 · Linearization and Kahn's algorithm #text(size: 8pt, fill: muted, weight: "regular")[(lecture-only; Epp calls it topological sorting)]

#defn[Linearization (Lecture 6.4.7)][
A *linearization* of a partial order $pleq$ on $A$ is a *total order* $plin$ on $A$ with $forall x, y in A thin (x pleq y -> x plin y)$. It lists the elements one at a time without breaking any precedence.]

#tip[Kahn's algorithm (1962) · Testing a proposed line-up][
*Kahn:* set $A_0 := A$, $i := 0$; while $A_i != nothing$: pick a *minimal* element $c_i$ of $A_i$, set $A_(i+1) := A_i without {c_i}$, $i := i + 1$. Output $c_0 plin c_1 plin dots.c$. Different choices of minimal element give different linearizations. \
*Test:* a sequence is a linearization iff *for every line of the Hasse diagram, the lower element comes earlier*. A single reversed pair means it is not a linearization.]

#grid(columns: (auto, 1fr), gutter: 16pt,
  align(center + horizon, hasse(
    (([7], 0.2, 0.2), ([2], 1.1, 0.2), ([3], 2.1, 0.2),
     ([28], 0.2, 1.3), ([6], 1.1, 1.3), ([9], 2.1, 1.3),
     ([24], 0.7, 2.4), ([18], 1.7, 2.4)),
    ((0,3), (1,3), (1,4), (2,4), (2,5), (4,6), (4,7), (5,7)),
    w: 2.5cm, h: 2.75cm, u: 1cm, size: 8pt)),
  exam[AY24 Q13–Q15 · $({2,3,6,7,9,18,24,28}, dv)$][
  Covers: $2 dv 6$, $2 dv 28$, $3 dv 6$, $3 dv 9$, $7 dv 28$, $6 dv 18$, $6 dv 24$, $9 dv 18$. \
  *Q13* Longest maximal chains have length 2: ${2,6,18}, {2,6,24}, {3,6,18}, {3,6,24}, {3,9,18}$. There are *5*; answer B. \
  *Q14* ${2,3,28}$ is not an antichain ($2 dv 28$); ${7, 9, 24}$ is; ${6}$ is, vacuously. *D*. \
  *Q15* $2,3,6,7,9,18,24,28$ ✓; $quad 7,3,2,28,9,6,18,24$ ✓; $quad 7,2,3,6,18,9,24,28$ ✗, since $9 dv 18$ but 18 comes first. *B*.])

#exam[AY24 Q17(c), (d) · $(E = {2,4,6,8,10,12}, dv)$][
Covers: $2 dv 4$, $2 dv 6$, $2 dv 10$, $4 dv 8$, $4 dv 12$, $6 dv 12$. *Minimal:* 2. *Maximal:* 8, 10, 12. *Smallest:* 2. *Largest:* none. Two maximal chains of different lengths: ${2, 4, 8}$ (length 2) and ${2, 10}$ (length 1); ${2,4,12}$, ${2,6,12}$ also work for the first.]

#grid(columns: (1fr, auto), gutter: 16pt,
  exam[AY25 Q17(e) · $({{a}, {a,b}, {a,c}, {a,b,c}, {a,b,c,d}, {c,d}}, subset.eq)$][
  Covers: ${a} subset {a,b}, {a,c} subset {a,b,c} subset {a,b,c,d}$, and ${c,d} subset {a,b,c,d}$. *Smallest element:* no, since ${a}$ and ${c, d}$ are both minimal and noncomparable. *Maximal:* yes, ${a,b,c,d}$ (which is also largest).],
  align(center + horizon, hasse(
    (([${a}$], 0.9, 0.2), ([${a,b}$], 0.3, 1.1), ([${a,c}$], 1.5, 1.1),
     ([${a,b,c}$], 0.9, 2.0), ([${a,b,c,d}$], 1.5, 2.9), ([${c,d}$], 2.3, 2.0)),
    ((0,1),(0,2),(1,3),(2,3),(3,4),(5,4)),
    w: 2.8cm, h: 3.15cm, u: 1cm, size: 7.5pt)))

#exam[AY23 Q15, Q18 · $x pleq z <-> F_x = F_z or |F_x| < |F_z|$ on ${11, ..., 16}$, $F_x$ = positive divisors][
Divisor counts: $11 -> 2$, $13 -> 2$, $14 -> 4$, $15 -> 4$, $16 -> 5$, $12 -> 6$. The order compares counts only, so 11, 13 are incomparable, as are 14, 15. *Minimal:* 11, 13. *Smallest:* none. *Maximal:* 12. *Largest:* 12. \
*Q15:* a linearization must list counts in non-decreasing order: $13, 11, 15, 14, 16, 12$ ✓ and $11, 13, 14, 15, 16, 12$ ✓; the other two put 12 too early. *B*.]

#proofb[AY24 Q17(f), (g) · $(a, b) W (c, d) <-> a <= c and b >= d$ on $ZZ times ZZ$][
*(f) "Every two elements are comparable" is false.* Counterexample: $(1,3)$ and $(2,4)$, since neither $1 <= 2 and 3 >= 4$ nor $2 <= 1 and 4 >= 3$ holds. \
*(g) "Every two elements are compatible" is true.*
+ Let $x = (x_1, x_2)$ and $y = (y_1, y_2)$ be arbitrary elements of $ZZ times ZZ$.
+ Let $c = (max(x_1, y_1), min(x_2, y_2)) in ZZ times ZZ$.
+ Then $x_1 <= c_1$, $y_1 <= c_1$ #j[definition of max] and $x_2 >= c_2$, $y_2 >= c_2$ #j[definition of min].
+ So $x W c$ and $y W c$ #j[definition of $W$]: $x$ and $y$ are compatible. #qed]


#block(breakable: false)[#table(columns: (1fr, auto, auto, auto, auto, 1fr), align: (left, center, center, center, center, left),
  [Relation], [Refl.], [Sym.], [Trans.], [Antisym.], [Verdict],
  [$=$ on any set], [✓], [✓], [✓], [✓], [equivalence *and* partial order],
  [$<=$ on $RR$], [✓], [✗], [✓], [✓], [total order],
  [$<$ on $RR$], [✗], [✗], [✓], [✓], [neither (asymmetric)],
  [$dv$ on $ZZ^+$], [✓], [✗], [✓], [✓], [partial order, not total],
  [$dv$ on $ZZ$], [✓], [✗], [✓], [✗], [neither ($2 dv -2 dv 2$)],
  [$equiv space (mod n)$ on $ZZ$], [✓], [✓], [✓], [✗], [equivalence, $n$ classes],
  [$subset.eq$ on $PP(A)$], [✓], [✗], [✓], [✓], [partial order],
  [$|X| = |Y|$ on $PP(A)$], [✓], [✓], [✓], [✗], [equivalence, classes by size],
  [$x y >= 0$ on $ZZ$], [✓], [✓], [✗], [✗], [neither: $-1, 0, 1$],
  [$|x - y| <= 1$ on $ZZ$], [✓], [✓], [✗], [✗], [neither: $0, 1, 2$],
  [$nothing$ on $A != nothing$], [✗], [✓], [✓], [✓], [neither],
  [$A times A$], [✓], [✓], [✓], [✗ if $|A| >= 2$], [equivalence, one class],
)
]

#example[Lecture 6, Ex. 26 · Kahn's algorithm on ${d in ZZ^+ : d dv 30}$][
#table(columns: (auto, auto, auto), stroke: none, inset: (x: 6pt, y: 1.2pt),
  [Step], [Minimal elements of $A_i$], [Choose],
  [$A_0$], [1], [$c_0 = 1$],
  [$A_1$], [2, 3, 5], [$c_1 = 3$],
  [$A_2$], [2, 5], [$c_2 = 2$],
  [$A_3$], [5, 6], [$c_3 = 6$],
  [$A_4$], [5], [$c_4 = 5$],
  [$A_5$], [10, 15], [$c_5 = 15$],
  [$A_6$], [10], [$c_6 = 10$],
  [$A_7$], [30], [$c_7 = 30$],
)
Result: $1 plin 3 plin 2 plin 6 plin 5 plin 15 plin 10 plin 30$. Any other choice at steps 1–3 or 5 gives another valid linearization.]


#example[Lecture 6 · Composition as "going through" a middle set][
"takes" $subset.eq$ Students $times$ Modules and "held in" $subset.eq$ Modules $times$ Venues. Ann takes CS1010, CS1231, MA1101; Bryan takes CS1010, IS1103; Candy takes CS1231, IS1103; Danny takes nothing. CS1010 is held in LT15; CS1231 in ICube and SR1; IS1103 in SR1; CS2100 in LT15; MA1101 nowhere. \
"held in $compose$ takes" = "goes to": Ann $->$ {LT15, ICube, SR1}; Bryan $->$ {LT15, SR1}; Candy $->$ {ICube, SR1}; Danny $->$ nothing. CS2100 contributes no pair, since nobody takes it.]

#thm[Closure facts][
The transitive closure of a *symmetric* relation is symmetric, and of a *reflexive* relation is reflexive (reverse or extend the paths). Hence the *smallest equivalence relation containing $R$* is $(R union R^(-1) union {(x, x) : x in A})^t$. Its classes are the connected components of the digraph of $R$ when arrow directions are ignored.]

// ============================================================================
= Part VI · Practice with Model Solutions
// ============================================================================

#text(size: 8.4pt, fill: muted)[New problems in the style of Part B. Attempt each one before reading the solution, and compare the justifications line by line.]

#prob[1 · Logic laws][Without a truth table, show $(p -> q) and (p -> lnot q) equiv lnot p$.]
#proofb[Solution][
$(p -> q) and (p -> lnot q) equiv (lnot p or q) and (lnot p or lnot q)$ #j[implication law ×2] $equiv lnot p or (q and lnot q)$ #j[distributive law] $equiv lnot p or bold(c)$ #j[negation law] $equiv lnot p$ #j[identity law]. #qed]

#prob[2 · Validity][Decide validity: (a) $p -> q$, $q -> r$, $lnot r$ $therefore lnot p$. $quad$ (b) $p -> q$, $lnot p$ $therefore lnot q$.]
#proofb[Solution][
(a) *Valid:* $p -> r$ #j[transitivity]; with $lnot r$, $lnot p$ #j[modus tollens]. \
(b) *Invalid* (inverse error): the critical row $p = F$, $q = T$ makes both premises true and the conclusion $lnot q$ false.]

#prob[3 · Nested quantifiers][Decide and justify: (a) $forall x in ZZ thin exists y in ZZ thin (y > x^2)$; $quad$ (b) $exists y in ZZ thin forall x in ZZ thin (y > x^2)$.]
#proofb[Solution][
(a) *True.* Let $x in ZZ$ be arbitrary; take $y = x^2 + 1 in ZZ$ #j[closure]; then $y > x^2$. \
(b) *False.* Its negation $forall y in ZZ thin exists x in ZZ thin (y <= x^2)$ holds: given $y$, take $x = y$; then $y <= y^2$ for every integer $y$ (if $y <= 0$ then $y <= 0 <= y^2$; if $y >= 1$ then $y^2 = y dot y >= y$).]

#prob[4 · Division into cases][Prove: for every integer $n$, $n^2 + n$ is even.]
#proofb[Solution][
+ Let $n$ be a particular but arbitrarily chosen integer. Then $n$ is even or odd #j[Assumption 1].
  + *Case 1:* $n = 2k$ for some $k in ZZ$. Then $n^2 + n = 4k^2 + 2k = 2(2k^2 + k)$, and $2k^2 + k in ZZ$ #j[closure].
  + *Case 2:* $n = 2k + 1$. Then $n^2 + n = (2k + 1)(2k + 2) = 2(2k + 1)(k + 1)$, and $(2k+1)(k+1) in ZZ$ #j[closure].
+ In both cases $n^2 + n$ is even #j[by definition of even]. #qed]

#prob[5 · Contradiction][Prove: there is no smallest positive rational number.]
#proofb[Solution][
+ Suppose not: let $r$ be the smallest positive rational number.
  + $r = a slash b$ for some integers $a, b$ with $b != 0$ #j[definition of rational]. Then $r slash 2 = a slash (2b)$, where $a, 2b in ZZ$ and $2b != 0$, so $r slash 2$ is rational.
  + $r slash 2 > 0$ and $r slash 2 < r$ #j[as $r > 0$], contradicting the choice of $r$ as the smallest.
+ Hence there is no smallest positive rational number. #qed]

#prob[6 · Contraposition][Prove: for all integers $a, b$, if $a b$ is even then $a$ is even or $b$ is even.]
#proofb[Solution][
+ Contrapositive: for all integers $a, b$, if $a$ is odd and $b$ is odd, then $a b$ is odd.
+ Let $a, b$ be odd: $a = 2r + 1$, $b = 2s + 1$ for some $r, s in ZZ$ #j[definition of odd].
  + $a b = 4 r s + 2r + 2s + 1 = 2(2 r s + r + s) + 1$ #j[basic algebra], with $2 r s + r + s in ZZ$ #j[closure]; so $a b$ is odd.
+ Hence the original statement holds #j[a statement is equivalent to its contrapositive]. #qed]

#prob[7 · Set identity][Prove $A without (B union C) = (A without B) inter (A without C)$.]
#proofb[Solution][
$A without (B union C) = A inter overline(B union C)$ #j[set difference law] $= A inter (overline(B) inter overline(C))$ #j[De Morgan's law] $= (A inter A) inter (overline(B) inter overline(C))$ #j[idempotent law] $= (A inter overline(B)) inter (A inter overline(C))$ #j[associative, commutative laws] $= (A without B) inter (A without C)$ #j[set difference law]. #qed]

#prob[8 · Prove or disprove][(a) $A union (B without C) = (A union B) without C$; $quad$ (b) $PP(A union B) = PP(A) union PP(B)$; $quad$ (c) $A subset.eq C and B subset.eq C -> A union B subset.eq C$.]
#proofb[Solution][
(a) *False:* $A = {1}$, $B = nothing$, $C = {1}$: left side ${1}$, right side $nothing$. \
(b) *False:* $A = {1}$, $B = {2}$: ${1, 2} in PP(A union B)$ but ${1,2} in.not PP(A) union PP(B)$. (Only $supset.eq$ holds.) \
(c) *True:* let $x in A union B$; then $x in A$ or $x in B$ #j[definition of $union$]; in either case $x in C$ #j[as $A subset.eq C$, $B subset.eq C$]. #qed]

#prob[9 · Equivalence relation and quotient][On $ZZ$ let $x R y <-> 3 dv (x^2 - y^2)$. Prove $R$ is an equivalence relation and find $ZZ slash R$.]
#proofb[Solution][
+ (Reflexive) $x^2 - x^2 = 0 = 3 dot 0$, so $x R x$ #j[definition of divisibility].
+ (Symmetric) If $x^2 - y^2 = 3k$ then $y^2 - x^2 = 3(-k)$ with $-k in ZZ$, so $y R x$.
+ (Transitive) If $x^2 - y^2 = 3k$ and $y^2 - z^2 = 3l$, then $x^2 - z^2 = 3(k + l)$, so $x R z$.
+ (Classes) By the QR theorem $x = 3q + r$ with $r in {0,1,2}$; $x^2 = 9q^2 + 6 q r + r^2$, so $x^2 mod 3 = 0$ if $r = 0$ and $1$ if $r = 1, 2$. Hence
  $ZZ slash R = {[0], [1]} = {{3k : k in ZZ}, {n in ZZ : 3 ndv n}}$. #qed]

#prob[10 · Not an equivalence relation][On $ZZ$ let $x R y <-> x y >= 0$. Which properties hold?]
#proofb[Solution][
*Reflexive* ($x^2 >= 0$) and *symmetric* ($x y = y x$). *Not transitive:* $(-1) R 0$ and $0 R 1$ (both products are $0$), but $(-1)(1) = -1 < 0$. So $R$ is not an equivalence relation. (On $ZZ without {0}$ it is an equivalence relation, "has the same sign as", with classes $ZZ^+$ and $ZZ^-$.)]

#prob[11 · Partial order and extremal elements][On $ZZ^+$ let $a pleq b <-> b = a dot 2^k$ for some $k in NN$. Prove $pleq$ is a partial order; find its minimal and maximal elements.]
#proofb[Solution][
+ (Reflexive) $a = a dot 2^0$ and $0 in NN$.
+ (Antisymmetric) If $b = a 2^j$ and $a = b 2^k$, then $a = a 2^(j + k)$, so $2^(j+k) = 1$, $j = k = 0$, and $a = b$.
+ (Transitive) If $b = a 2^j$ and $c = b 2^k$ then $c = a 2^(j + k)$ with $j + k in NN$ #j[closure].
+ (Minimal) $b pleq a$ with $b != a$ means $a = b 2^k$, $k >= 1$, which is possible iff $a$ is even. So the minimal elements are exactly the *odd* numbers.
+ (Maximal) None: $a pleq 2a$ and $2a != a$. Hence no largest or smallest element either. #qed]

#prob[12 · Composition and closure][$A = {1,2,3,4}$, $R = {(1,2),(2,3),(3,4),(4,1)}$. Find $R compose R$, $R^(-1) compose R$ and $|R^t|$.]
#proofb[Solution][
$R compose R = {(1,3),(2,4),(3,1),(4,2)}$ (two steps round the 4-cycle). $R^(-1) compose R = {(1,1),(2,2),(3,3),(4,4)}$: follow an arrow of $R$, then return along the same arrow. From any vertex a path reaches every vertex, itself included, so $R^t = A times A$ and $|R^t| = 16$.]


#grid(columns: (1fr, auto), gutter: 16pt,
  [
    #prob[13 · Hasse diagram and Kahn][For $({1, 2, 3, 4, 6, 12}, dv)$: draw the Hasse diagram; give the minimal, maximal, smallest, largest elements; produce a linearization with Kahn's algorithm.]
    #proofb[Solution][
    Covers: $1 dv 2$, $1 dv 3$, $2 dv 4$, $2 dv 6$, $3 dv 6$, $4 dv 12$, $6 dv 12$ (diagram right). Minimal and smallest: *1*. Maximal and largest: *12*. Kahn: $A_0$ has the single minimal element 1; then 2 and 3 are minimal and we take 2; then 3 and 4, and we take 3; then 4 and 6, and we take 4; then 6; then 12. Linearization: $1 plin 2 plin 3 plin 4 plin 6 plin 12$ (also valid: $1, 3, 2, 6, 4, 12$).]
  ],
  align(center + horizon, hasse(
    (([1], 0.9, 0.2), ([2], 0.35, 1.05), ([3], 1.45, 1.05), ([4], 0.1, 1.9), ([6], 1.0, 1.9), ([12], 0.55, 2.75)),
    ((0,1),(0,2),(1,3),(1,4),(2,4),(3,5),(4,5)),
    w: 1.9cm, h: 2.95cm, u: 1cm, size: 8pt)))

#prob[14 · Power set of a set that contains $nothing$][Let $A = {nothing, {nothing}}$. Find $PP(A)$ and $A inter PP(A)$.]
#proofb[Solution][
$PP(A) = {nothing, {nothing}, {{nothing}}, {nothing, {nothing}}}$, with four subsets since $|A| = 2$. For $A inter PP(A)$ test each element of $A$: $nothing in PP(A)$ (as $nothing subset.eq A$), and ${nothing} in PP(A)$ (as ${nothing} subset.eq A$, since $nothing in A$). So $A inter PP(A) = {nothing, {nothing}} = A$, i.e. $A subset.eq PP(A)$.]


#prob[15 · Classes of a relation on pairs][On $ZZ times ZZ$ let $(a, b) tilde.op (c, d) <-> a + d = b + c$. Show $tilde.op$ is an equivalence relation and describe $(ZZ times ZZ) slash simq$.]
#proofb[Solution][
+ Rewrite: $(a, b) tilde.op (c, d) <-> a - b = c - d$ #j[basic algebra]. Then reflexivity, symmetry and transitivity are those of $=$ on $ZZ$ (e.g. $a - b = c - d$ and $c - d = e - f$ give $a - b = e - f$).
+ So $[(a, b)] = {(c, d) : c - d = a - b}$, a diagonal line of lattice points, and each class contains exactly one point $(k, 0)$ with $k = a - b$.
+ $(ZZ times ZZ) slash simq = {[(k, 0)] : k in ZZ}$, with one class for each integer and no duplicates. #qed]

#prob[16 · All the closures][$A = {1, 2, 3}$, $R = {(1,2), (2,3)}$. Find $R^r$, $R^s$, $R^t$ and the smallest equivalence relation containing $R$.]
#proofb[Solution][
$R^r = {(1,1), (1,2), (2,2), (2,3), (3,3)}$ (5 pairs); $quad R^s = {(1,2), (2,1), (2,3), (3,2)}$ (4); $quad R^t = {(1,2), (2,3), (1,3)}$ (3). \
The smallest equivalence relation containing $R$ is $A times A$ (9 pairs): ignoring directions, 1–2–3 is one connected piece, so there is a single class.]

// ============================================================================
= Part VII · Exam Playbook and Definition Index
// ============================================================================

== 26 · Part A: multiple-choice questions

#tip[Approach][
- *Judge each of (i)–(iv) on its own* and mark T/F in the margin before reading the options. Several options usually differ in only one item. "None of (A)–(D)" has been the correct answer several times (AY23 Q2, AY24 Q12, AY25 Q2).
- *"For all sets / all relations" claims:* look for a counterexample among $nothing$, a singleton, ${a, b}$, the empty relation and the identity relation. One counterexample is enough.
- *Relations on small sets:* draw the digraph. *Posets:* draw the Hasse diagram first, then read off the answers.
- *Nested $nothing$ / power sets:* write each layer out explicitly, especially for $PP$ of a set containing $nothing$.
- *Counting questions:* use the table in §28, or enumerate the $n = 2$ case to test an option.]

#table(columns: (1fr, 1.25fr, auto),
  [#text(fill: rgb("#a23a2a"))[Common error]], [Correct statement], [Paper],
  [$forall x (P and Q)$ read as "all $P$ are $Q$"], [It says *everything* is $P$ and $Q$; "all $P$ are $Q$" is $forall x (P -> Q)$], [AY23 Q2, AY24 Q2],
  [A $forall$-statement needs a non-empty domain], [Over $nothing$ it is vacuously true], [AY23 Q2, AY25 Q2],
  [Swapping $forall$ and $exists$], [$forall x exists y$ lets $y$ depend on $x$; $exists y forall x$ does not], [AY23 Q5],
  [$nothing = {nothing}$, or $PP(nothing) = nothing$], [$PP(nothing) = {nothing}$ has one element], [AY23 Q6, AY24 Q16],
  [$in$ is transitive], [Only $subset.eq$ is: $A in B subset.eq C => A in C$, but $A subset.eq B in C$ gives nothing], [AY23 Q8],
  [A partition may repeat components or be a set of numbers], [Duplicates collapse; components must be non-empty *subsets*], [AY24 Q7],
  [$A times B subset.eq B times C => A subset.eq C$], [Fails when $B = nothing$], [AY24 Q6],
  [$S compose R$ applies $S$ first], [$R$ first: $x R y$, then $y S z$], [AY24 Q17, AY25 Q17],
  [Antisymmetric = not symmetric], [Independent; subsets of the identity are both], [AY23 Q10],
  [Equivalence relations and partial orders are disjoint], [$=$ is both; so is divisibility on primes], [AY23 Q10, AY24 Q9],
  [$[x] subset.eq A slash simq$], [$[x] in A slash simq$ and $[x] subset.eq A$], [AY25 Q15],
  [Maximal = largest], [Largest needs *everything* below it; several maximal elements rule it out], [AY23 Q13, Q18],
  [Distinct maximal elements may be comparable], [Never; that contradicts maximality], [AY23 Q13],
  [Any ordering of the elements is a linearization], [Every Hasse edge must point forward in the line-up], [AY23 Q15, AY24 Q15],
  [$|R compose R|$ relates simply to $|R|$], [It can be larger, equal or smaller], [AY24 Q12],
)

== 27 · Part B: written answers

#grid(columns: (1fr, 1fr), gutter: 14pt,
  tip[Computations][
  - Answer in *set-roster notation* with braces; list every element; working is usually not required.
  - Write *"None"* rather than leaving a blank; a blank is treated as no answer (AY23 Q18, AY24 Q17c).
  - For $A slash simq$, use one representative per class, with *no duplicates* (AY23 Q19c).
  - Keep answers short; *marks may be deducted for excessively long answers.*],
  tip[Proofs][
  - State the goal, then *unpack every definition* you use.
  - One claim per numbered line, each with its justification.
  - For "prove or disprove", *state which first*, then the proof or one explicit counterexample.
  - Finish by restating what was shown.])

== 28 · Counting facts

#block(breakable: false, grid(columns: (1.15fr, 1fr), gutter: 14pt,
  table(columns: (1fr, auto, auto, auto),
    [Relations on an $n$-element set], [General], [$n = 2$], [$n = 3$],
    [all relations], $2^(n^2)$, [16], [512],
    [reflexive], $2^(n^2 - n)$, [4], [64],
    [symmetric], $2^(n(n+1) slash 2)$, [8], [64],
    [reflexive and symmetric], $2^(n(n-1) slash 2)$, [2], [8],
    [antisymmetric], $2^n dot 3^(n(n-1) slash 2)$, [12], [216],
    [asymmetric], $3^(n(n-1) slash 2)$, [3], [27],
    [equivalence relations (Bell)], [$B_n$], [2], [5],
    [partial orders], [—], [3], [19],
    [total orders], $n!$, [2], [6],
  ),
  [
    #text(size: 8.5pt)[*Derivation.* Each of the $n^2$ pairs is either in the relation or not; reflexivity fixes the $n$ diagonal pairs; symmetry decides each unordered pair once; antisymmetry allows 3 of the 4 states of each off-diagonal pair; asymmetry also forbids loops. For $n = 4$ there are 15 equivalence relations, 219 partial orders and 24 total orders. *AY25 Q12:* on ${0, 1}$ there are 2 equivalence relations and 3 partial orders, so $|F| + 1 = |G|$. Answer B.]

    #table(columns: (1fr, auto),
      [Other counts], [Value],
      $|A times B|$, $|A| dot |B|$,
      $|PP(A)|$, $2^(|A|)$,
      [relations from $A$ to $B$], $2^(|A| |B|)$,
      [partitions of an $n$-set], $B_n: 1, 2, 5, 15, 52$,
    )
  ]))


== 29 · Proof skeletons and past-paper locator

#grid(columns: (1fr, 1fr), gutter: 14pt,
  proofb[$forall x in D thin (P(x) -> Q(x))$, direct][
  + Let $x$ be a particular but arbitrarily chosen element of $D$ with $P(x)$.
    + Unpack $P(x)$ #j[by definition of …].
    + Algebra / earlier results #j[by …].
    + Repack as $Q(x)$ #j[by definition of …].
  + Therefore $forall x in D thin (P(x) -> Q(x))$. #qed],
  proofb[By contradiction][
  + Suppose not: $lnot S$ (write the negation out explicitly).
    + Derive consequences, each justified.
    + Reach $R$ and $lnot R$ for some statement $R$.
  + Hence the supposition is false, so $S$. #qed],
  proofb[By contraposition][
  + Contrapositive: $forall x in D thin (lnot Q(x) -> lnot P(x))$.
  + Let $x in D$ be arbitrary with $lnot Q(x)$. … so $lnot P(x)$.
  + Hence the original statement holds #j[equivalent to its contrapositive]. #qed],
  proofb[Division into cases][
  + Let $x$ be arbitrary. Then $x$ satisfies case 1, 2, … #j[Assumption 1 / QR theorem / trichotomy].
    + *Case 1:* … so $Q(x)$.
    + *Case 2:* … so $Q(x)$.
  + In every case $Q(x)$. #qed],
  proofb[Set inclusion $X subset.eq Y$ and equality][
  + ($subset.eq$) Let $z in X$. … so $z in Y$.
  + ($supset.eq$) Let $z in Y$. … so $z in X$.
  + Therefore $X = Y$ #j[definition of set equality]. #qed],
  proofb[$R$ is an equivalence relation / a partial order][
  + (Reflexive) Let $x in A$. … $x R x$.
  + (Symmetric) Let $x R y$. … $y R x$. #h(0.3em) *or* (Antisymmetric) Let $x R y$ and $y R x$. … $x = y$.
  + (Transitive) Let $x R y$ and $y R z$. … $x R z$.
  + Therefore $R$ is an equivalence relation / a partial order. #qed],
)

#table(columns: (auto, 1fr), align: (left, left),
  [Past-paper question], [Solved in],
  [AY23 Q2, Q4, Q5, Q16], [§6, §4, §7, §7],
  [AY23 Q3, Q6, Q7, Q8, Q17], [§2, §18, §16, §14, §18],
  [AY23 Q9, Q10, Q12, Q13, Q14, Q15, Q18, Q19], [§21, §21, §23, §24, §24, §25, §25, §23],
  [AY24 Q2, Q3, Q4, Q5], [§5, §2, §2, §4],
  [AY24 Q6, Q7, Q8, Q16], [§15, §18, §18, §18],
  [AY24 Q9, Q10, Q11, Q12, Q13–15, Q17], [§23, §21, §20, §20, §25, §20–§25],
  [AY25 Q1, Q2, Q4, Q6, Q7, Q8, Q9, Q10, Q12], [§18, §6, §23, §8, §18, §18, §19, §19, §28],
  [AY25 Q11, Q13, Q14, Q15, Q16, Q17], [§21, §4, §21, §23, §4; Q17(a)–(e): §20, §13, §23, §23, §25],
)

== 30 · Self-test: true or false?

#text(size: 8.4pt, fill: muted)[Decide each statement before reading the reason.]
#table(columns: (1fr, auto, 1.15fr),
  [Statement], [], [Reason],
  $lnot(p <-> q) equiv lnot p <-> q$, [*T*], [both are true exactly when $p, q$ differ],
  $(p or q) -> r equiv (p -> r) or (q -> r)$, [*F*], [it is $and$; $p = T, q = F, r = F$ separates them],
  $exists y in ZZ thin forall x in ZZ thin (x < y)$, [*F*], [take $x = y$],
  $exists x in nothing thin P(x)$, [*F*], [no witness exists; $forall x in nothing thin P(x)$ is *T*],
  [$nothing in {nothing}$ and $nothing subset.eq {nothing}$], [*T*], [listed element; Theorem 6.2.4],
  ${nothing} subset.eq nothing$, [*F*], [$nothing in {nothing}$ but $nothing in.not nothing$],
  $PP(A inter B) = PP(A) inter PP(B)$, [*T*], [$X subset.eq A inter B <-> X subset.eq A and X subset.eq B$],
  [$A times B = B times A => A = B$], [*F*], [$A = nothing$, $B = {1}$: both products are $nothing$],
  [a partition of a finite $A$ has at most $|A|$ components], [*T*], [components are non-empty and disjoint],
  [symmetric and transitive $=>$ reflexive], [*F*], [the empty relation on ${a}$],
  [$R compose R^(-1)$ is always symmetric], [*T*], [$(R compose R^(-1))^(-1) = (R^(-1))^(-1) compose R^(-1)$],
  [the inverse of a partial order is a partial order], [*T*], [each property survives reversing pairs],
  [the union of two equivalence relations is one], [*F*], [$1 tilde 2$ and $2 tilde 3$ from different relations],
  [the intersection of two equivalence relations is one], [*T*], [each property is preserved by $inter$],
  [a unique minimal element is smallest, in any poset], [*F*], [true only for finite posets (§24)],
  [$(ZZ^+, dv)$ has a smallest element], [*T*], [$1 dv n$ for all $n$],
  [there are 4 relations on a one-element set], [*F*], [$2^(1^2) = 2$: $nothing$ and ${(a, a)}$],
  [$a dv b and a dv c => a dv (b - c)$], [*T*], [$b - c = a(r - s)$],
)

== 31 · Symbol table

#table(columns: (auto, 1fr, auto, 1fr, auto, 1fr), align: (center, left, center, left, center, left),
  [Symbol], [Read as], [Symbol], [Read as], [Symbol], [Read as],
  $lnot p$, [not $p$], $p and q$, [$p$ and $q$], $p or q$, [$p$ or $q$],
  $p -> q$, [if $p$ then $q$], $p <-> q$, [$p$ iff $q$], $p xor q$, [exclusive or],
  $P equiv Q$, [logically equivalent], $therefore$, [therefore], $bold(t), bold(c)$, [tautology, contradiction],
  $forall$, [for all], $exists$, [there exists], $exists!$, [there exists exactly one],
  $x in A$, [$x$ is an element of $A$], $A subset.eq B$, [$A$ is a subset of $B$], $A subset.neq B$, [proper subset],
  $nothing$, [empty set], $|A|$, [cardinality], $PP(A)$, [power set],
  $A times B$, [Cartesian product], $A without B$, [set difference], $overline(A)$, [complement],
  $A xor B$, [symmetric difference], $(a, b)$, [ordered pair], ${x in U : P(x)}$, [set-builder],
  $d dv n$, [$d$ divides $n$], $d ndv n$, [$d$ does not divide $n$], $a equiv b space (mod n)$, [congruent mod $n$],
  $x R y$, [$(x, y) in R$], $R^(-1)$, [inverse relation], $S compose R$, [$R$ then $S$],
  $R^r, R^s, R^t$, [closures], $[x]_simq$, [class of $x$], $A slash simq$, [quotient: set of classes],
  $x pleq y$, [$x$ precedes-or-equals $y$], $x plin y$, [a linearization], $(A, pleq)$, [poset],
  $ZZ^+, ZZ_(>= 0)$, [positive / non-negative integers], $NN$, [${0, 1, 2, ...}$], $n "div" d, n mod d$, [quotient, remainder],
)

#pagebreak()
== 32 · Definition index

#set text(size: 9.3pt)
#columns(2, gutter: 14pt)[
#let e(term, body, where) = block(below: 0.42em)[*#term:* #body #text(fill: muted)[§#where]]
#e[Absolute value][$|x| = x$ if $x >= 0$, $-x$ if $x < 0$.][10]
#e[Antichain][no two distinct elements comparable.][24]
#e[Antisymmetric][$x R y and y R x -> x = y$.][21]
#e[Argument; valid; sound, unsound][premises then conclusion; valid if true premises force a true conclusion; sound if valid with true premises, else unsound.][4]
#e[Asymmetric][$x R y -> y cancel(R) x$.][21]
#e[Biconditional][$p <-> q$: true iff $p, q$ agree.][3]
#e[Cardinality][$|S|$, the number of elements.][13]
#e[Cartesian product][$A times B = {(a, b) : a in A and b in B}$.][15]
#e[Chain; maximal chain; length][pairwise comparable subset; cannot be extended; one less than its size.][24]
#e[Colorful][$n = 3k$ for some $k in ZZ$ (lecture only).][10]
#e[Comparable][$a pleq b$ or $b pleq a$.][24]
#e[Compatible][$exists c thin (a pleq c and b pleq c)$.][24]
#e[Complement][$overline(A) = U without A$.][16]
#e[Composite][$n > 1$, $n = r s$ with $1 < r, s < n$.][10]
#e[Composition][$x (S compose R) z <-> exists y (x R y and y S z)$; $R$ first.][20]
#e[Conditional][$p -> q$, false only for T $->$ F; hypothesis $p$, conclusion $q$.][3]
#e[Congruence][$a equiv b space (mod n) <-> n dv (a - b)$.][23]
#e[Contradiction][statement form false in every row.][1]
#e[Contrapositive / converse / inverse][of $p -> q$: $lnot q -> lnot p$ / $q -> p$ / $lnot p -> lnot q$.][3]
#e[Critical row][truth-table row with all premises true.][4]
#e[Difference][$B without A = {x : x in B and x in.not A}$.][16]
#e[Directed graph][one vertex per element; arrow $x -> y$ iff $x R y$.][19]
#e[Disjoint; mutually disjoint][$A inter B = nothing$; $A_i inter A_j = nothing$ for $i != j$.][16]
#e[div, mod][quotient and remainder of the QR theorem.][10]
#e[Divides][$d dv n <-> exists k in ZZ thin (n = d k)$.][10]
#e[Domain, co-domain, range][first coordinates used; $B$; second coordinates used.][19]
#e[Empty set; singleton][$nothing$, no elements; exactly one element.][14]
#e[Equivalence class][$[a] = {x in A : a tilde.op x}$.][23]
#e[Equivalence relation][reflexive, symmetric and transitive.][23]
#e[Even / odd][$n = 2k$ / $n = 2k + 1$ for some $k in ZZ$.][10]
#e[Existential statement][true iff some element of the domain satisfies it.][5]
#e[Hasse diagram][line $x$ below $y$ iff $x pleq y$ with nothing strictly between.][24]
#e[Induced relation][same component of a partition.][23]
#e[Intersection][$A inter B = {x : x in A and x in B}$.][16]
#e[Interval notation][$(a, b)$, $[a, b]$, $(a, b]$, $[a, b)$, $[a, oo)$, … as subsets of $RR$.][13]
#e[Inverse relation][$R^(-1) = {(y, x) : (x, y) in R}$.][19]
#e[Largest / smallest][$forall x (x pleq c)$ / $forall x (c pleq x)$.][24]
#e[Linearization][total order $plin$ with $x pleq y -> x plin y$.][25]
#e[Logical equivalence][identical truth values in every row.][1]
#e[Lowest terms][$a slash b$ where 1 is the largest common divisor.][10]
#e[Maximal / minimal][$forall x (c pleq x -> c = x)$ / $forall x (x pleq c -> c = x)$.][24]
#e[$n$-ary relation][subset of $A_1 times dots.c times A_n$.][19]
#e[Necessary / sufficient][$r$ necessary for $s$: $s -> r$; sufficient: $r -> s$.][3]
#colbreak()
#e[Negation, conjunction, disjunction][$lnot p$; $p and q$; $p or q$.][1]
#e[Only if][$p$ only if $q$: $p -> q$.][3]
#e[Ordered pair; $n$-tuple][equal iff equal componentwise.][15]
#e[Partial order; poset][reflexive, antisymmetric, transitive; $(A, pleq)$.][24]
#e[Partition; component][non-empty subsets; each element in exactly one; its elements.][18]
#e[Power set][$PP(A)$, the set of all subsets of $A$.][18]
#e[Predicate; domain; truth set][sentence with variables; allowed values; ${x in D : P(x)}$.][5]
#e[Prime][$n > 1$ whose only positive factorizations are $1 dot n$, $n dot 1$.][10]
#e[Proper subset][$A subset.eq B$ and $A != B$.][14]
#e[Quotient $A slash simq$][${[x] : x in A}$.][23]
#e[Rational / irrational][$r = a slash b$ with $a, b in ZZ$, $b != 0$ / not rational.][10]
#e[Reflexive][$forall x (x R x)$.][21]
#e[Reflexive / symmetric closure][$R union {(x, x) : x in A}$ / $R union R^(-1)$.][22]
#e[Relation; relation on $A$][subset of $A times B$; subset of $A times A$.][19]
#e[Replacement notation][${t(x) : x in A}$.][13]
#e[Set-builder notation][${x in U : P(x)}$.][13]
#e[Set equality][$A subset.eq B$ and $B subset.eq A$.][14]
#e[Set-roster notation][elements listed in braces.][13]
#e[Statement; statement form][true or false, not both; built from variables and connectives.][1]
#e[Subset; superset][$forall x (x in A -> x in B)$; $B supset.eq A$.][14]
#e[Syllogism][two premises and a conclusion.][4]
#e[Symmetric][$x R y -> y R x$.][21]
#e[Symmetric difference][$A xor B = (A without B) union (B without A)$.][16]
#e[Tautology][statement form true in every row.][1]
#e[Total order][partial order in which every two elements are comparable.][24]
#e[Transitive][$x R y and y R z -> x R z$.][21]
#e[Transitive closure][smallest transitive relation containing $R$.][22]
#e[Union][$A union B = {x : x in A or x in B}$.][16]
#e[Uniqueness $exists!$][exactly one element satisfies it.][5]
#e[Universal conditional; universal existential; existential universal][$forall x (P -> Q)$; $forall exists$; $exists forall$.][5]
#e[Universal set][$U$, all objects under discussion.][16]
#e[Universal statement][true iff every element of the domain satisfies it.][5]
#e[Vacuous truth][$forall x (P(x) -> Q(x))$ with no $x$ satisfying $P$.][6]
#e[Valid argument form][true premises force a true conclusion.][4, §8]
#e[Well-ordered][total order in which every non-empty subset has a smallest element.][24]
]
