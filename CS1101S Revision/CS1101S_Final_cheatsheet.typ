// CS1101S Final Cheatsheet (adapted from CS1101S_MT_cheatsheet.typ)
// Side 1: Units 1–2 (midterm material, condensed). Side 2: Units 3–4.
// Compile: typst compile CS1101S_Final_cheatsheet.typ

#let kw-color = rgb(0, 92, 197)
#let accent = rgb(196, 72, 0)     // highlights (burnt orange)
#let accent2 = rgb(16, 94, 110)   // headings (deep teal)
#let cmt = rgb(110, 110, 110)
#let rowgray = luma(90%)

#let body-size = 7.4pt
#let code-size = 6.5pt
#let codebg = luma(96%)

#set document(title: "CS1101S final cheatsheet (adapted from m. zaidan)")
#set page(
  paper: "a4",
  flipped: true,
  margin: 0.22in,
  columns: 4,
)
#set columns(gutter: 8pt)
#set text(font: "IBM Plex Sans", stretch: 75%, size: body-size)
#show math.equation: set text(font: "IBM Plex Math")
#set par(leading: 0.42em, spacing: 0.55em, justify: false)
#set list(indent: 0pt, body-indent: 0.4em, spacing: 0.38em)
#set strong(delta: 200)

// Python code uses Typst's built-in raw syntax highlighting (default theme)
#show raw: set text(font: "Inconsolatazi4", size: code-size)
#show raw.where(block: false): set text(size: 7pt)
#show raw.where(block: true): set par(leading: 0.3em)
// each code block is unbreakable and shaded, so no function is split across columns
#show raw.where(block: true): it => block(
  width: 100%, fill: codebg, radius: 1.5pt,
  outset: (x: 2pt, y: 1.5pt), above: 3.8pt, below: 3.8pt,
  breakable: it.lines.len() > 16, it,   // only long blocks may run on into the next column
)

#show table: it => block(breakable: false, it)
#show heading: set block(sticky: true)
#show heading.where(level: 1): it => block(
  width: 100%, fill: accent2, radius: 1.5pt,
  inset: (x: 3pt, y: 2pt), above: 6pt, below: 3.6pt,
  text(fill: white, size: 8pt, weight: "bold", it.body),
)
#show heading.where(level: 2): it => block(
  above: 5pt, below: 2.6pt,
  text(fill: accent2, size: 7.5pt, weight: "bold", it.body),
)

#let hl(x) = text(fill: accent, x)
#let hll(x) = text(fill: accent2, x)
#let note(x) = text(fill: cmt, style: "italic", x)

#let booktable(..args) = table(
  stroke: none,
  inset: (x: 3pt, y: 1.4pt),
  ..args,
)
#let toprule = table.hline(stroke: 0.8pt)
#let midrule = table.hline(stroke: 0.4pt)
#let bottomrule = table.hline(stroke: 0.8pt)

