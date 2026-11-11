#import "exam_style.typ": *

// ============================================================================
= Part IX · Counting and Probability
// ============================================================================

== 39 · Sample spaces, the multiplication rule, permutations

#defn[Sample space, event (L10 s8) · Equally likely probability (L10 s9)][
A *sample space* is the set of all possible outcomes of a random process or experiment. An *event* is a subset of a sample space. \
If $S$ is a *finite* sample space in which *all outcomes are equally likely* and $E$ is an event in $S$, then
$ P(E) = (|E|) / (|S|) = "the number of outcomes in" E / "the total number of outcomes in" S. $]

#thm[Theorem 9.1.1 · Number of elements in a list (L10 s12) $quad$ Theorem 9.2.1 · Multiplication rule (L10 s21)][
- If $m <= n$ are integers, there are $n - m + 1$ integers from $m$ to $n$ inclusive.
- If an operation consists of $k$ steps, where step $i$ can be performed in $n_i$ ways *regardless of how the preceding steps were performed*, then the whole operation can be performed in $n_1 n_2 dots.c n_k$ ways.
- *Theorem 5.2.4 (L10 s24).* A finite set $A$ has $|PP(A)| = 2^(|A|)$ subsets: each element is picked or dropped.]

#example[L10 s13, Ex. 1–5 · Lists, possibility trees, the multiplication rule][
- *Multiples of 5 from 100 to 999:* $5 dot 20, dots, 5 dot 199$, so $199 - 20 + 1 = 180$; probability $180 slash 900 = 1 slash 5$.
- *Tournament* (play until one team wins two in a row or three in total): the possibility tree has *10* leaves; 4 of them need five games, so $P = 4 slash 10 = 2 slash 5$ if all are equally likely.
- *PINs* of 4 symbols from 36: $36^4 = 1 thin 679 thin 616$ with repetition; $36 dot 35 dot 34 dot 33 = 1 thin 413 thin 720$ without; $P("no repeat") approx 0.8417$.
- *Officers* (president, treasurer, secretary from Ann, Bob, Cyd, Dan; Ann is not president; Cyd or Dan is secretary). $3 dot 3 dot 2 = 18$ is *wrong*: the number of choices for secretary depends on earlier choices. Reorder the steps: secretary (2 ways), then president (2), then treasurer (2): $2 dot 2 dot 2 = 8$.
- *ICANDOIT* from 26 tiles: without replacement the probability is $0$ (the letter I is needed twice); with replacement it is $(1 slash 26)^8$.]

#defn[Permutation (L10 s32) · $r$-permutation, $P(n, r)$ (L10 s36)][
A *permutation* of a set of objects is an ordering of the objects in a row. An *$r$-permutation* of a set of $n$ elements is an ordered selection of $r$ of its elements; their number is $P(n, r)$.]

#thm[Theorem 9.2.2 · Theorem 9.2.3 (L10 s34, s37) · Circular permutations (T9 Q5)][
- A set with $n >= 1$ elements has $n!$ permutations; $0! = 1$.
- For $1 <= r <= n$: $quad P(n, r) = n(n - 1)(n - 2) dots.c (n - r + 1) = n! / ((n - r)!)$. $quad P(5, 2) = 20$, $P(7, 4) = 840$, $P(5, 5) = 120$.
- $n$ distinct objects can be arranged around a circle in $(n - 1)!$ ways (rotations are the same arrangement).]

