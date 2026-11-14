#import "cheatsheet.typ": *

#show: cheatsheet.with(
  title: "MA1521 Calculus for Computing: technique sheet",
  legend: [#text(weight: "bold")[Exam] #h(0.5em) 28 short answers, 2 marks each; only the boxed answer is marked #h(0.5em)·#h(0.5em) chips give the section of Thomas' _Calculus_ #h(0.5em)·#h(0.5em) $bold(upright(u))$, $bold(upright(v))$ are vectors, $nabla f$ the gradient],
  size: 9.6pt,
)

// ───────────────────────────────────────────────────────────────── notation ──
// upright bold vectors, as in Thomas
#let bu = $upright(bold(u))$
#let bv = $upright(bold(v))$
#let bw = $upright(bold(w))$
#let bn = $upright(bold(n))$
#let bm = $upright(bold(m))$
#let br = $upright(bold(r))$
#let bx = $upright(bold(x))$
#let grad = $nabla$
#let proj = math.op("proj")
#let dd = $thin d$ // differential with a thin space before it
#let iint = $integral.double$
#let iiint = $integral.triple$

// ═══════════════════════════════════ SIDE 1: single-variable, Ch. 11–13 ══

#section(tag: "1-var", accent: hue.blue)[Single-variable tools][
  *L'Hôpital* for $0\/0$ or $oo\/oo$: $lim f\/g = lim f'\/g'$; #warn[re-check the form] before every use. $0 dot oo$: rewrite as $f\/(1\/g)$. $1^oo, 0^0, oo^0$: take $ln$ first; $lim_(x -> oo) (1 + a\/x)^(b x) = e^(a b)$.

  *Maclaurin* (often faster near 0) $e^x = 1 + x + x^2\/2 + x^3\/6$ #sep $sin x = x - x^3\/6$ #sep $cos x = 1 - x^2\/2 + x^4\/24$ #sep $ln(1 + x) = x - x^2\/2 + x^3\/3$ #sep $tan x = x + x^3\/3$ #sep $arctan x = x - x^3\/3$ #sep $(1 + x)^k = 1 + k x + k(k - 1) x^2\/2$.

  *FTC with moving limits* for $a = a(x)$, $b = b(x)$:
  $ d/(d x) integral_a^b g(t) dd t = g(b) b' - g(a) a' $

  *Integration* substitution (#warn[change the limits]); parts $integral u dd v = u v - integral v dd u$, choosing $u$ by LIATE; $integral ln x dd x = x ln x - x$.

  *Improper integrals* replace the bad endpoint by a limit; split at an interior singularity. $integral_1^oo x^(-p) dd x$ converges ⇔ $p > 1$; $integral_0^1 x^(-p) dd x$ ⇔ $p < 1$. Ready values: $integral_0^oo x^n e^(-a x) dd x = n! \/ a^(n + 1)$ #sep $integral_0^1 x^n ln x dd x = -1\/(n + 1)^2$ #sep $integral_0^1 x^n (ln x)^2 dd x = 2\/(n + 1)^3$ #sep $x^a (ln x)^k -> 0$ as $x -> 0^+$ for $a > 0$.

  *Applications* area $integral ("top" - "bottom") dd x$ #sep volume of revolution: discs $pi integral R^2$, washers $pi integral (R^2 - r^2)$, shells $2 pi integral ("radius")("height")$ #sep arc length $integral sqrt(1 + y'^2) dd x$.

  *Implicit curves* $F(x, y) = 0$ ⇒ $dd y\/d x = -F_x\/F_y$. Horizontal tangent: $F_x = 0$ with $F = 0$, #warn[and $F_y != 0$]. Related rates: differentiate in $t$ first, substitute after.
]

