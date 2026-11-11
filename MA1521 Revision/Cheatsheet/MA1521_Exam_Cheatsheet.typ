// MA1521 Calculus for Computing — Final exam helpsheet (A4, double-sided)
// Scope: Thomas' Calculus 15/e §11.3–11.5, Ch. 13, Ch. 14, weighted like the 28-question sample final.

#let blue = rgb("#00558C")
#let deep = rgb("#003A62")
#let tint = rgb("#EAF2F8")
#let exfill = rgb("#FBF4E8")
#let exink = rgb("#8A4B00")
#let sans = "Helvetica Neue"

#set page(
  paper: "a4",
  margin: (x: 0.55cm, top: 0.55cm, bottom: 0.6cm),
  columns: 3,
  footer: context align(center, text(font: sans, size: 5.5pt, fill: luma(130))[
    MA1521 Final Exam Helpsheet · side #counter(page).display() of 2
  ]),
  footer-descent: 0.25cm,
)
#set columns(gutter: 0.28cm)
#set text(font: "Libertinus Serif", size: 9.7pt, hyphenate: true)
#show math.equation: set text(font: "Libertinus Math")
#set par(leading: 0.55em, spacing: 0.62em, justify: false)
#set list(indent: 0pt, body-indent: 3.5pt, spacing: 0.62em,
  marker: text(fill: blue, size: 5.5pt, baseline: -0.5pt)[▸])

// Upright bold vectors, as in Thomas
#let bu = $upright(bold(u))$
#let bv = $upright(bold(v))$
#let bw = $upright(bold(w))$
#let bi = $upright(bold(i))$
#let bj = $upright(bold(j))$
#let bk = $upright(bold(k))$
#let bn = $upright(bold(n))$
#let br = $upright(bold(r))$
#let ba = $upright(bold(a))$
#let bT = $upright(bold(T))$
#let bU = $upright(bold(U))$
#let bV = $upright(bold(V))$
#let bQ = $upright(bold(Q))$
#let bF = $upright(bold(F))$

#let sec(num, title, body) = block(width: 100%, breakable: true, above: 0.95em, below: 0.4em)[
  #block(width: 100%, fill: blue, inset: (x: 3pt, y: 2.1pt), radius: 1.2pt, below: 3.2pt, sticky: true,
    text(font: sans, weight: "bold", fill: white, size: 8.4pt)[#num#h(4pt)#title])
  #body
]
#let sub(t) = text(font: sans, weight: "bold", fill: blue, size: 7.8pt)[#t]
#let ex(label, body) = block(width: 100%, fill: exfill, inset: (x: 3.2pt, y: 2.8pt),
  radius: 1pt, above: 0.55em, below: 0.55em, breakable: false,
  text(size: 8.2pt)[#text(font: sans, weight: "bold", fill: exink, size: 6.8pt)[#label]#h(3pt)#body])
#let key(body) = block(width: 100%, fill: tint, stroke: (left: 1.3pt + blue),
  inset: (x: 3.5pt, y: 3pt), above: 0.55em, below: 0.55em, breakable: false, body)
#let warn(body) = text(fill: rgb("#B0271F"), weight: "bold")[#body]


// ───────────────────────────────────────────────────────────── title strip ──
#place(top + center, scope: "parent", float: true, clearance: 0.3em,
  block(width: 100%, below: 0pt)[
    #block(width: 100%, fill: deep, inset: (x: 5pt, y: 3.6pt), radius: 1.5pt)[
      #text(font: sans, weight: "bold", fill: white, size: 9.5pt)[MA1521 Final Exam Helpsheet]
      #h(1fr)
      #text(font: sans, fill: rgb("#CFE2F0"), size: 6.4pt)[
        Thomas 15/e §11.3–11.5 · Ch. 13 · Ch. 14 #h(4pt)|#h(4pt) side 1: Q1–17 #h(3pt)·#h(3pt) side 2: Q18–28 #h(4pt)|#h(4pt)
        #box(fill: exfill, inset: (x: 2pt, y: 0.5pt), radius: 1pt)[#text(fill: exink, weight: "bold")[SF]] = sample-final question type]
    ]
  ])

// ═══════════════════════════════════════════════════════════════ SIDE 1 ══

