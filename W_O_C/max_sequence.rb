=begin
Problem:
The maximum sum subarray problem consists in finding the maximum sum of contiguous subsequence 
in an array of integers.
max_sequence [-2, 1, -3, 4, -1, 2, 1, -5, 4] should be 6 [4, -1, 2, 1]
Easy case is when the array is made up of only positive numbers and the maximum sum is 
the sum of the whole array

If the array is made up of only negative numbers, return 0 instead.
Empty array is considered to have zero greatest sum. Note that empty array is also a valid subarray.

Test case:
p max_sequence([]) == 0
p max_sequence([-2, 1, -3, 4, -1, 2, 1, -5, 4]) == 6 #4, -1, 2, 1
p max_sequence([11]) == 11
p max_sequence([-32]) == 0
p max_sequence([-2, 1, -7, 4, -10, 2, 1, 5, 4]) == 12 #2, 1, 5, 4

P - [Understand the] Problem
input: array of integers
output: integer

rules:
- find the maximum sum of the contigous subsequence (consecutive)
- the elements can be all negative in which case return 0
- the input can be empty in which case return 0
- if all are positive then the maximum sum will be the sum of the whole array

E - Examples / Test cases
p max_sequence([]) == 0
p max_sequence([-2, 1, -3, 4, -1, 2, 1, -5, 4]) == 6 #4, -1, 2, 1
p max_sequence([11]) == 11
p max_sequence([-32]) == 0
p max_sequence([-2, 1, -7, 4, -10, 2, 1, 5, 4]) == 12 #2, 1, 5, 4


D - Data Structure
array to store all of the subarrays
integer for output

#initial thoughts
- have to find all of the possible subarrays where a subarray is atlease one element long
- find the sum of the subarrays
- return the maximum sum
A - Algorithm
- return 0 if either all elements are less than 0 or it is empty
- find all possible subarrays and store it in an array
  - iterate over the range from 0 till size of the array exclusive, track iteration start index
    - iterate over the range from start index till size of the array excluisve, track iteration end index
      - slice the array from start index to end index append
- find the sum of all the subarrays
- return the maximum sum
C - Code
=end

def max_sequence(array)
  return 0 if array.empty? || array.all? { |number| number < 0 }

  array.each.each_with_object([]) do |num, arr|
    (0...array.size).each do |start|
      (start...array.size).each do |ending|
        arr << array[start..ending].sum
      end
    end
  end.max
end


p max_sequence([]) == 0
p max_sequence([-2, 1, -3, 4, -1, 2, 1, -5, 4]) == 6 #4, -1, 2, 1
p max_sequence([11]) == 11
p max_sequence([-32]) == 0
p max_sequence([-2, 1, -7, 4, -10, 2, 1, 5, 4]) == 12 #2, 1, 5, 4