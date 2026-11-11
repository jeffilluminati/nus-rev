// MA1521 Calculus for Computing — Midterm Exercise Set
// Typeset in Typst on A4; converted from the earlier LaTeX edition.

#import "exset.typ": *
#show: exset.with(module: "MA1521", running: "Midterm Exercise Set")
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
  text(font: sans, size: 9.5pt, fill: soft)[Exercise Set M#h(0.5em);(Midterm Revision)\
    Name: #box(width: 3.2cm, stroke: (bottom: 0.4pt + soft))\
    Date: #box(width: 3.2cm, stroke: (bottom: 0.4pt + soft))])
#v(12pt)
#text(font: sans, weight: "bold", size: 28pt, fill: blue)[Vectors, Space Curves,\ and Partial Derivatives]
#v(-2pt)
#text(style: "italic", size: 11.5pt, fill: deep)[Thomas' Calculus: Early Transcendentals, 15/e #h(0.4em)•#h(0.4em) Sections 11.1–11.5, 12.1–12.3, and Chapter 13 complete]
#v(-3pt)
#text(style: "italic", size: 10.5pt, fill: soft)[MIT 18.02 Multivariable Calculus #h(0.4em)•#h(0.4em) Lectures 1–13]
#v(-4pt)
#line(length: 100%, stroke: 1.4pt + blue)
#v(4pt)

#panel[HOW TO USE THIS SET][
The set is arranged in five parts. Parts~A and~B rebuild the geometric machinery (§11.1--11.5, §12.1--12.3); Parts~C and~D are the heart of the midterm and cover Chapter~13 in full, from level curves through Lagrange multipliers; Part~E is a timed simulation assembled from all of the above.

Every problem is followed by a ruled panel sized to the work it should take. Do the problem #emph[inside] the panel --- if your work spills out of the box, you are almost certainly computing something the problem did not ask for. Answers to all problems begin on the last pages; consult them only after a complete attempt.

Problems are drawn from the exercise sets of Thomas' Calculus 15/e, from the MIT 18.02 problem sets used in Lecture Group~1, and from the tutorial questions of Lecture Group~2. The source of each part is recorded in its banner.
]

#topichead[Distribution of Problems]

#figure(
  align(center)[#table(stroke: none, inset: (x: 6pt, y: 3.5pt),
    columns: (6%, 44%, 26%, 14%),
    align: (left,left,left,left,),
    table.header([#strong[Part]], [#strong[Topic]], [#strong[Thomas sections]], [#strong[Problems]],),
    table.hline(),
    [A], [Vectors and the Geometry of Space], [11.1--11.5], [1--9],
    [B], [Vector-Valued Functions and Motion], [12.1--12.3], [10--15],
    [C], [Partial Derivatives, Chain Rule, Gradient], [13.1--13.6], [16--38],
    [D], [Extreme Values and Lagrange Multipliers], [13.7--13.9], [39--52],
    [E], [Midterm Simulation (90 minutes)], [11--13], [53--58],
  )]
  , kind: table
  )

#topichead[Results You Are Expected to Know Cold]

#panel[THEOREM 1 --- Angle Between Two Vectors][
The angle $theta$ between two nonzero vectors $upright(bold(u)) = chevron.l u_1\,u_2\,u_3 chevron.r$ and $upright(bold(v)) = chevron.l v_1\,v_2\,v_3 chevron.r$ is $ theta = cos^(- 1) #h(-0.167em) (frac(upright(bold(u)) dot.op upright(bold(v)), \|upright(bold(u))\|thin\|upright(bold(v))\|))\,#h(2em) upright(bold(u)) dot.op upright(bold(v)) = u_1 v_1 + u_2 v_2 + u_3 v_3 . $

$ "proj"_(upright(bold(v))) upright(bold(u)) = (frac(upright(bold(u)) dot.op upright(bold(v)), \|upright(bold(v))\|^2)) upright(bold(v))\,#h(2em)\|upright(bold(u)) times upright(bold(v))\|=\|upright(bold(u))\|thin\|upright(bold(v))\|sin theta\,#h(2em)\|thin\(upright(bold(u)) times upright(bold(v))\)dot.op upright(bold(w)) thin\|=\|det\[upright(bold(u)) med upright(bold(v)) med upright(bold(w))\]\|. $
]

#panel[DEFINITION --- Arc Length Along a Space Curve][
For a smooth curve $upright(bold(r))\(t\)= f\(t\)upright(bold(i)) + g\(t\)upright(bold(j)) + h\(t\)upright(bold(k))$, $a lt.eq t lt.eq b$, $ L = integral_a^b\|upright(bold(v))\(t\)\|thin d t = integral_a^b sqrt((frac(d x, d t))^2 + (frac(d y, d t))^2 + (frac(d z, d t))^2) thin d t\,#h(2em) upright(bold(T)) = frac(upright(bold(v)), \|upright(bold(v))\|) . $
]

#panel[THEOREM --- The Chain Rule, the Gradient, and the Second Derivative Test][
If $w = f\(x\,y\,z\)$ is differentiable and $x\,y\,z$ are differentiable functions of $t$, then $display(frac(d w, d t) = f_x frac(d x, d t) + f_y frac(d y, d t) + f_z frac(d z, d t))$, and $d f = f_x thin d x + f_y thin d y + f_z thin d z$.

The directional derivative of $f$ at $P_0$ in the direction of a #emph[unit] vector $upright(bold(u))$ is $D_(upright(bold(u))) f = nabla f\|_(P_0) #h(-0.167em) dot.op upright(bold(u))$\; it is largest ($=\|nabla f\|$) in the direction of $nabla f$ and zero along the level curve through $P_0$.

At a critical point $\(a\,b\)$ of $f$, set $D = f_(x x) f_(y y) - f_(x y)^(thin 2)$ evaluated at $\(a\,b\)$. Then $f$ has a local maximum if $D > 0$ and $f_(x x) < 0$\; a local minimum if $D > 0$ and $f_(x x) > 0$\; a saddle point if $D < 0$\; and the test is inconclusive if $D = 0$.

#emph[Lagrange multipliers.] To find the extreme values of $f$ subject to $g = 0$, solve $nabla f = lambda nabla g$ together with $g = 0$, then compare the values of $f$ at the solutions.
]

#endpart()
#parthead[A][Vectors and the Geometry of Space][Thomas 11.1--11.5 ~•~~MIT 18.02 Lectures 1--5][9 problems ~|~~25 points]

#topichead[Vectors, Lengths, and Directions]

#prob(space: 3.6cm)[
  #strong[Unit vectors and displacement.]

  + For what value or values of $c$ will $1 / 2 upright(bold(i)) - c upright(bold(j)) + c upright(bold(k))$ be a unit vector?

  + A vector $upright(bold(A))$ has magnitude $6$ and direction $\(upright(bold(i)) + 2 upright(bold(j)) - 2 upright(bold(k))\)\/3$. If its tail is at $\(- 2\,0\,1\)$, where is its head?

  #src[MIT 18.02, Problem Set 1]
]


#prob(space: 4.8cm)[
  Let $P$ and $Q$ be two points in space, and let $X$ be the midpoint of the line segment $P Q$. Let $O$ be an arbitrary fixed point.

  + Show that, as vectors, $accent(O X, ⃗) = 1 / 2\(accent(O P, ⃗) + accent(O Q, ⃗)\)$.

  + With the notation of part (a), assume instead that $X$ divides the segment $P Q$ in the ratio $r : s$, where $r + s = 1$. Derive an expression for $accent(O X, ⃗)$ in terms of $accent(O P, ⃗)$ and $accent(O Q, ⃗)$.

  #src[MIT 18.02, Problem Set 1]
]


#topichead[The Dot Product, Projections, and Angles]

#prob(space: 4.2cm)[
  #strong[Angles between vectors.]

  + Find the angle between $upright(bold(i)) - upright(bold(k))$ and $4 upright(bold(i)) + 4 upright(bold(j)) - 2 upright(bold(k))$, and the angle between $upright(bold(i)) + upright(bold(j)) + 2 upright(bold(k))$ and $2 upright(bold(i)) - upright(bold(j)) + upright(bold(k))$.

  + Tell for what values of $c$ the vectors $c upright(bold(i)) + 2 upright(bold(j)) - upright(bold(k))$ and $upright(bold(i)) - upright(bold(j)) + 2 upright(bold(k))$ will (i) be orthogonal; (ii) form an acute angle.

  #src[MIT 18.02, Problem Set 1]
]


