// CS1101S Final Assessment, AY2024/25 Semester 2 — Python §3 edition.
// Translated from the Source §3 (JavaScript) paper CS1101S-2024-2025-Semester2.pdf.

#import "cs1101s-exam.typ": *
#import "appendix.typ": *

#show: exam.with(ay: "2024/25", sem: 2)

#cover(ay: "2024/25", sem: 2, year: "2025", standard-instructions(answer-pages: 8))

// ---------------------------------------------------------------------------
#section[Pair Structures][
  For each of the following Python §3 programs, draw the _box-and-pointer diagram_ for the values of the indicated names at the end of the program evaluation. *Clearly show where each name is pointing to. For pairs that are _identical_, only one box must be shown. Pairs that are _not identical_ must be drawn as separate boxes.*
]

#question(marks: 5)[
  Draw the box-and-pointer diagram for the values of `XX` and `YY`.

  ```python
  XX = llist(llist(2, llist(3), 4))
  YY = tail(head(XX))
  set_head(YY, XX)
  ```
]

#question(marks: 5)[
  Draw the box-and-pointer diagram for the value of `YY`.

  ```python
  ff = lambda: pair(3, 4)
  YY = llist(ff, 6, 7)
  ff = lambda: 5
  set_head(YY, head(YY)())
  ```
]

#question(marks: 5)[
  Draw the box-and-pointer diagram for the values of `XX` and `YY`.

  ```python
  XX = llist(1, 2, 3, 4)
  YY = llist(5, 6, 7, 8)

  def fun(x, y):
      z = tail(x)
      set_tail(x, tail(y))
      set_tail(y, z)

  fun(XX, YY)
  fun(tail(tail(XX)), tail(YY))
  ```
]

#question(marks: 5)[
  Draw the box-and-pointer diagram for the values of `XX` and `YY`. Refer to Appendix B for the implementation of `map`.

  ```python
  def fun(x):
      set_head(x, head(x) * head(x))
      return x

  XX = llist(llist(2), llist(3), llist(5))
  YY = map(fun, XX)
  ```
]

// ---------------------------------------------------------------------------
#section[Orders of Growth][
  For each question in this section, choose the order of growth that best characterizes the running time of the function `fun`. Note that `N` is a non-negative number value.
]

#question(marks: 3)[
  ```python
  def fun(N):
      acc = 0
      k = 1
      while k <= N:
          j = 1
          while j <= k / 2:
              acc = acc + 1
              j = j + 2
          k = k + 1
      return acc
  ```
  #growth-choices
]

#question(marks: 3)[
  ```python
  def fun(N):
      acc = 0
      j = N
      while j >= 1:
          acc = acc + 1
          j = j / 2
      return acc
  ```
  #growth-choices
]

#question(marks: 3)[
  ```python
  def fun(N):
      acc = 0
      i = 1
      while i <= N:
          k = N
          while k >= 1:
              acc = acc + 1
              k = k - 2
          i = i * 2
      return acc
  ```
  #growth-choices
]

#question(marks: 3)[
  ```python
  def fun(N):
      acc = 0
      i = 1
      while i <= N:
          j = N
          while j >= 1:
              acc = acc + 1
              j = j / 2
          k = N
          while k >= 1:
              acc = acc + 1
              k = k - 2
          i = i + 1
      return acc
  ```
  #growth-choices
]

#question(marks: 3)[
  ```python
  def fun(N):
      acc = 0
      j = 9999 * N
      while j >= 1:
          acc = acc + 1
          j = j - N
      return acc
  ```
  #growth-choices
]

// ---------------------------------------------------------------------------
#section[Program Evaluation][
  We assume that in *Python §3*,

  #set enum(numbering: "(1)")
  + the left operand of a binary operation is evaluated before the right operand, and
  + when there are multiple arguments in a function application, the argument expressions are evaluated from left to right, i.e. the leftmost argument expression is evaluated first, and the rightmost last.

  For each of the programs in this section, *write the sequence of values printed* by the `print` function when the program is evaluated. The `print` function prints the value of its argument. For example, `print(2 * 5)` prints `10`; and `print(pair(1, 2))` prints `[1, 2]` in box notation.
]

