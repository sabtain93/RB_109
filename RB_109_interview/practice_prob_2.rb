=begin

# Write a method that takes one argument: an array of integers.
# The method should return the minimum sum of 5 consecutive
# numbers in the array. If the array contains fewer than 5
# elements, the method should return nil.

# Examples:

p minimum_sum([1, 2, 3, 4]) == nil
p minimum_sum([1, 2, 3, 4, 5, 6]) == 15
p minimum_sum([55, 2, 6, 5, 1, 2, 9, 3, 5, 100]) == 16
p minimum_sum([-1, -5, -3, 0, -1, 2, -4]) == -10

# The tests above should print "true".

problem:
input: array of integers (positive or negative)
output: integer 

rules:
-return the minimum sum of 5 consective integers
- if the input has less than 5 elements return nil
- input can conatin positive or negative numbers

Examples:
[1, 2, 3, 4, 5, 6]
(1+2+3+4+5) -> 15
[0, 5]
(2+3+4+5+6) -> 20
[1, 5]
return 15 as it is less than 20

Algorithm:
- return nil if the size of the array is less than 5
- create my sum array (to store the possible sums)
- iterate from 0 till the size of the array - 5 inclusice, track iteration (start index)
  - slice away the inetegers from start index for a length of 5
  - find the sum of te subarray
  - append the sum array with the sum
- return the minimum value in the sum array

=end

def minimum_sum(array)
  return nil if array.size < 5
  sum_arr = []

  (0..array.size - 5).each do |start_index|
    sum_arr << array[start_index, 5].sum
  end

  sum_arr.min

end



p minimum_sum([1, 2, 3, 4]) == nil
p minimum_sum([1, 2, 3, 4, 5, 6]) == 15
p minimum_sum([55, 2, 6, 5, 1, 2, 9, 3, 5, 100]) == 16
p minimum_sum([-1, -5, -3, 0, -1, 2, -4]) == -10