#prob(space: 4.4cm)[
  Consider the vectors $upright(bold(A)) = 6 upright(bold(j)) + 6 upright(bold(k))$ and $upright(bold(B)) = 2 upright(bold(i)) - upright(bold(j)) - upright(bold(k))$. Write $upright(bold(A)) = upright(bold(C)) + upright(bold(D))$ as a sum of two vectors such that $upright(bold(C))$ is parallel to $upright(bold(B))$ and $upright(bold(D))$ is perpendicular to $upright(bold(B))$.

  #emph[Suggestion. First write $upright(bold(C)) = alpha upright(bold(B))$, so that $upright(bold(A)) = alpha upright(bold(B)) + upright(bold(D))$ for some real number $alpha$. Determine $alpha$ using the dot product, then proceed to get $upright(bold(C))$ and $upright(bold(D))$.]

  #src[MA1521 L2, Q04.4]
]


#topichead[Determinants and the Cross Product]

#prob(space: 5.1cm)[
  #strong[Determinants and the cross product.]

  + Calculate $ mat(delim: "|", - 1, 0, 4; 1, 2, 2; 3, - 2, - 1) $ using the Laplace expansion by the cofactors of (i) the first row; (ii) the first column.

  + Find $upright(bold(A)) times upright(bold(B))$ if (i) $upright(bold(A)) = upright(bold(i)) - 2 upright(bold(j)) + upright(bold(k))$, $upright(bold(B)) = 2 upright(bold(i)) - upright(bold(j)) - upright(bold(k))$\; #h(0.8em) (ii) $upright(bold(A)) = 2 upright(bold(i)) - 3 upright(bold(k))$, $upright(bold(B)) = upright(bold(i)) + upright(bold(j)) - upright(bold(k))$.

  #src[MIT 18.02, Problem Set 1]
]


#prob(space: 5.4cm)[
  Consider the points $A =\(5\,2\,0\)$, $B =\(2\,6\,1\)$, and $C =\(2\,4\,7\)$ in space.

  + Find the area of the parallelogram with two adjacent sides given by the line segments $A B$ and $A C$. Hence find the area of triangle $A B C$.

  + Find the volume of the parallelepiped spanned by $upright(bold(i)) + 3 upright(bold(k))$, $2 upright(bold(i)) + upright(bold(j)) - 2 upright(bold(k))$, and $5 upright(bold(i)) + 4 upright(bold(k))$.

  + Suppose $A$, $B$, $C$, $D$ are four points in space with $det\(accent(A B, ⃗)\,accent(A C, ⃗)\,accent(A D, ⃗)\)= 0$. Must the four points be coplanar? Give a reason.

  #src[MA1521 L2, Q04.8--Q04.10]
]


#topichead[Lines and Planes in Space]

#prob(space: 6.0cm)[
  Find equations for the following planes.

  + Through $\(2\,0\,- 1\)$ and perpendicular to $upright(bold(i)) + 2 upright(bold(j)) - 2 upright(bold(k))$.

  + Through the origin, $\(1\,1\,0\)$, and $\(2\,- 1\,3\)$.

  + Through the points on the $x$-, $y$-, and $z$-axes where $x = a$, $y = b$, $z = c$ respectively (all nonzero).

  + Through $\(1\,0\,1\)$ and $\(0\,1\,1\)$ and parallel to $upright(bold(i)) - upright(bold(j)) + 2 upright(bold(k))$.

  #src[MIT 18.02, Problem Set 1]
]


#prob(space: 6.3cm)[
  Find, in parametric form, equations for

  + the line through $\(1\,0\,- 1\)$ and parallel to $2 upright(bold(i)) - upright(bold(j)) + 3 upright(bold(k))$\;

  + the line through $\(2\,- 1\,- 1\)$ and perpendicular to the plane $x - y + 2 z = 3$\;

  + all lines passing through $\(1\,1\,1\)$ and lying in the plane $x + 2 y - z = 2$\;

  + the line through $P\(4\,2\,1\)$ and perpendicular to both of the lines $ ell_1 : med x = 3 t + 2\,quad y = - 4 t - 1\,quad z = 4 t - 9\,#h(2em) ell_2 : med x = 3 t - 4\,quad y = - t + 6\,quad z = 5 t . $

  #src[MIT 18.02, Problem Set 1; MA1521 L2, Q05.2]
]


#prob(space: 6.5cm)[
  #strong[Lines meeting planes.]

  + Where does the line through $\(0\,1\,2\)$ and $\(2\,0\,3\)$ intersect the plane $x + 4 y + z = 4$?

  + The line passing through $\(1\,1\,- 1\)$ and perpendicular to the plane $x + 2 y - z = 3$ intersects the plane $2 x - y + z = 1$ at what point?

  + Find an equation of the plane that contains the point $\(- 1\,2\,1\)$ and the line of intersection of the planes $x + y - z = 2$ and $2 x - y + 3 z = 1$.

  #src[MIT 18.02, Problem Set 1; MA1521 L2, Q05.5]
]


#endpart()
#parthead[B][Vector-Valued Functions and Motion in Space][Thomas 12.1--12.3 ~•~~MIT 18.02 Lectures 5--6][6 problems ~|~~20 points]

#topichead[Curves in Space and Their Tangents]

#prob(space: 5.6cm)[
  For each of the following vector functions of time, calculate the velocity, the speed, the unit tangent vector (in the direction of the velocity), and the acceleration.

  + $upright(bold(r)) = e^t upright(bold(i)) + e^(- t) upright(bold(j))$

  + $upright(bold(r)) = t^2 upright(bold(i)) + t^3 upright(bold(j))$

  + $upright(bold(r)) =\(1 - 2 t^2\)upright(bold(i)) + t^2 upright(bold(j)) +\(- 2 + 2 t^2\)upright(bold(k))$

  #src[MIT 18.02, Problem Set 2]
]


#prob(space: 5.1cm)[
  Consider the vector function $upright(bold(v))\(t\)=\(3 t^2 + 2 t\)upright(bold(i)) + pi sin\(pi t\)upright(bold(j)) + e^t upright(bold(k))$.

  + Evaluate $upright(bold(v))'\(t\)$, and find $upright(bold(v))'\(2\)$.

  + Evaluate the indefinite integral $display(integral upright(bold(v))\(t\)thin d t)$.

  + Evaluate the definite integral $display(integral_0^1 upright(bold(v))\(t\)thin d t)$.

  #src[MA1521 L2, Q05.10]
]


#prob(space: 4.6cm)[
  Consider the curve in $RR^3$ given by $ upright(bold(r))\(t\)=\(ln t\)thin upright(bold(i)) + frac(t - 1, t + 3) thin upright(bold(j)) +\(t ln t\)thin upright(bold(k)) . $ Find parametric equations of the tangent line to the curve at the point where $t = 1$.

  #src[MA1521 L2, Q05.11]
]


#topichead[Integrals of Vector Functions; Motion]

#prob(space: 4.6cm)[
  A particle moves in $RR^3$ so that its velocity at time $t$ is $ upright(bold(v))\(t\)=\(6 t^2 + 4 t\)thin upright(bold(i)) +\(8 t^3 + 2 t\)thin upright(bold(j)) + frac(1, 1 + t^2) thin upright(bold(k)) . $ If the position of the particle at time $t = 0$ is $upright(bold(i)) + 2 upright(bold(j)) + pi upright(bold(k))$, find the position of the particle at time $t = 1$.

  #src[MA1521 L2, Q05.12]
]


#prob(space: 5.6cm)[
  Two particles move in $RR^3$ so that their positions at time $t$ are $ upright(bold(r))_1\(t\)= t thin upright(bold(i)) + t^2 thin upright(bold(j)) + t^3 thin upright(bold(k))\,#h(2em) upright(bold(r))_2\(t\)=\(1 + 2 t\)thin upright(bold(i)) +\(1 + 6 t\)thin upright(bold(j)) +\(1 + 14 t\)thin upright(bold(k)) . $

  + Do the particles collide? Justify your answer.

  + Do their paths intersect? Justify your answer.

  #src[MA1521 L2, Q05.13]
]


#topichead[Arc Length in Space]

#prob(space: 7.1cm)[
  #strong[Lengths of curves in space.]

  + Find the unit tangent vector of $upright(bold(r))\(t\)=\(2 cos t\)upright(bold(i)) +\(2 sin t\)upright(bold(j)) + sqrt(5) thin t thin upright(bold(k))$, and the length of the portion $0 lt.eq t lt.eq pi$.

  + Find the arc length of the curve $ x = 2 t - 2 sin t\,#h(2em) y = 2 - sqrt(2) cos t\,#h(2em) z = sqrt(2) cos t\,#h(2em) 0 lt.eq t lt.eq 4 pi . $

  + Find the length of the curve $upright(bold(r))\(t\)= 2 t thin upright(bold(i)) + 2 t thin upright(bold(j)) +\(1 - t^2\)thin upright(bold(k))$ from $\(0\,0\,1\)$ to $\(2\,2\,0\)$.

  #src[Thomas 12.3, Exercises 1 and 15; MA1521 L2, Q05.14]
]