#example[L10 Ex. 6 · T9 Q1, Q2, Q5][
- *COMPUTER:* $8! = 40 thin 320$ orderings; with CO kept together in order, treat CO as one unit: $7! = 5040$; probability $7! slash 8! = 1 slash 8$.
- *T9 Q1.* 5-card sequences with at least one picture card (12 picture cards, 40 others): with replacement $52^5 - 40^5 = 277 thin 804 thin 032$; without replacement $P(52, 5) - P(40, 5) = 232 thin 914 thin 240$.
- *T9 Q2 (AY23/24 exam).* Five-digit cheque numbers readable upside down use digits $0, 1, 6, 8, 9$: $5^5$. Those that read the same after rotation (the middle digit is $0, 1$ or $8$; the last two digits are forced): $5 dot 5 dot 3 = 75$. Confusable numbers: $5^5 - 75 = 3050$.
- *T9 Q5.* (a) 8 boys and 4 girls at a round table, no two girls adjacent: seat the boys ($7!$), then put the girls into 4 of the 8 gaps ($P(8, 4)$): $7! dot 1680 = 8 thin 467 thin 200$. (b) 6 people, Eric not next to Freddy: $5! - 2 dot 4! = 72$. (c) $n - 1$ people at $n$ chairs: treat the empty chair as a person: $(n - 1)!$.]

== 40 · Addition, difference, inclusion and exclusion

#thm[Theorems 9.3.1–9.3.3 (L10 s40, s43, s50) · Complement (L10 s48)][
- *Addition rule.* If a finite set $A$ is the union of mutually disjoint subsets $A_1, dots, A_k$, then $|A| = |A_1| + |A_2| + dots.c + |A_k|$.
- *Difference rule.* If $A$ is finite and $B subset.eq A$, then $|A without B| = |A| - |B|$. (Proof: $B$ and $A without B$ are disjoint with union $A$; apply the addition rule.)
- *Inclusion/exclusion.* For finite $A, B, C$: $quad |A union B| = |A| + |B| - |A inter B|$ and
  $ |A union B union C| = |A| + |B| + |C| - |A inter B| - |A inter C| - |B inter C| + |A inter B inter C|. $
- *Complement.* For an event $A$ in a finite sample space $S$: $P(overline(A)) = 1 - P(A)$.]

#example[L10 Ex. 7–9 · T9 Q3][
- *Passwords* of 1 to 3 letters: $26 + 26^2 + 26^3 = 18 thin 278$ (addition rule over the lengths).
- *PINs with a repeated symbol:* $36^4 - 36 dot 35 dot 34 dot 33 = 265 thin 896$; probability $approx 0.158 = 1 - 0.842$.
- *Multiples of 3 or 5 from 1 to 1000:* $333 + 200 - 66 = 467$ (multiples of both are the multiples of 15). *Neither:* $1000 - 467 = 533$, using De Morgan: $overline(A) inter overline(B) = overline(A union B)$.
- *T9 Q3.* Permutations of $1, dots, n$ ($n >= 3$) with 1, 2 or 3 in its correct position: $|P_k| = (n - 1)!$, $|P_i inter P_j| = (n - 2)!$, $|P_1 inter P_2 inter P_3| = (n - 3)!$, so the count is $3(n - 1)! - 3(n - 2)! + (n - 3)! = (3n^2 - 12n + 13)(n - 3)!$.]

#tip["At least one" and "at most"][
"At least one" is usually shortest by the difference rule: total minus "none". "At most one" is "none" plus "exactly one" by the addition rule. Overlapping conditions joined by "or" need inclusion/exclusion. Before multiplying, check that each step's count is independent of earlier choices; if not, reorder the steps or split into cases.]

== 41 · The pigeonhole principle in counting

#thm[Pigeonhole Principle · Generalized PHP and its contrapositive (L10 s55, s62, s65)][
- *PHP.* A function from one finite set to a smaller finite set cannot be one-to-one: at least two elements of the domain have the same image.
- *Generalized PHP.* For $f: X -> Y$ with $|X| = n$, $|Y| = m$ and a positive integer $k$: if $k < n slash m$, then some $y in Y$ is the image of at least $k + 1$ distinct elements of $X$.
- *Contrapositive form.* If for each $y in Y$ the set $f^(-1)({y})$ has at most $k$ elements, then $n <= k m$.
Equivalently: among $n$ pigeons in $m$ holes, some hole holds at least $ceil(n slash m)$ pigeons.]

