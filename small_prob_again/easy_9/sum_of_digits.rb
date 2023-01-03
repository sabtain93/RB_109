=begin
Write a method that takes one argument, a positive integer, and returns the sum of its digits.

Examples:
puts sum(23) == 5
puts sum(496) == 19
puts sum(123_456_789) == 45
The tests above should print true.

For a challenge, try writing this without any basic looping constructs
(while, until, loop, and each).

P - [Understand the] Problem
input: array of integer
output: integer

rules:
- input has positive integers
- return the sum of digits in the integer
- do not use the basic looping constructs

E - Examples / Test cases
sum(123_456_789)
1+2+3+4+5+6+7+8+9 = 45

D - Data Structure
string
array to store digits
A - Algorithm
- convert the integer to string
- store each charcater of the number string into an array
- select the characters if they are numbers from 0-9
- find the sum of all the number strings in the list
- return the sum
C - Code
=end

def sum(number)
  number.to_s.chars.select { |char| char =~ /[0-9]/ }.map { |char| char.to_i }.sum

end

puts sum(23) == 5
puts sum(496) == 19
puts sum(123_456_789) == 45