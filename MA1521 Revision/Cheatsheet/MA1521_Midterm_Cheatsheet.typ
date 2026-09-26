// MA1521 Calculus for Computing — Midterm helpsheet (A4, double-sided)
// Scope: Thomas' Calculus 15/e §11.3–11.5, §12.1–12.3, Ch. 13 (the Midterm Tome),
// plus the single-variable warm-up that opens the sample test (Q1–6).

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
    MA1521 Midterm Helpsheet · side #counter(page).display() of 2
  ]),
  footer-descent: 0.25cm,
)
#set columns(gutter: 0.28cm)
#set text(font: "Libertinus Serif", size: 9.3pt, hyphenate: true)
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
      #text(font: sans, weight: "bold", fill: white, size: 9.5pt)[MA1521 Midterm Helpsheet]
      #h(1fr)
      #text(font: sans, fill: rgb("#CFE2F0"), size: 6.4pt)[
        Thomas 15/e §11.3–11.5 · §12.1–12.3 · Ch. 13 #h(4pt)|#h(4pt) + single-variable warm-up #h(4pt)|#h(4pt)
        #box(fill: exfill, inset: (x: 2pt, y: 0.5pt), radius: 1pt)[#text(fill: exink, weight: "bold")[PY]] = worked sample-test question]
    ]
  ])

// ═══════════════════════════════════════════════════════════════ SIDE 1 ══

#sec("0", "Single-variable warm-up (test Q1–6)")[
  - #sub[Limits.] L'Hôpital for $0/0$, $oo/oo$: $lim f/g = lim f'/g'$. Rewrite $0 dot oo$ as $f\/(1\/g)$; for $1^oo, 0^0, oo^0$ take $ln$ first. *Faster: Maclaurin series* near 0:
    #grid(columns: (auto, 1fr), row-gutter: 0.55em, column-gutter: 8pt,
      [$e^x = 1+x+x^2\/2+x^3\/6$], [$sin x = x - x^3\/6$],
      [$cos x = 1-x^2\/2+x^4\/24$], [$tan x = x + x^3\/3$],
      grid.cell(colspan: 2)[$ln(1+x) = x - x^2\/2 + x^3\/3$],
      grid.cell(colspan: 2)[$arctan x = x - x^3\/3$],
      grid.cell(colspan: 2)[$(1+x)^k approx 1+k x+ k(k-1)\/2 dot x^2$])
  #ex("PY Q1")[$lim_(x->0) (e^(2x)-cos x-2 sin x)/x^2$: numerator $=(1+2x+2x^2)-(1-x^2\/2)-2x+O(x^3) = 5\/2 dot x^2$ ⇒ limit $= 5\/2$.]
  - #sub[Implicit / related rates.] $F(x,y)=0 => (d y)/(d x) = -F_x\/F_y$. Horizontal tangent: solve $F_x=0$ with $F=0$, #warn[check $F_y != 0$]; vertical: $F_y = 0$. Related rates: $d\/d t$ both sides, *then* substitute.
  #ex("PY Q2–3")[$x^2 - 7y^2 + y^3 = 6x y$: $F_x = 2x - 6y = 0 => x = 3y => y^3 = 16y^2$; $(0,0)$ is singular ($F_y = 0$), so only $(48,16)$. #h(3pt) $2x^3 + 3y^2 + x y = 6$ at $(1,1)$, $x' = 4$: $6x^2 x' + 6y y' + x' y + x y' = 0 => y' = -4$.]
  - #sub[FTC.] $d/(d x) integral_(a(x))^(b(x)) f(t) d t = f(b(x)) b'(x) - f(a(x)) a'(x)$.
  #ex("PY Q5")[$f = integral_(x^2)^(3x) (t/3 + 1) d t$: $f'(1) = (1+1)(3) - (1/3+1)(2) = 10/3$.]
  - #sub[Integrals.] $u$-sub (change the limits!); parts $integral u d v = u v - integral v d u$ (LIATE); partial fractions. $integral_0^oo x^n e^(-a x) d x = n!\/a^(n+1)$, e.g. $integral_0^oo x e^(-x\/2) d x = 1\/(1\/2)^2 = 4$.
  #ex("PY Q6")[$integral_0^(ln 3) e^x (1+e^x)^2 d x$, $u = 1 + e^x$: $integral_2^4 u^2 d u = (64-8)\/3 = 56\/3$.]
  - #sub[Improper.] Replace the bad limit by $lim_(b -> oo)$; split at interior singularities. $integral_1^oo x^(-p)$ converges iff $p>1$; $integral_0^1 x^(-p)$ iff $p<1$.
  - #sub[Polar (10.3–10.4).] $x = r cos theta$, $y = r sin theta$, $r^2 = x^2 + y^2$, $tan theta = y\/x$. $r = 2a cos theta$: circle $(x-a)^2 + y^2 = a^2$; $r = a(1 - cos theta)$: cardioid.
  - #sub[Applications.] Disk $pi integral R^2$; washer $pi integral (R^2-r^2)$; shell $2 pi integral (text("radius"))(text("height"))$; arc length $integral sqrt(1+(y')^2) d x$; $f(x) approx f(a)+f'(a)(x-a)+ (f''(a))/2 (x-a)^2$.
]