// ── T-diagram pieces ─────────────────────────────────────────────────────────
#let tcell(w, body) = box(width: w, height: 8pt, stroke: 0.5pt, align(center + horizon, text(size: 5.6pt, body)))
#let tprog(name, lang, w: 30pt) = stack(dir: ttb, tcell(w, name), tcell(w, lang))
#let tinterp(lang, impl, w: 22pt) = stack(dir: ttb, tcell(w, lang), tcell(w, impl))
#let tmachine(name, w: 22pt) = box(width: w, height: 9pt, {
  place(polygon(stroke: 0.5pt, (0pt, 0pt), (w, 0pt), (w / 2, 9pt)))
  place(top + center, dy: 0.8pt, text(size: 5pt, name))
})
// compiler: bar "from → to" over a stem holding the implementation language, then whatever runs it
#let tcomp(from, to, impl, ..below) = stack(dir: ttb,
  tcell(56pt, [#from #sym.arrow.r #to]),
  align(center, stack(dir: ttb, tcell(22pt, impl), ..below.pos())))

// ═══════════════════════ SIDE 1: Units 1–2 (functions, data) ═══════════════════════

= Recursion, Iteration & Evaluation
Recursive process: #hl[growing] deferred operations (space $prop$ depth). Iterative: #text(fill: kw-color)[none] -- the recursive call is the *last* thing done; state is carried in arguments.
*Wishful thinking:* base case; assume the smaller problem is solved; combine.

*Applicative order* (Python): evaluate function and argument expressions, then substitute. `a if p else b` evaluates `p`, then *only* one branch. *Normal order:* substitute unevaluated arguments; evaluate when needed.
`p and q` $equiv$ `q if p else False`; `p or q` $equiv$ `True if p else q` (short-circuit).
*Precedence:* application > conditional > lambda, so `lambda x: a if p else b` is `lambda x: (a if p else b)`.
```python
def fib_iter(a, b, count):  # fib_iter(1, 0, n): Θ(n), Θ(1)
    return (b if count == 0
            else fib_iter(a + b, a, count - 1))
def fib(n):                 # tree: Θ(φ^n) time, Θ(n) space
    return n if n <= 1 else fib(n - 1) + fib(n - 2)
```
```python
def gcd(a, b): return a if b == 0 else gcd(b, a % b)
```

= Scope & Higher-Order Functions
A name refers to the #hl[closest surrounding declaration] (lexical scope). An assignment *anywhere* in a function body makes the name local to the *whole* body; reading it before it is assigned is an error.
```python
z = 3
def h():
    print(z)   # ERROR: z is local to h (assigned below),
    z = 4      # even if `z = …` is in a branch not taken
def f(g):
    z = 4
    return g(z)
f(lambda y: y + z)   # 7: the lambda's z is the global z
```
```python
compose = lambda f, g: lambda x: f(g(x))
def repeat(f, n):         # f applied n times; returns a fn
    return lambda x: (x if n == 0
                      else repeat(f, n - 1)(f(x)))
```
*CPS:* pass the deferred operation as an extra function argument $=>$ iterative process, but the chain of continuations still takes $Theta(n)$ space.
```python
def fac_cps(n, c):         # fac_cps(5, lambda x: x)
    return (c(1) if n <= 1
            else fac_cps(n - 1, lambda x: c(n * x)))
```

= Pairs, Linked Lists & Trees
Llist: #text(fill: kw-color)[`None`] or #hl[a pair whose tail is a llist]. Tree: a llist whose elements are data items or trees.
`pair(1, 2)` prints `[1, 2]`; `llist(1, 2)` is `[1, [2, None]]`. One box per `pair` call; `head`, `tail`, naming and passing *never copy*.
```python
pair = lambda x, y: lambda f: f(x, y)  # pairs as functions
head = lambda p: p(lambda x, y: x)
```
*Pre-declared* ($n$ = length): `length` $Theta(n)$; `llist_ref(xs, i)` $Theta(i)$; `append(xs, ys)` $Theta(|"xs"|)$, copies `xs`, *shares* `ys`; `reverse` $Theta(n)$; `member(v, xs)` returns the sub-llist starting at `v` or `None`; `remove` (first only), `remove_all`; `enum_llist(a, b)` inclusive; `build_llist(f, n)` = `llist(f(0), …, f(n-1))`; `for_each`; `reduce(op, init, llist(1, 2, 3))` = `op(1, op(2, op(3, init)))`.
```python
def map(f, xs):
    return (None if is_none(xs)
            else pair(f(head(xs)), map(f, tail(xs))))
```
```python
def filter(pred, xs):
    return (None if is_none(xs)
            else pair(head(xs), filter(pred, tail(xs)))
                 if pred(head(xs))
            else filter(pred, tail(xs)))
```
```python
def reduce(op, initial, xs):     # op(element, rest_result)
    return (initial if is_none(xs) else
            op(head(xs), reduce(op, initial, tail(xs))))
```
```python
def append(xs, ys):
    return (ys if is_none(xs)
            else pair(head(xs), append(tail(xs), ys)))
```
```python
def reverse(xs):                  # iterative, Θ(n)
    def rev(orig, done):
        return (done if is_none(orig) else
                rev(tail(orig), pair(head(orig), done)))
    return rev(xs, None)
```
```python
def remove(v, xs):
    return (None if is_none(xs)
            else tail(xs) if head(xs) == v
            else pair(head(xs), remove(v, tail(xs))))
flatten = lambda xss: reduce(append, None, xss)
```
```python
def remove_duplicates(xs):
    return (None if is_none(xs) else pair(head(xs),
        remove_duplicates(filter(lambda y: y != head(xs),
                                 tail(xs)))))
```
All three: recursive process, $Theta(n)$ time and space. *Choose:* same length out $=>$ `map`; subset of items $=>$ `filter`; anything else $=>$ `reduce`.
```python
def map_tree(f, tree):
    return map(lambda t: map_tree(f, t) if is_llist(t)
                         else f(t), tree)
```
== Binary search trees
Empty, or `llist(entry, left, right)` with left < entry < right. `find`, `insert`: $O(log n)$ balanced, $O(n)$ degenerate. `insert` rebuilds the path: `make_tree(entry(t), insert(left_branch(t), x), right_branch(t))`.
```python
def find(bst, x):
    return (False if is_empty_tree(bst)
            else True if x == entry(bst)
            else find(left_branch(bst), x)
                 if x < entry(bst)
            else find(right_branch(bst), x))
```
== Permutations, subsets, combinations
```python
def permutations(s):
    return (llist(None) if is_none(s)
            else reduce(append, None, map(
                lambda x: map(lambda p: pair(x, p),
                              permutations(remove(x, s))),
                s)))
```
```python
def subsets(s):
    if is_none(s):
        return llist(None)
    else:
        rest = subsets(tail(s))
        return append(
            rest, map(lambda x: pair(head(s), x), rest))
```
```python
def combinations(xs, r):   # r items out of xs
    if r == 0:
        return llist(None)
    elif is_none(xs):
        return None
    else:
        return append(combinations(tail(xs), r),
                      map(lambda c: pair(head(xs), c),
                          combinations(tail(xs), r - 1)))
```

= Orders of Growth
$r(n)$ is $O(g)$: $r(n) <= k dot g(n)$ for some $k > 0$ and all large $n$ (upper bound). $Omega(g)$: $r(n) >= k dot g(n)$. $Theta(g)$: both. Give the *tightest*. \
$1 < log n < sqrt(n) < n < n log n < n^2 < n^3 < 2^n < n! < n^n$ \
Drop constants and lower-order terms; sequence $=>$ add (larger wins); nesting $=>$ multiply. Loop `i = i * 2` or `i = i / 2`: $log n$ rounds. $1 + 2 + … + n = Theta(n^2)$; $1 + 2 + 4 + … + n = Theta(n)$; $n\/1 + n\/2 + … + n\/n = Theta(n log n)$. \
*Space* = max deferred operations + data alive at once (pairs/lists that must be remembered, not the total ever created).
#show table: set text(size: 6.3pt)
#booktable(
  columns: (auto, 1fr, auto, 1fr),
  align: (left, left, left, left),
  inset: (x: 1.5pt, y: 1.3pt),
  toprule,
  [$T(n) =$], [], [$T(n) =$], [],
  midrule,
  [$T(n-1) + O(1)$], [$O(n)$], [$T(n\/2) + O(1)$], [$O(log n)$],
  [$T(n-1) + O(log n)$], [$O(n log n)$], [$T(n\/2) + O(n)$], [$O(n)$],
  [$T(n-1) + O(n)$], [$O(n^2)$], [$2T(n\/2) + O(1)$], [$O(n)$],
  [$T(n-1) + O(n^k)$], [$O(n^(k+1))$], [$2T(n\/2) + O(n)$], [$O(n log n)$],
  [$2T(n-1) + O(1)$], [$O(2^n)$], [$T(n-1) + T(n-2) + O(1)$], [$O(phi^n)$],
  bottomrule,
)
*Master theorem* $T(n) = a T(n\/b) + Theta(n^d)$: $a < b^d => Theta(n^d)$ #h(0.6em) $a = b^d => Theta(n^d log n)$ #h(0.6em) $a > b^d => Theta(n^(log_b a))$.