#sec("0", "Single-variable (Q1–3)")[
  - #sub[L'Hôpital.] $0/0$ or $oo/oo$: $lim f/g = lim f'/g'$ — *re-check the form before each use*; repeat if still $0\/0$. $0 dot oo$: write as $f\/(1\/g)$. $1^oo, 0^0, oo^0$: take $ln$ first; $lim (1 + a/x)^(b x) = e^(a b)$.
  - #sub[Maclaurin shortcut] near 0: $e^x = 1 + x + x^2\/2 + dots$, $sin x = x - x^3\/6$, $cos x = 1 - x^2\/2$, $ln(1+x) = x - x^2\/2$.
  #ex("SF Q2")[$lim_(x->2) ((x-2)(ln x - ln 2))/(x^2 - 5x + 6 + 2 ln x - ln 4)$: L'H twice ⇒ $(1\/x + 2\/x^2)/(2 - 2\/x^2) = 1/(3\/2) = 2/3$.]
  - #sub[Improper integrals.] Bad endpoint ⇒ $lim$. $integral_0^1 x^n ln x d x = -1/(n+1)^2$, #h(2pt) $integral_0^1 x^n (ln x)^2 d x = 2/(n+1)^3$, #h(2pt) $integral_0^oo x^n e^(-a x) d x = n!/a^(n+1)$. Boundary terms: $lim_(x -> 0^+) x^a (ln x)^k = 0$ ($a > 0$), by L'Hôpital on $(ln x)^k\/x^(-a)$.
  #ex("SF Q1")[$integral_0^1 x (ln x)^2 d x$: parts twice ($u = (ln x)^2$, then $u = ln x$) ⇒ $[x^2/2 (ln x)^2 - x^2/2 ln x + x^2/4]_(0^+)^1 = 1/4$.]
  - #sub[FTC.] $d/(d x) integral_(a(x))^(b(x)) g(t) d t = g(b(x)) b'(x) - g(a(x)) a'(x)$.
  #ex("SF Q3")[$f = integral_(x-2)^(x^2-7) (d t)/(t^3+3)$: $f'(3) = (2 dot 3)/(2^3+3) - 1/(1^3+3) = 6/11 - 1/4 = 13/44$.]
  - Parts: $integral u d v = u v - integral v d u$ (LIATE). Sub: *change the limits*. $integral ln x = x ln x - x$.
]

#sec("11", "Vectors, lines & planes (Q4)")[
  - $bu dot bv = sum u_i v_i = |bu||bv| cos theta$; $perp <=> bu dot bv = 0$. Angle "$= a pi$": $a = theta\/pi$ ($cos theta = 1/2 => 1/3$; $-1/2 => 2/3$; $sqrt(3)/2 => 1/6$; $sqrt(2)/2 => 1/4$).
  - $"proj"_bv bu = ((bu dot bv)/(|bv|^2)) bv$. #h(3pt) $bu times bv = vec(u_2 v_3 - u_3 v_2, u_3 v_1 - u_1 v_3, u_1 v_2 - u_2 v_1)$ $perp$ both; $|bu times bv|$ = parallelogram area; triangle $= 1/2 |arrow(A B) times arrow(A C)|$; box volume $= |det[bu; bv; bw]|$.
  - *Line* through $P$, $Q$: $br = P + t(Q - P)$. *Plane*, normal $bn = ⟨a,b,c⟩$ through $P_0$: $a x + b y + c z = bn dot P_0$. Three points: $bn = arrow(P Q) times arrow(P R)$.
  - *Line ∩ plane*: substitute $x(t), y(t), z(t)$ into the plane, solve $t$, back-substitute.
  #ex("SF Q4")[$P(3,2,1)$, $Q(0,1,2)$: $(3 - 3t, 2 - t, 1 + t)$ in $2x + 3y + 6z = 14$: $18 - 3t = 14$, $t = 4/3$ ⇒ $(-1, 2/3, 7/3)$.]
  - Distance point–plane: $(|a x_0 + b y_0 + c z_0 - d|)/sqrt(a^2 + b^2 + c^2)$; point–line: $(|arrow(P_0 S) times bv|)/(|bv|)$. Planes parallel $<=>$ normals parallel. Line $parallel$ plane $<=> bv dot bn = 0$.
]