#sec("11.3", "Vectors & the dot product")[
  - $|bv| = sqrt(v_1^2+v_2^2+v_3^2)$; unit vector $bv\/|bv|$; vector of length $L$ along $bv$: $L bv \/ |bv|$. Point dividing $P Q$ in ratio $r:s$: $(s P + r Q)\/(r+s)$.
  - $bu dot bv = sum u_i v_i = |bu||bv| cos theta$, #h(1pt) $theta = cos^(-1) (bu dot bv)/(|bu||bv|) in [0, pi]$.
    $bu perp bv <=> bu dot bv = 0$; acute $<=> > 0$; obtuse $<=> < 0$. (PY Q7: $2c - 15 + 6 = 0 => c = 9\/2$.)
  - $"proj"_bv bu = ((bu dot bv)/(|bv|^2)) bv$, #h(2pt) scalar component $(bu dot bv)\/|bv|$.
  #key[*Decompose* $bu = underbrace("proj"_bv bu, parallel bv) + underbrace((bu - "proj"_bv bu), perp bv)$. Work $W = bF dot arrow(P Q)$.]
  #ex("PY Q8")[$bQ perp bV$, $bU - bQ parallel bV$ ⇒ $bU-bQ = "proj"_bV bU$. $bU = ⟨4,3,4⟩, bV = ⟨1,2,2⟩$: $(bU dot bV)\/|bV|^2 = 18\/9 = 2$, so $bQ = ⟨4,3,4⟩ - 2⟨1,2,2⟩ = 2bi - bj$.]
]

#sec("11.4", "Cross product & determinants")[
  $ bu times bv = mat(delim: "|", bi, bj, bk; u_1, u_2, u_3; v_1, v_2, v_3) = vec(u_2 v_3 - u_3 v_2, u_3 v_1 - u_1 v_3, u_1 v_2 - u_2 v_1) $
  - $bu times bv perp bu, bv$; $bv times bu = -bu times bv$; $bu parallel bv <=> bu times bv = bold(0)$; $bi times bj = bk$, $bj times bk = bi$, $bk times bi = bj$.
  - $|bu times bv| = |bu||bv| sin theta$ = *parallelogram area*; triangle $= 1/2 |arrow(A B) times arrow(A C)|$.
  - $(bu times bv) dot bw = det[bu; bv; bw]$ = ± *parallelepiped volume*; tetrahedron $1/6 |det|$. $det = 0 <=>$ coplanar.
  - Cofactor expansion along any row/column with signs $(-1)^(i+j)$ (checkerboard $+ - +$). Row swap flips the sign; $det(bu,bv,bw)=det(bw,bu,bv)$ (cyclic).
]