#section(tag: "11", accent: hue.teal)[Vectors, lines, planes][
  *Dot product* $bu dot bv = sum u_i v_i = |bu| |bv| cos theta$; #h(0.2em) $bu perp bv <=> bu dot bv = 0$. Projection $proj_bv bu = ((bu dot bv) \/ |bv|^2) bv$, and $bu - proj_bv bu perp bv$.

  *Cross product* $bu times bv = ⟨u_2 v_3 - u_3 v_2, #h(0.25em) u_3 v_1 - u_1 v_3, #h(0.25em) u_1 v_2 - u_2 v_1⟩$, perpendicular to both. $|bu times bv| = |bu| |bv| sin theta$ is the parallelogram area (triangle: half). Box volume $|(bu times bv) dot bw|$.

  *Line* through $P_0$ along $bv$: $br = P_0 + t bv$; through $P, Q$ take $bv = Q - P$. #h(0.2em) *Plane* with normal $bn = ⟨a, b, c⟩$ through $P_0$: $a x + b y + c z = bn dot P_0$.

  *Normal of a plane* through three points: $arrow(P Q) times arrow(P R)$ #sep containing a line $(P_0, bv)$ and a point $A$: $bv times arrow(P_0 A)$ #sep containing $A, B$ and perpendicular to a plane with normal $bm$: $arrow(A B) times bm$. #h(0.2em) Line where two planes meet: direction $bn_1 times bn_2$; for a point on it set $z = 0$ and solve.

  *Line meets plane* substitute $x(t), y(t), z(t)$ into the plane, solve for $t$, back-substitute. #h(0.2em) Line $parallel$ plane ⇔ $bv dot bn = 0$; line $perp$ plane ⇔ $bv parallel bn$; planes parallel ⇔ normals parallel; angle between planes $=$ angle between normals.

  *Distances* point $S$ to the plane $a x + b y + c z = d$: $|a x_S + b y_S + c z_S - d| \/ |bn|$ #sep $S$ to the line $(P_0, bv)$: $|arrow(P_0 S) times bv| \/ |bv|$ #sep parallel planes: $|d_1 - d_2| \/ |bn|$ #sep skew lines: $|arrow(P_1 P_2) dot (bv_1 times bv_2)| \/ |bv_1 times bv_2|$.

  *Curve $br(t)$* velocity $br'(t)$, speed $|br'(t)|$. Tangent line at $t_0$: $br(t_0) + s br'(t_0)$. Position from velocity: $br(t) = br(t_0) + integral_(t_0)^t bv$. Arc length $integral_a^b |br'(t)| dd t$: simplify $|br'|^2$ before taking the root. Collide: same $t$; paths cross: separate parameters $t, s$.
]

#section(tag: "13.3", accent: hue.green)[Partials and the chain rule][
  *Partials* $f_x$: differentiate in $x$, every other variable held constant. Clairaut: $f_(x y) = f_(y x)$, so $f_x = P$, $f_y = Q$ is solvable only if $P_y = Q_x$.

  #key[*Rebuild $f$ from $f_x, f_y$* #s1 $f = integral f_x dd x + g(y)$. #s2 Differentiate in $y$ and match $f_y$: this gives $g'(y)$. #s3 Integrate $g'$, then fix the constant from the given value.]

  *Chain rule* sum over every path. If $z = z(u, v, w)$ and each depends on $(x, y)$: $z_y = z_u u_y + z_v v_y + z_w w_y$. An unknown $v(x, y)$ is fine: only $v_x, v_y$ are needed. Substitute $u, v, w$ back at the end.

  *Along a path* $(d\/d t) f(br(t)) = grad f(br(t)) dot br'(t)$: #warn[evaluate $grad f$ at the point $br(t_0)$].

  *Implicit* $F(x, y, z) = 0$ ⇒ $z_x = -F_x\/F_z$, $z_y = -F_y\/F_z$.

  *Limits in two variables* continuous ⇒ substitute. No limit: two paths ($y = m x$, $y = k x^2$) give different values. Limit 0: in polar the bound $-> 0$ as $r -> 0$ for every $theta$.
]

#section(tag: "13.5", accent: hue.amber)[Gradient and tangent planes][
  *Directional derivative* $D_bu f = grad f dot bu$ with $bu$ a #warn[unit] vector: divide the direction by its length first. Largest rate $|grad f|$ along $grad f$; smallest $-|grad f|$ along $-grad f$; zero perpendicular to $grad f$.

  *Tangent plane* to $F(x, y, z) = c$ at $P_0$: $grad F(P_0) dot (bx - P_0) = 0$; normal line $P_0 + t grad F(P_0)$. Graph $z = f(x, y)$: $z = f(a, b) + f_x (x - a) + f_y (y - b)$, which is also the linearization; $d f = f_x dd x + f_y dd y$.

  #key[*Tangent plane parallel to a given plane* (normal $bn$) #s1 Write $grad F = lambda bn$; a constant component fixes $lambda$. #s2 Solve for the coordinates it determines. #s3 Use $F = c$ for the one that remains.]

  *Also* tangent to the curve $F = c$, $G = k$: direction $grad F times grad G$ #sep $grad f$ is perpendicular to the level set through the point #sep gradient descent: $bx_(k + 1) = bx_k - h grad f(bx_k)$, $h > 0$.
]