= Sorting Linked Lists
```python
def insert(x, xs):                    # xs sorted
    return (llist(x) if is_none(xs)
            else pair(x, xs) if x <= head(xs)
            else pair(head(xs), insert(x, tail(xs))))
```
```python
def insertion_sort(xs):
    return (xs if is_none(xs) else
            insert(head(xs), insertion_sort(tail(xs))))
```
```python
def merge(xs, ys):
    if is_none(xs):
        return ys
    elif is_none(ys):
        return xs
    elif head(xs) <= head(ys):
        return pair(head(xs), merge(tail(xs), ys))
    else:
        return pair(head(ys), merge(xs, tail(ys)))
```
```python
def take(xs, n):
    return (None if n == 0
            else pair(head(xs), take(tail(xs), n - 1)))
```
```python
def drop(xs, n):
    return xs if n == 0 else drop(tail(xs), n - 1)
def merge_sort(xs):
    if is_none(xs) or is_none(tail(xs)):
        return xs
    else:
        m = math_floor(length(xs) / 2)
        return merge(merge_sort(take(xs, m)),
                     merge_sort(drop(xs, m)))
```
```python
def quicksort(xs):
    if is_none(xs) or is_none(tail(xs)):
        return xs
    else:
        p = head(xs)
        lo = filter(lambda x: x <= p, tail(xs))
        hi = filter(lambda x: x > p, tail(xs))
        return append(quicksort(lo),
                      pair(p, quicksort(hi)))
```