#sec("11.5", "Lines & planes — recipes")[
  *Line* through $P_0$ along $bv$: $br = P_0 + t bv$, i.e. $x = x_0 + t v_1$, …; segment $P -> Q$: $P + t(Q-P)$, $0 <= t <= 1$.
  *Plane* through $P_0$ with normal $bn = ⟨a,b,c⟩$: $a(x-x_0)+b(y-y_0)+c(z-z_0)=0$. Normal = coefficients.
  #key[
    #sub[Finding the normal $bn$]
    - 3 points $P,Q,R$: $bn = arrow(P Q) times arrow(P R)$.
    - point $A$ + line $(P_0, bv)$: $bn = bv times arrow(P_0 A)$.
    - contains $A, B$, $perp$ plane with normal $bold(m)$: $bn = arrow(A B) times bold(m)$.
    - contains the line $Pi_1 inter Pi_2$ and point $A$: *pencil* $(a_1x+dots-d_1) + lambda (a_2 x + dots - d_2) = 0$, fix $lambda$ by $A$.
    - line $perp$ to two lines: direction $bv_1 times bv_2$. #h(2pt) Line $Pi_1 inter Pi_2$: direction $bn_1 times bn_2$, point: set $z = 0$, solve.
  ]
  #ex("PY Q10")[$L: (0,0,1)+t⟨1,2,0⟩$, $A=(1,1,3)$: $arrow(P_0 A) = ⟨1,1,2⟩$, $bn = ⟨1,2,0⟩ times ⟨1,1,2⟩ = ⟨4,-2,-1⟩$ ⇒ $4x - 2y - z = -1$, i.e. $z = 4x-2y+1$.]
  - *Line ∩ plane*: substitute $x(t), y(t), z(t)$ into the plane, solve for $t$.
  #ex("PY Q11")[$(1+t, 1+2t, 1+t)$ in $2x-y+3z=10$: $4+3t=10$, $t=2$ ⇒ $(3,5,3)$.]
  - Line $parallel$ plane $<=> bv dot bn = 0$; line $perp$ plane $<=> bv parallel bn$. Planes parallel $<=> bn_1 parallel bn_2$; angle between planes = angle between normals.
  - Angle between line and plane: $sin phi = (|bv dot bn|)/(|bv||bn|)$. Foot of perpendicular from $S$ to line $P_0 + t bv$: $t = (arrow(P_0 S) dot bv)\/|bv|^2$. Collinear $A,B,C$ $<=> arrow(A B) times arrow(A C) = bold(0)$.
  - Two lines: parallel ($bv_1 parallel bv_2$), intersecting (solve $P_1 + t bv_1 = P_2 + s bv_2$ consistently), else *skew*.
  - Distance $S$ to plane: $(|a x_S + b y_S + c z_S - d|)/sqrt(a^2+b^2+c^2)$; $S$ to line: $(|arrow(P_0 S) times bv|)/(|bv|)$; parallel planes: $|d_1 - d_2|\/|bn|$; skew lines: $(|arrow(P_1 P_2) dot (bv_1 times bv_2)|)/(|bv_1 times bv_2|)$. E.g. $(2,-1,1)$ to $x + y - z = 2$: $|2 - 1 - 1 - 2|\/sqrt(3) = 2\/sqrt(3)$.
  - Answer "$a x + b y + c z = 1$": divide by the constant $d$ (fractions!). Intercept form $x/a + y/b + z/c = 1$.
  #ex("PY Q9")[$(1,2,-1),(3,1,0),(-1,0,2)$: $bn = ⟨2,-1,1⟩ times ⟨-2,-2,3⟩ = ⟨-1,-8,-6⟩$, so $x + 8y + 6z = 11$ ⇒ $1/11 x + 8/11 y + 6/11 z = 1$.]
]

#sec("12.1–12.2", "Vector functions & motion")[
  - $br(t) = ⟨f,g,h⟩$; velocity $bv = br'$, *speed* $|bv|$, acceleration $ba = br''$, unit tangent $bT = bv\/|bv|$. Limits, derivatives, integrals: *componentwise*.
  - $(bu dot bv)' = bu' dot bv + bu dot bv'$; #h(1pt) $(bu times bv)' = bu' times bv + bu times bv'$ (keep order); $(bu(f(t)))' = f'(t) bu'(f(t))$.
  - $|br|$ constant $<=> br dot br' = 0$ (motion on a sphere). Constant speed ⇒ $bv perp ba$.
  - Angle between curves at a common point = angle between their tangent vectors. Max/min speed: extremise $|bv|^2$.
  - *Tangent line* at $t_0$: $br(t_0) + s br'(t_0)$. #h(2pt) *Initial values*: $br(t) = br(t_0) + integral_(t_0)^t bv(tau) d tau$.
  #ex("PY Q12")[$br = ⟨3-t^2, t^3, 4t-1⟩$, $t=1$: $P = (2,1,3)$, $br' = ⟨-2,3,4⟩$. $L: (2-2s, 1+3s, 3+4s)$; $y z$-plane $x = 0 => s=1$ ⇒ $(0,4,7)$.]
  #ex("e.g.")[$bv = ⟨6t^2+4t, 8t^3+2t, 1\/(1+t^2)⟩$, $br(0) = ⟨1,2,pi⟩$: $br(1) = br(0) + integral_0^1 bv = ⟨1+4, 2+3, pi + pi\/4⟩ = ⟨5,5,5pi\/4⟩$.]
  - *Collide*: same $t$ in $br_1(t) = br_2(t)$. *Paths meet*: $br_1(t) = br_2(s)$ with independent $t, s$.
  - Projectile ($v_0$, angle $alpha$, origin): $br = (v_0 cos alpha) t bi + ((v_0 sin alpha) t - 1/2 g t^2) bj$; $y_max = ((v_0 sin alpha)^2)/(2g)$, flight time $(2 v_0 sin alpha)/g$, range $(v_0^2 sin 2alpha)/g$.
]

