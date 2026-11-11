// MA1521 Calculus for Computing — Final Exam Exercise Set
// Typeset in Typst on A4; converted from the earlier LaTeX edition.

#import "exset.typ": *
#show: exset.with(module: "MA1521", running: "Final Exam Exercise Set")
#set math.mat(delim: "[")
#set math.vec(delim: "[")
#set enum(spacing: 1.2em)

#line(length: 100%, stroke: 3.2pt + blue)
#v(-8pt)
#line(length: 100%, stroke: 0.5pt + rulegray)
#v(6pt)
#grid(columns: (1fr, auto), align: (left + top, right + top),
  [#text(font: sans, weight: "bold", size: 12pt, fill: deep)[MA1521#h(0.6em)CALCULUS FOR COMPUTING]\
   #text(font: sans, size: 9.5pt, fill: soft)[National University of Singapore]],
  text(font: sans, size: 9.5pt, fill: soft)[Exercise Set F#h(0.5em);(Final Exam Revision)\
    Name: #box(width: 3.2cm, stroke: (bottom: 0.4pt + soft))\
    Date: #box(width: 3.2cm, stroke: (bottom: 0.4pt + soft))])
#v(12pt)
#text(font: sans, weight: "bold", size: 28pt, fill: blue)[Partial Derivatives\ and Multiple Integrals]
#v(-2pt)
#text(style: "italic", size: 11.5pt, fill: deep)[Thomas' Calculus: Early Transcendentals, 15/e #h(0.4em)•#h(0.4em) Sections 11.3–11.5, Chapter 13, and Chapter 14 complete]
#v(-3pt)
#text(style: "italic", size: 10.5pt, fill: soft)[MIT 18.02 Multivariable Calculus #h(0.4em)•#h(0.4em) Lectures 1–18 and 25–26]
#v(-4pt)
#line(length: 100%, stroke: 1.4pt + blue)
#v(4pt)

#panel[HOW TO USE THIS SET][
The official sample final paper has 28 short-answer questions of 2 marks each, with only the boxed answer marked: three on single-variable calculus, nine on vectors and partial derivatives, and sixteen on multiple integrals. This set is weighted the same way. Parts~A to~C revise the material already examined at the midterm, in the form the final asks it; Parts~D to~F cover Chapter~14 in full; Part~G is a complete 28-question mock paper to be sat in one sitting of two hours.

Every problem here is new: none is copied from the textbook, the lesson notes, or the sample paper, although each is modelled on a question type that appears there. Every problem is followed by a ruled panel sized to the work it should take. Answers to all problems begin on the last pages; consult them only after a complete attempt.
]

#topichead[Distribution of Problems]

#figure(
  align(center)[#table(stroke: none, inset: (x: 6pt, y: 3.5pt),
    columns: (6%, 46%, 24%, 14%),
    align: (left,left,left,left,),
    table.header([#strong[Part]], [#strong[Topic]], [#strong[Thomas sections]], [#strong[Problems]],),
    table.hline(),
    [A], [Single-Variable Warm-Up], [4.5, 5.4, 8.8], [1--3],
    [B], [Lines, Planes, and Partial Derivatives], [11.3--11.5, 13.3--13.6], [4--9],
    [C], [Extreme Values and Lagrange Multipliers], [13.7--13.8], [10--14],
    [D], [Double Integrals in Rectangular Coordinates], [14.1--14.3], [15--22],
    [E], [Polar Coordinates and Substitutions], [14.4, 14.8], [23--33],
    [F], [Triple Integrals], [14.5--14.7], [34--45],
    [G], [Mock Final Examination (2 hours)], [all of the above], [46--73],
  )]
  , kind: table
  )

#topichead[Results You Are Expected to Know Cold]

#panel[THEOREM --- Fubini's Theorem and Reversing the Order of Integration][
If $f$ is continuous on $R : med a lt.eq x lt.eq b\,med g_1\(x\)lt.eq y lt.eq g_2\(x\)$, then $ integral.double_R f\(x\,y\)thin d A = integral_a^b #h(-0.167em) #h(-0.167em) integral_(g_1\(x\))^(g_2\(x\)) f\(x\,y\)thin d y thin d x . $ The outer limits are always constants. To reverse the order, sketch $R$, describe it again as $c lt.eq y lt.eq d\,med h_1\(y\)lt.eq x lt.eq h_2\(y\)$, and rewrite the limits; never simply swap the integral signs. On a rectangle, $display(integral.double g\(x\)h\(y\)thin d A =\(integral g thin d x\)\(integral h thin d y\))$.
]

#panel[THEOREM --- Substitutions in Multiple Integrals][
If $x = g\(u\,v\)$, $y = h\(u\,v\)$ maps a region $G$ of the $u v$-plane one-to-one onto $R$, then $ integral.double_R f\(x\,y\)thin d x thin d y = integral.double_G f\(g\(u\,v\)\,h\(u\,v\)\)lr(|frac(partial\(x\,y\), partial\(u\,v\))|) d u thin d v\,#h(2em) frac(partial\(x\,y\), partial\(u\,v\)) = mat(delim: "|", x_u, x_v; y_u, y_v) = frac(1, partial\(u\,v\)\/partial\(x\,y\)) . $

$ upright("Polar: ") d A = r thin d r thin d theta #h(2em) upright("Cylindrical: ") d V = r thin d z thin d r thin d theta #h(2em) upright("Spherical: ") d V = rho^2 sin phi.alt thin d rho thin d phi.alt thin d theta $ In spherical coordinates $x = rho sin phi.alt cos theta$, $y = rho sin phi.alt sin theta$, $z = rho cos phi.alt$, with $rho gt.eq 0$ and $0 lt.eq phi.alt lt.eq pi$.
]

#endpart()
#parthead[A][Single-Variable Warm-Up][Thomas 4.5, 5.4, 8.8 ~•~~sample final Questions 1--3][3 problems]

#topichead[Improper Integrals]

#prob(space: 8.4cm)[
  #strong[Improper integrals.] #h(0.8em) Each integral below is improper. Say why, and evaluate it.

  + $display(integral_0^1 x^2\(ln x\)^2 thin d x)$

  + $display(integral_0^1 frac(ln x, sqrt(x)) thin d x)$

  + $display(integral_1^oo frac(ln x, x^3) thin d x)$

  + $display(integral_0^oo x^2 e^(- 3 x) thin d x)$
]


#topichead[Indeterminate Forms and L'Hôpital's Rule]

#prob(space: 7.2cm)[
  #strong[Limits.] #h(0.8em) Evaluate each limit.

  + $display(lim_(x arrow.r 3) frac(\(x - 3\)\(ln x - ln 3\), x^2 - 7 x + 12 + 3 ln x - 3 ln 3))$

  + $display(lim_(x arrow.r 0) frac(e^(3 x) - 1 - 3 x, 1 - cos 2 x))$

  + $display(lim_(x arrow.r oo) (1 + 2 / x)^(3 x))$
]


#topichead[The Fundamental Theorem of Calculus]