// ═══════════════════════ SIDE 2: Units 3–4 (state, beyond) ═══════════════════════

= State & Mutable Data
*Reassignment* changes a binding; *mutation* changes an existing pair or list, and #hl[every alias sees it]. Results now depend on call order -- the substitution model no longer works.
`nonlocal x` / `global x`: assignments to `x` in this body go to the enclosing function's / the global `x`. Without it, `x = …` creates a *local* `x`.
```python
def make_account(balance):     # each call: its own balance
    def withdraw(amount):
        nonlocal balance
        if balance >= amount:
            balance = balance - amount
            return balance
        else:
            return "Insufficient funds"
    return withdraw
```
`set_head(p, x)`, `set_tail(p, y)` change pair `p` in place and return `None`. A pair *is* the list `[h, t]`: `p[0]`, `p[1]`.
`a is b`: same object (each `pair(…)`, `[…]`, `lambda` is a new one). `==`: numbers, strings.
After `c = append(a, b)`, `set_head(b, 9)` shows in `c`; mutating `a` does not. `set_tail(last_pair, xs)` makes a cycle: `length` never ends.

== Destructive processing
"No new pairs" $=>$ never call `pair`, `llist`, `map`, `filter`, `append`; relink the existing pairs with `set_tail` / `set_head`.
```python
def d_append(xs, ys):
    if is_none(xs):
        return ys
    else:
        set_tail(xs, d_append(tail(xs), ys))
        return xs
```
```python
def d_map(f, xs):                  # returns None
    if not is_none(xs):
        set_head(xs, f(head(xs)))
        d_map(f, tail(xs))
```
```python
def d_filter(pred, xs):
    if is_none(xs):
        return xs
    elif pred(head(xs)):
        set_tail(xs, d_filter(pred, tail(xs)))
        return xs
    else:
        return d_filter(pred, tail(xs))
```
```python
def d_reverse(xs):                 # relink every tail
    def rev(rest, done):
        if is_none(rest):
            return done
        else:
            nxt = tail(rest)      # save before overwriting
            set_tail(rest, done)
            return rev(nxt, rest)
    return rev(xs, None)
```
```python
def d_insert(p, xs):    # p: a pair; xs sorted ascending
    if is_none(xs):
        set_tail(p, None)
        return p
    elif head(p) <= head(xs):
        set_tail(p, xs)
        return p
    else:
        set_tail(xs, d_insert(p, tail(xs)))
        return xs
```
```python
def d_insertion_sort(xs):
    return (xs if is_none(xs)
            else d_insert(xs, d_insertion_sort(tail(xs))))
```
Always *use the returned value* (the first pair may change). Read `tail` *before* you overwrite it. Loop over a llist: `p = xs`, then `while not is_none(p): … p = tail(p)` -- $Theta(1)$ space.