#sec("12.3", "Arc length")[
  $L = integral_a^b |bv(t)| d t = integral_a^b sqrt(x'^2 + y'^2 + z'^2) d t$; arc-length parameter $s(t) = integral_(t_0)^t |bv(tau)| d tau$ ($|bv| = 1 <=>$ parametrised by arc length).
  #key[*Simplify $|bv|^2$ before rooting*: $sin^2 + cos^2 = 1$; $1 - cos t = 2 sin^2(t/2)$; $1 + cos t = 2 cos^2(t/2)$; perfect squares. Keep $|dot|$: $sqrt(sin^2(t\/2)) = |sin(t\/2)|$ — split the interval where the sign changes.]
  #ex("e.g.")[$⟨2t - 2 sin t, 2 - sqrt(2) cos t, sqrt(2) cos t⟩$, $0 <= t <= 4pi$: $|bv|^2 = (2 - 2cos t)^2 + 4 sin^2 t = 8(1 - cos t) = 16 sin^2(t\/2)$ ⇒ $L = integral_0^(4pi) 4|sin(t\/2)| d t = 2 dot 16 = 32$.]
Helix $⟨a cos t, a sin t, b t⟩$: $|bv| = sqrt(a^2+b^2)$. #h(2pt) $integral sqrt(t^2+a^2) d t = t/2 sqrt(t^2+a^2) + a^2/2 ln(t + sqrt(t^2+a^2))$.
]

#sec("13.1–13.2", "Functions, domains, limits")[
  - *Domain*: $sqrt(dot) >= 0$, $ln(dot) > 0$, denominators $!= 0$, $sin^(-1)$ argument in $[-1,1]$.
  - Level curves $f(x,y) = k$; level surfaces $f(x,y,z)=k$. $x^2+y^2$: circles / paraboloid; $sqrt(x^2+y^2)$: circles / cone; $(x+y)\/(x-y) = k$: lines through $O$.
  - *Limits*: continuous ⇒ substitute. Else simplify — factor, conjugate ($(sqrt(u)-2)/(u-4) = 1/(sqrt(u)+2)$), sub $u = 2x - y$.
  - *Exists*: squeeze $|f - L| <= g -> 0$; polar $x = r cos theta, y = r sin theta$ — if bound $-> 0$ as $r -> 0$ *for all* $theta$, limit is 0 (e.g. $(x^2 y)/(x^2+y^2) = r cos^2 theta sin theta$).
  - *DNE (two-path test)*: different values along $y = m x$, $y = k x^2$, axes. E.g. $(x y)/(x^2+y^2) -> m/(1+m^2)$; $y/x^2 -> k$ along $y = k x^2$.
  - Continuous at $(a,b)$ $<=> lim = f(a,b)$ (limit exists *and* equals value).
]