#sec("13.3–13.4", "Partials & chain rule (Q6–7, 9)")[
  - $f_x$: differentiate in $x$, others constant. Clairaut: $f_(x y) = f_(y x)$ — so $f_x = P$, $f_y = Q$ solvable only if $P_y = Q_x$.
  #key[*Rebuild $f$ from $f_x, f_y$*: $f = integral f_x d x + g(y)$; differentiate in $y$, match $f_y$ ⇒ $g'(y)$; fix the constant from the given value.]
  #ex("SF Q6")[$f_x = cos x + 4x^3 y^2$, $f_y = 2x^4 y - sin y$, $f(0,0) = 7$: $f = sin x + x^4 y^2 + g(y)$, $g' = -sin y$ ⇒ $f = sin x + x^4 y^2 + cos y + 6$.]
  - *Chain rule = sum over every path*: $z = z(u,v,w)$, each a function of $(x,y)$: $z_y = z_u u_y + z_v v_y + z_w w_y$. An unknown $v(x,y)$ is fine — only $v_x, v_y$ are needed. Substitute $u, w$ back at the end.
  #ex("SF Q7")[$z = u^2 + 2v + w^2$, $u = 3x y$, $v_y = -2y$, $w = x^2 + x y$: $z_y = 2u(3x) + 2(-2y) + 2w(x) = 2x^3 + 20x^2 y - 4y$.]
  - Along a path: $d/(d t) f(br(t)) = nabla f(br(t)) dot br'(t)$ — *evaluate $nabla f$ at the point $br(t_0)$*.
  #ex("SF Q9")[$nabla P = ⟨y z - 3x^2, x z, x y - 6⟩$, $br = ⟨t^2, t^3, 2t+1⟩$, $t = 1$: point $(1,1,3)$, $nabla P = ⟨0,3,-5⟩$, $br' = ⟨2,3,2⟩$ ⇒ $-1$.]
  - Implicit: $F(x,y,z) = 0 => z_x = -F_x\/F_z$, $z_y = -F_y\/F_z$; $F(x,y) = 0 => y' = -F_x\/F_y$.
]

#sec("13.5–13.6", "Gradient, directional derivative, tangent planes (Q5, 8)")[
  - $D_bu f = nabla f dot bu$ with $bu$ #warn[unit]: divide by $|bv|$ ($⟨3,4⟩ -> 5$, $⟨5,12⟩ -> 13$, $⟨8,15⟩ -> 17$). Max rate $|nabla f|$ along $nabla f$; min $-|nabla f|$; zero $perp nabla f$.
  #ex("SF Q8")[$f = x^2 y - y^2$ at $(3,2)$: $nabla f = ⟨2x y, x^2 - 2y⟩ = ⟨12, 5⟩$; along $⟨8,15⟩\/17$: $(96 + 75)\/17 = 171/17$.]
  - *Tangent plane* to $F(x,y,z) = c$ at $P_0$: normal $nabla F(P_0)$, i.e. $nabla F(P_0) dot (bold(x) - P_0) = 0$. Graph $z = f(x,y)$: $z = f + f_x (x - a) + f_y (y - b)$. Normal line: $P_0 + t nabla F$.
  #key[*Tangent plane parallel to a given plane* with normal $bn$: solve $nabla F = lambda bn$ for $x, y, z$ in terms of $lambda$ (a constant component fixes $lambda$), then use $F = c$ for what remains.]
  #ex("SF Q5")[$3x^2 - 2y + 2z^2 = 4$, plane $6x - y + 2z = 5$: $⟨6x, -2, 4z⟩ = lambda ⟨6,-1,2⟩$ ⇒ $lambda = 2$, $x = 2$, $z = 1$; then $12 - 2y + 2 = 4$ ⇒ $(2,5,1)$.]
  - Linearization $L = f(a,b) + f_x (x-a) + f_y (y-b)$; $d f = f_x d x + f_y d y$.
]

#sec("13.7", "Critical points & D-test (Q10)")[
  Solve $f_x = 0 = f_y$ — *factor and split into cases* (e.g. $6x y = 0 => x = 0$ or $y = 0$), never divide by a variable. At each point $D = f_(x x) f_(y y) - f_(x y)^2$:
  #align(center, table(columns: 4, stroke: 0.4pt + luma(190), inset: (x: 3pt, y: 2pt), align: center + horizon,
    fill: (x, y) => if y == 0 { tint },
    [$D > 0$ \ $f_(x x) < 0$], [$D > 0$ \ $f_(x x) > 0$], [$D < 0$], [$D = 0$],
    [local max], [local min], [saddle], [no info]))
  #ex("SF Q10")[$f = 2x^3 - 6x + 3x y^2$: $f_y = 6x y = 0$. $x = 0 => y = plus.minus sqrt(2)$; $y = 0 => x = plus.minus 1$. $D = 72x^2 - 36y^2$: $(0, plus.minus sqrt(2))$ *saddles*; $(1,0)$ min; $(-1,0)$ max.]
]