= Environment Model
- *Environment* = sequence of *frames* (name → value). Lookup: first frame, then enclosing ones; not found $=>$ unbound-name error.
- Built-ins frame ← *global* frame (top-level names) ← call frames.
- `lambda`/`def` creates a *function object* (two circles): parameters + body, and the #hl[environment in which it was created]. `def f` then binds `f` in the current frame.
- *Call:* evaluate function and arguments in the *current* env; make a new frame that extends the #hl[function's own environment] (not the caller's); bind parameters; bind every name assigned in the body as a local, *unassigned*; run the body.
- `x = e`: evaluate `e`, then set the binding of `x` in the frame that owns it (local frame; the enclosing/global one if declared `nonlocal`/`global`).
- *No block scope:* `if`, `while`, `for` create *no* frames; the loop variable lives in the surrounding frame and is reassigned, so closures made in a loop all see its *final* value (fix: make each in a function call).
- Built-in calls create no frame; empty frames are not drawn. Numbers, booleans, strings, `None` go inside the frame; pairs, lists and function objects outside, with arrows.

= Python Lists & Loops
`A = [None] * n` ($Theta(n)$); `A[i]` read/write $Theta(1)$; `len(A)` $Theta(1)$; `A[-1]` is the last. #hl[Lists cannot grow]: size must be known first (count, then fill). Index $>=$ `len` is an error. `[[0] * c] * r` shares *one* row -- build each row in a loop.
`for i in range(a, b, step)`: `b` exclusive; `range(n)` = `0 … n-1`; down: `range(n - 1, -1, -1)`. Only `range` in `for`.
`break` leaves the innermost loop; `continue` starts its next round (in a `while`, do the update *before* `continue`).
Reassigning a parameter never changes the caller's list; assigning to `A[i]` does. Llist → list: `A = [None] * length(xs)`, fill in a `while`. List → llist: `i` from the end down, `xs = pair(A[i], xs)`.
```python
def swap(A, i, j):
    temp = A[i]
    A[i] = A[j]
    A[j] = temp
```
```python
def make_table(rows, cols):        # distinct rows
    T = [None] * rows
    for r in range(rows):
        T[r] = [None] * cols
    return T
```
```python
def count_leaves(T):   # nested lists: recurse on elements
    if is_number(T):
        return 1
    else:
        count = 0
        for i in range(len(T)):
            count = count + count_leaves(T[i])
        return count
```
```python
def binary_search(A, v):           # A sorted; Θ(log n)
    low = 0
    high = len(A) - 1
    while low <= high:
        mid = math_floor((low + high) / 2)
        if v == A[mid]:
            return True
        elif v < A[mid]:
            high = mid - 1
        else:
            low = mid + 1
    return False
```
```python
def selection_sort(A):
    for i in range(len(A) - 1):
        min_pos = i
        for j in range(i + 1, len(A)):
            if A[j] < A[min_pos]:
                min_pos = j
        swap(A, i, min_pos)
```
```python
def insertion_sort(A):
    for i in range(1, len(A)):
        j = i
        while j > 0 and A[j - 1] > A[j]:
            swap(A, j - 1, j)
            j = j - 1
```
```python
def merge_sort(A):
    def sort(low, high):
        if low < high:
            mid = math_floor((low + high) / 2)
            sort(low, mid)
            sort(mid + 1, high)
            merge(A, low, mid, high)
    sort(0, len(A) - 1)
```
```python
def merge(A, low, mid, high):
    B = [None] * (high - low + 1)
    left = low
    right = mid + 1
    for i in range(len(B)):
        if right > high or (left <= mid
                            and A[left] <= A[right]):
            B[i] = A[left]
            left = left + 1
        else:
            B[i] = A[right]
            right = right + 1
    for i in range(len(B)):
        A[low + i] = B[i]
```
#booktable(
  columns: (1fr, auto, auto, auto),
  align: (left, center, center, center),
  fill: (_, y) => if y in (3, 5) { rowgray },
  toprule,
  [*Time*], [best], [worst], [extra space (list)],
  midrule,
  [Selection sort], [$n^2$], [$n^2$], [$1$],
  [Insertion sort], [$n$ (sorted)], [$n^2$ (reversed)], [$1$],
  [Merge sort], [$n log n$], [$n log n$], [$n$],
  [Quicksort (llist)], [$n log n$], [$n^2$ (sorted)], [],
  bottomrule,
)
Llist versions build new pairs and defer operations: $Theta(n)$ space or more. Linear search $Theta(n)$. Binary search needs sorted data and $Theta(1)$ access (list or balanced BST), never a llist.

