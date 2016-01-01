Solutions to problems using Ruby and RSpec

These problems are the result of research or past interviews and can be a helpful guide to anyone conducting an interview or being interviewed themselves.

I would suggest first reading the test files, downloading them individually and making all examples pass with `RSpec`.

## FizzBuzz

Iterate through a range of numbers starting at `0` and ending at the inputed number `n`.

Print the number.

If the number is divisible my `3` print `fizz` instead.
If the number is divisible by `5` print `buzz` instead.
If the number is divisible by both 3 and 5, print `fizzbuzz` instead of the number.

[Solution](fizzbuzz/fizz_buzz.rb)
[Test](fizzbuzz/fizz_buzz_spec.rb)

## LinkedList

Implement a one directional linked list. A `Node` class and `LinkedList` should both be created.

[Solution](linked_list/linked_list.rb)
[Test](linked_list/linked_list_spec.rb)

## Reverse Polish Notation (RPN) Evaluator

RPN (otherwise known as postfix notation) is a way of writing simple arithmetic without the use of parenthesis.

Example: `1 + 2` translated to RPN is `1 2 +`

Create a calculator that can accept a string in RPN, and compute the result.

[Solution](rpn_eval/rpn.rb)
[Test](rpn_eval/rpn_methods_spec.rb)

## Array Sorting

Given two ordered arrays, create a method to combine them into a single ordered array. The use of `sort`, `+` and similar array operators is prohibited.

[Solution](sorted_arrays/array_sort.rb)
[Test](sorted_arrays/array_sort_spec.rb)

## Spell Checker

Given a misspelled word, compute and display a list of suggestions.

[Solution](spellcheck/spelling_suggestion.rb)
[Test](spellcheck/spelling_tester.rb)

## Grid

Within an N x N grid, visit every node exactly one time.

[Solution](spiral/spiral.rb)
[Test](spiral/spiral_spec.rb)