#section(tag: "13.7", accent: hue.plum)[Critical points and extrema][
  *Critical points* solve $f_x = 0 = f_y$: factor and split into cases ($6 x y = 0$ ⇒ $x = 0$ or $y = 0$); #warn[never divide by a variable].

  #block(breakable: false)[
    *Second derivative test* $D = f_(x x) f_(y y) - f_(x y)^2$ at the point; only the second partials there are needed.
    #tbl(columns: (1fr, 1fr, auto, auto),
      [$D > 0$, $f_(x x) < 0$], [$D > 0$, $f_(x x) > 0$], [$D < 0$], [$D = 0$],
      [local max], [local min], [saddle], [no verdict],
    )
  ]

  #key[*Largest or smallest value on a closed bounded region* #s1 Interior critical points. #s2 Boundary: Lagrange, or parametrize each piece. #s3 Corners. Compare $f$ at #b[all] the candidates.]

  *Least squares* fit $y = a g(x) + b h(x)$: solve $a sum g_i^2 + b sum g_i h_i = sum g_i y_i$ and $a sum g_i h_i + b sum h_i^2 = sum h_i y_i$. Line $y = m x + b$: $m sum x_i^2 + b sum x_i = sum x_i y_i$ and $m sum x_i + n b = sum y_i$.

  *Taylor to order 2* at $(a, b)$, with $h = x - a$, $k = y - b$: $f approx f + f_x h + f_y k + (f_(x x) h^2 + 2 f_(x y) h k + f_(y y) k^2) \/ 2$.
]

#section(tag: "13.8", accent: hue.violet)[Lagrange multipliers][
  #key[*Extremize $f$ on $g = c$* solve $grad f = lambda grad g$ together with $g = c$. Written out: $f_x = lambda g_x$, $f_y = lambda g_y$ (and $f_z = lambda g_z$), $g = c$. Then evaluate $f$ at #b[every] solution: the largest value is the maximum, the smallest the minimum. Two constraints: $grad f = lambda grad g + mu grad h$.]

  *Solving the system* factor each equation and split into cases (a variable is 0, or $lambda$ takes a value) #sep eliminate $lambda$: $f_x g_y = f_y g_x$ #sep symmetric in $x, y$: try $x = y$ #sep $f = x y z$: multiply the three equations by $x, y, z$.

  *Shortcuts* max of $a x + b y + c z$ on the sphere of radius $R$: $R sqrt(a^2 + b^2 + c^2)$ #sep max of $a x + b y$ on $p x^2 + q y^2 = k$: $sqrt(k (a^2\/p + b^2\/q))$ #sep point of the plane $bn dot bx = d$ nearest the origin: $(d \/ |bn|^2) bn$ #sep with $x + y + z$ fixed, $x^a y^b z^c$ is largest when $x : y : z = a : b : c$.
]

#section(tag: "∫", accent: hue.slate)[Integrals and derivatives][
  *Inner integrals* $integral r e^(-r^2) dd r = -e^(-r^2) \/ 2$ #sep $integral r\/(1 + r^2) dd r = ln(1 + r^2) \/ 2$ #sep $integral r sqrt(a^2 - r^2) dd r = -(a^2 - r^2)^(3\/2) \/ 3$ #sep $integral cos^n phi sin phi dd phi = -cos^(n + 1) phi \/ (n + 1)$ #sep $integral sin^3 phi dd phi = -cos phi + (cos^3 phi) \/ 3$ #sep $integral sec^2 = tan$ #sep $integral tan = ln|sec|$ #sep $integral sec = ln|sec + tan|$.

  *Standard forms* $integral dd x\/(a^2 + x^2) = (1\/a) arctan(x\/a)$ #sep $integral dd x\/sqrt(a^2 - x^2) = arcsin(x\/a)$ #sep $integral dd x\/sqrt(x^2 plus.minus a^2) = ln|x + sqrt(x^2 plus.minus a^2)|$ #sep $integral sqrt(a^2 - x^2) dd x = (x\/2) sqrt(a^2 - x^2) + (a^2\/2) arcsin(x\/a)$.

  *Derivatives* $(tan x)' = sec^2 x$ #sep $(sec x)' = sec x tan x$ #sep $(arcsin x)' = 1\/sqrt(1 - x^2)$ #sep $(arctan x)' = 1\/(1 + x^2)$ #sep $(a^x)' = a^x ln a$.
]