#tip[Writing a pigeonhole argument][
State (1) what the pigeons are, (2) what the holes are, (3) the rule sending each pigeon to a hole, (4) the two counts, then conclude with the principle by name. For "how many must be drawn to guarantee $dots$", find the *largest* selection that avoids the target and add 1.]

#example[L10 Ex. 10–12 · Decimal expansions (L10 s59–61)][
- 13 people: two share a birth month ($13 > 12$). Singapore: two people have the same number of hairs (5.47 million people, at most 300 001 possible counts).
- *85 people, 26 initials:* $3 < 85 slash 26$, so at least 4 share a last initial. By the contrapositive: if at most 3 shared each initial there would be at most $3 dot 26 = 78$ people.
- *Rational numbers have terminating or repeating decimals.* In the long division of $a$ by $b$ every remainder lies in ${0, dots, b - 1}$ #j[Theorem 4.4.1]. If no remainder is 0, then among $b + 1$ successive remainders two are equal, $r_j = r_k$ with $j < k$ #j[PHP], and the digits repeat from there. $3 slash 14 = 0.2 overline(142857)$: remainders $3, 2, 6, 4, 12, 8, 10, 2, dots$
- *42 students, 12 computers, at most 6 per computer: at least 5 computers are used by 3 or more students.* Let $k$ be the number of such computers. They serve at most $6k$ students; the other $12 - k$ serve at most $2(12 - k)$. So $42 <= 6k + 24 - 2k = 4k + 24$, giving $k >= 4.5$, hence $k >= 5$.]

#proofb[T9 Q8 (AY21/22 exam) · Among any 5 distinct non-negative integers, two differ by a multiple of 4 $quad$ T9 Q9 · Chess master][
*Q8.*
+ Let the pigeonholes be the classes $[0], [1], [2], [3]$ of congruence mod 4, and send each of the 5 integers to its class.
+ Two of the integers, $x$ and $y$, lie in the same class $[i]$ #j[PHP: $5 > 4$]. So $x = 4k + i$ and $y = 4l + i$ for some $k, l in ZZ$.
+ Then $x - y = 4(k - l)$ with $k - l in ZZ$ #j[closure], so $4 dv (x - y)$. #qed
*Q9.* 77 days, at least one game a day, at most 12 a week. Let $P_i$ be the number of games played up to day $i$: $1 <= P_1 < P_2 < dots.c < P_77 <= 132$. Let $Q_i = P_i + 21 <= 153$. The 154 numbers $P_1, dots, P_77, Q_1, dots, Q_77$ take values in ${1, dots, 153}$, so two are equal #j[PHP]. The $P_i$ are distinct and so are the $Q_i$, hence $P_j = Q_i = P_i + 21$ for some $i, j$: exactly 21 games were played on days $i + 1$ to $j$. #qed]

#exam[T10 Q10 · T10 Q12 · AY25 final Q24(f)][
*T10 Q10.* At a party of $n >= 2$ people where the host shakes hands with everyone, two people shook the same number of hands: every degree lies in ${1, dots, n - 1}$ (each person shook the host's hand), so $n$ people share $n - 1$ possible values #j[PHP]. \
*T10 Q12.* Any simple graph $G$ on 6 vertices, or its complement, contains a triangle. Colour the edges of $K_6$ black (in $G$) or red (in $overline(G)$). Fix a vertex $v$: of its 5 edges, at least 3 have one colour #j[generalized PHP, $2 < 5 slash 2$], say red, to $u_1, u_2, u_3$. If some edge ${u_x, u_y}$ is red, then $v, u_x, u_y$ form a red triangle; otherwise $u_1, u_2, u_3$ form a black triangle. \
*AY25 Q24(f).* Socks: 8 red, 7 blue, 6 green, 5 black, 4 white. To avoid both "4 of one colour" and "3 each of two colours", take 3 of one colour and 2 of each of the other four: 11 socks. So *12* guarantee one of the two.]

== 42 · Combinations and multisets

#defn[$r$-combination, $binom(n, r)$ (L11 s4) · Multiset (L11 s18)][
For integers $0 <= r <= n$, an *$r$-combination* of a set of $n$ elements is a *subset* of $r$ of them. $binom(n, r)$, read "$n$ choose $r$", is the number of $r$-combinations (also written $C(n, r)$, $""_n C_r$). \
An *$r$-combination with repetition allowed*, or *multiset of size $r$*, chosen from a set $X$ of $n$ elements is an unordered selection of $r$ elements of $X$ with repetition allowed, written $[x_(i_1), x_(i_2), dots, x_(i_r)]$.]

