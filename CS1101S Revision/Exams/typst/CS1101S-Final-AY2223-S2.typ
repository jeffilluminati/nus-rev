// CS1101S Final Assessment, AY2022/23 Semester 2 — Python §3 edition.
// Translated from the Source §3 (JavaScript) paper CS1101S-2022-2023-Semester2.pdf.

#import "cs1101s-exam.typ": *
#import "appendix.typ": *

#show: exam.with(ay: "2022/23", sem: 2)

#cover(ay: "2022/23", sem: 2, year: "2023", standard-instructions(answer-pages: 10))

// ---------------------------------------------------------------------------
#section[Pair Structures][
  For each of the following Python §3 programs, draw the _box-and-pointer diagram_ for the value of `result` at the end of the program evaluation. Clearly show where `result` is pointing to. For pairs that are _identical_, only one box must be shown. Pairs that are _not identical_ must be drawn as separate boxes.

  The functions `map` and `reduce` are declared as shown in Appendix B.
]

#question(marks: 4)[
  ```python
  result = llist(llist(2), 3, 4)
  set_tail(head(result), tail(result))
  ```
]

#question(marks: 4)[
  ```python
  result = pair(None, llist(llist(2), 3))
  set_head(result, map(lambda x: x, tail(result)))
  ```
]

#question(marks: 4)[
  ```python
  xx = pair(1, None)
  yy = pair(2, xx)
  result = pair(3, yy)
  set_head(yy, result)
  set_head(xx, yy)
  ```
]

#question(marks: 4)[
  ```python
  def join(xs, ys):
      if is_none(xs):
          return ys
      else:
          set_tail(xs, join(tail(xs), ys))
          return xs

  yy = llist(2, 4, 6)
  result = join(yy, yy)
  ```
]

#question(marks: 4)[
  ```python
  def binop(x, y):
      p = pair(tail(y), x)
      set_tail(y, p)
      return y

  result = reduce(binop, pair(0, None), llist(1, 2, 3, 4))
  ```
]

// ---------------------------------------------------------------------------
#section[Orders of Growth][
  What is the *order of growth* of the *running time* of each of the following functions in terms of `N` using the $Theta$ notation? Note that `N` is a positive integer value. Assume that each arithmetic operation takes constant time.
]

#question(marks: 3)[
  ```python
  def fun(N):
      acc = 1
      i = 1
      while i <= N / 2:
          acc = acc * 2
          i = i + 2
      return acc
  ```
  #growth-choices
]

#question(marks: 3)[
  ```python
  def fun(N):
      acc = 1
      i = 1
      while i <= N:
          acc = acc + 10
          i = 10 * i
      return acc
  ```
  #growth-choices
]

#question(marks: 3)[
  ```python
  def fun(N):
      acc = 1
      i = 1
      while i <= N:
          k = i
          while k >= 1:
              acc = acc + 2
              k = k - 2
          i = i + 2
      return acc
  ```
  #growth-choices
]

#question(marks: 3)[
  ```python
  def fun(N):
      acc = 1
      i = 1
      while i <= 3 * N:
          acc = acc + 3
          i = i + 3
      j = 1
      while j <= 5 * N:
          acc = acc + 5
          j = j + 5
      return acc
  ```
  #growth-choices
]

#question(marks: 3)[
  ```python
  def fun(N):
      acc = 1
      i = 1
      while i <= N * N * N:
          acc = acc + 1
          i = i + N
      return acc
  ```
  #growth-choices
]

#question(marks: 3)[
  ```python
  def fun(N):
      acc = 1
      i = N
      while i >= 1:
          j = 1
          while j <= i:
              k = 1
              while k <= N / i:
                  acc = acc + 1
                  k = k + 1
              j = j + 1
          i = i / 2
      return acc
  ```
  #growth-choices
]

// ---------------------------------------------------------------------------
#section[Program Evaluation][
  For each of the following programs, *write the sequence of values printed* by the `print` function when the program is evaluated.

  Some of the programs use the function `print_value`, which prints the value of its argument and returns the value of its argument:

  ```python
  def print_value(v):
      print(v)
      return v
  ```

  For example, `print_value(2 * 5)` prints `10` and returns `10`; and `print_value(1 > 2)` prints `False` and returns `False`.
]

#question(marks: 5)[
  ```python
  def D(x, y):
      print(str(x) + ", " + str(y))

  def fun(N):
      for i in range(1, N + 1):
          for j in range(N, i - 1, -2):
              D(i, j)

  fun(5)
  ```
]

#question(marks: 5)[
  ```python
  D = print_value

  def fun(x, y):
      return D(D(5 + x) * D(4 + y))  # (5 + x) * (4 + y)

  fun(D(3), D(2))  # equivalent to fun(3, 2)
  ```
]

#question(marks: 5)[
  ```python
  def D(m, x):
      print(m)
      return x

  w = D(5, 5)
  z = D("fn", lambda x: D("+", D("x", x) + D("w", w)))(D(20, 20))
  # equivalent to (lambda x: x + w)(20)
  D(z, z)
  ```
]

