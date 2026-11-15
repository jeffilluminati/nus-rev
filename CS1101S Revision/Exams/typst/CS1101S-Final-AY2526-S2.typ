// CS1101S Final Assessment, AY2025/26 Semester 2 — Python §3 edition.
// Translated from the Source §3 (JavaScript) paper CS1101S-2025-2026-Semester2.pdf.

#import "cs1101s-exam.typ": *
#import "appendix.typ": *

#show: exam.with(ay: "2025/26", sem: 2)

#cover(ay: "2025/26", sem: 2, year: "2026", standard-instructions(answer-pages: 8))

// ---------------------------------------------------------------------------
#section[Pair Structures][
  For each of the following Python §3 programs, draw the _box-and-pointer diagram_ for the values of the indicated names at the end of the program evaluation. *Clearly show where each name is pointing to. For pairs that are identical, only one box must be shown. Pairs that are not identical must be drawn as separate boxes.*
]

#question(marks: 4)[
  Draw the box-and-pointer diagram for the value of `xx`.

  ```python
  xx = llist(4, 5, 6)
  set_head(xx, tail(xx))
  set_tail(xx, tail(head(xx)))
  ```
]

#question(marks: 4)[
  Draw the box-and-pointer diagram for the values of `xx` and `yy`. (Refer to Appendix B for the implementation of `map`.)

  ```python
  xx = llist(llist(2), 3)
  yy = map(lambda x: x, xx)
  set_head(head(yy), 8)
  ```
]

#question(marks: 4)[
  Draw the box-and-pointer diagram for the values of `xx` and `yy`. (Refer to Appendix B for the implementation of `append`.)

  ```python
  xx = llist(2, llist(3))
  yy = append(xx, xx)
  ```
]

#question(marks: 4)[
  Draw the box-and-pointer diagram for the value of `xx`. (Refer to Appendix B for the implementation of `reduce`.)

  ```python
  xx = reduce(lambda x, y: llist(y, x),
              llist(8), llist(2, 3, 4))
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
      i = 1
      while i <= N / 2:
          k = 1
          while k <= i:
              acc = acc + 1
              k = k + 1
          i = i + 1
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
          k = 1
          while k <= 1000000:
              acc = acc + 1
              k = k + 1
          i = i + 1
      return acc
  ```
  #growth-choices
]