#prob(space: 6.6cm)[
  #strong[Differentiating an integral.]

  + Let $display(f\(x\)= integral_(2 x - 1)^(x^3) frac(1, t^2 + 4) thin d t)$. Find $f'\(2\)$.

  + Let $display(g\(x\)= integral_x^(x^2) sqrt(1 + t^3) thin d t)$. Find $g'\(2\)$.

  + Let $display(F\(x\)= integral_0^(x^2)\(t - 4\)e^(- t) thin d t)$ for $x > 0$. At what value of $x$ does $F$ have a local minimum?
]


#endpart()
#parthead[B][Lines, Planes, and Partial Derivatives][Thomas 11.3--11.5, 13.3--13.6 ~•~~sample final Questions 4--9][6 problems]

#topichead[Lines and Planes in Space]

#prob(space: 7.4cm)[
  #strong[Three short questions.]

  + Let $P =\(1\,- 2\,3\)$ and $Q =\(4\,0\,1\)$. Find the point at which the line through $P$ and $Q$ meets the plane $3 x - y + 2 z = 5$.

  + The angle between the vectors $upright(bold(i)) - 2 upright(bold(j)) + upright(bold(k))$ and $- 2 upright(bold(i)) + upright(bold(j)) + upright(bold(k))$ is $a pi$ with $0 lt.eq a lt.eq 1$. Find $a$.

  + Find an equation of the plane through $\(1\,1\,0\)$, $\(2\,0\,3\)$, and $\(0\,2\,1\)$, and the distance from the point $\(3\,4\,5\)$ to that plane.
]


#topichead[Tangent Planes]

#prob(space: 6.4cm)[
  #strong[Tangent planes to level surfaces.]

  + Let $S$ be the surface $x^2 + 4 y^2 - z = 5$. Find the point on $S$ at which the tangent plane to $S$ is parallel to the plane $4 x - 8 y - 2 z = 1$.

  + Find an equation of the tangent plane to the surface $x y z + z^3 = 12$ at the point $\(1\,2\,2\)$.
]


#topichead[Recovering a Function from Its Partial Derivatives]

#prob(space: 7.4cm)[
  + Find the function $f\(x\,y\)$ such that $ frac(partial f, partial x) = 2 x e^y - y sin x\,#h(2em) frac(partial f, partial y) = x^2 e^y + cos x + 2 y\,#h(2em) f\(0\,0\)= 3\, $ and hence find $f\(pi\,1\)$.

  + For what value of the constant $k$ does there exist a function $g\(x\,y\)$ with $ frac(partial g, partial x) = k x y^2 + 3 y\,#h(2em) frac(partial g, partial y) = 4 x^2 y + 3 x + 1 thin ? $ For that value of $k$, find all such functions $g$.
]


#topichead[The Chain Rule]

#prob(space: 5.6cm)[
  Let $u = 2 x y$, let $v = v\(x\,y\)$ be a function such that $display(frac(partial v, partial x) = 4 x)$ and $display(frac(partial v, partial y) = - y)$, let $w = x^2 - y$, and let $ z = u^2 - 3 v + u w . $ Determine $display(frac(partial z, partial x))$ as a function of $x$ and $y$.
]


#topichead[Directional Derivatives and Rates of Change]

#prob(space: 5.2cm)[
  Consider the function $f\(x\,y\)= x y^2 - x^3$.

  + Find the directional derivative of $f$ at the point $\(1\,2\)$ in the direction of the vector $5 upright(bold(i)) - 12 upright(bold(j))$.

  + What is the largest value the directional derivative of $f$ at $\(1\,2\)$ can take, over all directions?
]


#prob(space: 5.4cm)[
  Let $T\(x\,y\,z\)$, measured in degrees Celsius, be the temperature at the point $\(x\,y\,z\)$ of a server room, where $x$, $y$, $z$ are measured in metres. It is given that $ nabla T\(x\,y\,z\)= ⟨thin y^2 - z \, med 2 x y \, med 4 - x thin⟩ . $ A sensor drone flies through the room so that its position at time $t$ seconds is $upright(bold(r))\(t\)= ⟨t^2 \, med 2 t - 1 \, med t^3⟩$. Find the rate of change, in degrees Celsius per second, of the temperature recorded by the drone at time $t = 1$.
]


#endpart()
#parthead[C][Extreme Values and Lagrange Multipliers][Thomas 13.7--13.8 ~•~~sample final Questions 10--12][5 problems]

#topichead[Critical Points and the Second Derivative Test]

#prob(space: 7.6cm)[
  Find all the critical points of $ f\(x\,y\)= x^2 y - 2 x y + 2 y^2 - 15 y\, $ and classify each as a local maximum point, a local minimum point, or a saddle point. Give the value of $f$ at each local extremum.
]


#prob(space: 6.6cm)[
  Determine all the saddle points and all the local extrema of $ f\(x\,y\)= x^3 - 12 x y + 8 y^3 . $
]


#topichead[Absolute Extrema on a Closed Disk]

#prob(space: 8.4cm)[
  Let $f\(x\,y\)= x^2 + 2 y^2 - x$.

  + Find the critical point of $f$ and its type.

  + Write down the system of three equations in $x$, $y$, and $lambda$ that the method of Lagrange multipliers gives for the extreme values of $f$ on the circle $x^2 + y^2 = 1$.

  + Find the maximum and minimum values of $f$ on the closed disk $x^2 + y^2 lt.eq 1$.
]


#topichead[The Method of Lagrange Multipliers]

#prob(space: 7.4cm)[
  #strong[Constrained extrema.]

  + Find the maximum and minimum values of $f\(x\,y\)= x y^2$ on the circle $x^2 + y^2 = 3$.

  + Find the point on the plane $2 x - y + 2 z = 18$ closest to the origin, and its distance from the origin.
]


#prob(space: 5.8cm)[
  Three positive numbers $x$, $y$, $z$ have sum $12$. Find the largest possible value of the product $x y^2 z^3$, and the values of $x$, $y$, $z$ at which it is attained.
]


#endpart()
#parthead[D][Double Integrals in Rectangular Coordinates][Thomas 14.1--14.3 ~•~~sample final Questions 13--17][8 problems]

#topichead[Double Integrals over Rectangles]

#prob(space: 7.6cm)[
  #strong[Rectangles.] #h(0.8em) Evaluate each double integral.

  + $display(integral.double_R (4 x^3 + 6 x y^2) d A)$, #h(0.8em) $R : med 0 lt.eq x lt.eq 1\,med 0 lt.eq y lt.eq 2$

  + $display(integral.double_R x cos\(x y\)thin d A)$, #h(0.8em) $R : med 0 lt.eq x lt.eq pi\/2\,med 0 lt.eq y lt.eq 1$

  + $display(integral.double_R frac(y, 1 + x y) thin d A)$, #h(0.8em) $R : med 0 lt.eq x lt.eq 1\,med 0 lt.eq y lt.eq 1$

  #fmt[In parts (b) and (c) one order of integration is much easier than the other.]
]