// ════════════════════════════════════════════════════════ SIDE 2: Ch. 14 ══
#pagebreak()

#section(tag: "14", accent: hue.slate)[Which method?][
  *Rectangle, product $g(x) h(y)$* split into single integrals.

  *Triangle, region between curves* sketch; take the order that needs one integral.

  *Inner integral impossible* reverse the order.

  *Disc, annulus, $x^2 + y^2$* polar. #h(0.4em) *Symmetric region, odd integrand* 0.

  *Parallelogram, curves $g = c_1, c_2$* substitute $u = g$, $v = h$.

  *Cylinder, paraboloid, $x^2 + y^2$ in space* cylindrical, $z$ innermost.

  *Ball, cone, $x^2 + y^2 + z^2$* spherical.
]

#section(tag: "14.1", accent: hue.blue)[Double integrals][
  *Iterated integral* $iint_R f dd A = integral_a^b integral_(g_1(x))^(g_2(x)) f dd y dd x$ (vertical strips) $= integral_c^d integral_(h_1(y))^(h_2(y)) f dd x dd y$ (horizontal strips). #warn[Outer limits are constants]\; inner limits depend only on the outer variable. Rectangle with $f = g(x) h(y)$: $(integral g dd x)(integral h dd y)$.

  #key[*Setting up* #s1 Sketch the region; equate the curves to find where they meet. #s2 Push an arrow through the region in the inner direction: lower limit where it enters, upper limit where it leaves. #s3 If the entry or exit curve changes along the region, take the other order (or split).]

  *Reverse the order* when the inner integral has no elementary antiderivative ($e^(x^2)$, $sin y \/ y$, $1 \/ sqrt(y^4 + 1)$). #s1 Read the region off the limits: $a <= x <= b$, $g_1(x) <= y <= g_2(x)$. #s2 Sketch it and invert the boundary curves ($y = x^(1\/3) <=> x = y^3$). #s3 Describe it the other way; the new inner integral supplies the factor a substitution needs.

  *Tools* scaling: $integral_0^a f(k x) dd x = (1\/k) integral_0^(k a) f(u) dd u$ #sep symmetry: region symmetric in $x$ and integrand odd in $x$ ⇒ 0; even ⇒ twice the half #sep line through $(x_1, y_1)$, $(x_2, y_2)$ as $x$ in terms of $y$: $x = x_1 + dfrac(x_2 - x_1, y_2 - y_1) (y - y_1)$.

  *Uses* area $iint 1 dd A$ #sep volume $iint (z_"top" - z_"bot") dd A$ #sep average $(1\/"area") iint f dd A$ #sep centroid $overline(x) = (1\/A) iint x dd A$, so $iint x dd A = overline(x) A$ (triangle: centroid $=$ mean of the vertices) #sep mass $M = iint delta dd A$, $overline(x) = (1\/M) iint x delta dd A$.
]