#sec("13.3", "Partial derivatives")[
  - $f_x$: differentiate in $x$, *all others constant*. $f_(x y) = (f_x)_y = (partial^2 f)/(partial y partial x)$.
  - *Clairaut*: $f_(x y) = f_(y x)$ (continuous 2nd partials). So $f_x = P, f_y = Q$ has a solution only if $P_y = Q_x$ — use to find unknown constants.
  - *Implicit*: $F(x,y,z)=0$ ⇒ $(partial z)/(partial x) = -F_x/F_z$, $(partial z)/(partial y) = -F_y/F_z$.
  #key[*Rebuild $f$ from $f_x, f_y$*: $f = integral f_x d x + g(y)$; differentiate in $y$, match $f_y$ ⇒ $g'(y)$; fix the constant from a given value.]
  #ex("PY Q13")[$f_x = 2x+y^2$, $f_y = 2x y + 3y^2$: $f = x^2 + x y^2 + g(y)$, $g' = 3y^2$ ⇒ $f = x^2+x y^2+y^3+C$. $f(2,1) = 7 + C = 11/2 => C = -3/2$; $f(1,0) = -1/2$.]
  - Laplace $f_(x x) + f_(y y) = 0$; wave $f_(t t) = c^2 f_(x x)$. $f_x, f_y$ continuous ⇒ differentiable ⇒ continuous.
]


#pagebreak()

// ═══════════════════════════════════════════════════════════════ SIDE 2 ══

#sec("13.4", "The Chain Rule")[
  - $w = f(x,y,z)$, all functions of $t$: $(d w)/(d t) = f_x x' + f_y y' + f_z z' = nabla f dot br'(t)$.
  - $x, y$ functions of $(u, v)$: $(partial w)/(partial u) = f_x x_u + f_y y_u$ — *sum over every path* in the tree diagram.
  - $w = f(u)$, $u = g(x,y)$: $w_x = f'(u) u_x$. Implicit $F(x,y) = 0$: $(d y)/(d x) = -F_x/F_y$.
  - Polar: $w_r = f_x cos theta + f_y sin theta$, $w_theta = -f_x r sin theta + f_y r cos theta$; $f_x^2 + f_y^2 = w_r^2 + w_theta^2\/r^2$.
  #ex("PY Q16")[$w = u^2 + 2u v$, $u = x y$, $v = -y^2$: $w_x = w_u u_x + w_v v_x = (2u+2v) y + 0 = 2x y^2 - 2y^3$.]
  #ex("PY Q17")[$nabla f(1,1,1) = ⟨a,b,c⟩$, $⟨x',y',z'⟩ = ⟨5,5,5⟩$ ⇒ $(d f)/(d t) = 5(a+b+c)$.]
]

#sec("13.5", "Gradient & directional derivative")[
  $nabla f = ⟨f_x, f_y, f_z⟩$. #h(3pt) $D_bu f(P) = nabla f(P) dot bu$ with $bu$ a #warn[unit] vector ($bu = bv\/|bv|$); $D_bu f = |nabla f| cos theta$.
  #key[
    - fastest increase: along $nabla f$, rate $|nabla f|$; fastest decrease: $-nabla f$, rate $-|nabla f|$;
    - no change: $bu perp nabla f$ (2-D: $bu = plus.minus ⟨-f_y, f_x⟩\/|nabla f|$);
    - attainable rates: $-|nabla f| <= D_bu f <= |nabla f|$ ("is there a direction with rate 14?").
  ]
  - $nabla f$ is $perp$ to the level curve/surface through $P$; tangent line to level curve: $f_x (x-x_0) + f_y (y-y_0) = 0$.
  - Given $D_(bu_1) f, D_(bu_2) f$: solve the $2 times 2$ system for $f_x, f_y$. Along a path: $d f\/d t = nabla f dot bv$; per unit distance: $nabla f dot bT$.
  #ex("e.g.")[$D_bu f = 2sqrt(2)$ along $bi + bj$ and $-3$ along $-2bj$: $f_y = 3\/2$, $(f_x + f_y)\/sqrt(2) = 2sqrt(2) => f_x = 5\/2$; along $-bi - 2bj$: $(-5\/2 - 3)\/sqrt(5) = -11\/(2sqrt(5))$.]
  #ex("PY Q18")[$f = a ln x + x y^2$: $nabla f(1,2) = ⟨a+4, 4⟩$, $bu = ⟨4,-3⟩\/5$: $(4(a+4)-12)\/5 = 2$ ⇒ $a = 3/2$.]
  #ex("PY Q14")[$nabla(x^2 y + y^2 z + z^2 x) = ⟨2x y+z^2, x^2+2y z, y^2+2z x⟩$; at $(1,2,3)$: $⟨13,13,10⟩$.]
]