#prob(space: 6.2cm)[
  #strong[Integrals of products.]

  + Let $f$ be a continuous function with $display(integral_0^8 f\(t\)thin d t = 12)$, and let $R$ be the rectangle bounded by the lines $x = 0$, $x = 4$, $y = 0$, $y = 2$. Find the value of $display(integral.double_R f\(2 x\)thin f\(4 y\)thin d A)$.

  + Let $g$ be a continuous function with $display(integral_0^1 g\(t\)thin d t = 5)$, and let $S$ be the unit square $0 lt.eq x lt.eq 1$, $0 lt.eq y lt.eq 1$. Find the value of $display(integral.double_S\(g\(x\)+ g\(y\)\)thin d A)$.
]


#topichead[Double Integrals over General Regions]

#prob(space: 6.6cm)[
  Consider the triangular region $R$ in the $x y$-plane with vertices $\(1\,1\)$, $\(5\,1\)$, and $\(3\,5\)$. Compute $display(integral.double_R y thin d A)$.
]


#prob(space: 7.0cm)[
  Let $R$ be the region in the $x y$-plane bounded by the parabola $y = x^2$ and the line $y = 2 x + 3$.

  + Find the area of $R$.

  + Find $display(integral.double_R x thin d A)$, and deduce the $x$-coordinate of the centroid of $R$.
]


#prob(space: 6.6cm)[
  Let $R$ be the region in the first quadrant bounded by the curve $y = sqrt(x)$, the line $x + y = 2$, and the $x$-axis. Sketch $R$, and evaluate $display(integral.double_R y thin d A)$ using a #emph[single] iterated integral.
]


#topichead[Reversing the Order of Integration]

#prob(space: 10.4cm)[
  #strong[Reversing the order.] #h(0.8em) Sketch the region of integration and evaluate each iterated integral by reversing the order of integration.

  + $display(integral_0^1 #h(-0.167em) #h(-0.167em) integral_(sqrt(x))^1 sqrt(1 + y^3) thin d y thin d x)$

  + $display(integral_0^4 #h(-0.167em) #h(-0.167em) integral_(y\/2)^2 e^(x^2) thin d x thin d y)$

  + $display(integral_0^(pi\/2) #h(-0.167em) #h(-0.167em) integral_x^(pi\/2) frac(cos y, y) thin d y thin d x)$

  + $display(integral_0^8 #h(-0.167em) #h(-0.167em) integral_(x^(1\/3))^2 frac(1, y^4 + 1) thin d y thin d x)$
]


#prob(space: 6.4cm)[
  The sum $ integral_0^1 #h(-0.167em) #h(-0.167em) integral_0^x x y thin d y thin d x + integral_1^2 #h(-0.167em) #h(-0.167em) integral_0^(2 - x) x y thin d y thin d x $ is a double integral of $x y$ over a single region $R$. Sketch $R$, write the sum as one iterated integral with the order $d x thin d y$, and evaluate it.
]


#topichead[Volume]

#prob(space: 6.0cm)[
  Find the volume of the solid that lies below the plane $z = 2 x + y + 1$ and above the region in the $x y$-plane bounded by the parabola $y = x^2$ and the line $y = 1$.
]


#endpart()
#parthead[E][Polar Coordinates and Substitutions][Thomas 14.4, 14.8 ~•~~sample final Questions 18--22][11 problems]

#topichead[Double Integrals in Polar Form]

#prob(space: 8.4cm)[
  #strong[Disks, annuli, and sectors.] #h(0.8em) Evaluate each double integral.

  + $display(integral.double_R e^(-\(x^2 + y^2\)) thin d A)$, where $R$ is the closed disk of radius $2$ centred at the origin.

  + $display(integral.double_R (x^2 + y^2)^(3\/2) d A)$, where $R$ is the part of the annulus $1 lt.eq x^2 + y^2 lt.eq 4$ that lies in the upper half-plane $y gt.eq 0$.

  + $display(integral.double_R y thin d A)$, where $R$ is the region in the first quadrant bounded by the circles $x^2 + y^2 = 1$ and $x^2 + y^2 = 9$ and the lines $y = x$ and $y = sqrt(3) thin x$.
]


#prob(space: 7.8cm)[
  #strong[Circles through the origin.]

  + Let $R$ be the region in the first quadrant bounded by the curve $y = sqrt(4 x - x^2)$ and the $x$-axis. Find $display(integral.double_R 1 / sqrt(x^2 + y^2) thin d A)$.

  + Let $R$ be the closed disk $x^2 + y^2 lt.eq 2 y$. Find $display(integral.double_R y thin d A)$ using polar coordinates, and explain how the answer could have been predicted without integrating.
]


#prob(space: 7.4cm)[
  + Compute $display(1 / pi integral.double_R (x^4 + 2 x^2 y^2 + y^4 - 2 x^2 - 2 y^2 + 4) d A)$, where $R$ is the closed disk of radius $sqrt(2)$ centred at the origin.

  + Evaluate $display(integral_0^2 #h(-0.167em) #h(-0.167em) integral_y^(sqrt(8 - y^2)) frac(1, 1 + x^2 + y^2) thin d x thin d y)$ by changing to polar coordinates.
]


#prob(space: 4.6cm)[
  Find the area enclosed by one leaf of the rose $r = 2 cos 3 theta$.
]


#prob(space: 5.6cm)[
  Let $display(I = integral_0^oo e^(- 4 x^2) thin d x)$. By writing $I^2$ as a double integral over the first quadrant and changing to polar coordinates, find the exact value of $I$.
]


#topichead[Substitutions in Double Integrals]

#prob(space: 6.6cm)[
  Let $D$ be the parallelogram in the $x y$-plane bounded by the lines $ x - 2 y = 0\,#h(2em) x - 2 y = 4\,#h(2em) 2 x + y = 1\,#h(2em) 2 x + y = 6 . $ Compute $display(integral.double_D\(x - 2 y\)thin e^(2 x + y) thin d x thin d y)$, giving the answer in terms of integer powers of $e$.
]


#prob(space: 6.6cm)[
  Let $R$ be the region in the first quadrant of the $x y$-plane bounded by the hyperbolas $x y = 1$ and $x y = 2$ and the lines $y = x$ and $y = 4 x$. Use the change of variables $u = x y$, $v = y\/x$ to compute $display(integral.double_R y^2 thin d A)$.
]


#prob(space: 6.6cm)[
  Let $R$ be the region in the first quadrant of the $x y$-plane bounded by the curves $x^2 - y^2 = 1$, $x^2 - y^2 = 3$, $x y = 1$, and $x y = 4$. Compute $display(integral.double_R (x^4 - y^4) d A)$.

  #fmt[Suggestion. The Jacobian $partial\(u\,v\)\/partial\(x\,y\)$ is much easier to compute than $partial\(x\,y\)\/partial\(u\,v\)$.]
]


#prob(space: 6.6cm)[
  Consider the double integral $ integral.double_R x^2 / y cos #h(-0.167em) (y^2) d A\, $ where $R$ is the region in the first quadrant of the $x y$-plane bounded by the lines $y = 1$, $y = 2$, $y = x$, and $y = 3 x$. Use the change of variables $u = y^2$ and $v = x\/y$ to rewrite the integral as an iterated integral in the variables $u$, $v$ with integration order $d u thin d v$.

  #fmt[\[You do not have to compute the integral.\]]
]