#section(tag: "14.4", accent: hue.teal)[Polar coordinates][
  #key[$x = r cos theta$, #h(0.3em) $y = r sin theta$, #h(0.3em) $x^2 + y^2 = r^2$, #h(0.3em) #b[$dd A = r dd r dd theta$]. Use for discs, annuli, sectors, and integrands in $x^2 + y^2$.]
  #tbl(columns: (auto, 1fr),
    [Curve], [In polar],
    [disc of radius $a$], [$0 <= r <= a$, #h(0.2em) $0 <= theta <= 2 pi$],
    [line $y = m x$], [$theta = arctan m$ #h(0.3em) ($y = x$: $pi\/4$; #h(0.2em) $y = sqrt(3) x$: $pi\/3$)],
    [$x^2 + y^2 = 2 a x$], [$r = 2 a cos theta$, #h(0.2em) $-pi\/2 <= theta <= pi\/2$],
    [$x^2 + y^2 = 2 a y$], [$r = 2 a sin theta$, #h(0.2em) $0 <= theta <= pi$],
    [$x = a$; #h(0.3em) $y = b$], [$r = a sec theta$; #h(0.3em) $r = b csc theta$],
  )
  $y = sqrt(2 x - x^2)$ is the upper half of $r = 2 cos theta$: $0 <= theta <= pi\/2$. #h(0.2em) Area inside $r(theta)$: $integral_alpha^beta (r^2\/2) dd theta$. #h(0.2em) Gaussian: $integral_0^oo e^(-a x^2) dd x = sqrt(pi\/a) \/ 2$.

  *Trig* $sin^2 theta = (1 - cos 2 theta)\/2$ #sep $cos^2 theta = (1 + cos 2 theta)\/2$ #sep $sin 2 theta = 2 sin theta cos theta$ #sep $1 + tan^2 theta = sec^2 theta$.

  *Powers of sin, cos* $integral_0^(pi\/2) sin^n = integral_0^(pi\/2) cos^n$ equals, for $n = 2, ..., 6$: #h(0.2em) $pi\/4$, #h(0.2em) $2\/3$, #h(0.2em) $3 pi\/16$, #h(0.2em) $8\/15$, #h(0.2em) $5 pi\/32$. Over $[0, pi]$ double the $sin$ values. $integral_0^(2 pi) cos^2 = integral_0^(2 pi) sin^2 = pi$; #h(0.2em) $integral_0^(2 pi) sin cos = 0$.
]

#section(tag: "14.8", accent: hue.green)[Change of variables][
  #key[
    $ iint_R f dd x dd y = iint_G f |J| dd u dd v, \ J = (partial(x, y))/(partial(u, v)) = x_u y_v - x_v y_u $

    #s1 Choose $u, v$ so that the boundary curves become $u =$ const and $v =$ const.

    #s2 Compute the easy Jacobian $partial(u, v) \/ partial(x, y) = u_x v_y - u_y v_x$; then $J$ is its reciprocal.

    #s3 Write $f |J|$ in $u, v$; the awkward factor often cancels.

    #s4 Limits from the boundary curves, in the order asked for.]

  *Common choices* $u = x + y$, $v = x - y$: $|J| = 1\/2$ #sep $u = x y$, $v = y\/x$: $partial(u, v) \/ partial(x, y) = 2 v$, with $x^2 = u\/v$, $y^2 = u v$ #sep $u = x^2 - y^2$, $v = x y$: $2(x^2 + y^2)$ #sep ellipse $x = a r cos theta$, $y = b r sin theta$: $dd A = a b r dd r dd theta$ #sep three variables: $dd V = |partial(x, y, z) \/ partial(u, v, w)| dd u dd v dd w$.
]

#section(tag: "14.5", accent: hue.amber)[Triple integrals][
  *Limits* outer limits are constants; middle limits depend on the outer variable only; inner limits may depend on both. With $z$ innermost: $z_"bot" (x, y) <= z <= z_"top" (x, y)$, then a double integral over the shadow in the $x y$-plane.

  *Shortcuts* box with a product integrand: product of three single integrals #sep region symmetric under $x -> -x$ and integrand odd in $x$ ⇒ 0 #sep ball centred at $O$: $iiint x^2 = iiint y^2 = iiint z^2 = (1\/3) iiint rho^2$ #sep slicing: $iiint g(z) dd V = integral g(z) A(z) dd z$, with $A(z)$ the cross-section area.

  *Uses* volume $iiint 1 dd V$ #sep mass $M = iiint delta dd V$ #sep centre of mass $overline(x) = (1\/M) iiint x delta dd V$ #sep average $(1\/V) iiint f dd V$.
]

#section(tag: "14.7", accent: hue.plum)[Cylindrical coordinates][
  #key[$x = r cos theta$, #h(0.3em) $y = r sin theta$, #h(0.3em) $z = z$, #h(0.3em) #b[$dd V = r dd z dd r dd theta$]. Use when the shadow is a disc or annulus, or the integrand contains $x^2 + y^2$.]

  *Surfaces* cylinder $x^2 + y^2 = a^2$: $r = a$ #sep cone $z = sqrt(x^2 + y^2)$: $z = r$ #sep paraboloid $z = x^2 + y^2$: $z = r^2$ #sep sphere: $z = plus.minus sqrt(a^2 - r^2)$ #sep plane $z = 6 + x$: $z = 6 + r cos theta$.

  *Order* $z$ innermost, from the bottom surface to the top one; then $r$ and $theta$ over the shadow (equate the two surfaces for its radius). $integral_0^(2 pi) cos theta dd theta = integral_0^(2 pi) sin theta dd theta = 0$ removes the slanted part of a plane.
]

