// Appendix A — "Selected Python §n Reference", as printed in the Semester 1 papers.
// Appendix B — declarations of the list functions that the Semester 2 papers
// ask candidates to assume.

#import "cs1101s-exam.typ": *

#let appendix-a(chapter: "3", metacircular: false) = {
  let lang = [Python §#chapter]
  let row = ref-row.with(170pt)
  let wide = ref-row.with(179.46pt)

  appendix-title(
    "A",
    [Selected #lang Reference],
    if metacircular [Linked lists, Python lists, mutation, streams, and evaluator primitives] else [Linked lists, Python lists, mutation, and streams],
  )

  ref-compact[
    #block(above: 0pt, below: 0pt)[
      The following functions are pre-declared in #lang. `None` denotes the empty linked list; linked-list positions start at zero. The linked-list processing functions below use iterative processes, with the stated time and space bounds. Bounds assume constant-time element operations.
    ]
    #v(4pt)

    #ref-heading[Pairs and linked lists]
    #row[pair(x, y)][Makes a pair whose head is `x` and whose tail is `y`. Time and space $O(1)$.]
    #row[is_pair(x)][Returns `True` if `x` is a pair, and `False` otherwise. Time and space $O(1)$.]
    #row[head(p)][Returns the head (first component) of pair `p`. Time and space $O(1)$.]
    #row[tail(p)][Returns the tail (second component) of pair `p`. Time and space $O(1)$.]
    #row[is_none(x)][Returns `True` if `x` is the empty linked list `None`, and `False` otherwise. Time and space $O(1)$.]
    #row[is_llist(xs)][Returns `True` if `xs` is a linked list as defined in lectures, and `False` otherwise. Time $O(n)$ and space $O(1)$, where `n` is the length of the chain of tail operations that can be applied to `xs`.]
    #row[llist(x1, …, xn)][Given `n` values, returns a linked list of length `n` containing the values in the given order. Time and space $O(n)$.]
    #row[enum_llist(start, end)][Makes a linked list with elements from `start` to `end`, inclusive: `enum_llist(2, 5)` returns `llist(2, 3, 4, 5)`. Time and space $O(n)$ in the result length.]
    #row[build_llist(fun, n)][Makes a linked list with `n` elements by applying unary function `fun` to the numbers 0 through `n - 1`. Time and space $O(n)$.]
    #row[length(xs)][Returns the length of the linked list `xs`. Time $O(n)$ and space $O(1)$, where `n` is its length.]
    #row[llist_ref(xs, n)][Returns the element of `xs` at position `n` (0-indexed). Time $O(n)$ and space $O(1)$.]

    #ref-heading[Higher-order linked-list functions]
    #row[map(f, xs)][Returns the linked list that results from `xs` by element-wise application of unary function `f`. Time and space $O(n)$.]
    #row[filter(pred, xs)][Returns the linked list containing only the elements of `xs` for which the one-argument function `pred` returns `True`, preserving their order. Time and space $O(n)$.]
    #row[reduce(f, initial, xs)][Applies binary function `f` to the elements of `xs` from right to left, starting with `initial`. Time and space $O(n)$, assuming `f` takes constant time. `reduce` here is the pre-declared linked-list right fold.]
    #row[for_each(fun, xs)][Applies unary function `fun` to every element of `xs`, in order, then returns `True`. Time $O(n)$ and space $O(1)$.]

    #ref-heading[Searching and modifying linked lists]
    #row[member(v, xs)][Returns the first postfix sub-linked list whose head is identical to `v` (using `==`), or `None` if no such element occurs. Time $O(n)$ and space $O(1)$.]
    #row[remove(v, xs)][Returns the linked list that results from `xs` by removing the first item identical (`==`) to `v`. Time and space $O(n)$.]
    #row[remove_all(v, xs)][Returns the linked list that results from `xs` by removing all items identical (`==`) to `v`. Time and space $O(n)$.]
    #row[reverse(xs)][Returns `xs` in reverse order. Time and space $O(n)$; the process is iterative, but the result itself occupies $O(n)$ space.]
    #row[append(xs, ys)][Returns the linked list that results from appending `ys` to `xs`. Time and space $O(n)$ in the length of `xs`. A definition supplied in a question overrides this pre-declared implementation.]

    #ref-heading[Type predicates]
    #row[is_boolean(x), is_number(x), is_string(x), is_function(x)][Return `True` exactly when `x` has the named type, and `False` otherwise --- `is_number` covers integers, floats, and complex numbers (a boolean is not a number). `is_integer`, `is_float`, and `is_complex` test the corresponding numeric types.]

    #ref-heading[Input and output]
    #row[print(v1, v2, …)][Converts the given values to strings and writes them to standard output, followed by a newline; returns `None`. Where a question needs to print and return a value, it defines `print_value` explicitly.]
    #row[print_llist(xs)][Prints the linked list `xs` in `llist` notation, e.g. `llist(1, 2, 3)`; returns `None`.]
    #row[str(x)][Returns a string representation of `x`, e.g. `str(19)` returns `"19"` and `str(True)` returns `"True"`.]
    #row[input(prompt)][Writes `prompt` to standard output without a trailing newline, then reads a line of input and returns it as a string.]

    #ref-heading[Mathematics]
    #row[abs(x)][Returns the absolute value of `x`.]
    #row[round(number, ndigits)][Rounds `number` to `ndigits` decimal places, or to the nearest integer if `ndigits` is omitted.]
    #row[math_floor(x)][Returns the floor of `x`, the largest integer less than or equal to `x`.]
    #row[math_sqrt(x)][Returns the square root of `x`.]
    #row[math_pow(x, y)][Returns `x` raised to the power `y`, converting both arguments to `float`.]
    #row[math_pi, math_e][The constants $pi approx 3.14159$ and Euler's number $e approx 2.71828$.]
    #row[min(arg1, arg2, …), max(arg1, arg2, …)][Return the smallest and largest of the given values, respectively; arguments must be all comparable numbers or all strings. Time $O(n)$ and space $O(1)$.]
  ]

  v(4pt)

  let lit(s) = text(size: 9pt / 0.85, raw(s))

  ref-heading[Python lists]
  wide(lit("[x1, ..., xn]"))[Creates a Python list of fixed length `n`. List positions start at zero. #lang lists do not provide an `append` method and do not grow after creation.]
  wide(lit("[value] * n"))[Creates a Python list of length `n` whose positions initially contain `value`.]
  wide[len(xs)][Returns the length of Python list `xs`. Time and space $O(1)$.]
  wide[xs[i], xs[i] = value][Read or replace the value at position `i` of Python list `xs`. Both operations take $O(1)$ time. Assignment replaces an existing value and does not change the list length.]
  wide[range(stop), range(start, #linebreak(justify: true) stop), range(start, stop, step)][Produces the integer range used by a `for` loop. The `stop` value is excluded.]

  ref-heading[Mutable pairs]
  wide[set_head(p, value)][Replaces the head of pair `p` with `value` and returns `None`. Time and space $O(1)$.]
  wide[set_tail(p, value)][Replaces the tail of pair `p` with `value` and returns `None`. Time and space $O(1)$.]

  ref-heading[Streams]
  wide[stream_tail(s)][Forces and returns the tail of stream `s`, by applying the nullary function stored in its tail.]
  wide[stream_ref(s, n)][Returns the element at zero-based position `n` of stream `s`.]
  wide[eval_stream(s, n)][Returns a linked list containing the first `n` elements of stream `s`.]
  wide[stream_map(f, s), stream_filter(pred, s)][Lazily map unary function `f` over stream `s`, or retain the elements that satisfy `pred`.]
  wide[enum_stream(low, high), integers_from(n)][`enum_stream` makes a finite stream containing the integers from `low` through `high`; `integers_from` makes the infinite stream beginning at `n`.]
  wide[build_stream(f, n)][Returns a stream of length `n` whose element at position `i` is `f(i)`.]
  wide[stream_append(s1, s2)][Returns a stream containing the elements of `s1` followed by those of `s2`.]

  if metacircular {
    ref-heading[Metacircular evaluation]
    wide[tokenize(program)][Returns the tokens of the #lang program represented by string `program`.]
    wide[parse(program)][Parses the #lang program represented by string `program` and returns its syntax tree.]
    wide[apply_in_underlying_python][Takes Python function `f` and linked list `args`, and applies `f` to those arguments.]
  }
}

// Appendix B: the recursive declarations the Semester 2 papers refer to.
#let appendix-b(sections) = {
  appendix-title(
    "B",
    [List Function Reference],
    [Declarations of map, filter, reduce and append assumed in #sections],
  )
  ```python
  def map(f, xs):
      return (xs
              if is_none(xs)
              else pair(f(head(xs)), map(f, tail(xs))))

  def filter(pred, xs):
      return (None
              if is_none(xs)
              else pair(head(xs), filter(pred, tail(xs)))
              if pred(head(xs))
              else filter(pred, tail(xs)))

  def reduce(f, initial, xs):
      return (initial
              if is_none(xs)
              else f(head(xs), reduce(f, initial, tail(xs))))

  def append(xs, ys):
      return (ys
              if is_none(xs)
              else pair(head(xs), append(tail(xs), ys)))
  ```
}