#sec("13.8", "Lagrange & closed regions (Q11–12)")[
  - Extremise $f$ on $g = c$: solve #box(stroke: 0.6pt + blue, inset: (x: 2.5pt, y: 1.5pt), outset: (y: 1pt), radius: 1pt)[$nabla f = lambda nabla g, quad g = c$]. Componentwise, $nabla f = lambda nabla g$ reads $f_x = lambda g_x$, $f_y = lambda g_y$ (and $f_z = lambda g_z$) — with $g = c$, these are the "three equations" to write down. Solve by cases, then *evaluate $f$ at every solution*. Two constraints: $nabla f = lambda nabla g + mu nabla h$.
  - Tricks: factor ($2y(3x - lambda) = 0$); eliminate $lambda$ ($nabla f parallel nabla g <=> f_x g_y = f_y g_x$); symmetric ⇒ try $x = y$; for $x^a y^b z^c$ with $x + y + z = S$: $x : y : z = a : b : c$.
  #key[*Max/min on a closed disk or region*: (1) interior critical points; (2) Lagrange (or parametrise) on the boundary; (3) corners if any. Compare *all* the values — the largest wins.]
  #ex("SF Q11–12")[$f = 2x^3 - 6x + 3x y^2$ on $x^2 + y^2 <= 4$. $nabla f = lambda nabla g$: $⟨6x^2 - 6 + 3y^2, 6x y⟩ = lambda ⟨2x, 2y⟩$, with $x^2 + y^2 = 4$. $y = 0$: $f(plus.minus 2, 0) = plus.minus 4$. $lambda = 3x$: $y^2 = 2 = x^2$, $f = plus.minus 4 sqrt(2)$. Interior max $f(-1,0) = 4$ ⇒ max $4 sqrt(2)$.]
  - Shortcuts: max of $a x + b y + c z$ on a sphere radius $R$: $R sqrt(a^2 + b^2 + c^2)$. Closest point of plane $bn dot bold(x) = d$ to $O$: $(d\/|bn|^2) bn$, distance $|d|\/|bn|$.
]

#sec("!", "Answer-format pitfalls")[
  - Fractions in lowest terms; points as $(a,b,c)$; "$a sqrt(b)$ with $b$ smallest"; "in terms of $pi$"; "integer powers of $e$" — expand or factor as asked.
  - "Rewrite, do not compute" ⇒ limits *and* integrand *and* Jacobian, in the requested order of $d u d v$ / $d rho d phi d theta$.
  - Normalise directions. Saddle $<=> D < 0$ (sign of $f_(x x)$ irrelevant). Read "saddle points" vs "max value" carefully.
]

#sec("14.1–14.2", "Double integrals (Q13–15)")[
  - *Fubini*: $integral.double_R f d A = integral_a^b integral_(g_1(x))^(g_2(x)) f d y d x$ (vertical strips) $= integral_c^d integral_(h_1(y))^(h_2(y)) f d x d y$ (horizontal strips). *Outer limits are constants; inner limits depend only on the outer variable.*
  - Rectangle + product: $integral.double g(x) h(y) d A = (integral g d x)(integral h d y)$.
  #key[*Choosing the order*: draw the region and an arrow through it. If the arrow's *entry* or *exit* curve changes along the region, that order needs two integrals — use the other. Lower limit = where the arrow enters, upper = where it leaves.]
  #ex("SF Q14")[Triangle $(1,3), (4,3), (3,4)$: horizontal arrows run from $x = 2y - 5$ to $x = 7 - y$: $integral_3^4 integral_(2y-5)^(7-y) y^2 d x d y = integral_3^4 (12y^2 - 3y^3) d y = 67/4$.]
  #ex("SF Q15")[Between $y = x^2$ and $y = x + 2$: meet at $x = -1, 2$. $integral_(-1)^2 integral_(x^2)^(x+2) x d y d x = integral_(-1)^2 (x^2 + 2x - x^3) d x = 9/4$.]
  - Line through $(x_1,y_1), (x_2,y_2)$: $x = x_1 + (x_2 - x_1)/(y_2 - y_1) (y - y_1)$. Intersections: equate the curves first.
  - *Substitution inside a factor*: $integral_0^a f(k x) d x = 1/k integral_0^(k a) f(u) d u$.
  #ex("SF Q17")[$integral_0^6 f = 18$, $R = [0,3] times [0,2]$: $integral.double f(2x) f(3y) d A = (18/2)(18/3) = 54$.]
  - *Symmetry*: region symmetric in $x$ and integrand odd in $x$ ⇒ $0$; even ⇒ $2 times$ half.
  - Area $= integral.double_R 1 d A$; volume under $z = f >= 0$: $integral.double f d A$; between surfaces: $integral.double (z_"top" - z_"bot") d A$. Average $= 1/"area" integral.double f$. *Centroid*: $overline(x) = 1/A integral.double x d A$ — so $integral.double x d A = overline(x) dot A$ (triangle: centroid = mean of vertices).
]