#thm[Theorems 9.5.1, 9.5.2, 9.6.1 (L11 s10, s15, s21)][
- *9.5.1.* $quad binom(n, r) = P(n, r) / r! = n! / (r! (n - r)!)$, because an $r$-permutation is an $r$-subset followed by one of its $r!$ orderings: $P(n, r) = binom(n, r) dot r!$.
- *9.5.2 Permutations with indistinguishable objects.* If $n$ objects consist of $n_1$ of type 1, $dots$, $n_k$ of type $k$, with $n_1 + dots.c + n_k = n$, the number of distinguishable orderings is
  $ binom(n, n_1) binom(n - n_1, n_2) dots.c binom(n - n_1 - dots.c - n_(k-1), n_k) = n! / (n_1 ! thin n_2 ! dots.c n_k !). $
- *9.6.1 Multisets.* The number of multisets of size $r$ from $n$ elements, equivalently the number of ways to select $r$ objects from $n$ categories with repetition, is $binom(r + n - 1, r)$. (Stars and bars: a string of $r$ crosses and $n - 1$ bars.)]

#block(breakable: false)[
#table(columns: (auto, 1fr, 1fr), align: (left, center, center),
  [Choosing $k$ from $n$ (L11 s23)], [Order matters], [Order does not matter],
  [Repetition allowed], $n^k$, $binom(k + n - 1, k)$,
  [Repetition not allowed], $P(n, k) = n! slash (n - k)!$, $binom(n, k) = n! slash (k! (n - k)!)$,
)]

#example[L11 Ex. 1–7][
- *Committees.* 3-person committees from 4 people: $binom(4, 3) = 4$. $P(4, 2) = 12 = binom(4, 2) dot 2!$, so $binom(4, 2) = 6$.
- *Teams of 5 from 5 men and 7 women.* 3 men and 2 women: $binom(5, 3) binom(7, 2) = 10 dot 21 = 210$. At least one man: $binom(12, 5) - binom(7, 5) = 792 - 21 = 771$. At most one man: $binom(7, 5) + binom(5, 1) binom(7, 4) = 21 + 175 = 196$.
- *MISSISSIPPI* (4 S, 4 I, 2 P, 1 M): $binom(11, 4) binom(7, 4) binom(3, 2) binom(1, 1) = 11! / (4! thin 4! thin 2! thin 1!) = 34 thin 650$.
- *Multisets of size 3 from ${1, 2, 3, 4}$:* $binom(3 + 4 - 1, 3) = binom(6, 3) = 20$; e.g. $[1, 3, 4]$ is the string $times | | times | times$.
- *Lunch for 20 guests from 6 stalls:* $binom(20 + 6 - 1, 20) = binom(25, 20) = 53 thin 130$.
- *$x_1 + x_2 + x_3 = 20$:* non-negative integer solutions $binom(22, 20) = 231$. Positive solutions: put $y_i = x_i - 1$, so $y_1 + y_2 + y_3 = 17$: $binom(19, 17) = 171$.]