#endpart()
#parthead[C][Partial Derivatives, the Chain Rule, and the Gradient][Thomas 13.1--13.6 ~•~~MIT 18.02 Lectures 8--12][23 problems ~|~~60 points]

#topichead[Functions of Several Variables; Limits and Continuity]

#prob(space: 5.4cm)[
  #strong[Values, domains, and level sets.]

  + Let $display(f\(x\,y\,z\)= frac(x - y, y^2 + z^2))$. Evaluate $f\(3\,- 1\,2\)$ and $f #h(-0.167em) (0 \, - 1 / 3 \, 0)$.

  + Find and sketch the natural domain of $display(f\(x\,y\)= frac(1, ln (9 - x^2 - y^2)))$.

  + Describe geometrically the level sets of $f\(x\,y\,z\)= sqrt(16 - x^2 - y^2 - z^2)$.

  #src[MA1521 L2, Q06.1, Q06.2, Q06.4]
]


#prob(space: 7.3cm)[
  #strong[Level curves and graphs.]

  + Sketch five level curves for each of the following functions, and sketch the portion of the graph lying in the first octant: $ upright("(i) ") 1 - x - y\,#h(2em) upright("(ii) ") sqrt(x^2 + y^2)\,#h(2em) upright("(iii) ") x^2 + y^2\,#h(2em) upright("(iv) ") 1 - x^2 - y^2 . $

  + Sketch the level curves $f\(x\,y\)= k$ for $k = - 2\,0\,1\,2$, where $display(f\(x\,y\)= frac(x + y, x - y))$.

  #src[MIT 18.02, Problem Set 3; MA1521 L2, Q06.3]
]


#prob(space: 6.6cm)[
  Evaluate each limit, or show that it does not exist.

  + $display(lim_(\(x\,y\)arrow.r\(0\,pi\/4\)) sec x thin tan\(x + y\))$

  + $display(lim_(\(x\,y\)arrow.r\(2\,0\)) frac(sqrt(2 x - y) - 2, 2 x - y - 4))$ #h(0.8em) #emph[\(The identity $a^2 - b^2 =\(a + b\)\(a - b\)$ is useful.)]

  + $display(lim_(\(x\,y\)arrow.r\(0\,0\)) y / x^2)$

  + Let $f\(x\,y\)= sqrt(x^2 + y^2)$ for $\(x\,y\)eq.not\(0\,0\)$ and $f\(0\,0\)= 1$. Find $display(lim_(\(x\,y\)arrow.r\(0\,0\)) f\(x\,y\))$, and decide whether $f$ is continuous at $\(0\,0\)$.

  #src[MA1521 L2, Q06.5, Q06.6, Q07.1]
]


#topichead[Partial Derivatives]

#prob(space: 6.1cm)[
  Calculate the first partial derivatives of each of the following functions.

  + $4 x^3 - 3 x^2 y^2 + 2 x$

  + $sin\(3 x + 2 y\)$

  + $y ln\(4 x + 3 y\)$\; find also the values of the first partials at $\(2\,1\)$.

  + $x^2 z - 2 y z^3$

  + $y^2 z + x^3 y z^3$\; find also the values of the first partials at $\(1\,2\,4\)$.

  #src[MIT 18.02, Problem Set 3; MA1521 L2, Q07.2]
]


#prob(space: 6.8cm)[
  #strong[Mixed second partials.]

  + Verify that $f_(x y) = f_(y x)$ for (i) $x^m y^n$ ($m\,n$ positive integers); #h(0.8em) (ii) $display(frac(x, 1 + y))$\; #h(0.8em) (iii) $cos\(x^2 + y\)$.

  + Using $f_(x y) = f_(y x)$, tell for what value of the constant $a$ there exists a function $f\(x\,y\)$ with $f_x = a x y + 3 y^2$ and $f_y = x^2 + 6 x y$\; then find such a function by inspection.

  + Suppose $f\(x\,y\)$ satisfies $f_x = 3 x^2 + A x y$ and $f_y = 3 x^2 + 6 y^2$, where $A$ is a constant. Using Clairaut's Theorem, determine $A$, and then find such a function $f\(x\,y\)$. #emph[\(Such a function is not unique.)]

  #src[MIT 18.02, Problem Set 3; MA1521 L2, Q07.6]
]


#prob(space: 6.5cm)[
  #strong[Laplace's equation and implicit partials.]

  + Show that each of the following functions $w = f\(x\,y\)$ satisfies the two-dimensional Laplace equation $w_(x x) + w_(y y) = 0$: (i) $w = e^(a x) sin a y$ ($a$ constant); #h(0.8em) (ii) $w = ln #h(-0.167em) (x^2 + y^2)$.

  + Using implicit differentiation, find $partial z\/partial x$ and $partial z\/partial y$ if $ x^3 + 2 y^3 + 6 x z^3 - 2 = 59 z . $ #emph[Here $z$ is regarded as a function of the independent variables $x$ and $y$, defined implicitly by the equation.]

  #src[MIT 18.02, Problem Set 3; MA1521 L2, Q07.3]
]


#topichead[Tangent Planes and Normal Lines]

#prob(space: 6.8cm)[
  Give an equation of the tangent plane to each of the following surfaces at the point indicated.

  + $z = x y^2$ at $\(1\,1\,1\)$

  + $w = y^2\/x$ at $\(1\,2\,4\)$

  + the graph of $f\(x\,y\)= x^2 y + 2 x y$ at the point where $\(x\,y\)=\(1\,2\)$

  + the surface $y z = x^2$ at $\(4\,2\,8\)$ ~#emph[\(Suggestion: first rewrite the surface as the graph of a function of two variables.)]

  #src[MIT 18.02, Problem Set 3; MA1521 L2, Q07.8, Q07.9]
]


#prob(space: 4.9cm)[
  Consider the surface in $x y z$-space defined by $ cos\(pi x\)- x^2 y + e^(x z) + y z = 4 . $ Find equations for the tangent plane and the normal line to the surface at the point $\(0\,1\,2\)$.

  #src[Thomas 13.6, Exercise 5; MA1521 L2, Q10.1]
]


#prob(space: 6.1cm)[
  #strong[Tangent planes to a cone.]

  + Find an equation of the tangent plane to the cone $z = sqrt(x^2 + y^2)$ at a point $P_0 :\(x_0\,y_0\,z_0\)$ on the cone, with $z_0 > 0$.

  + Write parametric equations for the ray from the origin passing through $P_0$, and use them to show that the ray lies on both the cone and the tangent plane at $P_0$.

  #src[MIT 18.02, Problem Set 3]
]


#topichead[Differentials]

#prob(space: 4.4cm)[
  Find the differential ($d w$ or $d z$). Make the answer look as neat as possible.

  + $w = ln\(x y z\)$

  + $w = x y^2 z^3$

  + $display(z = frac(x - y, x + y))$

  #src[MIT 18.02, Problem Set 4; MA1521 L2, Q10.5]
]


#prob(space: 5.4cm)[
  The following equations define $w$ implicitly as a function of the other variables. Find $d w$ in terms of the other differentials by taking the differential of both sides and solving algebraically for $d w$.

  + $z^2 + x y w + y w^3 = 0$

  + $u^2 + 2 v^2 + 3 w^2 = 10$

  #src[MIT 18.02, Problem Set 4; MA1521 L2, Q10.6]
]


#topichead[The Chain Rule]

#prob(space: 6.3cm)[
  In each of the following, find $d w\/d t$ in two distinct ways: (i) use the Chain Rule, then express the answer in terms of $t$\; (ii) express the composite function in terms of $t$ and differentiate.

  + $w = x y z$\; #h(0.8em) $x = t$, $y = t^2$, $z = t^3$

  + $w = x^2 - y^2$\; #h(0.8em) $x = cos t$, $y = sin t$

  + $w = ln #h(-0.167em) (u^2 + v^2)$\; #h(0.8em) $u = 2 cos t$, $v = 2 sin t$

  #src[MIT 18.02, Problem Set 4]
]


#prob(space: 5.8cm)[
  Consider the function $w = 2 y e^x - ln z$, where $x = ln #h(-0.167em) (t^2 + 1)$, $y = tan^(- 1) t$, and $z = e^t$.

  + Find $d w\/d t$ using the Chain Rule, expressing the answer in terms of $t$.

  + Find $d w\/d t$ by first expressing $w$ in terms of $t$, and check that the two answers agree.

  #src[MA1521 L2, Q09.2]
]