#sec("14.2", "Reversing the order (Q16)")[
  Inner integrand has no elementary antiderivative ($e^(x^2)$, $sin y\/y$, $1\/sqrt(y^4+1)$, $sqrt(1+y^3)$) ⇒ *reverse*.
  #key[(1) Read the region off the limits: $a <= x <= b$, $g_1(x) <= y <= g_2(x)$. (2) Sketch it; invert the boundary curves ($y = x^(1\/3) <=> x = y^3$). (3) Describe it the other way and rewrite. The new inner integral produces the factor that makes a $u$-substitution work.]
  #ex("SF Q16")[$integral_0^1 integral_(x^(1\/3))^1 (d y d x)/sqrt(y^4+1)$: region $0 <= y <= 1$, $0 <= x <= y^3$ ⇒ $integral_0^1 y^3/sqrt(y^4+1) d y = [1/2 sqrt(y^4+1)]_0^1 = (sqrt(2)-1)/2$.]
  Typical flips: $integral_0^a integral_x^a -> integral_0^a integral_0^y$; #h(2pt) $integral_0^1 integral_(sqrt(x))^1 -> integral_0^1 integral_0^(y^2)$; #h(2pt) $integral_0^(2a) integral_(y\/2)^a -> integral_0^a integral_0^(2x)$.
]

#pagebreak()

// ═══════════════════════════════════════════════════════════════ SIDE 2 ══

#sec("14.4", "Polar coordinates (Q18–19)")[
  $x = r cos theta$, $y = r sin theta$, $x^2 + y^2 = r^2$, #h(2pt) #box(stroke: 0.6pt + blue, inset: (x: 2.5pt, y: 1.5pt), outset: (y: 1pt), radius: 1pt)[$d A = r d r d theta$]. Use for disks, annuli, sectors, integrands in $x^2 + y^2$.
  - Disk radius $a$: $0 <= r <= a$, $0 <= theta <= 2pi$. Line $y = m x$: $theta = arctan m$ ($y = x$: $pi/4$; $y = sqrt(3) x$: $pi/3$).
  - *Circles through $O$*: $x^2 + y^2 = 2a x <=> r = 2a cos theta$, $-pi/2 <= theta <= pi/2$; #h(2pt) $x^2 + y^2 = 2a y <=> r = 2a sin theta$, $0 <= theta <= pi$. ($y = sqrt(2x - x^2)$ is the upper half of $r = 2 cos theta$: $0 <= theta <= pi/2$.)
  - Lines: $x = a <=> r = a sec theta$; $y = b <=> r = b csc theta$.
  #ex("SF Q18")[$R$ under $y = sqrt(2x - x^2)$: $integral.double 1/x d A = integral_0^(pi\/2) integral_0^(2 cos theta) 1/(r cos theta) r d r d theta = integral_0^(pi\/2) 2 d theta = pi$.]
  #ex("SF Q19")[$1/pi integral.double_(r <= 1) (3 + (x^2+y^2)^2) d A = 1/pi dot 2pi integral_0^1 (3 + r^4) r d r = 2 (3/2 + 1/6) = 10/3$.]
  - Area in polar: $integral_alpha^beta 1/2 r(theta)^2 d theta$. #h(2pt) Gaussian: $integral_0^oo e^(-a x^2) d x = 1/2 sqrt(pi\/a)$.
  - $integral_0^(pi\/2) sin^n = integral_0^(pi\/2) cos^n$: $n = 2$: $pi/4$; $3$: $2/3$; $4$: $(3pi)/16$; $5$: $8/15$. Over $[0, pi]$: double the $sin$ values. $sin^2 theta = (1 - cos 2theta)/2$, $cos^2 theta = (1 + cos 2theta)/2$.
]

