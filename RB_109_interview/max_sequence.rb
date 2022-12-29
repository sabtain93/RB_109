
=begin
# Problem
The maximum sum subarray problem consists in finding the maximum sum of a contiguous
subsequence in an array or list of integers:

maxSequence [-2, 1, -3, 4, -1, 2, 1, -5, 4]
-- should be 6: [4, -1, 2, 1]

Easy case is when the list is made up of only positive numbers and the maximum sum is the sum of
the whole array.

If the list is made up of only negative numbers, return 0 instead.
Empty list is considered to have zero greatest sum.
Note that the empty list or array is also a valid sublist/subarray.

P - [Understand the] Problem
input: array of integers 
- array can have positive only elements
- array can have negative and positive elements
- array can have no elements (valid)
- array can have all negative elements

output: integer
- represents the maximun sum of a contiguous subsequence
- return 0 if the input is empty
- return the sum the whole array if all elements are positive
- return 0 if all the elements are negative
- find the maximun sum if we have positive and negative elements


E - Examples / Test cases

D - Data Structure
array
integer (for output)

## initial thoughts


A - Algorithm
## scrapped - sum array initialized to 0
- if the input list is empty 
  - return 0
- if the input array has all negative number 
  return 0
- if all positive
  - return the sum of all the numbers
- if both negative and positive numbers
  call the helper method find all the possible subarrays

helper method
# initial thoughts
##  find the largest sum (contiguous sequence)
##  return the largest sum 

- sum array initialized to 0
- find all possible sub-arrays
  iterate over the range from 0 to size of array (excluding), tracking iterationb (start index)
    iterate over the range from start index to size of array (excluding), tracking iteration (end index)
      slice my input array from start index till end index
      find the sum
      assign the sum to sum array if it greater than value of sum array
C - Code

=end
def sum_of_subarray(array)
  sum_array = 0
  (0...array.size).each do |start_index|
    (start_index...array.size).each do |end_index|
      if array[start_index..end_index].sum > sum_array
        sum_array = array[start_index..end_index].sum
      end
    end
  end
  sum_array
end


def max_sequence(arr)
  sum_array = 0

  if arr.empty?
    0
  elsif arr.all? { |number| number < 0 }
    0
  elsif arr.all? {|number| number > 0 }
    arr.sum
  else
    sum_of_subarray(arr)
  end
end


p max_sequence([]) == 0
p max_sequence([11]) == 11
p max_sequence([-32]) == 0
p max_sequence([-2, 1, -7, 4, -10, 2, 1, 5, 4]) == 12