#prob(space: 4.4cm)[
  Suppose the temperature at any point in $x y z$-space is $T\(x\,y\,z\)= e^x - y z + z x$, measured in $zws^compose$C, where $x\,y\,z$ are measured in cm. If the position of an insect at time $t$ seconds is $x = t$, $y = 2 (1 + t^2)$, $z = 3 + t$, find the rate of change of temperature experienced by the insect at time $t = 0$. Give the answer in $zws^compose$C per second.

  #src[MA1521 L2, Q09.3]
]


#prob(space: 7.1cm)[
  Let $w = f\(x\,y\)$, where all first- and second-order partial derivatives of $f$ are continuous, and change to polar coordinates $x = r cos theta$, $y = r sin theta$.

  + Show that $\(w_x\)^2 +\(w_y\)^2 =\(w_r\)^2 + 1 / r^2\(w_theta\)^2$.

  + Show that $display(frac(partial^2 w, partial r^2) = f_(x x) cos^2 theta + 2 f_(x y) cos theta sin theta + f_(y y) sin^2 theta)$. #emph[\(First find $partial w\/partial r$ in terms of $f_x$, $f_y$, and $theta$. Clairaut's Theorem may be used freely.)]

  #src[MIT 18.02, Problem Set 4; MA1521 L2, Q09.6]
]


#prob(space: 4.9cm)[
  Let $w = f\(x\,y\)$ and make the change of variables $x = u^2 - v^2$, $y = 2 u v$. Show that $ \(w_u\)^2 +\(w_v\)^2 = 4 (u^2 + v^2) [\( w_x \)^2 + \( w_y \)^2] . $

  #src[MIT 18.02, Problem Set 4]
]


#prob(space: 6.3cm)[
  #strong[Partial differential equations from the Chain Rule.]

  + Let $w = f\(y\/x\)$\; that is, $w$ is the composite of $w = f\(u\)$ and $u = y\/x$. Show that $w$ satisfies the partial differential equation $display(x thin frac(partial w, partial x) + y thin frac(partial w, partial y) = 0)$.

  + Let $w = f #h(-0.167em) (x^2 - y^2)$\; show that $display(y thin frac(partial w, partial x) + x thin frac(partial w, partial y) = 0)$.

  + Let $w = f\(a x + b y\)$\; show that $display(b thin frac(partial w, partial x) - a thin frac(partial w, partial y) = 0)$.

  #src[MIT 18.02, Problem Set 4]
]


#topichead[Directional Derivatives and Gradient Vectors]

#prob(space: 6.8cm)[
  In each of the following, a function $f$, a point $P$, and a vector $upright(bold(A))$ are given. Calculate the gradient of $f$ at $P$, and the directional derivative $D_(upright(bold(u))) f$ at $P$ in the direction $upright(bold(u))$ of the given vector $upright(bold(A))$.

  + $f\(x\,y\)= 2 x y - 3 y^2$\; #h(0.8em) $P\(5\,5\)$, #h(0.8em) $upright(bold(A)) = 4 upright(bold(i)) + 3 upright(bold(j))$

  + $f\(x\,y\,z\)= x y + y z + z x$\; #h(0.8em) $P\(1\,- 1\,2\)$, #h(0.8em) $upright(bold(A)) = 3 upright(bold(i)) + 6 upright(bold(j)) - 2 upright(bold(k))$

  + $f\(x\,y\,z\)= x^2 + 2 y^2 - 3 z^2$\; #h(0.8em) $P\(1\,1\,1\)$, #h(0.8em) $upright(bold(A)) = upright(bold(i)) + upright(bold(j)) + upright(bold(k))$

  + $f\(u\,v\,w\)=\(u + 2 v + 3 w\)^2$\; #h(0.8em) $P\(1\,- 1\,1\)$, #h(0.8em) $upright(bold(A)) = - 2 upright(bold(i)) + 2 upright(bold(j)) - upright(bold(k))$

  #src[Thomas 13.5, Exercises 11, 15, 16; MIT 18.02, Problem Set 4]
]


#prob(space: 6.8cm)[
  Consider the function $f\(x\,y\)= 2 y e^(- x) + 1$ and the point $P\(0\,- 2\)$.

  + Find the directional derivative of $f$ at $P$ in the direction of each of the vectors (i) $1 / sqrt(2) upright(bold(i)) + 1 / sqrt(2) upright(bold(j))$\; #h(0.8em) (ii) $12 upright(bold(i)) + 5 upright(bold(j))$.

  + Find the direction that gives the largest possible directional derivative of $f$ at $P$, and the value of that derivative.

  + Find the direction along which $f$ decreases most rapidly at $P$.

  + Find the directions along which $f$ exhibits no change at $P$.

  #src[MA1521 L2, Q09.10]
]


#prob(space: 5.3cm)[
  Let $a$ be a positive number and consider $f\(x\,y\)= (x^2 + a) e^(2 x + 3 y^2)$. It is given that the directional derivative of $f$ at the point $\(- 6\,2\)$ in the direction of the vector $upright(bold(i)) + 2 upright(bold(j))$ is $216 sqrt(5)$. Find the value of $a$.

  #src[MA1521 L2, Q09.9]
]


#prob(space: 5.4cm)[
  Let $C$ be the curve of intersection of the two surfaces $x^3 + 2 x y + y z = 7$ and $3 x^2 - y z = 1$. Find parametric equations of the tangent line to $C$ at $\(1\,2\,1\)$.

  #emph[Suggestion. For each of the two surfaces, first find a normal vector at the point $\(1\,2\,1\)$.]

  #src[Thomas 13.6, Exercises 15--20; MA1521 L2, Q10.2]
]


#topichead[Linearization and Quadratic Approximation]

#prob(space: 6.8cm)[
  #strong[Linearization and linear approximation.]

  + Find the linearization of $f\(x\,y\)= e^(2 x + y)$ at $\(0\,0\)$ and at $\(1\,2\)$. Give each answer in the form $a x + b y + c$.

  + Consider $f\(x\,y\,z\)= x z + sin\(x y z\)$. Using linear approximation, estimate the change in the value of $f$ when $\(x\,y\,z\)$ changes from $(1 / 2 \, pi \, 1 / 3)$ to $(1 / 2 + 0.03 \, med pi + 0.04 \, med 1 / 3 - 0.02)$.

  #src[MA1521 L2, Q10.4, Q10.7]
]


#prob(space: 6.5cm)[
  Consider the function $f\(x\,y\)= e^(x + 4 y) cos x$.

  + Find the second-degree Taylor polynomial of $f$ at $\(0\,0\)$.

  + Using part (a), find an approximate value of $f\(0.2\,thin 0.1\)$.

  #src[Thomas 13.9; MA1521 L2, Q10.9]
]


#endpart()
#parthead[D][Extreme Values, Saddle Points, and Lagrange Multipliers][Thomas 13.7--13.9 ~•~~MIT 18.02 Lectures 9, 10, 13][14 problems ~|~~60 points]

#topichead[Finding Local Extrema]

#prob(space: 7.8cm)[
  Find all the local maxima, local minima, and saddle points of the following functions, and give the corresponding values of the function.

  + $f\(x\,y\)= x^2 + x y + y^2 + 3 x - 3 y + 4$

  + $f\(x\,y\)= x^3 - y^3 - 2 x y + 6$

  + $f\(x\,y\)= 4 x y - x^4 - y^4$

  + $f\(x\,y\)= 2 ln x + ln y - 4 x - y$ #h(0.8em) ($x > 0$, $y > 0$)

  #src[Thomas 13.7, Exercises 1, 13, 19, 29]
]


#prob(space: 7.1cm)[
  Determine all the critical points of $ f\(x\,y\)= 2 x y - x^2 y - x y^2\, $ and classify each as a local maximum point, a local minimum point, or a saddle point of $f$. Evaluate also the local maximum and local minimum values of $f$, if any.

  #src[MA1521 L2, Q08.2]
]


#prob(space: 6.8cm)[
  Determine all the critical points of $ f\(x\,y\)= ln #h(-0.167em) (x y^2) - x y - 2 y $ over the region $x > 0$, $y > 0$ in the $x y$-plane, and classify each one. Evaluate also the local maximum and local minimum values of $f$, if any.

  #src[MA1521 L2, Q08.3]
]


#topichead[Finding Absolute Extrema]

#prob(space: 8.2cm)[
  Find the maximum and minimum points of $ f\(x\,y\)= x^2 - 2 x y + 2 y^2 - 2 y $ over the rectangular region $R : med - 1 lt.eq x lt.eq 2$, $0 lt.eq y lt.eq 2$ in the $x y$-plane. Hence find the absolute maximum and absolute minimum values of $f$ over $R$.

  #src[MIT 18.02, Problem Set 3; MA1521 L2, Q08.6]
]