#prob(space: 5.4cm)[
  Let $R$ be the region enclosed by the ellipse $x^2 / 9 + y^2 / 4 = 1$. Evaluate $ integral.double_R (x^2 / 9 + y^2 / 4) d A . $
]


#prob(space: 6.6cm)[
  Let $R$ be the triangle with vertices $\(0\,0\)$, $\(2\,0\)$, and $\(0\,2\)$. Use the change of variables $u = y - x$, $v = y + x$ to evaluate $ integral.double_R e^(\(y - x\)\/\(y + x\)) thin d A . $
]


#endpart()
#parthead[F][Triple Integrals][Thomas 14.5--14.7 ~•~~sample final Questions 23--28][12 problems]

#topichead[Triple Integrals in Rectangular Coordinates]

#prob(space: 7.8cm)[
  #strong[Iterated integrals.] #h(0.8em) Evaluate.

  + $display(integral_0^2 #h(-0.167em) #h(-0.167em) integral_0^1 #h(-0.167em) #h(-0.167em) integral_0^3 (x^2 y + 2 z) d z thin d y thin d x)$

  + $display(integral_0^1 #h(-0.167em) #h(-0.167em) integral_0^(2 x) #h(-0.167em) #h(-0.167em) integral_0^(x + y) 6 z thin d z thin d y thin d x)$

  + $display(integral_(- 1)^1 #h(-0.167em) #h(-0.167em) integral_(- 2)^2 #h(-0.167em) #h(-0.167em) integral_(- 3)^3 (x^3 y^2 + z sin y + 5) d z thin d y thin d x)$

  #fmt[Part (c) should take one line.]
]


#prob(space: 8.4cm)[
  Let $D$ be the tetrahedron in the first octant bounded by the coordinate planes and the plane $x + 2 y + z = 2$.

  + Find the volume of $D$.

  + Evaluate $display(integral.triple_D y thin d V)$.

  + Find the centre of mass of $D$, assuming constant density.
]


#topichead[Triple Integrals in Cylindrical Coordinates]

#prob(space: 6.6cm)[
  Find the volume of the solid bounded below by the paraboloid $z = x^2 + y^2$ and above by the plane $z = 2 y$.
]


#prob(space: 5.6cm)[
  Let $R$ be the solid region bounded by the cylinders $x^2 + y^2 = 1$ and $x^2 + y^2 = 4$ and the planes $z = 0$ and $z = 2$. Compute $ integral.triple_R z (x^2 + y^2)^(3\/2) d x thin d y thin d z . $
]


#prob(space: 6.6cm)[
  Consider the solid region $E$ bounded by the cylinder $x^2 + y^2 = 4$, the horizontal plane $z = 1$, and the plane $z = 5 - y$. Evaluate $ 1 / pi integral.triple_E (x^2 + y^2) d V . $
]


#prob(space: 5.6cm)[
  Let $E$ be the solid consisting of the points $\(x\,y\,z\)$ with $sqrt(x^2 + y^2) lt.eq z lt.eq 3$. Evaluate $display(integral.triple_E z thin d V)$.
]


#prob(space: 5.6cm)[
  Evaluate $ integral_(- 2)^2 #h(-0.167em) #h(-0.167em) integral_(- sqrt(4 - x^2))^(sqrt(4 - x^2)) #h(-0.167em) #h(-0.167em) integral_(sqrt(x^2 + y^2))^2 (x^2 + y^2) d z thin d y thin d x $ by converting to cylindrical coordinates.
]


#topichead[Triple Integrals in Spherical Coordinates]

#prob(space: 8.4cm)[
  #strong[Balls and shells.] #h(0.8em) Evaluate.

  + $display(integral.triple_E sqrt(x^2 + y^2 + z^2) thin d V)$, where $E$ is the set of points with $1 lt.eq x^2 + y^2 + z^2 lt.eq 4$ and $z gt.eq 0$.

  + $display(integral.triple_E z thin d V)$, where $E$ is the upper half of the ball of radius $2$ centred at the origin.

  + $display(integral.triple_E x^2 thin d V)$, where $E$ is the unit ball $x^2 + y^2 + z^2 lt.eq 1$.
]


#prob(space: 5.4cm)[
  Find the volume of the solid that lies above the cone $z = sqrt(3 (x^2 + y^2))$ and inside the sphere $x^2 + y^2 + z^2 = 4$.
]


#prob(space: 8.4cm)[
  + Let $E$ be the solid consisting of the points $\(x\,y\,z\)$ with $sqrt(3 (x^2 + y^2)) lt.eq z lt.eq 3$. Rewrite $ integral.triple_E frac(1, 1 + x^2 + y^2 + z^2) thin d V $ as an iterated integral in spherical coordinates with integration order $d rho thin d phi.alt thin d theta$. #emph[\[You do not have to compute the integral.\]]

  + Let $B$ be the ball $x^2 + y^2 + z^2 lt.eq 2 z$. Evaluate $display(integral.triple_B sqrt(x^2 + y^2 + z^2) thin d V)$.
]


#topichead[Masses, Centres of Mass, and Other Substitutions]

#prob(space: 6.4cm)[
  A solid is bounded below by the paraboloid $z = x^2 + y^2$ and above by the plane $z = 4$. Its density at the point $\(x\,y\,z\)$ is $delta = z$. Find the mass of the solid and the $z$-coordinate of its centre of mass.
]


#prob(space: 5.6cm)[
  Let $E$ be the solid ellipsoid $x^2 / 4 + y^2 / 9 + z^2 lt.eq 1$. Use the substitution $x = 2 u$, $y = 3 v$, $z = w$ to evaluate $display(integral.triple_E z^2 thin d V)$.
]


#endpart()
#parthead[G][Mock Final Examination][28 questions of 2 marks each ~•~~2 hours, closed book, one A4 double-sided helpsheet][28 problems ~|~~56 marks]

#panel[INSTRUCTIONS][
This paper follows the format of the official sample final paper (#emph[FinalExam2610-sample]): 28 questions of #strong[2 marks each], to be worked in one uninterrupted sitting of #strong[two hours]. It is a closed book paper, but you may bring one A4-size, double-sided helpsheet and a non-programmable calculator; the sheet of standard derivatives, integrals, and trigonometric identities is provided.

For each question, #strong[only a legible answer written within the given box is marked]\; all other writing is ignored, so there is no credit for working. Check the requested form of each answer before writing it down. Unless a question says otherwise, give each answer as an integer or a fraction in lowest terms.

\(In the real paper a further 4 marks are given for shading your student number and writing your seat number correctly, for a total of 60.)
]

#prob(space: 4.2cm, answer: true)[
  Evaluate $display(integral_0^1 x^3\(ln x\)^2 thin d x)$.
]


#prob(space: 3.8cm, answer: true)[
  Evaluate $display(lim_(x arrow.r 1) frac(\(x - 1\)ln x, x^2 - 3 x + 2 + ln x))$.
]


#prob(space: 3.6cm, answer: true)[
  Consider the function $f$ given by $display(f\(x\)= integral_(x + 1)^(x^2 + 2) frac(1, t^3 + 1) thin d t)$. Find $f'\(1\)$.
]