#question(marks: 5)[
  ```python
  for i in range(1, 5):
      if i == 2:
          continue
      print(i)
      for k in range(6, 11):
          if k == 8:
              break
          print(k)
  print("OK")
  ```
]

#question(marks: 5)[
  ```python
  def D(m, x):
      print(m)
      return x

  w = D(10, 10)
  z = D("fn", lambda x: D("+", D("w", w) + D("x", x)))
  # equivalent to (lambda x: w + x)
  print("OK")
  y = z(D(23, 23))
  D(y, y)
  ```
]

#question(marks: 5)[
  ```python
  def insert(x, xs):
      print(x)
      return (llist(x)
              if is_none(xs)
              else pair(x, xs)
              if x <= head(xs)
              else pair(head(xs), insert(x, tail(xs))))

  def insertion_sort(xs):
      return (xs
              if is_none(xs)
              else insert(head(xs), insertion_sort(tail(xs))))

  insertion_sort(llist(3, 4, 1, 5, 2))
  ```
]

#question(marks: 5)[
  ```python
  def binary_search(A, v):
      def search(low, high):
          print(low)
          print(high)
          if low > high:
              return False
          else:
              mid = math_floor((low + high) / 2)
              return (v == A[mid] or
                      (search(low, mid - 1)
                       if v < A[mid]
                       else search(mid + 1, high)))
      return search(0, len(A) - 1)

  AA = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10,
        11, 12, 13, 14, 15, 16, 17, 18, 19, 20]
  # len(AA) is 21
  binary_search(AA, 6)
  ```
]

// ---------------------------------------------------------------------------
#section[Environment Model][
  For each of the following Python programs, draw the diagram to show the environment during the evaluation of the program. Show all the frames that are created during the program evaluation (except the global environment frame), and show the final value of each binding.

  Note that the application of a *primitive* function (e.g. `pair`, `llist`, `head`, `tail`, `is_none`) does not create a new environment frame.
]

#question(marks: 8)[
  *Program D1:*

  ```python
  def fun(N):
      BB = [None] * N
      kk = 0
      while kk < N:
          tt = kk
          BB[kk] = lambda x: x + tt * kk
          kk = kk + 1
      return BB

  AA = fun(4)
  zz = AA[2](0)
  ```
]

#question(marks: 8)[
  *Program D2:*

  ```python
  def sort(xs):
      def insert(yy, ys):
          return (llist(yy)
                  if is_none(ys)
                  else pair(yy, ys)
                  if yy <= head(ys)
                  else pair(head(ys), insert(yy, tail(ys))))
      return (xs
              if is_none(xs)
              else insert(head(xs), sort(tail(xs))))

  L = llist(2, 1)
  R = sort(L)
  ```
]

// ---------------------------------------------------------------------------
#section[Sets]

#question(marks: 8)[
  We represent a *_set of numbers_* as an _ordered linked list of numbers_, where all the elements are *unique* and are arranged in *ascending order*.

  The *_set union_* of set $A$ and set $B$ (denoted $A union B$ in mathematics), is the set of elements that are in $A$ or $B$.

  Complete the declaration of the function `union`, which takes as arguments two sets of numbers, `A` and `B`, and returns the set union of `A` and `B`. For example,

  ```python
  s1 = llist(2, 4, 5, 6, 9, 10)
  s2 = llist(4, 6, 7, 10, 11)
  union(s1, s2)  # returns llist(2, 4, 5, 6, 7, 9, 10, 11)
  union(None, None)         # returns None
  union(None, llist(6, 7))  # returns llist(6, 7)
  union(llist(1, 2, 3), llist(1, 2, 3))  # returns llist(1, 2, 3)
  ```

  *The running time of your function must have an order of growth of $O(n)$, where `n` is the total length of the two input lists.*

  Complete the five branches of the following declaration:

  ```python
  def union(A, B):
      if is_none(A):
          # complete this branch
      elif is_none(B):
          # complete this branch
      elif head(A) == head(B):
          # complete this branch
      elif head(A) < head(B):
          # complete this branch
      else:
          # complete this branch
  ```
]