#prob(space: 6.5cm)[
  #strong[Constrained minimum distance.]

  + Consider the surface $y^2 - x z = 4$ in $x y z$-space. Find the point or points on the surface closest to the origin. #emph[\(Suggestion: first formulate the question as a problem of minimizing a function of the variables $x$ and $z$\.)]

  + Find the minimum distance from the point $\(2\,- 1\,1\)$ to the plane $x + y - z = 2$.

  #src[Thomas 13.7, Exercise 52; MA1521 L2, Q08.4]
]


#prob(space: 7.1cm)[
  #strong[The method of least squares.]

  + Using the method of least squares, find the line $y = a x + b$ that best fits the three data points $\(- 1\,1\)$, $\(1\,2\)$, $\(3\,2\)$.

  + Using the method of least squares, find the quadratic polynomial of the form $y = a x^2 + b x$ that best fits the three data points $\(- 1\,1\)$, $\(1\,1\)$, $\(2\,0\)$.

  #src[MIT 18.02, Problem Set 3; MA1521 L2, Q08.7, Q08.8]
]


#prob(space: 8.8cm)[
  A rectangular box with its top left open has its five faces made from different materials. The front face and the back face are made from material costing $10$ dollars per square metre; the two lateral faces from material costing $5$ dollars per square metre; and the bottom face from material costing $30$ dollars per square metre. Find the minimum material cost of the box if its volume is $6$ cubic metres, and give the dimensions (length, width, and height) of such a box.

  #emph[Do this problem twice: first by eliminating a variable and using the Second Derivative Test, and then again by the method of Lagrange multipliers. Compare the work involved.]

  #src[MIT 18.02, Problem Set 3; MA1521 L2, Q08.5 and Q11.4]
]


#topichead[The Method of Lagrange Multipliers]

#prob(space: 7.8cm)[
  #strong[Extrema on a circle.]

  + Use the method of Lagrange multipliers to find the maximum value of $f\(x\,y\)= x y$ subject to the constraint $\(x - 2\)^2 + y^2 = 4$.

  + Use the method of Lagrange multipliers to find the maximum value of $f\(x\,y\)= x y$ subject to the constraints $\(x - 2\)^2 + y^2 = 4$ #emph[and] $x lt.eq 2$. #emph[\(This is part (a) with one extra constraint, so the work there is useful.)]

  #src[MA1521 L2, Q11.1, Q11.2]
]


#prob(space: 6.8cm)[
  #strong[Nearest and farthest points.]

  + Find the point or points on the sphere $x^2 + y^2 + z^2 = 1$ furthest from the point $\(2\,1\,2\)$.

  + Find the point on the plane $x + 2 y + 3 z = 13$ closest to the point $\(1\,1\,1\)$.

  #src[Thomas 13.8, Exercise 17; MA1521 L2, Q11.3]
]


#prob(space: 7.8cm)[
  A rectangular box is placed in the first octant so that one corner $Q$ is at the origin and the three sides adjacent to $Q$ lie in the coordinate planes. The corner $P$ diagonally opposite to $Q$ lies on the ellipsoid $ x^2 / 3 + y^2 / 9 + z^2 / 4 = 1 . $ Use the method of Lagrange multipliers to determine the largest possible volume of the box, and say how you know that your answer gives a maximum.

  #src[MIT 18.02, Problem Set 5; MA1521 L2, Q12.1]
]


#prob(space: 7.1cm)[
  Let $f\(x\,y\)= x^2 - y^2$ be defined on the disk $D = {\( x \, y \) : x^2 + y^2 lt.eq 1}$.

  + Find the critical points of $f$ and classify them.

  + Find the maximum and minimum values of $f$ on $D$. #emph[\(Lagrange multipliers are used in part (b).)]

  #src[MA1521 L2, Q12.2]
]


#prob(space: 7.8cm)[
  #strong[Extrema on a curve of intersection.]

  + Find the extreme values of $f\(x\,y\,z\)= x y + z^2$ on the circle in which the plane $y - x = 0$ intersects the sphere $x^2 + y^2 + z^2 = 4$.

  + Find the maximum value of $w = x y z$ on the line of intersection of the two planes $x + y + z = 40$ and $x + y - z = 0$. Give a geometric argument supporting the claim that you have found a maximum and not a minimum.

  #src[Thomas 13.8, Exercises 42, 43]
]


#prob(space: 8.2cm)[
  #strong[Three applications.]

  + The temperature at a point $\(x\,y\)$ on a metal plate is $T\(x\,y\)= 4 x^2 - 4 x y + y^2$. An ant on the plate walks around the circle of radius $5$ centred at the origin. What are the highest and lowest temperatures the ant encounters?

  + Find the dimensions of the closed right circular cylindrical can of smallest surface area whose volume is $16 pi med upright("cm")^3$.

  + Suppose the utility of amounts $x$ and $y$ of two capital goods is $U\(x\,y\)= x y + 2 x$, and that the budget constraint simplifies to $2 x + y = 30$. Find the maximum value of $U$ and the corresponding values of $x$ and $y$.

  #src[Thomas 13.8, Exercises 9, 15, 33]
]


#prob(space: 6.8cm)[
  #strong[The condition $nabla f = lambda nabla g$ is not sufficient.] #h(0.8em) Even though $nabla f = lambda nabla g$ is a necessary condition for an extreme value of $f\(x\,y\)$ subject to $g\(x\,y\)= 0$ and $nabla g eq.not upright(bold(0))$, it does not by itself guarantee that an extreme value exists. Try using Lagrange multipliers to find a maximum value of $f\(x\,y\)= x + y$ subject to $x y = 16$. The method identifies $\(4\,4\)$ and $\(- 4\,- 4\)$ as candidates. Explain carefully why $x + y$ nevertheless has #emph[no] maximum value on the hyperbola $x y = 16$, and say which of the two candidates is a genuine local extremum and of what kind.

  #src[Thomas 13.8, Exercise 45]
]


#endpart()
#parthead[E][Midterm Simulation][Thomas 11--13 ~•~~90 minutes, no calculator, closed book][6 problems ~|~~100 points]

#panel[INSTRUCTIONS][
Work the six problems below in one uninterrupted sitting of #strong[90 minutes]. Show all reasoning; an unsupported answer earns no credit. Leave answers in exact form ($sqrt(2)$, $ln 3$, $pi\/4$, and so on). The point values sum to $100$.
]

#prob(space: 7.6cm)[
  #pts[15 points] #h(0.5em)

  Let $A =\(1\,0\,2\)$, $B =\(2\,1\,0\)$, and $C =\(0\,3\,1\)$.

  + Find the area of the triangle $A B C$.

  + Find an equation of the plane containing $A$, $B$, and $C$.

  + Find the distance from the origin to that plane.
]


#prob(space: 7.6cm)[
  #pts[13 points] #h(0.5em)

  Consider the plane curve $ upright(bold(r))\(t\)=\(cos t + t sin t\)thin upright(bold(i)) +\(sin t - t cos t\)thin upright(bold(j))\,#h(2em) t gt.eq 0 . $

  + Find $upright(bold(v))\(t\)$ and the speed $\|upright(bold(v))\(t\)\|$, simplifying as far as possible.

  + Find the arc length parameter $s\(t\)$ measured from the point where $t = 0$, and hence the length of the portion of the curve with $0 lt.eq t lt.eq pi\/2$.

  + Find the unit tangent vector $upright(bold(T))\(t\)$ for $t > 0$.
]


#prob(space: 8.5cm)[
  #pts[18 points] #h(0.5em)

  Let $f\(x\,y\,z\)= x^2 y + y z^2$ and let $P =\(1\,2\,- 1\)$.

  + Find $nabla f$ at $P$.

  + Find the directional derivative of $f$ at $P$ in the direction of $2 upright(bold(i)) - upright(bold(j)) + 2 upright(bold(k))$.

  + In what direction does $f$ increase most rapidly at $P$, and what is that rate of increase?

  + A particle moves so that its position at time $t$ is $upright(bold(r))\(t\)= t thin upright(bold(i)) +\(t + 1\)thin upright(bold(j)) + (t^2 - 2) upright(bold(k))$. Verify that the particle is at $P$ when $t = 1$, and find the rate of change of $f$ experienced by the particle at that instant.
]