= Memoization
Store each result the first time; later calls look it up. Time = (number of distinct arguments) $times$ (work per call).
```python
def memoize(f, size):              # f: non-negative int
    mem = [None] * size
    def memoized(x):
        if mem[x] is not None:
            return mem[x]
        result = f(x)
        mem[x] = result
        return result
    return memoized
mfib = memoize(lambda n: n if n <= 1          # Θ(n)
               else mfib(n - 1) + mfib(n - 2), 32)
```
`memoize(fib, 32)` stays exponential: the recursive calls must go through the memoized name. Two arguments: `mem = make_table(n + 1, k + 1)`, check `mem[i][j]` first $=>$ `choose(n, k)` in $Theta(n k)$.

= Streams
Stream: `None`, or a pair whose #hl[tail is a nullary function returning a stream]. The tail runs only on `stream_tail`, and *runs again each time* unless memoized.
```python
def stream_tail(s): return tail(s)()
def stream_ref(s, n):
    return (head(s) if n == 0
            else stream_ref(stream_tail(s), n - 1))
```
```python
def stream_map(f, s):
    return None if is_none(s) else pair(
        f(head(s)), lambda: stream_map(f, stream_tail(s)))
```
```python
def add_streams(s1, s2):        # mul_streams: same with *
    if is_none(s1):
        return s2
    elif is_none(s2):
        return s1
    else:
        return pair(head(s1) + head(s2),
                    lambda: add_streams(stream_tail(s1),
                                        stream_tail(s2)))
def integers_from(n):
    return pair(n, lambda: integers_from(n + 1))
ones = pair(1, lambda: ones)     # one pair, reused forever
integers = pair(1, lambda: add_streams(ones, integers))
fibs = pair(0, lambda: pair(1,
            lambda: add_streams(stream_tail(fibs), fibs)))
```
`memo_fun(f)` runs `f` on its first call only and then returns the stored result: `pair(x, memo_fun(lambda: …))`. It changes *how often side effects (prints, new pairs) happen*, never the values. `x = stream_map(f, s)` applies `f` to the head *now*; each `stream_ref(x, k)` applies it to elements $1…k$ again (only to new ones if memoized). A stream that refers to *its own name* revisits the same pairs; one built by a *function call* makes a new pair per tail. Also: `eval_stream(s, n)` (first `n` as a llist), `stream_filter(p, s)` (never returns if nothing matches), `enum_stream(lo, hi)`, `stream_append`.