#prob(space: 3.8cm, answer: true)[
  Let $P =\(2\,1\,- 1\)$ and $Q =\(0\,2\,3\)$. Find the point of intersection between the plane $x + 2 y + z = 9$ and the line through $P$ and $Q$.

  #fmt[Give the answer in the form $\(a\,b\,c\)$, where $a$, $b$, $c$ are real numbers.]
]


#prob(space: 3.8cm, answer: true)[
  Let $S$ be the surface in $x y z$-space defined by the equation $2 x^2 + y^2 - 3 z = 3$. Find the point on $S$ at which the tangent plane to $S$ is parallel to the plane $8 x - 4 y - 6 z = 7$.

  #fmt[Give the answer in the form $\(a\,b\,c\)$, where $a$, $b$, $c$ are real numbers.]
]


#prob(space: 3.8cm, answer: true)[
  Find the function $f\(x\,y\)$ such that $ frac(partial f, partial x) = 3 x^2 y + e^x\,#h(2em) frac(partial f, partial y) = x^3 - 2 sin 2 y\, $ and $f\(0\,0\)= 5$.

  #fmt[Give the answer as an expression in terms of $x$ and $y$.]
]


#prob(space: 3.8cm, answer: true)[
  Let $u = x^2 y$, let $v = v\(x\,y\)$ be such that $display(frac(partial v, partial x) = - 3 x^2)$ and $display(frac(partial v, partial y) = 4 y)$, let $w = x - 2 y$, and let $z = u w + v$. Determine $display(frac(partial z, partial x))$ as a function of $x$, $y$.
]


#prob(space: 3.4cm, answer: true)[
  Consider the function $f\(x\,y\)= x^3 - x y^2$. Find the directional derivative of $f$ at the point $\(2\,1\)$ in the direction of the vector $3 upright(bold(i)) - 4 upright(bold(j))$.
]


#prob(space: 3.6cm, answer: true)[
  Let $C\(x\,y\,z\)$, measured in parts per million, be the concentration of a gas at the point $\(x\,y\,z\)$, where $x$, $y$, $z$ are measured in metres. It is given that $nabla C\(x\,y\,z\)= ⟨2 x - z \, med 3 y^2 \, med 2 - x⟩$. The position of a probe at time $t$ seconds is $upright(bold(r))\(t\)= ⟨2 t \, med t^2 \, med t^3 - 1⟩$. Let $A$ be the real number such that the rate of change of the concentration measured by the probe at time $t = 1$ is $A$ parts per million per second. Find the value of $A$.
]


#prob(space: 5.2cm, answer: true)[
  Determine all saddle points of the function $f\(x\,y\)= 3 x^2 y + y^3 - 3 y$.
]


#prob(space: 3.0cm, answer: true)[
  Keep the notation of the previous question. Write down the system of three polynomial equations in the unknowns $x$, $y$ and a parameter $lambda$ that you need to solve if you use the method of Lagrange multipliers to find the maximum value of $f\(x\,y\)= 3 x^2 y + y^3 - 3 y$ on the circle $x^2 + y^2 = 3$.
]


#prob(space: 5.6cm, answer: true)[
  Keep the notation of the previous question. It is given that $\(0\,- 1\)$ is the only local maximum point of $f\(x\,y\)= 3 x^2 y + y^3 - 3 y$ in the $x y$-plane. Determine the maximum value of $f\(x\,y\)$ on the closed disk of radius $sqrt(3)$ centred at $\(0\,0\)$.
]


#prob(space: 3.4cm, answer: true)[
  Let $R$ be the region in the $x y$-plane bounded by the lines $x = 0$, $x = 3$, $y = 0$, $y = 2$. Evaluate $display(integral.double_R (6 x y^2 + 2 x) d A)$.
]


#prob(space: 5.0cm, answer: true)[
  Consider the triangular region $R$ in the $x y$-plane with vertices at $\(0\,1\)$, $\(3\,1\)$, and $\(1\,4\)$. Compute $display(integral.double_R x thin d A)$.
]


#prob(space: 4.6cm, answer: true)[
  Let $R$ be the region in the $x y$-plane bounded by the curve $y = x^2 - 2$ and the line $y = x$. Find the value of $display(integral.double_R y thin d A)$.
]


#prob(space: 4.4cm, answer: true)[
  Find the exact value of the iterated integral $display(integral_0^4 #h(-0.167em) #h(-0.167em) integral_(sqrt(x))^2 1 / sqrt(y^3 + 1) thin d y thin d x)$.
]


#prob(space: 3.6cm, answer: true)[
  Let $f\(t\)$ be a function such that $display(integral_0^12 f\(t\)thin d t = 30)$. Let $R$ be the region in the $x y$-plane bounded by the lines $x = 0$, $x = 4$, $y = 0$, and $y = 6$. Find the value of $display(integral.double_R f\(3 x\)thin f\(2 y\)thin d A)$.
]


#prob(space: 4.4cm, answer: true)[
  Consider the region $R$ in the first quadrant of the $x y$-plane bounded by the curve $y = sqrt(2 x - x^2)$ and the $x$-axis. Find the value of $display(integral.double_R frac(x, x^2 + y^2) thin d A)$.

  #fmt[Give the answer in terms of $pi$.]
]


#prob(space: 3.8cm, answer: true)[
  Compute $display(1 / pi integral.double_R (2 + 3 x^4 + 6 x^2 y^2 + 3 y^4) d A)$, where $R$ is the closed disk of unit radius centred at the origin.
]


#prob(space: 5.6cm, answer: true)[
  Let $D$ be the parallelogram in the $x y$-plane bounded by the lines $y = x$, $y = x + 3$, $y = - 2 x$, $y = - 2 x + 6$. Compute $display(integral.double_D e^y thin d y thin d x)$.

  #fmt[Give the answer as an expression in terms of integer powers of $e$.]
]


#prob(space: 5.6cm, answer: true)[
  Let $R$ be the region in the first quadrant of the $x y$-plane bounded by the curves $x^2 + y^2 = 1$, $x^2 + y^2 = 4$ and the lines $y = 3 x$, $y = 3 x + 1$. Compute $display(integral.double_R\(x + 3 y\)(x^2 + y^2)^2 d y thin d x)$.
]


#prob(space: 5.0cm, answer: true)[
  Consider the double integral $display(integral.double_R x^2 e^(x y) thin d A)$, where $R$ is the region in the first quadrant of the $x y$-plane bounded by the curves $x y = 1$, $x y = 3$ and the lines $y = x$, $y = 2 x$. Use the change of variables $u = x y$ and $v = y\/x$ to rewrite the double integral as an iterated integral in the variables $u$, $v$ with integration order $d u thin d v$. #emph[\[You do not have to compute the integral.\]]

  #fmt[Give the answer in the form $display(integral_a^b #h(-0.167em) integral_c^d g\(u\,v\)thin d u thin d v)$, where $a$ and $b$ are real numbers, $c$ and $d$ are real numbers or expressions in terms of $v$, and $g\(u\,v\)$ is an expression in terms of $u$ and $v$.]
]