#sec("13.6", "Tangent planes, linearization, differentials")[
  - *Level surface* $F = c$ at $P_0$: $nabla F(P_0) dot ⟨x-x_0, y-y_0, z-z_0⟩ = 0$; normal line $P_0 + t nabla F(P_0)$.
  - *Graph* $z = f(x,y)$: $z = f(a,b) + f_x (a,b)(x-a) + f_y (a,b)(y-b)$ (= level surface $F = f - z$).
  - Tangent line to the curve $F = c$ ∩ $G = k$: direction $nabla F times nabla G$.
  #ex("e.g.")[$x^3 + 2x y + y z = 7$ ∩ $3x^2 - y z = 1$ at $(1,2,1)$: $nabla F = ⟨7,3,2⟩$, $nabla G = ⟨6,-1,-2⟩$, $nabla F times nabla G = ⟨-4,26,-25⟩$ ⇒ $x = 1 - 4t, y = 2 + 26t, z = 1 - 25t$.]
  #ex("PY Q15")[$x^2+y^3+z^4 = 8$ at $(3,2,1)$: $nabla F = ⟨6,12,4⟩$ ⇒ $6x+12y+4z = 46$ ⇒ $3/23 x + 6/23 y + 2/23 z = 1$.]
  - *Linearization* $L(x,y) = f(a,b) + f_x (x-a) + f_y (y-b)$.
  - *Differential* $d f = f_x d x + f_y d y + f_z d z$, $Delta f approx d f$. Moving distance $d s$ along $bu$: $d f approx (nabla f dot bu) d s$.
  - Relative error: $(d f)/f = d(ln f)$; for $f = k x^a y^b$: $(d f)/f = a (d x)/x + b (d y)/y$. Implicit: take $d(dot)$ of both sides, solve for $d w$.
  #ex("e.g.")[$V = pi r^2 h$ with $r$ off by $2%$, $h$ by $1%$: $(d V)/V = 2 (d r)/r + (d h)/h$ ⇒ at most $5%$.]
]

#sec("13.7", "Extreme values & saddle points")[
  Critical point: $f_x = f_y = 0$ (or undefined). At it, $D = f_(x x) f_(y y) - f_(x y)^2$:
  #align(center, table(columns: 4, stroke: 0.4pt + luma(190), inset: (x: 3pt, y: 2pt), align: center + horizon,
    fill: (x, y) => if y == 0 { tint },
    [$D > 0$ \ $f_(x x) < 0$], [$D > 0$ \ $f_(x x) > 0$], [$D < 0$], [$D = 0$],
    [local max], [local min], [saddle], [no info]))
  #key[*You never need $f$ itself — only its 2nd partials at the point.* If $D = 0$: test $f - f(a,b)$ along lines/curves — at $(0,0)$, $x^2 y^2$ is a min, $1 - x^2 y^2$ a max, $x y^2$ neither.]
  #ex("PY Q21")[$f_x = 2x + cos y$, $f_y = -x sin y + 2y - pi$; at $(0, pi\/2)$: $f_(x x) = 2$, $f_(y y) = -x cos y + 2 = 2$, $f_(x y) = -sin y = -1$ ⇒ $D = 3 > 0$ ⇒ *local min*.]
  #ex("PY Q20")[$f = e^x (x^2 - y^2)$ at $(0,0)$: $f_(x x) = 2$, $f_(y y) = -2$, $f_(x y) = 0$ ⇒ $D = -4$ ⇒ *saddle*.]
  - *Solving $nabla f = bold(0)$*: factor and split cases ($y(2-2x-y) = 0$); substitute the simpler equation into the other; add/subtract; symmetry ⇒ try $x = y$.
  #ex("PY Q19")[$f = 1/4 x^4 - 1/2 x^2 - x y + 1/2 y^2$: $f_y = y - x = 0$, $f_x = x^3 - x - y = x^3 - 2x = 0$ ⇒ $(0,0), (plus.minus sqrt(2), plus.minus sqrt(2))$.]
  - *Absolute extrema on closed bounded $R$*: (1) interior critical points; (2) each boundary piece as a 1-variable function (circle: $x = r cos t$, $y = r sin t$); (3) corners. Compare all values.
  #ex("e.g.")[$x^2 - 2x y + 2y^2 - 2y$ on $[-1,2] times [0,2]$: interior $(1,1) -> -1$; edge $x = 2$: $2y^2 - 6y + 4$, vertex $y = 3\/2 -> -1\/2$; corners $1, 9, 4, 0$ ⇒ max $9$ at $(-1,2)$, min $-1$ at $(1,1)$.]
  - *Distance problems*: minimise $d^2$, eliminate a variable via the surface (e.g. $y^2 = 4 + x z$ ⇒ $d^2 = x^2 + x z + z^2 + 4$). Box with volume $V$: $z = V\/(x y)$.
]