= Metacircular Evaluator
`parse(string)` gives a syntax tree of tagged llists. `evaluate(component, env)` dispatches on the tag; `apply(fun, args)` applies a function value. *evaluate → apply* for every application; *apply → evaluate* on the body, in a new frame.
```python
llist('literal', 5)            llist('name', 'x')
llist('assignment', name, e)   llist('return_statement', e)
llist('binary_operator_combination', '+', e1, e2)
llist('conditional_expression', pred, cons, alt)
llist('sequence', llist(s1, …))
llist('application', f_exp, llist(arg, …))
llist('lambda_expression', llist(name, …), body)
llist('function_definition', name, llist(name, …), body)
```
*Syntax functions:* `is_tagged_list(c, tag)` = `is_pair(c) and head(c) == tag`. Selectors (`head(tail(c))`, `llist_ref(c, i)`): `literal_value`; `symbol_of_name`; `operator_symbol`, `first_operand`, `second_operand`; `conditional_predicate`, `_consequent`, `_alternative`; `sequence_statements`, then `first_statement`, `rest_statements`, `is_empty_sequence`, `is_last_statement`; `assignment_symbol`, `assignment_value_expression`; `function_expression`, `arg_expressions`; `lambda_parameter_symbols`, `lambda_body`; `function_definition_symbol`, `_parameter_symbols`, `_body`; `return_expression`. Constructors: `make_name`, `make_application`, `make_return_statement`.
```python
def evaluate(c, env):                # c: a component
    if is_literal(c):
        return literal_value(c)
    elif is_name(c):
        return lookup_symbol_value(symbol_of_name(c), env)
    elif is_application(c):
        return apply(
            evaluate(function_expression(c), env),
            llist_of_values(arg_expressions(c), env))
    elif is_operator_combination(c):
        return evaluate(
            operator_combination_to_application(c), env)
    elif is_conditional(c):
        return eval_conditional(c, env)
    elif is_lambda_expression(c):
        return make_function(
            lambda_parameter_symbols(c), None, None,
            make_return_statement(lambda_body(c)), env)
    elif is_sequence(c):
        return eval_sequence(sequence_statements(c), env)
    elif is_return_statement(c):
        return eval_return_statement(c, env)
    elif is_function_definition(c):
        return eval_function_definition(c, env)
    elif is_assignment(c):
        return eval_assignment(c, env)
    else:  # (pass, global, nonlocal statements give None)
        return error("unknown syntax", c)
```
```python
def llist_of_values(exps, env):    # order = map's order
    return map(lambda e: evaluate(e, env), exps)
def is_truthy(x):
    return x if is_boolean(x) else error(
        "boolean expected, received", x)
def eval_conditional(c, env):
    if is_truthy(evaluate(conditional_predicate(c), env)):
        return evaluate(conditional_consequent(c), env)
    else:
        return evaluate(conditional_alternative(c), env)
```
```python
def eval_sequence(stmts, env):
    if is_empty_sequence(stmts):
        return None
    elif is_last_statement(stmts):
        return evaluate(first_statement(stmts), env)
    else:
        v = evaluate(first_statement(stmts), env)
        if is_return_value(v):
            return v               # skip the rest
        else:
            return eval_sequence(
                rest_statements(stmts), env)
```
```python
def eval_function_definition(c, env):
    ps = function_definition_parameter_symbols(c)
    body = function_definition_body(c)
    fun = make_function(ps, local_variables(ps, body),
                        global_variables(body), body, env)
    assign_symbol_value(function_definition_symbol(c),
                        fun, env)
```
`eval_assignment`: evaluate the value expression, `assign_symbol_value(symbol, value, env)`, return the value. `eval_return_statement`: `make_return_value(evaluate(return_expression(c), env))` = `llist('return_value', v)`; `eval_sequence` hands it up and only `apply` unwraps it. No `return` $=>$ `None`.
`local_variables(ps, body)` = names assigned in the body, minus parameters and names declared `global`/`nonlocal` -- decided *once*, when the definition is evaluated. A lambda has no locals.
```python
def apply(fun, arguments):
    if is_built_in_function(fun):
        return apply_built_in_function(fun, arguments)
    elif is_compound_function(fun):
        locals = function_locals(fun)
        globals = function_globals(fun)
        result = evaluate(function_body(fun),
            extend_environment(
                append(function_parameters(fun),
                       append(locals, globals)),
                append(arguments, append(
                    map(lambda s: '*unassigned*', locals),
                    map(lambda s: '*global*', globals))),
                function_environment(fun)))   # lexical
        return (return_value_content(result)
                if is_return_value(result) else None)
    else:
        return error("unknown function type", fun)
```
*Values:* `make_function(params, locals, globals, body, env)` = `llist('compound_function', …)`, selectors `function_parameters`, `_locals`, `_globals`, `_body`, `_environment`. Built-in: `llist('built_in', impl)`, applied with `apply_in_underlying_python(impl, args)`.
*Environment* = llist of frames; frame = `pair(symbols, values)`; `the_empty_environment = None`.
```python
def extend_environment(symbols, vals, base_env):
    return (pair(pair(symbols, vals), base_env)
            if length(symbols) == length(vals)
            else error("arity mismatch"))
```
```python
def lookup_symbol_value(symbol, env):
    def env_loop(env):
        def scan(symbols, vals):
            if is_none(symbols):
                return env_loop(enclosing_environment(env))
            elif symbol == head(symbols):
                return head(vals)  # if '*global*': look
            else:                  # in the global env
                return scan(tail(symbols), tail(vals))
        if env is the_empty_environment:
            return error("unbound name", symbol)
        else:
            frame = first_frame(env)
            return scan(frame_symbols(frame),
                        frame_values(frame))
    return env_loop(env)
```
`assign_symbol_value(symbol, val, env)`: same scan; found $=>$ `set_head(vals, val)`; not found in the *global* frame $=>$ `add_binding_to_frame`; otherwise continue outwards (this is how `nonlocal` works: the name is simply not local).
`setup_environment()`: a frame of all built-ins (`built_in_functions` = `llist(llist('head', head), …, llist('+', lambda x, y: x + y), …)`) extended by an empty global frame. `a + b` becomes an application of the *name* `'+'` (`operator_combination_to_application`).