#sec("14.8", "Change of variables (Q20–22)")[
  $ integral.double_R f(x,y) d x d y &= integral.double_G f(x(u,v), y(u,v)) |J| d u d v, \ J = (partial(x,y))/(partial(u,v)) &= mat(delim: "|", x_u, x_v; y_u, y_v) = x_u y_v - x_v y_u $
  #key[
    *Recipe.* (1) Choose $u, v$ so the boundary curves become $u = "const"$, $v = "const"$ (the region becomes a rectangle).
    (2) Compute the *easy* Jacobian $(partial(u,v))/(partial(x,y)) = mat(delim: "|", u_x, u_y; v_x, v_y)$ and use $J = 1 \/ (partial(u,v))/(partial(x,y))$.
    (3) Write the integrand $times |J|$ in $u, v$ — often the awkward factor cancels. (4) Limits from the boundary curves.
  ]
  #ex("SF Q20")[Lines $y = -x + 5$, $-x + 2$, $2x - 1$, $2x - 4$: $u = x + y in [2,5]$, $v = y - 2x in [-4,-1]$, $(partial(u,v))/(partial(x,y)) = 3$, $x = (u - v)/3$: $integral.double e^x = 1/3 integral_(-4)^(-1) integral_2^5 e^(u\/3) e^(-v\/3) d u d v = 3e(e-1)^2$.]
  #ex("SF Q21")[$u = x^2 + y^2 in [9,16]$, $v = y - 2x in [1,2]$: $(partial(u,v))/(partial(x,y)) = 2x + 4y$, so $(x + 2y)(x^2+y^2) d A = u/2 d u d v$ ⇒ $1/4 (256 - 81) = 175/4$.]
  #ex("SF Q22")[$u = x^2$, $v = y\/x$ ⇒ $x = sqrt(u)$, $y = v sqrt(u)$, $J = 1/2$; $y^2/x e^(x^2) = sqrt(u) v^2 e^u$ ⇒ $integral_1^2 integral_1^3 1/2 u^(1\/2) v^2 e^u d u d v$.]
  - Common choices: $u = x y$, $v = y\/x$ ⇒ $(partial(u,v))/(partial(x,y)) = 2v$ ($x^2 = u\/v$, $y^2 = u v$); #h(2pt) $u = x^2 - y^2$, $v = x y$ ⇒ $2(x^2+y^2)$; #h(2pt) $u = x + y$, $v = x - y$ ⇒ $-2$, so $|J| = 1/2$.
  - Ellipse $x^2/a^2 + y^2/b^2 <= 1$: $x = a r cos theta$, $y = b r sin theta$, $d A = a b r d r d theta$ (area $pi a b$). 3-D: $d V = |(partial(x,y,z))/(partial(u,v,w))| d u d v d w$; ellipsoid volume $4/3 pi a b c$.
]

#sec("14.5–14.6", "Triple integrals (Q23–24)")[
  - $integral.triple_D f d V$: innermost limits may depend on both outer variables, middle on the outermost only. $z$ first: $z_"bot"(x,y) <= z <= z_"top"(x,y)$, then a double integral over the *shadow* in the $x y$-plane.
  #ex("SF Q24")[$integral_0^1 integral_0^x integral_(x^2+y^2)^2 d z d y d x = integral_0^1 integral_0^x (2 - x^2 - y^2) d y d x = integral_0^1 (2x - 4/3 x^3) d x = 2/3$.]
  - Box $[a,b] times [c,d] times [p,q]$ and product integrand ⇒ product of three single integrals.
  - *Symmetry (Q23)*: region symmetric under $x -> -x$ and integrand odd in $x$ ⇒ $0$ (e.g. $x z^2$ on a cube centred at $O$). By symmetry in a ball: $integral.triple x^2 = integral.triple y^2 = integral.triple z^2 = 1/3 integral.triple rho^2$.
  - Volume $= integral.triple 1 d V$; mass $M = integral.triple delta d V$; centre of mass $overline(x) = 1/M integral.triple x delta d V$ (etc.); average $= 1/V integral.triple f$. Tetrahedron with intercepts $a, b, c$: $V = (a b c)/6$, centroid $(a/4, b/4, c/4)$.
]

#sec("14.7", "Cylindrical coordinates (Q25–26)")[
  $(r, theta, z)$: $x = r cos theta$, $y = r sin theta$, $z = z$, #h(2pt) #box(stroke: 0.6pt + blue, inset: (x: 2.5pt, y: 1.5pt), outset: (y: 1pt), radius: 1pt)[$d V = r d z d r d theta$]. Use when the shadow is a disk/annulus or the integrand has $x^2 + y^2$.
  - Cylinder $x^2 + y^2 = a^2$: $r = a$. Cone $z = sqrt(x^2 + y^2)$: $z = r$. Paraboloid $z = x^2 + y^2$: $z = r^2$. Sphere: $z = plus.minus sqrt(a^2 - r^2)$. Plane $z = 6 + x$: $z = 6 + r cos theta$.
  - *$z$ innermost* between the bottom and top surfaces; then $r$, $theta$ over the shadow. $integral_0^(2pi) cos theta d theta = integral_0^(2pi) sin theta d theta = 0$ kills slanted-plane terms.
  #ex("SF Q25")[$1 <= r <= 3$, $0 <= z <= 1$: $integral.triple z^2 r^4 d V = 2pi dot [z^3/3]_0^1 dot [r^6/6]_1^3 = (728 pi)/9$.]
  #ex("SF Q26")[$r <= 3$, $2 <= z <= 6 + r cos theta$: $1/pi integral_0^(2pi) integral_0^3 r^3 (4 + r cos theta) d r d theta = 1/pi dot 81 dot 2pi = 162$.]
  - Volume between $z = r^2$ and a plane/paraboloid: equate to get the shadow radius, integrate (top $-$ bottom) $r d r d theta$.
]