#prob(space: 3.2cm, answer: true)[
  Compute $display(integral_(- 1)^1 #h(-0.167em) #h(-0.167em) integral_(- 1)^1 #h(-0.167em) #h(-0.167em) integral_(- 1)^1 (x^2 + y z^3) d z thin d y thin d x)$.
]


#prob(space: 3.8cm, answer: true)[
  Compute the integral $display(integral_0^1 #h(-0.167em) #h(-0.167em) integral_0^x #h(-0.167em) #h(-0.167em) integral_(x + y)^3 d z thin d y thin d x)$.
]


#prob(space: 4.4cm, answer: true)[
  Let $R$ be the solid region in $x y z$-space bounded by the surface $x^2 + y^2 = 4$, the surface $x^2 + y^2 = 1$, the plane $z = 3$, and the plane $z = 0$. Compute $display(integral.triple_R z (x^2 + y^2) d x thin d y thin d z)$.

  #fmt[Give the answer in terms of $pi$.]
]


#prob(space: 5.0cm, answer: true)[
  Consider the solid region $E$ in $x y z$-space bounded by the cylinder $x^2 + y^2 = 4$, the horizontal plane $z = 1$, and the surface $z = 4 + y$. Evaluate $display(1 / pi integral.triple_E (x^2 + y^2) d V)$.
]


#prob(space: 4.0cm, answer: true)[
  Let $E$ be the ball consisting of the points $\(x\,y\,z\)$ in $x y z$-space such that $x^2 + y^2 + z^2 lt.eq 4$. Evaluate $display(integral.triple_E sqrt(x^2 + y^2 + z^2) thin d V)$.

  #fmt[Give the answer in terms of $pi$.]
]


#prob(space: 5.0cm, answer: true)[
  Let $E$ be the solid region in $x y z$-space consisting of the points $\(x\,y\,z\)$ such that $display(sqrt(frac(x^2 + y^2, 3)) lt.eq z lt.eq 3)$. Rewrite the triple integral $ integral.triple_E frac(z^2, 1 + x^2 + y^2 + z^2) thin d V $ as an iterated integral in spherical coordinates with integration order $d rho thin d phi.alt thin d theta$. #emph[\[You do not have to compute the integral.\]]

  #fmt[Give the answer in the form $display(integral_a^b #h(-0.167em) integral_c^d #h(-0.167em) integral_e^f g\(rho\,phi.alt\,theta\)thin d rho thin d phi.alt thin d theta)$, where $a$ and $b$ are real numbers, $c$ and $d$ are expressions in terms of $theta$, and $e$ and $f$ are expressions in terms of $theta$ and $phi.alt$ (some of which may be real numbers).]
]


#endpart()
#part-title.update("Answers")
#pagebreak(weak: true)
#line(length: 100%, stroke: 2.6pt + blue)
#v(-6pt)
#text(font: sans, weight: "bold", size: 21pt, fill: blue)[Answers]
#v(-6pt)
#text(style: "italic", size: 10pt, fill: soft)[Consult these only after a complete attempt. Each answer is followed by the key step, so that a wrong answer can be traced to the line where it went wrong.]
#v(-5pt)
#line(length: 100%, stroke: 1.1pt + blue)
#v(2pt)

#set text(size: 9.3pt)
#show math.equation: set text(size: 9pt)
#set par(leading: 0.55em, spacing: 0.7em)
#show: columns.with(2, gutter: 0.8cm)
#let ah(t) = block(above: 12pt, below: 6pt, sticky: true, text(font: sans, weight: "bold", size: 9.5pt, fill: blue, t))
#let an(n) = text(weight: "bold", fill: deep)[#n.]

#ah[Part A]
#strong[\1.] In general $integral_0^1 x^n ln x thin d x = - frac(1, \(n + 1\)^2)$ and $integral_0^1 x^n\(ln x\)^2 d x = frac(2, \(n + 1\)^3)$, the boundary terms vanishing by L'Hôpital. #h(0.6em) (a) $2 / 27$. #h(0.6em) (b) $- 4$. #h(0.6em) (c) $1 / 4$ (parts with $u = ln x$). #h(0.6em) (d) $2 / 27$ (parts twice, or $n !\/a^(n + 1)$).

#strong[\2.] (a) $2 / 5$: two applications of L'Hôpital give $frac(1\/x + 3\/x^2, 2 - 3\/x^2)$ at $x = 3$. #h(0.6em) (b) $9 / 4$. #h(0.6em) (c) $e^6$.

#strong[\3.] (a) $frac(3 x^2, x^6 + 4) - frac(2, \(2 x - 1\)^2 + 4)$ at $x = 2$: $12 / 68 - 2 / 13 = 5 / 221$. #h(0.6em) (b) $2 x sqrt(1 + x^6) - sqrt(1 + x^3)$ at $x = 2$: $4 sqrt(65) - 3$. #h(0.6em) (c) $F'\(x\)= 2 x (x^2 - 4) e^(- x^2)$ changes from negative to positive at $x = 2$.

#ah[Part B]
#strong[\4.] (a) $upright(bold(r)) =\(1 + 3 t\,thin - 2 + 2 t\,thin 3 - 2 t\)$\; $11 + 3 t = 5$, $t = - 2$: $\(- 5\,- 6\,7\)$. #h(0.6em) (b) $cos theta = frac(- 3, 6)$, so $a = 2 / 3$. #h(0.6em) (c) $upright(bold(n)) = chevron.l 1\,- 1\,3 chevron.r times chevron.l - 1\,1\,1 chevron.r = chevron.l - 4\,- 4\,0 chevron.r$: the plane is $x + y = 2$, and the distance is $5 / sqrt(2) = frac(5 sqrt(2), 2)$.

#strong[\5.] (a) $chevron.l 2 x\,8 y\,- 1 chevron.r = lambda chevron.l 4\,- 8\,- 2 chevron.r$ gives $lambda = 1 / 2$, $x = 1$, $y = - 1 / 2$, then $z = - 3$: $(1 \, - 1 / 2 \, - 3)$. #h(0.6em) (b) $nabla F = chevron.l 4\,2\,14 chevron.r$: $2 x + y + 7 z = 18$.

#strong[\6.] (a) $f = x^2 e^y + y cos x + y^2 + 3$\;~$f\(pi\,1\)= pi^2 e + 3$. #h(0.6em) (b) $g_(x y) = 2 k x y + 3$ must equal $g_(y x) = 8 x y + 3$, so $k = 4$ and $g = 2 x^2 y^2 + 3 x y + y + C$.

#strong[\7.] $z_x =\(2 u + w\)u_x - 3 v_x + u thin w_x = 6 x^2 y + 8 x y^2 - 2 y^2 - 12 x$.

#strong[\8.] $nabla f\(1\,2\)= chevron.l 1\,4 chevron.r$. #h(0.6em) (a) $frac(5 - 48, 13) = - 43 / 13$. #h(0.6em) (b) $\|nabla f\|= sqrt(17)$.