== Changing the evaluator
- *New operator / primitive:* add `llist('%', lambda x, y: x ** y)` to `built_in_functions`.
- *Truthiness:* change `is_truthy` (e.g. `False`, `0`, `""`, `None` are falsy).
- *Argument order:* write `llist_of_values` recursively -- evaluate `head(exps)` first, then the rest (left to right), or the rest first.
- *Unassigned local read:* in lookup, a value `'*unassigned*'` $=>$ error.
- *Dynamic scoping:* pass `env` to `apply` and extend *it* instead of `function_environment(fun)` $=>$ free names resolve at the call site.

== Lazy evaluation (normal order)
```python
def actual_value(exp, env):
    return force_it(evaluate(exp, env))
def delay_it(exp, env):
    return llist('thunk', exp, env)
def force_it(obj):                 # memoizing version
    if is_thunk(obj):
        result = actual_value(thunk_exp(obj),
                              thunk_env(obj))
        set_head(obj, 'evaluated_thunk')
        set_head(tail(obj), result)    # store the value
        set_tail(tail(obj), None)      # drop the env
        return result
    elif is_evaluated_thunk(obj):
        return thunk_value(obj)
    else:
        return obj
```
Application: `apply(actual_value(function_expression(c), env), arg_expressions(c), env)` -- the arguments stay *expressions*. In `apply`, a built-in gets `map(actual_value)` of them (strict); a compound function gets `map(delay_it)` (thunks). `eval_conditional` and the driver use `actual_value`. An unused argument is never evaluated, so `unless(c, a, b)` works as a function and compound `pair` gives lazy lists.

= T-Diagrams
*Program* [name / its language]; *interpreter* [language it runs / written in]; *compiler* [from → to / written in]; *machine* ▽.
Whatever sits *on* something must be written in the language that thing accepts. A compiler changes only the *language* of its input (same name) and must itself run on an interpreter or machine. Compiling an interpreter or compiler changes the language it is *written in*.
#block(breakable: false, grid(
  columns: (auto, 1fr),
  column-gutter: 6pt,
  align: (left + top, left + horizon),
  stack(dir: ltr, spacing: 0pt,
    tprog[Ctrl][Python],
    pad(top: 8pt, tcomp([Python], [PVML], [JS], tinterp[JS][x86], tmachine[x86])),
    stack(dir: ttb, tprog[Ctrl][PVML], align(center, stack(dir: ttb, tinterp[PVML][EV3], tmachine[EV3]))),
  ),
  note[Python program `Ctrl`, compiled to PVML by a compiler written in JS (on a JS interpreter on x86), then run by a PVML interpreter on the EV3.],
))

= Types, Objects & Math
`def f(x: int) -> int:` #h(0.4em) `Callable[[A, B], C]` #h(0.4em) `Pair[H, T]` #h(0.4em) `list[T]` #h(0.4em) `T | None` #h(0.4em) `def f[A](x: A) -> A:` (generic). `type LList[T] = Pair[T, LList[T]] | None`. Type = set of values; subtype = subset (an `int` is a `float`, not vice versa). `head(xs)` is accepted only after an `is_none(xs)` test. Checked *before* running, on every path; passing $!=$ correct.
*Object* = state + operations: a closure with a `dispatch(message)` function, or a `class` (`def __init__(self, r): self.r = r`; `c = Circle(1)`; `c.area()`). A class is a type.
`math_floor`, `math_sqrt`, `math_pow(b, e)` (float), `abs`, `min`, `max`, `a % b`, `round(2.5) == 2`, `str(19)`. #h(1fr) #note[adapted from m. zaidan]