// ---------------------------------------------------------------------------
#section[Array-Integers][
  An *_array-integer_* is a representation of a *positive integer number* using a Python list whose elements are the decimal digits of the number, and the least significant digit is the first element of the list. For example, the decimal number 20536 is represented as the array-integer `[6, 3, 5, 0, 2]`.

  Note that *leading zeros are not allowed* in array-integers. For example, the integer 913 cannot be represented as `[3, 1, 9, 0]`.
]

#question(marks: 7)[
  The function `number_value` takes as argument an array-integer and returns the represented number value. For example,

  ```python
  number_value([6, 3, 5, 0, 2])  # returns 20536
  number_value([1])  # returns 1
  ```

  Complete the declaration of the function `number_value`. The running time of your function must have an order of growth of $O(n)$, where `n` is the length of the input Python list. The input list must not be modified.

  ```python
  def number_value(A):
      n = len(A)
      value = 0
      # complete this part
      return value
  ```
]

#question(marks: 7)[
  The function `add` takes as arguments two array-integers and returns an array-integer that represents the sum of the input array-integers. For example,

  ```python
  A = [5, 0, 6]
  B = [5, 8, 7, 9]
  add(A, B)  # returns [0, 9, 3, 0, 1]
             # Equivalent to 605 + 9785 = 10390
  ```

  Note that the input array-integers could be representing very large numbers. Your function must compute the sum digit by digit, and must not convert the input array-integers to number values.

  Complete the declaration of the function `add`. The running time of your function must have an order of growth of $O(n)$, where `n` is the total length of the input Python lists. The input lists must not be modified.

  ```python
  def add(A, B):
      A_len = len(A)
      B_len = len(B)
      max_len = max(A_len, B_len)
      # complete this part: C is the result, a new Python list
      return C
  ```
]

#question(marks: 7)[
  The function `second_largest` takes as argument an array-integer, and returns a *new* array-integer that represents the second largest integer that can be formed by permutating all the digits of the input array-integer. If the second largest integer does not exist, the largest possible integer is returned instead. Note that the input array-integer does not contain any digit 0 (zero). For example,

  ```python
  second_largest([1, 2, 3, 4, 5])        # returns [2, 1, 3, 4, 5]
  second_largest([5, 2, 6, 2, 4, 2, 7])  # returns [2, 2, 4, 2, 5, 6, 7]
  second_largest([5])                    # returns [5]
  second_largest([7, 7, 7])              # returns [7, 7, 7]
  ```

  Note that the input array-integer could be representing a very large number. Your function must work on its digits, and must not convert the input array-integer to a number value.

  Complete the declaration of the function `second_largest`. The following functions have been pre-declared, and your function is free to call them:

  - `swap(A, i, j)` --- Takes as arguments a Python list `A` and integers `i` and `j`. Swaps the list elements `A[i]` and `A[j]`. Does not return any value.
  - `sort_ascending(A)` --- Takes as argument a Python list of numbers. Returns a *new Python list* containing the elements of `A` in ascending order.
  - `sort_descending(A)` --- Takes as argument a Python list of numbers. Returns a *new Python list* containing the elements of `A` in descending order.

  The input list must not be modified.
]

#pagebreak()

// ---------------------------------------------------------------------------
#appendix-a(chapter: "3")

#pagebreak()

#appendix-b[Sections A, C and D]

#end-of-paper(gap: 2.2em)