#exam[T9 Q4, Q6, Q7 · T10 Q2 · AY25 final Q24(a)–(e), (g)][
*T9 Q6.* 5 from 7 men and 6 women with at least 3 men: $binom(7,3) binom(6,2) + binom(7,4) binom(6,1) + binom(7,5) = 525 + 210 + 21 = 756$; probability $756 slash binom(13, 5) = 756 slash 1287 approx 0.5874$. \
*T9 Q7 (AY21/22).* \$50 000 over 4 properties in \$1000 units: $x_1 + dots.c + x_4 = 50$ has $binom(53, 50) = 23 thin 426$ solutions. Not necessarily all invested: add a slack variable $x_5$: $binom(54, 50) = 316 thin 251$. \
*T9 Q4, T10 Q2.* $n$ boxes, white balls in a non-empty consecutive block: $sum_(k=1)^n (n - k + 1) = n(n+1) slash 2$; or choose the two ends of the block among $n + 1$ gaps: $binom(n + 1, 2)$. \
*AY25 Q24.* (a) 3 red, 4 blue, 5 green balls in a row: $12! slash (3! thin 4! thin 5!) = 27 thin 720$. (b) Committee of 5 from 6 men and 5 women with at least 3 women: $binom(5,3) binom(6,2) + binom(5,4) binom(6,1) + binom(5,5) = 150 + 30 + 1 = 181$. (c) 6 distinct letters with exactly 2 vowels: choose the 2 vowel positions, fill them, fill the rest: $binom(6, 2) dot P(5, 2) dot P(21, 4) = 15 dot 20 dot 143 thin 640 = 43 thin 092 thin 000$. (d) $n$ couples at a round table, men and women alternating: $(n - 1)! thin n!$. (e) Every woman next to her husband: seat the $n$ couples as units, then order each couple: $(n - 1)! thin 2^n$. (g) Three distinguishable dice with sum 10: *27*.]

== 43 · Pascal's formula, the binomial theorem, combinatorial proofs

#thm[Theorem 9.7.1 Pascal's formula (L11 s26) · Theorem 9.7.2 Binomial theorem (L11 s34) · Identities (L11 s29–33)][
- *Pascal.* For positive integers $r <= n$: $quad binom(n + 1, r) = binom(n, r - 1) + binom(n, r)$.
- *Binomial theorem.* For real $a, b$ and integer $n >= 0$: $quad (a + b)^n = sum_(k=0)^n binom(n, k) a^(n-k) b^k$. $quad binom(n, r)$ is a *binomial coefficient*.
- $binom(n, r) = binom(n, n - r)$; $quad k binom(n, k) = n binom(n - 1, k - 1)$; $quad binom(n, 0) + binom(n, 1) + dots.c + binom(n, n) = 2^n$.]

#defn[Combinatorial proof (L11 s27)][
A *combinatorial proof* uses counting as the basis of the proof. Two kinds: a *bijective proof* (a bijection between two sets shows they have the same size) and a *proof by double counting* (count one set in two ways; the two expressions are equal).]

#proofb[Pascal's formula, algebraic and combinatorial (L11 s28) · Three double-counting proofs (L11 s30–33)][
*Algebraic.* $binom(n, r-1) + binom(n, r) = n! / ((n - r + 1)! (r - 1)!) + n! / ((n - r)! thin r!) = (n! thin r + n! (n - r + 1)) / ((n - r + 1)! thin r!) = ((n + 1)!) / ((n + 1 - r)! thin r!) = binom(n + 1, r)$. \
*Combinatorial.*
+ $binom(n + 1, r)$ counts the $r$-subsets of a set $A$ with $n + 1$ elements. Fix $x in A$.
+ The $r$-subsets containing $x$: choose the other $r - 1$ elements from the remaining $n$: $binom(n, r - 1)$.
+ The $r$-subsets not containing $x$: choose all $r$ from the remaining $n$: $binom(n, r)$.
+ The two cases are disjoint and exhaustive, so $binom(n + 1, r) = binom(n, r - 1) + binom(n, r)$ #j[addition rule]. #qed
*$binom(n, k) = binom(n, n - k)$.* Choosing the $k$ pupils who go is the same as choosing the $n - k$ who stay. \
*$k binom(n, k) = n binom(n - 1, k - 1)$.* Count committees of $k$ from $n$ with a chairperson: choose the committee then the chair, or choose the chair then the other $k - 1$ members. \
*$sum_(k=0)^n binom(n, k) = 2^n$.* Both count the subsets of an $n$-element set: by size on the left, by Theorem 6.3.1 on the right.]