#sec("LSQ", "Least squares (13.7)")[
  Fit $y = a g(x) + b h(x)$: minimise $S = sum (a g_i + b h_i - y_i)^2$; $S_a = S_b = 0$ give the *normal equations*
  $ a sum g_i^2 + b sum g_i h_i &= sum g_i y_i, \ a sum g_i h_i + b sum h_i^2 &= sum h_i y_i. $
  Line $y = m x + b$: $m sum x^2 + b sum x = sum x y$, $m sum x + n b = sum y$. Tabulate $x, g, h, y, g^2, g y, dots$
  #ex("e.g.")[Line through $(-1,1), (1,2), (3,2)$: $sum x = 3$, $sum x^2 = 11$, $sum y = 5$, $sum x y = 7$ ⇒ $11m + 3b = 7$, $3m + 3b = 5$ ⇒ $y = 1/4 x + 17/12$.]
  #ex("PY Q22")[$y = a x^3 + b$ through $(-1,1), (0,-7), (1,7)$: $g = x^3 in {-1,0,1}$, $h = 1$: $sum g^2 = 2$, $sum g = 0$, $sum g y = 6$, $sum y = 1$ ⇒ $2a = 6$, $3b = 1$ ⇒ $y = 3x^3 + 1/3$.]
]

#sec("13.8", "Lagrange multipliers")[
  Extremise $f$ subject to $g = c$: solve $nabla f = lambda nabla g$, $g = c$. Two constraints: $nabla f = lambda nabla g + mu nabla h$. Then *evaluate $f$ at every solution* — largest = max, smallest = min (guaranteed if the constraint set is closed & bounded; on $x y = 16$, $x+y$ has no max).
  #key[
    #sub[Solving tricks]
    - eliminate $lambda$: $f_x\/g_x = f_y\/g_y$ — check $g_x = 0$, $lambda = 0$, variable $= 0$ cases separately;
    - $f = x y z$: multiply the equations by $x, y, z$ ⇒ $lambda x g_x = lambda y g_y = lambda z g_z$;
    - region with an inequality ($x <= 2$, disk): interior critical points + Lagrange on the boundary + corners.
  ]
  #ex("e.g.")[$x y$ on $(x-2)^2 + y^2 = 4$: $y^2 = x^2 - 2x$ ⇒ $x = 0$ or $3$, max $3sqrt(3)$ at $(3, sqrt(3))$. Add $x <= 2$: $x = 3$ is cut off, check the new edge $x = 2$: $y = plus.minus 2$ ⇒ max $4$ at $(2,2)$.]
  #ex("PY Q23")[$2x + y$ on $2x^2 + y^2 = 9$: $2 = 4 lambda x$, $1 = 2 lambda y$ ⇒ $x = y$ ⇒ $3x^2 = 9$, max $= 3 sqrt(3)$.]
  #ex("PY Q24")[$x y z$ on $x^2 + y^2 + z^2 + 2x z = 18$: constraint $= (x+z)^2 + y^2$ is symmetric in $x, z$ ⇒ $x = z$; then $x^2 y$ on $4x^2 + y^2 = 18$ ⇒ $y^2 = 6$, $x^2 = 3$: $(sqrt(3), sqrt(6), sqrt(3))$.]
  #ex("e.g.")[Open box, $V = x y z = 6$, cost $20x z + 10y z + 30x y$: substitute $z = 6\/(x y)$, or Lagrange ⇒ $(x,y,z) = (1,2,3)$, minimum $\$180$ (each cost term equals $\$60$ at the optimum).]
  - Shortcuts: max of $a x + b y + c z$ on $x^2+y^2+z^2 = R^2$ is $R sqrt(a^2+b^2+c^2)$ at $R ⟨a,b,c⟩\/|⟨a,b,c⟩|$; max of $a x + b y$ on $p x^2 + q y^2 = k$ is $sqrt(k(a^2\/p + b^2\/q))$.
  - First-octant box, corner on $x^2\/a^2 + y^2\/b^2 + z^2\/c^2 = 1$: $V_max = (a b c)\/(3 sqrt(3))$ at $x = a\/sqrt(3), dots$ #h(2pt) Fixed sum $S$: max product $(S\/3)^3$, min sum of squares when all equal.
  - Nearest point of plane $bn dot bold(x) = d$ to $P$: $P + t bn$, $t = (d - bn dot P)\/|bn|^2$. Nearest/farthest point of sphere radius $R$ (centre $O$) to $P$: $plus.minus R P\/|P|$.
]