#prob(space: 8.5cm)[
  #pts[16 points] #h(0.5em)

  Consider the ellipsoid $x^2 + 2 y^2 + 3 z^2 = 21$ and the point $P_0\(1\,2\,2\)$ on it.

  + Find an equation of the tangent plane and parametric equations of the normal line to the ellipsoid at $P_0$.

  + Regarding $z$ as a function of $x$ and $y$ near $P_0$, use implicit differentiation to find $partial z\/partial x$ and $partial z\/partial y$ at $P_0$, and check that your answers agree with part (a).

  + Find all points on the ellipsoid at which the tangent plane is parallel to the plane $x + 4 y + 6 z = 0$.
]


#prob(space: 9.0cm)[
  #pts[18 points] #h(0.5em)

  Find and classify all the critical points of $ f\(x\,y\)= x^3 + 3 x y^2 - 15 x - 12 y\, $ using the Second Derivative Test. State the local maximum and local minimum values of $f$.
]


#prob(space: 9.0cm)[
  #pts[20 points] #h(0.5em)

  + Use the method of Lagrange multipliers to find the maximum and minimum values of $f\(x\,y\,z\)= x - 2 y + 5 z$ on the sphere $x^2 + y^2 + z^2 = 30$.

  + Find the dimensions of the closed rectangular box of maximum volume that can be inscribed in the sphere $x^2 + y^2 + z^2 = 4$, and state that maximum volume.
]


#endpart()
#part-title.update("Answers")
#pagebreak(weak: true)
#line(length: 100%, stroke: 2.6pt + blue)
#v(-6pt)
#text(font: sans, weight: "bold", size: 21pt, fill: blue)[Answers]
#v(-6pt)
#text(style: "italic", size: 10pt, fill: soft)[Consult these only after a complete attempt. "Show that" problems are answered with the key step rather than the full argument.]
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
#strong[\1.] (a) $c = plus.minus sqrt(6)\/4$. #h(0.6em) (b) $\(0\,4\,- 3\)$.

#strong[\2.] (b) $accent(O X, ⃗) = s thin accent(O P, ⃗) + r thin accent(O Q, ⃗)$.

#strong[\3.] (a) $pi\/4$ and $pi\/3$. #h(0.6em) (b) The dot product is $c - 4$\; (i) $c = 4$, (ii) $c > 4$.

#strong[\4.] $upright(bold(C)) = - 4 upright(bold(i)) + 2 upright(bold(j)) + 2 upright(bold(k))$, $upright(bold(D)) = 4 upright(bold(i)) + 4 upright(bold(j)) + 4 upright(bold(k))$.

#strong[\5.] (a) $- 34$ by both expansions. #h(0.6em) (b) (i) $3 upright(bold(i)) + 3 upright(bold(j)) + 3 upright(bold(k))$\; (ii) $3 upright(bold(i)) - upright(bold(j)) + 2 upright(bold(k))$.

#strong[\6.] (a) $accent(A B, ⃗) times accent(A C, ⃗) = 26 upright(bold(i)) + 18 upright(bold(j)) + 6 upright(bold(k))$\; parallelogram $2 sqrt(259) approx 32.19$, triangle $sqrt(259)$. #h(0.6em) (b) $11$. #h(0.6em) (c) Yes --- a zero determinant means the three edge vectors are linearly dependent, so all four points lie in a common plane.

#strong[\7.] (a) $x + 2 y - 2 z = 4$. #h(0.6em) (b) $x - y - z = 0$. #h(0.6em) (c) $x / a + y / b + z / c = 1$. #h(0.6em) (d) $x + y = 1$.

#strong[\8.] (a) $x = 1 + 2 t$, $y = - t$, $z = - 1 + 3 t$. #h(0.6em) (b) $x = 2 + t$, $y = - 1 - t$, $z = - 1 + 2 t$. #h(0.6em) (c) $x = 1 + a t$, $y = 1 + b t$, $z = 1 +\(a + 2 b\)t$ for any $\(a\,b\)eq.not\(0\,0\)$. #h(0.6em) (d) Direction $chevron.l 3\,- 4\,4 chevron.r times chevron.l 3\,- 1\,5 chevron.r = chevron.l - 16\,- 3\,9 chevron.r$: $x = 4 - 16 t$, $y = 2 - 3 t$, $z = 1 + 9 t$.

#strong[\9.] (a) $\(4\,- 1\,4\)$. #h(0.6em) (b) $\(0\,- 1\,0\)$. #h(0.6em) (c) $x - 2 y + 4 z + 1 = 0$.

#ah[Part B]
#strong[\10.] (a) $upright(bold(v)) = e^t upright(bold(i)) - e^(- t) upright(bold(j))$, speed $sqrt(e^(2 t) + e^(- 2 t))$, $upright(bold(T)) = upright(bold(v))\/\|upright(bold(v))\|$, $upright(bold(a)) = e^t upright(bold(i)) + e^(- t) upright(bold(j))$. #h(0.6em) (b) $upright(bold(v)) = 2 t upright(bold(i)) + 3 t^2 upright(bold(j))$, speed $\|t\|sqrt(4 + 9 t^2)$, $upright(bold(T)) =\(2 upright(bold(i)) + 3 t upright(bold(j))\)\/sqrt(4 + 9 t^2)$ for $t > 0$, $upright(bold(a)) = 2 upright(bold(i)) + 6 t upright(bold(j))$. #h(0.6em) (c) $upright(bold(v)) = t\(- 4 upright(bold(i)) + 2 upright(bold(j)) + 4 upright(bold(k))\)$, speed $6\|t\|$, $upright(bold(T)) = 1 / 3\(- 2 upright(bold(i)) + upright(bold(j)) + 2 upright(bold(k))\)$ for $t > 0$, $upright(bold(a)) = - 4 upright(bold(i)) + 2 upright(bold(j)) + 4 upright(bold(k))$ (constant).

#strong[\11.] (a) $upright(bold(v))' =\(6 t + 2\)upright(bold(i)) + pi^2 cos\(pi t\)upright(bold(j)) + e^t upright(bold(k))$\;~$upright(bold(v))'\(2\)= 14 upright(bold(i)) + pi^2 upright(bold(j)) + e^2 upright(bold(k))$. #h(0.6em) (b) $(t^3 + t^2) upright(bold(i)) - cos\(pi t\)upright(bold(j)) + e^t upright(bold(k)) + upright(bold(C))$. #h(0.6em) (c) $2 upright(bold(i)) + 2 upright(bold(j)) +\(e - 1\)upright(bold(k))$.

#strong[\12.] $upright(bold(r))\(1\)= upright(bold(0))$ and $upright(bold(r))'\(1\)= upright(bold(i)) + 1 / 4 upright(bold(j)) + upright(bold(k))$, so $x = t$, $y = t\/4$, $z = t$.

#strong[\13.] $5 upright(bold(i)) + 5 upright(bold(j)) + frac(5 pi, 4) upright(bold(k))$.

#strong[\14.] (a) No: $t = 1 + 2 t$ forces $t = - 1$, and then $t^2 = 1 eq.not - 5$. #h(0.6em) (b) Yes. Solving $s = 1 + 2 t$, $s^2 = 1 + 6 t$, $s^3 = 1 + 14 t$ gives $s = 1$ ($t = 0$) and $s = 2$ ($t = 1 / 2$); the paths meet at $\(1\,1\,1\)$ and $\(2\,4\,8\)$.

#strong[\15.] (a) $\|upright(bold(v))\|= 3$, $upright(bold(T)) = 1 / 3 (- 2 sin t thin upright(bold(i)) + 2 cos t thin upright(bold(j)) + sqrt(5) thin upright(bold(k)))$, length $3 pi$. #h(0.6em) (b) $\|upright(bold(v))\|= 4 lr(|sin \( t \/ 2 \)|)$, length $32$. #h(0.6em) (c) $sqrt(3) + ln #h(-0.167em) (2 + sqrt(3)) approx 3.049$.

#ah[Part C]
#strong[\16.] (a) $4\/5$ and $3$. #h(0.6em) (b) ${\( x \, y \) : 0 lt.eq x^2 + y^2 < 9 med upright("and") med x^2 + y^2 eq.not 8}$: the open disk of radius $3$ with the circle of radius $2 sqrt(2)$ removed. #h(0.6em) (c) For $0 lt.eq c < 4$, the sphere $x^2 + y^2 + z^2 = 16 - c^2$ centred at the origin; for $c = 4$, the origin alone.

#strong[\17.] (a) (i) parallel lines $x + y = 1 - c$, graph a plane; (ii) circles $x^2 + y^2 = c^2$, $c gt.eq 0$, graph a cone; (iii) circles of radius $sqrt(c)$, graph a paraboloid opening upward; (iv) circles $x^2 + y^2 = 1 - c$, graph a paraboloid opening downward. #h(0.6em) (b) Lines through the origin (origin and the line $y = x$ deleted): $y = frac(k - 1, k + 1) thin x$, i.e. $y = 3 x$, $y = - x$, $y = 0$, $y = 1 / 3 x$ for $k = - 2\,0\,1\,2$.