#example[L11 Ex. 12, 13 · T10 Q1][
- $(a + b)^5 = a^5 + 5 a^4 b + 10 a^3 b^2 + 10 a^2 b^3 + 5 a b^4 + b^5$.
- $(x - 4y)^4 = x^4 - 16 x^3 y + 96 x^2 y^2 - 256 x y^3 + 256 y^4$ (substitute $b = -4y$ and keep the sign inside the power).
- $sum_(k=0)^n binom(n, k) 9^k = sum_(k=0)^n binom(n, k) 1^(n-k) 9^k = (1 + 9)^n = 10^n$.
- *T10 Q1.* Term independent of $x$ in $(2x^2 + 1 slash x)^9$: the general term is $binom(9, r) (2x^2)^(9-r) x^(-r) = binom(9, r) 2^(9-r) x^(18 - 3r)$; $18 - 3r = 0$ gives $r = 6$: $binom(9, 6) dot 2^3 = 84 dot 8 = 672$.]

#thm[Counting functions (T9 D3 · T10 D2, D3)][
For finite sets with $|A| = m$ and $|B| = n$:
#table(columns: (1fr, auto, auto, auto),
  [Functions $A -> B$], [Number], [$m = 3, n = 2$], [$m = n = 3$],
  [all functions], $n^m$, [8], [27],
  [injections ($m <= n$)], $P(n, m) = n! slash (n - m)!$, [0], [6],
  [surjections ($m >= n$)], $sum_(i=0)^n (-1)^i binom(n, i) (n - i)^m$, [6], [6],
  [bijections ($m = n$)], $n!$, [0], [6],
)
Surjections from a 5-element set to a 3-element set: $3^5 - 3 dot 2^5 + 3 dot 1^5 = 150$ (inclusion/exclusion on the values missed). *AY25 Q10:* strictly increasing $f: {0, 1} -> {0, 1, 2, 3}$: $binom(4, 2) = 6$; injective $g: {0, 1} -> {0, 1, 2}$: $P(3, 2) = 6$.]

== 44 · Probability axioms and expected value

#defn[Probability axioms (L11 s39) · Expected value (L11 s43)][
Let $S$ be a sample space. A *probability function* $P$ from the set of all events in $S$ to $RR$ satisfies, for all events $A$, $B$:
+ $0 <= P(A) <= 1$; $quad$ 2. $P(nothing) = 0$ and $P(S) = 1$; $quad$ 3. if $A inter B = nothing$, then $P(A union B) = P(A) + P(B)$.
If the possible outcomes of an experiment are real numbers $a_1, dots, a_n$ occurring with probabilities $p_1, dots, p_n$, the *expected value* is
$ sum_(k=1)^n a_k p_k = a_1 p_1 + a_2 p_2 + dots.c + a_n p_n. $]

#thm[Complement · General union (L11 s40–41) · Linearity of expectation (L11 s48)][
- $P(overline(A)) = 1 - P(A)$. $quad$ $P(A union B) = P(A) + P(B) - P(A inter B)$ for *any* events $A$, $B$.
- For random variables $X$, $Y$, *dependent or not*: $E[X + Y] = E[X] + E[Y]$; in general $E[sum_(i=1)^n c_i X_i] = sum_(i=1)^n c_i E[X_i]$.]

