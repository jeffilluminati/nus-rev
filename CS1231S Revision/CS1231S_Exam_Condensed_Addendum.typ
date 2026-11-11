// ============================================================================
//  CS1231S Exam Condensed: Addendum
//  Everything in the Exam Condensed that is not in the Midterm Condensed:
//  Lectures 7–13, Tutorials 6–11 and the AY25/26 final.
//  Section numbers match CS1231S_Exam_Condensed.typ.
//  Compile:  typst compile CS1231S_Exam_Condensed_Addendum.typ "CS1231S Exam Condensed Addendum.pdf"
// ============================================================================
#import "exam_style.typ": *
#import "exam_playbook_new.typ": exam-approach, formula-sheet, locator-new, selftest-new, symbols-new, new-theorem-rows
#show: setup.with(
  doc-title: "CS1231S Exam Condensed: Addendum",
  running: [CS1231S · Exam Condensed Addendum],
)

#text(size: 20pt, weight: "bold", fill: accent)[CS1231S · Exam Condensed Addendum]
#v(2pt)
Lectures 7–13, Tutorials 6–11 and the AY25/26 final: functions, induction and recursion, cardinality, counting and probability, graphs and trees. This is the part of the Exam Condensed that the Midterm Condensed does not contain; use it beside a printed Midterm Condensed.

*Numbering:* sections keep their Exam Condensed numbers (§26–52 for content; §56, §58, §60, §62 and §65 for the playbook pieces). A reference to §1–25 points to the same section of the Midterm Condensed. Appendix A is unchanged and is not repeated. *Final exam format (AY25/26):* 2 hours, open book, 100 marks: 23 MCQ (46) + 3 structured questions (54).

*Conventions:* as in the Midterm Condensed. $NN = {0, 1, 2, ...}$. Blue boxes define terms; grey boxes contain proofs and worked examples; green boxes state results; amber boxes solve tutorial and past-paper questions. Theorem labels follow the lecture slides (L = lecture, s = slide).

#include "exam_part6_functions.typ"
#include "exam_part7_induction.typ"
#include "exam_part8_cardinality.typ"
#include "exam_part9_counting.typ"
#include "exam_part10_graphs.typ"

// ============================================================================
= Part XI · Exam Playbook: additions
// ============================================================================

#exam-approach

== 56 · Formula sheet for Lectures 7–13

#formula-sheet

== 58 · Question locators for Tutorials 6–11 and the final

#locator-new

== 60 · Self-test for Lectures 7–13

#selftest-new

== 62 · Symbols for Lectures 7–13

#symbols-new

== 65 · Theorem locator · Lectures 7–13

Theorems are stated with their proofs or definitions in the listed sections. Labels match the slides. *L* = lecture; *s* = slide.
#table(columns: (1.35fr, 1.8fr, auto, auto),
  [Slide label], [Topic], [Source], [Section],
  ..new-theorem-rows,
)