#sec("13.9–13.10", "Taylor & constrained variables")[
  - 2nd-order Taylor at $(a,b)$, with $h = x - a$, $k = y - b$:
  $ f approx & f(a,b) + f_x h + f_y k \ & + 1/2 (f_(x x) h^2 + 2 f_(x y) h k + f_(y y) k^2) $
  - At $(0,0)$: *multiply 1-variable series, truncate at degree 2* ($u = x + 4y$):
  $ e^u cos x & approx (1 + u + u^2\/2)(1 - x^2\/2) \ & approx 1 + x + 4y + 4x y + 8y^2 $
  - $((partial w)/(partial x))_y$: $x, y$ independent, the rest dependent. Eliminate the dependent ones via the constraint, then differentiate.
  #ex("e.g.")[$w = x^2 + y^2 + z^2$, $z = x^2 + y^2$. $((partial w)/(partial y))_z$: $x^2 = z - y^2$ ⇒ $w = z + z^2$ ⇒ $0$. #h(2pt) $((partial w)/(partial y))_x$: $w = x^2 + y^2 + (x^2+y^2)^2$ ⇒ $2y + 4y(x^2+y^2)$.]
]

#sec("⇢", "Question type → first move")[
  #set text(size: 7.5pt)
  #table(columns: (1fr, 1.15fr), stroke: 0.4pt + luma(200), inset: (x: 2.5pt, y: 2pt),
    fill: (x, y) => if y == 0 { tint } else if calc.odd(y) { white } else { luma(248) },
    table.header([*Asked for…*], [*Do this*]),
    [plane through 3 points], [$bn = arrow(P Q) times arrow(P R)$, $d = bn dot P$, divide by $d$],
    [plane ⊃ line $+$ point], [$bn = bv times arrow(P_0 A)$],
    [$bQ perp bV$, $bU - bQ parallel bV$], [$bQ = bU - "proj"_bV bU$],
    [tangent line to $br(t)$ meets a plane], [$br(t_0) + s br'(t_0)$, substitute, solve $s$],
    [$f$ at a point from $f_x, f_y$], [integrate $f_x$, match $f_y$, constant from given value],
    [$d f\/d t$ from $nabla f$ and rates], [$nabla f dot ⟨x', y', z'⟩$],
    [constant from a directional derivative], [normalise $bu$, solve $nabla f dot bu = $ value],
    [tangent plane to $F = c$], [$nabla F(P_0) dot (bold(x) - P_0) = 0$],
    [type of critical point, only $f_x, f_y$ given], [differentiate once more, $D$-test],
    [all critical points], [solve the simpler equation first, substitute],
    [best fit $y = a g(x) + b h(x)$], [normal equations (tabulate)],
    [max/min on a curve/surface], [Lagrange; evaluate $f$ at every candidate],
    [max/min on a closed region], [interior + each edge + corners],
  )
]

#sec("!", "Pitfalls that cost marks")[
  - Normalise the direction before $D_bu f$. #h(2pt) $D$-test: the sign of $f_(x x)$ matters only when $D > 0$.
  - Lagrange: never divide by something that may be 0; treat $lambda = 0$ and zero variables as cases; an unbounded constraint may have no max.
  - Speed is $|bv|$: keep $|sin(t\/2)|$, $|t|$ and split intervals. *Collide* (same $t$) $!=$ *paths meet* ($t, s$).
  - Rename the parameter of the second line ($t -> s$) before equating. Check the given point satisfies the surface.
  - Answer format: exact fractions in lowest terms; "$a x + b y + c z = 1$"; $⟨a,b,c⟩$ vs $a bi + b bj + c bk$ as asked.
]
