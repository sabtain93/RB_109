=begin
Write a method that takes one argument, a positive integer, and returns a list of
the digits in the number.

Examples:
puts digit_list(12345) == [1, 2, 3, 4, 5]     # => true
puts digit_list(7) == [7]                     # => true
puts digit_list(375290) == [3, 7, 5, 2, 9, 0] # => true
puts digit_list(444) == [4, 4, 4]             # => true


P - [Understand the] Problem
input: integer
output: array

rules:
- the input will alwasy be positive integer
- return all the digits as seperate elements in an array.

E - Examples / Test cases
puts digit_list(12345) == [1, 2, 3, 4, 5]

D - Data Structure
string
array (of integer)

A - Algorithm
- convert the integer value into a string
- break the number string into single characters and store it in an array
- iterate over the character array
  - for each character transform into a character and store it in a array
- return the transformed array
C - Code
=end

def digit_list(number)
  number.to_s.chars.map { |char| char.to_i }
end



puts digit_list(12345) == [1, 2, 3, 4, 5]     # => true
puts digit_list(7) == [7]                     # => true
puts digit_list(375290) == [3, 7, 5, 2, 9, 0] # => true
puts digit_list(444) == [4, 4, 4]             # => true