#strong[\18.] (a) $1$. #h(0.6em) (b) $1 / 4$ (multiply by $sqrt(2 x - y) + 2$). #h(0.6em) (c) Does not exist: the limit is $0$ along $y = 0$ but $1$ along $y = x^2$. #h(0.6em) (d) The limit is $0 eq.not f\(0\,0\)= 1$, so $f$ is not continuous at the origin.

#strong[\19.] (a) $12 x^2 - 6 x y^2 + 2$\;~$- 6 x^2 y$. #h(0.6em) (b) $3 cos\(3 x + 2 y\)$\;~$2 cos\(3 x + 2 y\)$. #h(0.6em) (c) $frac(4 y, 4 x + 3 y)$\;~$ln\(4 x + 3 y\)+ frac(3 y, 4 x + 3 y)$\; at $\(2\,1\)$: $4 / 11$ and $ln 11 + 3 / 11$. #h(0.6em) (d) $2 x z$\;~$- 2 z^3$\;~$x^2 - 6 y z^2$. #h(0.6em) (e) $3 x^2 y z^3$\;~$2 y z + x^3 z^3$\;~$y^2 + 3 x^3 y z^2$\; at $\(1\,2\,4\)$: $384$, $80$, $100$.

#strong[\20.] (b) $f_(x y) = a x + 6 y$ and $f_(y x) = 2 x + 6 y$, so $a = 2$ and $f = x^2 y + 3 x y^2 + C$. #h(0.6em) (c) $f_(x y) = A x$ and $f_(y x) = 6 x$, so $A = 6$ and $f = x^3 + 3 x^2 y + 2 y^3 + C$.

#strong[\21.] (b) $frac(partial z, partial x) = frac(3 x^2 + 6 z^3, 59 - 18 x z^2)$, #h(0.6em) $frac(partial z, partial y) = frac(6 y^2, 59 - 18 x z^2)$.

#strong[\22.] (a) $z = x + 2 y - 2$. #h(0.6em) (b) $w = - 4 x + 4 y$. #h(0.6em) (c) $z = 8 x + 3 y - 8$. #h(0.6em) (d) $4 x - 4 y - z = 0$.

#strong[\23.] $nabla F = chevron.l 2\,2\,1 chevron.r$ at $\(0\,1\,2\)$\; tangent plane $2 x + 2 y + z = 4$, normal line $x = 2 t$, $y = 1 + 2 t$, $z = 2 + t$.

#strong[\24.] (a) $z_0 z = x_0 x + y_0 y$. #h(0.6em) (b) The ray is $\(t x_0\,t y_0\,t z_0\)$, $t gt.eq 0$\; substituting gives $t z_0 = t z_0$ on the cone and $t z_0^2 = t #h(-0.167em) (x_0^2 + y_0^2) = t z_0^2$ on the plane. (A cone is tangent to each of its tangent planes along a whole ruling.)

#strong[\25.] (a) $frac(d x, x) + frac(d y, y) + frac(d z, z)$. #h(0.6em) (b) $x y^2 z^3 #h(-0.167em) (frac(d x, x) + frac(2 thin d y, y) + frac(3 thin d z, z))$. #h(0.6em) (c) $frac(2 y thin d x - 2 x thin d y, \(x + y\)^2)$.

#strong[\26.] (a) $d w = - frac(y w thin d x + (x w + w^3) d y + 2 z thin d z, x y + 3 y w^2)$. #h(0.6em) (b) $d w = - frac(u thin d u + 2 v thin d v, 3 w)$.

#strong[\27.] (a) $6 t^5$. #h(0.6em) (b) $- 2 sin 2 t$. #h(0.6em) (c) $0$ (here $u^2 + v^2 equiv 4$).

#strong[\28.] $frac(d w, d t) = 4 t tan^(- 1) t + 1$ by either method.

#strong[\29.] $nabla T = chevron.l 4\,- 3\,- 2 chevron.r$ at $\(0\,2\,3\)$ and $upright(bold(r))'\(0\)= chevron.l 1\,0\,1 chevron.r$, so $d T\/d t = 2 med zws^compose upright("C/s")$.

#strong[\30.] (a) $w_r = f_x cos theta + f_y sin theta$ and $w_theta = r (- f_x sin theta + f_y cos theta)$\; squaring and adding gives the identity. #h(0.6em) (b) Differentiate $w_r$ again with respect to $r$, using the Chain Rule on $f_x$ and $f_y$ and $f_(x y) = f_(y x)$.

#strong[\31.] $w_u = 2 u thin w_x + 2 v thin w_y$ and $w_v = - 2 v thin w_x + 2 u thin w_y$\; the cross terms cancel when the squares are added.

#strong[\32.] (a) $w_x = - y / x^2 f'$, $w_y = 1 / x f'$. #h(0.6em) (b) $w_x = 2 x f'$, $w_y = - 2 y f'$. #h(0.6em) (c) $w_x = a f'$, $w_y = b f'$.

#strong[\33.] (a) $nabla f = chevron.l 10\,- 20 chevron.r$, $D_(upright(bold(u))) f = - 4$. #h(0.6em) (b) $nabla f = chevron.l 1\,3\,0 chevron.r$, $D_(upright(bold(u))) f = 3$. #h(0.6em) (c) $nabla f = chevron.l 2\,4\,- 6 chevron.r$, $D_(upright(bold(u))) f = 0$. #h(0.6em) (d) $nabla f = chevron.l 4\,8\,12 chevron.r$, $D_(upright(bold(u))) f = - 4 / 3$.

#strong[\34.] $nabla f\(P\)= chevron.l 4\,2 chevron.r$. (a) (i) $3 sqrt(2)$\; (ii) $58 / 13$. #h(0.6em) (b) $1 / sqrt(5) chevron.l 2\,1 chevron.r$, with value $\|nabla f\|= 2 sqrt(5)$. #h(0.6em) (c) $- 1 / sqrt(5) chevron.l 2\,1 chevron.r$, with value $- 2 sqrt(5)$. #h(0.6em) (d) $plus.minus 1 / sqrt(5) chevron.l 1\,- 2 chevron.r$.

#strong[\35.] $nabla f\(- 6\,2\)= chevron.l 60 + 2 a\,med 432 + 12 a chevron.r$ and $D_(upright(bold(u))) f =\(924 + 26 a\)\/sqrt(5) = 216 sqrt(5)$, so $a = 6$.

#strong[\36.] $nabla F = chevron.l 7\,3\,2 chevron.r$, $nabla G = chevron.l 6\,- 1\,- 2 chevron.r$, and $nabla F times nabla G = chevron.l - 4\,26\,- 25 chevron.r$: $x = 1 - 4 t$, $y = 2 + 26 t$, $z = 1 - 25 t$.

#strong[\37.] (a) $L\(x\,y\)= 1 + 2 x + y$ at $\(0\,0\)$\; ~$L\(x\,y\)= e^4\(2 x + y - 3\)$ at $\(1\,2\)$. #h(0.6em) (b) $d f = (1 / 3 + frac(sqrt(3) pi, 6))\(0.03\)+ sqrt(3) / 12\(0.04\)- (1 / 2 + frac(sqrt(3) pi, 4))\(0.02\)= sqrt(3) / 300 approx 0.0058$.

#strong[\38.] (a) $1 + x + 4 y + 4 x y + 8 y^2$. #h(0.6em) (b) $1.76$ (the true value is $1.7858 dots.h$).

#ah[Part D]
#strong[\39.] (a) Local minimum $- 5$ at $\(- 3\,3\)$ ($D = 3$, $f_(x x) = 2$). #h(0.6em) (b) Saddle at $\(0\,0\)$ ($D = - 4$); local maximum $170 / 27$ at $(- 2 / 3 \, 2 / 3)$ ($D = 12$, $f_(x x) = - 4$). #h(0.6em) (c) Saddle at $\(0\,0\)$\; local maxima of value $2$ at $\(1\,1\)$ and $\(- 1\,- 1\)$. #h(0.6em) (d) Local maximum $- 3 - 2 ln 2$ at $(1 / 2 \, 1)$ ($D = 8$, $f_(x x) = - 8$).

#strong[\40.] Critical points $\(0\,0\)$, $\(2\,0\)$, $\(0\,2\)$, $(2 / 3 \, 2 / 3)$\; $D = 4 x y -\(2 - 2 x - 2 y\)^2$. The first three are saddle points ($D = - 4$); the last is a local maximum with value $8 / 27$ ($D = 4 / 3$, $f_(x x) = - 4 / 3$). There is no local minimum.