#sec("14.7", "Spherical coordinates (Q27–28)")[
  $rho >= 0$: distance to $O$; $phi in [0, pi]$: angle *down from the $+z$-axis*; $theta$: as in polar.
  $ x = rho sin phi cos theta, quad y = rho sin phi sin theta, \ z = rho cos phi, quad r = rho sin phi $
  #align(center, box(stroke: 0.6pt + blue, inset: (x: 3pt, y: 2pt), radius: 1pt)[$x^2 + y^2 + z^2 = rho^2, quad d V = rho^2 sin phi d rho d phi d theta$])
  #table(columns: (1.05fr, 1fr), stroke: 0.4pt + luma(200), inset: (x: 2.5pt, y: 2pt),
    fill: (x, y) => if y == 0 { tint } else if calc.odd(y) { white } else { luma(248) },
    table.header([*Surface*], [*Spherical form*]),
    [sphere $x^2+y^2+z^2 = a^2$], [$rho = a$],
    [cone $z = sqrt(x^2+y^2)$], [$phi = pi/4$],
    [cone $z = k sqrt(x^2+y^2)$], [$tan phi = 1\/k$ #h(2pt) ($k = sqrt(3)$: $pi/6$; $1/sqrt(3)$: $pi/3$)],
    [plane $z = c$], [$rho = c sec phi$],
    [$x y$-plane / upper half], [$phi = pi/2$ #h(2pt) / #h(2pt) $0 <= phi <= pi/2$],
    [sphere $x^2+y^2+z^2 = 2a z$], [$rho = 2a cos phi$, $0 <= phi <= pi/2$],
    [cylinder $x^2+y^2 = a^2$], [$rho = a csc phi$],
  )
  - Full ball: $0 <= rho <= a$, $0 <= phi <= pi$, $0 <= theta <= 2pi$. First octant: $phi, theta in [0, pi/2]$. $integral_0^pi sin phi d phi = 2$; $integral_0^alpha sin phi d phi = 1 - cos alpha$.
  #ex("SF Q27")[Unit ball: $integral.triple rho^2 d V = 2pi dot 2 dot integral_0^1 rho^4 d rho = (4pi)/5$. In general $integral.triple_(rho <= a) g(rho) d V = 4pi integral_0^a g(rho) rho^2 d rho$.]
  #ex("SF Q28")[$sqrt(x^2+y^2) <= z <= 2$: cone ⇒ $0 <= phi <= pi/4$; plane ⇒ $rho <= 2 sec phi$: $integral_0^(2pi) integral_0^(pi\/4) integral_0^(2 sec phi) (rho cos phi)/((rho^2+2)^2) rho^2 sin phi d rho d phi d theta$.]
  - "Ice-cream cone" (inside $rho = a$, above the cone $phi = alpha$): $V = (2pi a^3)/3 (1 - cos alpha)$. Ball $4/3 pi a^3$; cone $1/3 pi r^2 h$; cylinder $pi r^2 h$.
]