#strong[\9.] $upright(bold(r))\(1\)=\(1\,1\,1\)$, $nabla T = chevron.l 0\,2\,3 chevron.r$, $upright(bold(r))'\(1\)= chevron.l 2\,2\,3 chevron.r$: $13 med zws^compose upright(C\/s)$.

#ah[Part C]
#strong[\10.] $f_x = 2 y\(x - 1\)$, $f_y = x^2 - 2 x + 4 y - 15$\; $D = 8 y -\(2 x - 2\)^2$. Saddle points at $\(5\,0\)$ and $\(- 3\,0\)$ ($D = - 64$); local minimum $- 32$ at $\(1\,4\)$ ($D = 32$, $f_(x x) = 8$).

#strong[\11.] Critical points $\(0\,0\)$ and $\(2\,1\)$\; $D = 288 x y - 144$. Saddle point at $\(0\,0\)$\; local minimum $- 8$ at $\(2\,1\)$. No local maximum.

#strong[\12.] (a) $(1 / 2 \, 0)$, a local minimum ($D = 8$), $f = - 1 / 4$. #h(0.6em) (b) $2 x - 1 = 2 lambda x$,~~$4 y = 2 lambda y$,~~$x^2 + y^2 = 1$. #h(0.6em) (c) $y = 0$ gives $f\(1\,0\)= 0$, $f\(- 1\,0\)= 2$\; $lambda = 2$ gives $x = - 1 / 2$, $y = plus.minus sqrt(3) / 2$, $f = 9 / 4$. Maximum $9 / 4$, minimum $- 1 / 4$.

#strong[\13.] (a) $y^2 = 2 x^2$, so $x = plus.minus 1$: maximum $2$ at $\(1\,plus.minus sqrt(2)\)$, minimum $- 2$ at $\(- 1\,plus.minus sqrt(2)\)$. #h(0.6em) (b) $\(4\,- 2\,4\)$, at distance $6$.

#strong[\14.] $y = 2 x$, $z = 3 x$, so $\(x\,y\,z\)=\(2\,4\,6\)$ and the maximum is $2 dot.op 16 dot.op 216 = 6912$.

#ah[Part D]
#strong[\15.] (a) $10$. #h(0.6em) (b) $1$ (integrate in $y$ first). #h(0.6em) (c) $2 ln 2 - 1$ (integrate in $x$ first).

#strong[\16.] (a) $(1 / 2 dot.op 12) (1 / 4 dot.op 12) = 18$. #h(0.6em) (b) $5 + 5 = 10$.

#strong[\17.] $integral_1^5 #h(-0.167em) #h(-0.167em) integral_(\(y + 1\)\/2)^(\(11 - y\)\/2) y thin d x thin d y = 56 / 3$ (area $8$ times $macron(y) = 7 / 3$).

#strong[\18.] The curves meet at $x = - 1$ and $x = 3$. #h(0.6em) (a) $32 / 3$. #h(0.6em) (b) $32 / 3$, so $macron(x) = 1$.

#strong[\19.] $integral_0^1 #h(-0.167em) #h(-0.167em) integral_(y^2)^(2 - y) y thin d x thin d y = 5 / 12$.

#strong[\20.] (a) $integral_0^1 y^2 sqrt(1 + y^3) thin d y = 2 / 9 (2 sqrt(2) - 1)$. #h(0.6em) (b) $integral_0^2 2 x e^(x^2) d x = e^4 - 1$. #h(0.6em) (c) $integral_0^(pi\/2) cos y thin d y = 1$. #h(0.6em) (d) $integral_0^2 frac(y^3, y^4 + 1) d y = 1 / 4 ln 17$.

#strong[\21.] $R$ is the triangle with vertices $\(0\,0\)$, $\(2\,0\)$, $\(1\,1\)$: $integral_0^1 #h(-0.167em) #h(-0.167em) integral_y^(2 - y) x y thin d x thin d y = 1 / 3$.

#strong[\22.] $integral_(- 1)^1 #h(-0.167em) #h(-0.167em) integral_(x^2)^1\(2 x + y + 1\)thin d y thin d x = 32 / 15$ (the term $2 x$ integrates to $0$ by symmetry).

#ah[Part E]
#strong[\23.] (a) $pi (1 - e^(- 4))$. #h(0.6em) (b) $frac(31 pi, 5)$. #h(0.6em) (c) $integral_(pi\/4)^(pi\/3) sin theta thin d theta integral_1^3 r^2 d r = 13 / 3 (sqrt(2) - 1)$.

#strong[\24.] (a) $r = 4 cos theta$, $0 lt.eq theta lt.eq pi / 2$: $integral_0^(pi\/2) 4 cos theta thin d theta = 4$. #h(0.6em) (b) $r = 2 sin theta$, $0 lt.eq theta lt.eq pi$: $8 / 3 integral_0^pi sin^4 theta thin d theta = pi$. The disk has area $pi$ and centroid $\(0\,1\)$, so $integral.double y thin d A = macron(y) dot.op upright("area") = pi$.

#strong[\25.] (a) The integrand is $r^4 - 2 r^2 + 4$: $20 / 3$. #h(0.6em) (b) The region is $0 lt.eq theta lt.eq pi / 4$, $0 lt.eq r lt.eq 2 sqrt(2)$: $pi / 4 ln 3$.

#strong[\26.] $1 / 2 integral_(- pi\/6)^(pi\/6) 4 cos^2 3 theta thin d theta = pi / 3$.

#strong[\27.] $I^2 = integral_0^(pi\/2) #h(-0.167em) integral_0^oo e^(- 4 r^2) r thin d r thin d theta = pi / 16$, so $I = sqrt(pi) / 4$.

#strong[\28.] $u = x - 2 y$, $v = 2 x + y$, $partial\(u\,v\)\/partial\(x\,y\)= 5$: $1 / 5 integral_0^4 u thin d u integral_1^6 e^v d v = 8 / 5 (e^6 - e)$.

#strong[\29.] $partial\(u\,v\)\/partial\(x\,y\)= 2 v$ and $y^2 = u v$: $integral_1^4 #h(-0.167em) integral_1^2 u / 2 thin d u thin d v = 9 / 4$.

#strong[\30.] $u = x^2 - y^2$, $v = x y$, $partial\(u\,v\)\/partial\(x\,y\)= 2 (x^2 + y^2)$, so the integrand becomes $u / 2$: $integral_1^4 #h(-0.167em) integral_1^3 u / 2 thin d u thin d v = 6$.

#strong[\31.] $x = v sqrt(u)$, $y = sqrt(u)$, $lr(|partial \( x \, y \) \/ partial \( u \, v \)|) = 1 / 2$: $integral_(1\/3)^1 #h(-0.167em) #h(-0.167em) integral_1^4 1 / 2 sqrt(u) thin v^2 cos u thin d u thin d v$.

#strong[\32.] $x = 3 r cos theta$, $y = 2 r sin theta$, Jacobian $6 r$: $6 integral_0^(2 pi) #h(-0.167em) integral_0^1 r^3 d r thin d theta = 3 pi$.

#strong[\33.] Jacobian $1 / 2$\; the triangle becomes $0 lt.eq v lt.eq 2$, $- v lt.eq u lt.eq v$: $1 / 2 integral_0^2 v (e - e^(- 1)) d v = e - 1 / e$.