#question(marks: 5)[
  ```python
  def binary_search(A, v):
      def search(low, high):
          if low > high:
              return False
          else:
              mid = math_floor((low + high) / 2)
              print(mid)  # print is here
              return (v == A[mid] or
                      (search(low, mid - 1)
                       if v < A[mid]
                       else search(mid + 1, high)))
      return search(0, len(A) - 1)

  AA = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19]
  # len(AA) is 20
  binary_search(AA, 16)
  ```
]

// ---------------------------------------------------------------------------
#section[Environment Model][
  For each of the following Python programs, draw the diagram to show the environment during the evaluation of the program. Show all the frames that are created during the program evaluation (except the global environment frame), and show the final value of each binding.

  Note that the application of a *primitive* function (e.g. `len`, `pair`, `print`, `tail`) does not create a new environment frame.
]

#question(marks: 8)[
  *Program D1:*

  ```python
  z = 4

  def g():
      z = 5
      h = lambda x: (lambda y: 100 * x + 10 * y + z)
      z = 6
      return h

  z = 7
  h = g()(2)(3)
  ```
]

#question(marks: 8)[
  *Program D2:*

  ```python
  def foo(n):
      A = [None] * n
      i = 0
      while i < n:
          f = lambda: i
          A[i] = f
          i = i + 1
      return A

  def bar(H, i, n):
      return 0 if i == n else H[i]() + bar(H, i + 1, n)

  N = 2
  F = foo(N)
  X = bar(F, 0, N)
  ```
]

// ---------------------------------------------------------------------------
#section[List Processing]

#question(marks: 7)[
  Complete the declaration of function `sum_every_pair` that takes as argument a linked list of numbers `xs`, and returns a linked list of numbers whose each element is the sum of two consecutive elements of `xs`. If the length of `xs` is odd, then the last element of the result list will just be the last element of the input list `xs`. Your function must not modify the input list `xs`.

  The running time of your function must have an order of growth of $O(n)$, where `n` is the length of the input list `xs`.

  Examples:

  ```python
  sum_every_pair(None)
  # returns None
  sum_every_pair(llist(1, 2, 3, 4, 5, 6))
  # returns llist(3, 7, 11)
  sum_every_pair(llist(1, 2, 3, 4, 5))
  # returns llist(3, 7, 5)
  ```
]

#question(marks: 7)[
  Complete the declaration of function `d_sum_every_pair` that takes as argument a linked list of numbers `xs`, and returns a linked list of numbers whose each element is the sum of two consecutive elements of `xs`. If the length of `xs` is odd, then the last element of the result list will just be the last element of the input list `xs`. Your function *must not create any new pair*, and the result list must be made of existing pairs in `xs`.

  The running time of your function must have an order of growth of $O(n)$, where `n` is the length of the input list `xs`.

  Examples:

  ```python
  d_sum_every_pair(None)
  # returns None
  d_sum_every_pair(llist(1, 2, 3, 4, 5, 6))
  # returns llist(3, 7, 11)
  d_sum_every_pair(llist(1, 2, 3, 4, 5))
  # returns llist(3, 7, 5)
  ```

  Complete the three branches of the following declaration:

  ```python
  def d_sum_every_pair(xs):
      if is_none(xs):
          # complete this branch
      elif is_none(tail(xs)):
          # complete this branch
      else:
          # complete this branch
  ```
]

#question(marks: 8)[
  Complete the declaration of function `d_insert` that takes as arguments, `p`, a pair whose head is a number, and, `xs`, a sorted linked list of numbers (in ascending order), and returns a sorted linked list of numbers by inserting `p` into `xs`. Your function *must not create any new pair*, and the result list must be made of existing pair `p` and pairs in `xs`. Your function must not modify the head of any of the existing pairs (i.e. must not use the `set_head` function).

  The running time of your function must have an order of growth of $O(n)$, where `n` is the length of the input list `xs`.

  Examples:

  ```python
  d_insert(llist(3), llist(1, 2, 4, 5, 6))
  # returns llist(1, 2, 3, 4, 5, 6)
  d_insert(llist(8), None)
  # returns llist(8)
  ```

  Complete the three branches of the following declaration:

  ```python
  def d_insert(p, xs):
      if is_none(xs):
          # complete this branch
      elif head(p) <= head(xs):
          # complete this branch
      else:
          # complete this branch
  ```
]

#question(marks: 4)[
  Complete the declaration of function `d_insertion_sort` that takes as argument a linked list of numbers `xs`, and returns a sorted linked list (in ascending order) of the elements of the input list by performing insertion sort. Your function *must not create any new pair*, and the result list must be made of existing pairs in `xs`. Your function must not modify the head of any of the existing pairs (i.e. must not use the `set_head` function).

  Your function must make use of the `d_insert` function from the preceding question, and it is assumed to be correctly implemented.

  The running time of your function must have an order of growth of $O(n^2)$, where `n` is the length of the input list `xs`.

  Example:

  ```python
  d_insertion_sort(llist(5, 2, 3, 6, 1, 4))
  # returns llist(1, 2, 3, 4, 5, 6)
  ```
]

#pagebreak()

// ---------------------------------------------------------------------------
#appendix-a(chapter: "3")

#pagebreak()

#appendix-b[Sections A and D]

#end-of-paper(gap: 2.2em)