#sec("+", "More worked patterns")[
  #ex("shifted disk")[$integral.double_(x^2+y^2 <= 2y) y d A = integral_0^pi integral_0^(2 sin theta) r^2 sin theta d r d theta = 8/3 integral_0^pi sin^4 theta d theta = pi$ ($= overline(y) dot "area"$).]
  #ex("sector")[$integral_0^2 integral_y^(sqrt(8-y^2)) (d x d y)/(1+x^2+y^2)$: region $0 <= theta <= pi/4$, $r <= 2sqrt(2)$ ⇒ $pi/4 dot 1/2 ln(1 + r^2) |_0^(2sqrt(2)) = pi/4 ln 3$.]
  #ex("triangle sub")[$integral.double e^((y-x)\/(y+x)) d A$ on the triangle $(0,0),(2,0),(0,2)$: $u = y - x$, $v = y + x$, $|J| = 1/2$, region $0 <= v <= 2$, $-v <= u <= v$ ⇒ $1/2 integral_0^2 v(e - e^(-1)) d v = e - 1/e$.]
  #ex("volume")[Between $z = x^2 + y^2$ and $z = 2y$: shadow $r <= 2 sin theta$, $V = integral_0^pi integral_0^(2 sin theta) (2 r sin theta - r^2) r d r d theta = 4/3 integral_0^pi sin^4 theta d theta = pi/2$.]
  #ex("cone")[$sqrt(x^2+y^2) <= z <= 3$: $integral.triple z d V = 2pi integral_0^3 integral_r^3 z r d z d r = pi integral_0^3 (9r - r^3) d r = (81pi)/4$. Or slice: $integral_0^3 z dot pi z^2 d z$.]
  #ex("shifted ball")[$x^2+y^2+z^2 <= 2z$: $rho <= 2 cos phi$, $phi <= pi/2$: $integral.triple rho d V = 2pi integral_0^(pi\/2) 4 cos^4 phi sin phi d phi = (8pi)/5$.]
  #ex("mass")[Solid $x^2 + y^2 <= z <= 4$, $delta = z$: slices are disks of area $pi z$ ⇒ $M = integral_0^4 pi z^2 d z = (64pi)/3$, $overline(z) = 1/M integral_0^4 pi z^3 d z = 3$.]
  #ex("ellipsoid")[$x^2/4 + y^2/9 + z^2 <= 1$, $x = 2u, y = 3v, z = w$: $integral.triple z^2 d V = 6 integral.triple_("ball") w^2 = 6 dot (4pi)/15 = (8pi)/5$.]
]

#sec("!", "Integral pitfalls")[
  - #warn[Forgetting the Jacobian]: $r$ (polar/cylindrical), $rho^2 sin phi$ (spherical), $|J|$ (substitution, *absolute value*).
  - The factor $1\/|u_x v_y - u_y v_x|$ comes out in $x, y$ — rewrite it in $u, v$ (or let it cancel) before integrating.
  - Outer limits must be numbers. After reversing, re-read *both* limits from the sketch.
  - $theta$-range of $r = 2a cos theta$ is $[-pi/2, pi/2]$, not $[0, 2pi]$; first-quadrant part: $[0, pi/2]$.
  - $phi$ is measured from the $z$-axis: the cone $z = r$ is $phi = pi/4$; "above the cone" means $0 <= phi <= pi/4$.
  - $sqrt(x^2+y^2) = r = rho sin phi$, but $sqrt(x^2+y^2+z^2) = rho$. In cylindrical, $x^2+y^2+z^2 = r^2 + z^2$.
  - Use symmetry *before* computing: odd terms vanish, slanted planes contribute only their constant part.
]

#sec("⇢", "Which coordinates? — first move")[
  #set text(size: 7.5pt)
  #table(columns: (1fr, 1.2fr), stroke: 0.4pt + luma(200), inset: (x: 2.5pt, y: 2pt),
    fill: (x, y) => if y == 0 { tint } else if calc.odd(y) { white } else { luma(248) },
    table.header([*You see…*], [*Do this*]),
    [rectangle, polynomial integrand], [iterate directly; product ⇒ split],
    [triangle / region between two curves], [sketch, pick the single-integral order],
    [inner integral impossible], [reverse the order],
    [disk, annulus, $x^2+y^2$, $sqrt(2x - x^2)$], [polar, $d A = r d r d theta$],
    [parallelogram; pairs of curves $g = c_1, c_2$], [$u = g$, $v = h$; inverse Jacobian],
    [box with odd integrand], [symmetry ⇒ $0$],
    [cylinder / paraboloid / $x^2+y^2$ in 3-D], [cylindrical, $z$ innermost],
    [ball, cone, $x^2+y^2+z^2$], [spherical, $rho^2 sin phi$],
  )
]

#sec("∫", "Inner integrals that keep appearing")[
  - $integral r e^(-r^2) d r = -1/2 e^(-r^2)$; #h(2pt) $integral r/(1+r^2) d r = 1/2 ln(1+r^2)$; #h(2pt) $integral r sqrt(a^2 - r^2) d r = -1/3 (a^2 - r^2)^(3\/2)$.
  - $integral cos^n phi sin phi d phi = -(cos^(n+1) phi)/(n+1)$; #h(2pt) $integral sin^3 phi d phi = -cos phi + 1/3 cos^3 phi$; #h(2pt) $integral sec^2 phi d phi = tan phi$; #h(2pt) $integral tan phi d phi = ln|sec phi|$.
  - $integral_0^(2pi) cos^2 theta d theta = integral_0^(2pi) sin^2 theta d theta = pi$; #h(2pt) $integral_0^(2pi) sin theta cos theta d theta = 0$.
  - Sphere of radius $a$ in cylindrical: volume $= 2pi integral_0^a 2 r sqrt(a^2 - r^2) d r = 4/3 pi a^3$ (check).
]