#ah[Part F]
#strong[\34.] (a) $22$. #h(0.6em) (b) $13 / 2$. #h(0.6em) (c) $240$: the first two terms are odd in $x$ and in $z$ respectively, and the box has volume $48$.

#strong[\35.] (a) $2 / 3$. #h(0.6em) (b) $1 / 6$. #h(0.6em) (c) $(1 / 2 \, 1 / 4 \, 1 / 2)$, one quarter of the way to each intercept.

#strong[\36.] The shadow is the disk $r lt.eq 2 sin theta$: $integral_0^pi #h(-0.167em) integral_0^(2 sin theta) (2 r sin theta - r^2) r thin d r thin d theta = 4 / 3 integral_0^pi sin^4 theta thin d theta = pi / 2$.

#strong[\37.] $2 pi integral_1^2 r^4 d r integral_0^2 z thin d z = frac(124 pi, 5)$.

#strong[\38.] $1 / pi integral_0^(2 pi) #h(-0.167em) integral_0^2 r^3\(4 - r sin theta\)thin d r thin d theta = 32$.

#strong[\39.] $2 pi integral_0^3 #h(-0.167em) integral_r^3 z r thin d z thin d r = frac(81 pi, 4)$.

#strong[\40.] $2 pi integral_0^2 r^3\(2 - r\)thin d r = frac(16 pi, 5)$.

#strong[\41.] (a) $2 pi integral_1^2 rho^3 d rho = frac(15 pi, 2)$. #h(0.6em) (b) $4 pi$. #h(0.6em) (c) By symmetry $integral.triple x^2 = 1 / 3 integral.triple rho^2 = frac(4 pi, 15)$.

#strong[\42.] The cone is $phi.alt = pi / 6$: $2 pi (1 - sqrt(3) / 2) 8 / 3 = frac(8 pi, 3) (2 - sqrt(3))$.

#strong[\43.] (a) $integral_0^(2 pi) #h(-0.167em) #h(-0.167em) integral_0^(pi\/6) #h(-0.167em) #h(-0.167em) integral_0^(3 sec phi.alt) frac(rho^2 sin phi.alt, 1 + rho^2) thin d rho thin d phi.alt thin d theta$. #h(0.6em) (b) The ball is $rho lt.eq 2 cos phi.alt$, $0 lt.eq phi.alt lt.eq pi / 2$: $2 pi integral_0^(pi\/2) 4 cos^4 phi.alt sin phi.alt thin d phi.alt = frac(8 pi, 5)$.

#strong[\44.] Slicing by horizontal disks of area $pi z$: $M = integral_0^4 pi z^2 d z = frac(64 pi, 3)$ and $macron(z) = 1 / M integral_0^4 pi z^3 d z = 3$.

#strong[\45.] Jacobian $6$, and $integral.triple_(upright("unit ball")) w^2 = frac(4 pi, 15)$: $frac(8 pi, 5)$.

#ah[Part G]
#strong[\46.] $1 / 32$. #h(0.6em) #strong[\47.] $2$. #h(0.6em) #strong[\48.] $2 / 28 - 1 / 9 = - 5 / 126$.

#strong[\49.] $t = 3 / 2$: $(- 1 \, 5 / 2 \, 5)$. #h(0.6em) #strong[\50.] $\(1\,- 1\,0\)$.

#strong[\51.] $x^3 y + e^x + cos 2 y + 3$. #h(0.6em) #strong[\52.] $3 x^2 y - 4 x y^2 - 3 x^2$.

#strong[\53.] $nabla f = chevron.l 11\,- 4 chevron.r$: $49 / 5$. #h(0.6em) #strong[\54.] $chevron.l 4\,3\,0 chevron.r dot.op chevron.l 2\,2\,3 chevron.r = 14$.

#strong[\55.] $\(1\,0\)$ and $\(- 1\,0\)$ (and $\(0\,1\)$ is a local minimum, $\(0\,- 1\)$ a local maximum).

#strong[\56.] $6 x y = 2 lambda x$, #h(0.6em) $3 x^2 + 3 y^2 - 3 = 2 lambda y$, #h(0.6em) $x^2 + y^2 = 3$.

#strong[\57.] Interior: $f\(0\,- 1\)= 2$. Boundary: $x = 0$ gives $f = 0$\; $lambda = 3 y$ gives $y = plus.minus 1$, $x = plus.minus sqrt(2)$, $f = 4 y$. Maximum $4$.

#strong[\58.] $90$. #h(0.6em) #strong[\59.] $integral_1^4 #h(-0.167em) integral_(\(y - 1\)\/3)^(\(11 - 2 y\)\/3) x thin d x thin d y = 6$. #h(0.6em) #strong[\60.] $- 9 / 5$.

#strong[\61.] $integral_0^2 y^2 / sqrt(y^3 + 1) d y = 4 / 3$. #h(0.6em) #strong[\62.] $10 dot.op 15 = 150$. #h(0.6em) #strong[\63.] $integral_0^(pi\/2) 2 cos^2 theta thin d theta = pi / 2$.

#strong[\64.] $3$. #h(0.6em) #strong[\65.] $u = y - x$, $v = y + 2 x$, $y = frac(2 u + v, 3)$, Jacobian $1 / 3$: $3 / 2 (e^2 - 1)^2$.

#strong[\66.] $u = x^2 + y^2$, $v = y - 3 x$, $partial\(u\,v\)\/partial\(x\,y\)= 2\(x + 3 y\)$: $integral_0^1 #h(-0.167em) integral_1^4 u^2 / 2 thin d u thin d v = 21 / 2$.

#strong[\67.] $integral_1^2 #h(-0.167em) #h(-0.167em) integral_1^3 frac(u thin e^u, 2 v^2) thin d u thin d v$. #h(0.6em) #strong[\68.] $8 / 3$. #h(0.6em) #strong[\69.] $1$.

#strong[\70.] $frac(135 pi, 4)$. #h(0.6em) #strong[\71.] $24$. #h(0.6em) #strong[\72.] $16 pi$.

#strong[\73.] $integral_0^(2 pi) #h(-0.167em) #h(-0.167em) integral_0^(pi\/3) #h(-0.167em) #h(-0.167em) integral_0^(3 sec phi.alt) frac(rho^4 cos^2 phi.alt thin sin phi.alt, 1 + rho^2) thin d rho thin d phi.alt thin d theta$.

#emph[Scoring.] Two marks for each correct boxed answer, out of $56$\; an answer in the wrong form (an unreduced fraction, a decimal, a missing Jacobian in a "rewrite" question) scores $0$.

#v(6pt)
#line(length: 100%, stroke: 0.5pt + rulegray)
#text(font: sans, size: 8pt, fill: soft)[All problems in this set are original. They are modelled on the question types of the MA1521 sample final paper and of the Lecture Group 1 and Lecture Group 2 lesson notes for Weeks 8--11, and on the exercise sets of #emph[Thomas' Calculus: Early Transcendentals], 15th edition (Hass, Heil, Weir), Chapters 13 and 14.]