#section(tag: "14.7", accent: hue.violet)[Spherical coordinates][
  #key[$x = rho sin phi cos theta$, #h(0.3em) $y = rho sin phi sin theta$, #h(0.3em) $z = rho cos phi$, #h(0.3em) $r = rho sin phi$, #h(0.3em) $x^2 + y^2 + z^2 = rho^2$, #h(0.3em) #b[$dd V = rho^2 sin phi dd rho dd phi dd theta$]. Here $rho >= 0$; $phi in [0, pi]$ is measured #warn[down from the $+z$-axis]\; $theta$ is as in polar.]
  #tbl(columns: (auto, 1fr),
    [Surface], [In spherical],
    [sphere $x^2 + y^2 + z^2 = a^2$], [$rho = a$],
    [sphere $x^2 + y^2 + z^2 = 2 a z$], [$rho = 2 a cos phi$, #h(0.2em) $phi <= pi\/2$],
    [cone $z = k sqrt(x^2 + y^2)$], [$tan phi = 1\/k$],
    [plane $z = c$], [$rho = c sec phi$],
    [cylinder $x^2 + y^2 = a^2$], [$rho = a csc phi$],
    [$x y$-plane; above it], [$phi = pi\/2$; #h(0.3em) $phi <= pi\/2$],
  )
  Cone angles: $k = 1$ gives $phi = pi\/4$; $sqrt(3)$ gives $pi\/6$; $1\/sqrt(3)$ gives $pi\/3$. Above the cone means $0 <= phi <=$ that angle.

  *Ranges* whole ball: $0 <= rho <= a$, $0 <= phi <= pi$, $0 <= theta <= 2 pi$; first octant: $phi, theta in [0, pi\/2]$. Radial integrand: $iiint_(rho <= a) g(rho) dd V = 4 pi integral_0^a g(rho) rho^2 dd rho$. #h(0.2em) $integral_0^alpha sin phi dd phi = 1 - cos alpha$.

  *Volumes* ball $(4\/3) pi a^3$ #sep cone $(1\/3) pi r^2 h$ #sep cylinder $pi r^2 h$ #sep inside $rho = a$ and above the cone $phi = alpha$: $(2\/3) pi a^3 (1 - cos alpha)$ #sep ellipsoid $(4\/3) pi a b c$ #sep tetrahedron with intercepts $a, b, c$: $a b c\/6$.
]

#section(tag: "!", accent: hue.slate)[Before you box the answer][
  *Jacobian present?* $r$ in polar and cylindrical, $rho^2 sin phi$ in spherical, $|J|$ in a substitution (absolute value, rewritten in $u, v$).

  *Limits* outer limits are numbers; after reversing, read both limits again from the sketch. $r = 2 a cos theta$ runs over $-pi\/2 <= theta <= pi\/2$, not $[0, 2 pi]$.

  *Do not mix up* $sqrt(x^2 + y^2) = r = rho sin phi$ and $sqrt(x^2 + y^2 + z^2) = rho$; in cylindrical $x^2 + y^2 + z^2 = r^2 + z^2$. Saddle ⇔ $D < 0$, whatever the sign of $f_(x x)$.

  *Rewrite, do not compute* give the limits, the integrand and the Jacobian, in the stated order of integration.

  *Form* fraction in lowest terms #sep point as $(a, b, c)$ #sep $a sqrt(b)$ with $b$ as small as possible #sep in terms of $pi$ #sep integer powers of $e$. Answer what is asked: "saddle points" is not "maximum value".
]