#example[L11 s41, Ex. 14–16 · T10 Q3, Q4, D1 · AY25 final Q23][
- *Heart or 7:* $13/52 + 4/52 - 1/52 = 16/52 = 4/13$.
- *Fair die:* $(1 + 2 + dots.c + 6) slash 6 = 3.5$. *Sum of two dice:* $3.5 + 3.5 = 7$ by linearity.
- *Lottery:* 500 000 tickets at \$5; prizes \$1 000 000 (1), \$1000 (10), \$500 (1000), \$10 (10 000). Expected net gain $= (999 thin 995 + 10 dot 995 + 1000 dot 495 + 10 thin 000 dot 5 - 488 thin 989 dot 5) slash 500 thin 000 = -1.78$ dollars.
- *T10 Q3 (AY20/21 S2).* Loaded die: each big number (4, 5, 6) is twice as likely as each small one, so $P(1) = P(2) = P(3) = 1 slash 9$ and $P(4) = P(5) = P(6) = 2 slash 9$. Maximum of two rolls: $P(max = 1, dots, 6) = 1/81, 3/81, 5/81, 16/81, 24/81, 32/81$; expected value $398 slash 81$.
- *T10 Q4.* Two balls from ${1, 2, 2, 8, 8}$: one ball has expectation $(1 + 2 + 2 + 8 + 8) slash 5 = 4.2$, so the sum has expectation $8.4$ by linearity (the draws are dependent; linearity still applies).
- *T10 D1.* 2 bulbs from 8 with 3 defective: $E[X] = 2 dot 3 slash 8 = 0.75$.
- *AY25 Q23.* Sundaes: 20% of customers choose 3 of 10 flavours, 80% choose 2: $0.2 binom(10, 3) + 0.8 binom(10, 2) = 24 + 36 = 60$.]

== 45 · Conditional probability, Bayes' theorem, independence

#defn[Conditional probability (L11 s53) · Independent events (L11 s73) · Pairwise and mutually independent (L11 s79–80)][
For events $A$, $B$ in $S$ with $P(A) != 0$, the *conditional probability of $B$ given $A$* is
$ P(B | A) = P(A inter B) / P(A), quad "so" quad P(A inter B) = P(B | A) dot P(A). $
$A$ and $B$ are *independent* iff $P(A inter B) = P(A) dot P(B)$. \
$A$, $B$, $C$ are *pairwise independent* iff (1) $P(A inter B) = P(A) P(B)$, (2) $P(A inter C) = P(A) P(C)$, (3) $P(B inter C) = P(B) P(C)$; they are *mutually independent* iff also (4) $P(A inter B inter C) = P(A) P(B) P(C)$. Events $A_1, dots, A_n$ are mutually independent iff the probability of the intersection of *any subset* of them is the product of their probabilities.]

#thm[Theorem 9.9.1 · Bayes' theorem (L11 s66)][
Suppose $S$ is the union of mutually disjoint events $B_1, dots, B_n$, and $A$ and all $B_i$ have non-zero probability. Then for $1 <= k <= n$:
$ P(B_k | A) = (P(A | B_k) dot P(B_k)) / (P(A | B_1) dot P(B_1) + P(A | B_2) dot P(B_2) + dots.c + P(A | B_n) dot P(B_n)). $
The denominator is $P(A)$ (total probability).]

#trap[Conditional probability and independence][
- $P(B | A)$ and $P(A | B)$ are different numbers; Bayes converts one into the other.
- "At least one is a boy" is not "the first is a boy": of $B B, B G, G B, G G$ the condition leaves three outcomes, so $P("both boys" | "at least one boy") = 1 slash 3$.
- Independent is not disjoint: disjoint events with positive probabilities are *dependent*.
- Pairwise independence does not give (4), and (4) does not give pairwise independence. Two fair coins with $A$ = first is heads, $B$ = second is heads, $C$ = both the same: every pair is independent, but $P(A inter B inter C) = 1 slash 4 != 1 slash 8$.]