#strong[\41.] The only critical point is $(2 \, 1 / 2)$, with $D = 1 > 0$ and $f_(x x) = - 1 / 4 < 0$: a local maximum of value $- 2 - ln 2$. There is no local minimum and no saddle point.

#strong[\42.] Interior critical point $\(1\,1\)$ with $f = - 1$. On the boundary the candidates are $f\(- 1\,0\)= 1$, $f\(- 1\,2\)= 9$, $f\(2\,0\)= 4$, $f\(2\,2\)= 0$, $f #h(-0.167em) (2 \, 3 / 2) = - 1 / 2$, $f\(0\,0\)= 0$. Absolute maximum $9$ at $\(- 1\,2\)$\; absolute minimum $- 1$ at $\(1\,1\)$.

#strong[\43.] (a) Minimise $x^2 + y^2 + z^2 = x^2 + x z + z^2 + 4$\; the only critical point is $x = z = 0$, giving $\(0\,plus.minus 2\,0\)$ at distance $2$. #h(0.6em) (b) $frac(\|2 - 1 - 1 - 2\|, sqrt(3)) = frac(2 sqrt(3), 3)$.

#strong[\44.] (a) $y = 1 / 4 x + 17 / 12$. #h(0.6em) (b) $y = 3 / 11 x^2 - 4 / 11 x$.

#strong[\45.] With width $x$, depth $y$, height $z$: $C = 20 x z + 10 y z + 30 x y$ subject to $x y z = 6$. Eliminating $z$ gives $C = 60 / x + 120 / y + 30 x y$, whose only critical point is $x = 1$, $y = 2$, so $z = 3$. Minimum cost $\$180$, with dimensions $1 med upright("m") times 2 med upright("m") times 3 med upright("m")$ (each of the three cost terms equals $\$60$).

#strong[\46.] (a) The equations give $y^2 = x^2 - 2 x$, hence $x = 0$ or $x = 3$\; the maximum is $3 sqrt(3)$ at $(3 \, sqrt(3))$ (and the minimum is $- 3 sqrt(3)$ at $(3 \, - sqrt(3))$). #h(0.6em) (b) The candidate $x = 3$ is excluded, so the maximum occurs on the new boundary $x = 2$: the maximum is $4$, at $\(2\,2\)$.

#strong[\47.] (a) $(- 2 / 3 \, - 1 / 3 \, - 2 / 3)$, at distance $4$. #h(0.6em) (b) $(3 / 2 \, 2 \, 5 / 2)$.

#strong[\48.] At the maximum $x^2 / 3 = y^2 / 9 = z^2 / 4 = 1 / 3$, so $x = 1$, $y = sqrt(3)$, $z = 2 / sqrt(3)$ and $V_max = 2$. The constraint surface is closed and bounded and $V$ is continuous, so the extreme values are attained; $V = 0$ on the boundary of the first octant, so the interior critical point is the maximum.

#strong[\49.] (a) $\(0\,0\)$ is the only critical point, and $D = - 4 < 0$: a saddle point, $f\(0\,0\)= 0$. #h(0.6em) (b) On $x^2 + y^2 = 1$: maximum $1$ at $\(plus.minus 1\,0\)$, minimum $- 1$ at $\(0\,plus.minus 1\)$.

#strong[\50.] (a) On $y = x$ the constraint becomes $2 x^2 + z^2 = 4$ and $f = 4 - x^2$: maximum $4$ at $\(0\,0\,plus.minus 2\)$, minimum $2$ at $plus.minus (sqrt(2) \, sqrt(2) \, 0)$. #h(0.6em) (b) The planes meet where $x + y = 20$, $z = 20$, so $w = 20 x y$ with $x + y = 20$\; the maximum is $w = 2000$ at $\(10\,10\,20\)$. Along the line $w = 20 x\(20 - x\)arrow.r - oo$ in both directions, so the critical point must be a maximum.

#strong[\51.] (a) $T =\(2 x - y\)^2$\; on $x = 5 cos t$, $y = 5 sin t$ this is $25\(2 cos t - sin t\)^2$, so the hottest temperature is $125^compose$ and the coldest is $0^compose$. #h(0.6em) (b) $r = 2$ cm, $h = 4$ cm. #h(0.6em) (c) $U_max = 128$ at $x = 8$, $y = 14$.

#strong[\52.] The method gives $x = y$, so $\(4\,4\)$ and $\(- 4\,- 4\)$. On the branch in the first quadrant $f = x + 16\/x arrow.r + oo$ as $x arrow.r 0^(+)$ and as $x arrow.r + oo$, so $\(4\,4\)$ is a #emph[minimum] there ($f = 8$) and $f$ has no maximum on $x y = 16$. On the third-quadrant branch $\(- 4\,- 4\)$ gives a maximum, $f = - 8$. The constraint set is unbounded, which is exactly what $nabla f = lambda nabla g$ cannot detect.

#ah[Part E]
#strong[\53.] $accent(A B, ⃗) times accent(A C, ⃗) = chevron.l 5\,3\,4 chevron.r$. (a) $frac(5 sqrt(2), 2)$. #h(0.6em) (b) $5 x + 3 y + 4 z = 13$. #h(0.6em) (c) $frac(13, 5 sqrt(2)) = frac(13 sqrt(2), 10)$.

#strong[\54.] (a) $upright(bold(v)) = t cos t thin upright(bold(i)) + t sin t thin upright(bold(j))$, $\|upright(bold(v))\|= t$ for $t gt.eq 0$. #h(0.6em) (b) $s\(t\)= t^2\/2$\; the length is $pi^2\/8$. #h(0.6em) (c) $upright(bold(T)) = cos t thin upright(bold(i)) + sin t thin upright(bold(j))$. (This curve is the involute of the unit circle.)

#strong[\55.] (a) $nabla f\(P\)= chevron.l 4\,2\,- 4 chevron.r$. #h(0.6em) (b) $- 2 / 3$. #h(0.6em) (c) In the direction $1 / 3 chevron.l 2\,1\,- 2 chevron.r$, at the rate $\|nabla f\|= 6$. #h(0.6em) (d) $upright(bold(r))\(1\)= chevron.l 1\,2\,- 1 chevron.r = P$ and $upright(bold(r))'\(1\)= chevron.l 1\,1\,2 chevron.r$, so $d f\/d t = 4 + 2 - 8 = - 2$.

#strong[\56.] $nabla F\(P_0\)= chevron.l 2\,8\,12 chevron.r$. (a) Tangent plane $x + 4 y + 6 z = 21$\; normal line $x = 1 + t$, $y = 2 + 4 t$, $z = 2 + 6 t$. #h(0.6em) (b) $partial z\/partial x = - x\/\(3 z\)= - 1 / 6$ and $partial z\/partial y = - 2 y\/\(3 z\)= - 2 / 3$, matching $z = 1 / 6\(21 - x - 4 y\)$. #h(0.6em) (c) $nabla F parallel chevron.l 1\,4\,6 chevron.r$ forces $\(x\,y\,z\)= plus.minus\(1\,2\,2\)$, so the points are $\(1\,2\,2\)$ and $\(- 1\,- 2\,- 2\)$.

#strong[\57.] $f_x = 0$ and $f_y = 0$ give $x^2 + y^2 = 5$ and $x y = 2$, so the critical points are $\(2\,1\)$, $\(1\,2\)$, $\(- 1\,- 2\)$, $\(- 2\,- 1\)$. Here $D = 36 #h(-0.167em) (x^2 - y^2)$. Local minimum $- 28$ at $\(2\,1\)$\; local maximum $28$ at $\(- 2\,- 1\)$\; saddle points at $\(1\,2\)$ and $\(- 1\,- 2\)$.

#strong[\58.] (a) $chevron.l 1\,- 2\,5 chevron.r = 2 lambda chevron.l x\,y\,z chevron.r$ gives $\(x\,y\,z\)= plus.minus\(1\,- 2\,5\)$: maximum $30$ at $\(1\,- 2\,5\)$, minimum $- 30$ at $\(- 1\,2\,- 5\)$. #h(0.6em) (b) A cube of edge $4 / sqrt(3)$, of volume $frac(64, 3 sqrt(3)) = frac(64 sqrt(3), 9)$.

#v(6pt)
#line(length: 100%, stroke: 0.5pt + rulegray)
#text(font: sans, size: 8pt, fill: soft)[Problems adapted from #emph[Thomas' Calculus: Early Transcendentals], 15th edition (Hass, Heil, Weir), §§11.1--11.5, 12.1--12.3, 13.1--13.9; from the MIT 18.02 problem sets distributed with the Lecture Group 1 lesson notes; and from the MA1521 Lecture Group 2 tutorial questions, Lessons 02--12.]