#question(marks: 3)[
  ```python
  def fun(N):
      acc = 0
      d = 2
      while d <= 1000:
          j = N
          while j >= 1:
              acc = acc + 1
              j = j / d
          d = d + 1
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
          k = 1
          while k <= N:
              acc = acc + 1
              k = k * 2
          i = i + 1
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

  For each of the programs in this section, *write the sequence of values printed* by the `print` function when the program is evaluated.

  Some of the programs use the function `print_value`, which prints the value of its argument and returns the value of its argument:

  ```python
  def print_value(v):
      print(v)
      return v
  ```

  For example, `print_value(2 * 5)` prints `10` and returns `10`; and `print_value(pair(1, 2))` prints `[1, 2]` in box notation and returns the pair `[1, 2]`.
]

#question(marks: 4)[
  ```python
  D = print_value

  def fun(x, y):
      return D(D(y * 2) + D(3 * x))  # (y * 2) + (3 * x)

  D(fun(D(4), D(5)))  # equivalent to fun(4, 5)
  ```
]

#question(marks: 4)[
  ```python
  def D(m, x):
      print(m)
      return x

  print("A")
  foo = D("fn", lambda x, y: D("+", D("x", x) + D("y", y)))
  print("B")
  print(foo(D(12, 12), D(9, 9)))
  ```
]

#question(marks: 4)[
  ```python
  def foo(n):
      print(n)
      if n <= 4:
          return n
      else:
          result = foo(n - 3) + foo(n - 1)
          print("r:", result)
          return result

  foo(6)
  ```
]

// ---------------------------------------------------------------------------
#section[Environment Model]

#question(marks: 10)[
  For the following Python program, draw the diagram to show the environment during the evaluation of the program. Show all the frames that are created during the program evaluation (except the global environment frame), and show the final value of each binding.

  ```python
  def foo(X):
      Y = 2 * X
      def gee(Z):
          W = Y + Z
          return KK + 3 * W
      return gee

  KK = 10
  A = foo(5)
  AA = A(6)
  KK = 15
  B = foo(7)
  BB = B(8)
  ```
]

// ---------------------------------------------------------------------------
#section[Big-Integers][
  A *big-integer* is a representation of a *non-negative integer number* using a *linked list* whose elements are the decimal digits of the number, and the least significant digit is the first element of the list. For example, the decimal number 20536 is represented as the big-integer `llist(6, 3, 5, 0, 2)`.

  The integer 0 (zero) is represented as `llist(0)`, but *leading zeros are not allowed* in all other big-integers. For example, the integer 913 cannot be represented as `llist(3, 1, 9, 0)`.

  Note that big-integers can represent integers with hundreds and thousands of digits.
]

#question(marks: 8)[
  Complete the declaration of the function `num_value`, which takes as argument a big-integer and returns the represented number value. For example,

  ```python
  num_value(llist(6, 3, 5, 0, 2))  # returns 20536
  num_value(llist(1))  # returns 1
  ```

  The running time of your function must have an order of growth of $O(n)$, where `n` is the length of the input list. The input list must not be modified.

  Give the expressions `<E1>`, `<E2>` and `<E3>` that complete the following declaration:

  ```python
  def num_value(B):
      return (<E1>
              if <E2>
              else <E3>)
  ```
]

#question(marks: 8)[
  Complete the declaration of the function `add_big_int`, which takes as arguments two big-integers and returns a big-integer that represents the sum of the input big-integers. For example,

  ```python
  A = llist(5, 0, 6)     # represents 605
  B = llist(5, 8, 7, 9)  # represents 9785
  add_big_int(A, B)  # returns llist(0, 9, 3, 0, 1)
                     # Equivalent to 605 + 9785 = 10390
  ```

  Note that the input big-integers could be representing very large numbers. Your function must compute the sum digit by digit, and must not convert the input big-integers to number values.

  The running time of your function must have an order of growth of $O(n)$, where `n` is the total length of the input lists. The input lists must not be modified.

  Give the expressions `<E1>`, `<E2>`, `<E3>` and `<E4>` that complete the following declaration:

  ```python
  def add_big_int(A, B):
      def add(x, y, carry):
          if is_none(x) and is_none(y):
              return None if carry == 0 else llist(carry)
          else:
              xdigit = 0 if is_none(x) else head(x)
              ydigit = 0 if is_none(y) else head(y)
              sum = <E1>
              new_digit = <E2>
              new_carry = <E3>
              return pair(new_digit, <E4>)
      return add(A, B, 0)
  ```
]

// ---------------------------------------------------------------------------
#section[Arraytrees][
  An *arraytree* is either a *number* or a non-empty Python list whose elements are arraytrees.

  Here are some example arraytrees:
  - `75`
  - `[32]`
  - `[9, [3, 8, [6, 3]], 5, [[7]]]`
]

#question(marks: 8)[
  Complete the declaration of the function `count_num`, which takes as argument an arraytree `T` and returns the number of numbers that are in `T`. For example,

  ```python
  count_num(75)    # returns 1
  count_num([32])  # returns 1
  count_num([9, [3, 8, [6, 3]], 5, [[4]]])  # returns 7
  ```

  The input arraytree must not be modified.

  ```python
  def count_num(T):
      if is_number(T):
          # complete this branch
      else:
          count = 0
          # complete this part
          return count
  ```
]

#question(marks: 8)[
  Complete the declaration of the function `rev_tree`, which takes as argument an arraytree `T` and returns a *new copy* of `T` but with all the Python lists in `T` *reversed*. For example,

  ```python
  rev_tree(75)            # returns 75
  rev_tree([32, 67, 45])  # returns [45, 67, 32]
  rev_tree([19, [23, 38, [46, 53]], 65, [[77]]])
  # returns [[[77]], 65, [[53, 46], 38, 23], 19]
  ```

  The input arraytree must not be modified.

  ```python
  def rev_tree(T):
      if is_number(T):
          # complete this branch
      else:
          B = [None] * len(T)
          # complete this part
          return B
  ```
]

#question(marks: 4)[
  Complete the declaration of the function `nest`, which takes as arguments a number `x` and a non-negative integer `n`, and returns a `n`*-level nested Python list* containing `x`. For example,

  ```python
  nest(58, 0)  # returns 58
  nest(58, 1)  # returns [58]
  nest(58, 2)  # returns [[58]]
  nest(58, 3)  # returns [[[58]]]
  ```
]

#question(marks: 6)[
  Complete the declaration of the function `nest_many`, which takes as argument a linked list of numbers, `L`, and returns a Python list `A`, where `A[i]` is an `i`*-level nested Python list* containing the element of `L` at position `i`. For example,

  ```python
  nest_many(llist(3, 9, 4, 6))  # returns [3, [9], [[4]], [[[6]]]]
  nest_many(None)  # returns []
  ```

  Your function may use the `nest` function from the preceding question.

  The input list must not be modified.
]

#question(marks: 8)[
  Complete the declaration of the function `replace_num`, which takes as arguments an arraytree `T`, and a Python list of numbers, `A`, and replaces all the numbers in `T` with the elements of `A`, in the order as demonstrated in the following example:

  ```python
  T = [[0, 0], 0, [[0, [0]], 0, [[0]]]]
  A = [2, 1, 6, 7, 3, 5, 4]
  replace_num(T, A)
  T  # value: [[2, 1], 6, [[7, [3]], 5, [[4]]]]
  ```

  We assume that the number of numbers in the input arraytree `T` is equal to the length of the input list `A`. Note that the function does not return a value since the result is the modified `T`.

  ```python
  def replace_num(T, A):
      next_idx = 0

      def replace(t):
          nonlocal next_idx
          for i in range(len(t)):
              # complete the loop body

      replace(T)
  ```
]

#pagebreak()

// ---------------------------------------------------------------------------
#appendix-a(chapter: "3")

#pagebreak()

#appendix-b[Section A]

#end-of-paper(gap: 2.2em)