#example[L11 Ex. 17 · Urn with 5 blue and 7 grey balls, two drawn without replacement][
$P(B_1) = 5/12$, $P(B_2 | B_1) = 4/11$, $P(B_2 | overline(B_1)) = 5/11$. Multiply along the branches of the tree:
$ P(B_1 inter B_2) = 20/132, quad P(B_1 inter overline(B_2)) = 35/132, quad P(overline(B_1) inter B_2) = 35/132, quad P(overline(B_1) inter overline(B_2)) = 42/132. $
- $P(B_2) = 20/132 + 35/132 = 55/132 = 5/12$ #j[axiom 3 on the disjoint cases].
- $P(B_1 union B_2) = 5/12 + 5/12 - 20/132 = 90/132 = 15/22$; so $P("no blue") = 7/22$.
- Expected number of blue balls: $0 dot 42/132 + 1 dot 70/132 + 2 dot 20/132 = 110/132 = 5/6 approx 0.83$.]

#example[Bayes · L11 s63–65, Ex. 18 · T10 Q5 · AY25 final Q24(h)][
- *Two urns* (3 blue, 4 grey; 5 blue, 3 grey), one chosen at random: $P(B) = 3/7 dot 1/2 + 5/8 dot 1/2 = 59/112$ and $P(U_1 | B) = (3 slash 14) slash (59 slash 112) = 24/59 approx 40.7%$.
- *Medical test.* Disease in 5 per 1000; false positive rate 3%; false negative rate 1%. \
  $P("disease" | +) = (0.99 dot 0.005) / (0.99 dot 0.005 + 0.03 dot 0.995) approx 14.2%$. $quad P("no disease" | -) = (0.97 dot 0.995) / (0.01 dot 0.005 + 0.97 dot 0.995) approx 99.995%$.
- *T10 Q5 (AY21/22 S2).* $P(D) = 0.001$, $P(+ | D) = 0.85$, $P(+) = 0.1$. $P(D | +) = (0.85 dot 0.001) slash 0.1 = 0.0085$. False positive: $P(+ | overline(D)) = (P(overline(D) | +) dot P(+)) / P(overline(D)) = (0.9915 dot 0.1) slash 0.999 approx 0.0992$.
- *AY25 Q24(h).* $P(S) = 0.2$, $P(O | S) = 0.5$, $P(O | H) = 0.08$: $P(S | O) = 0.1 slash (0.1 + 0.064) approx 0.61$. $P(U | S) = 0.35$, $P(U | H) = 0.04$: $P(S | U) = 0.07 slash (0.07 + 0.032) approx 0.69$. "Urgent" is the stronger signal.]

#example[Independence · L11 Ex. 19, 20 · T9 D1 · T10 Q6][
- *Loaded coin, $P(H) = 0.6$, two tosses:* $P("two heads") = 0.36$; $P("one head") = 0.6 dot 0.4 + 0.4 dot 0.6 = 0.48$; $P("no heads") = 0.16$; $P("at least one") = 1 - 0.16 = 0.84$.
- *Ten tosses:* $P("eight heads") = binom(10, 8) (0.6)^8 (0.4)^2 approx 0.121$; $P("at least eight") = binom(10, 8) (0.6)^8 (0.4)^2 + binom(10, 9) (0.6)^9 (0.4) + (0.6)^10 approx 0.167$. Probabilities of the form $binom(n, k) p^k (1 - p)^(n-k)$ are *binomial probabilities*.
- *T9 D1.* 3 blue and 7 white balls, two draws with replacement: $P("blue then white") = 0.21$; $P("both white") = 0.49$; $P("second blue") = 0.3$.
- *T10 Q6 (AY15/16).* A random relation on a 4-element set is reflexive with probability $2^12 slash 2^16 = 1 slash 16$ and symmetric with probability $2^10 slash 2^16 = 1 slash 64$. For $|A| = n$: $1 slash 2^n$ and $2^((n^2 + n) slash 2) slash 2^(n^2) = 1 slash 2^((n^2 - n) slash 2)$.
- *Birthday problem (T9 D4):* $P("some shared birthday among" n) = 1 - (365 dot 364 dots.c (365 - n + 1)) slash 365^n$, which first reaches 50% at $n = 23$.]
