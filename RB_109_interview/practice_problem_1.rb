=begin
# Given an array of numbers, for each number find out how many numbers
# in the array are smaller than it. When counting numbers, only count
# unique values. That is, if a given number occurs multiple times in
# the array, it should only be counted once.

# Examples:

p smaller_numbers_than_current([8,1,2,2,3]) == [3, 0, 1, 1, 2]
p smaller_numbers_than_current([1,4,6,8,13,2,4,5,4] == [0, 2, 4, 5, 6, 1, 2, 3, 2]
p smaller_numbers_than_current([7,7,7,7]) == [0,0,0,0]
p smaller_numbers_than_current([6,5,4,8]) == [2, 1, 0, 3]
p smaller_numbers_than_current([1]) == [0]

# The tests above should print "true".

Problem:
input: array of integers
output: array of integers

rules:
for each number in the input array find hom many numbers are smaller than it in the array
only count unique value when lookin for smaller numbers.
number of elements in the input array is eqaul to the output array
output will alwaysy have a 0 as an element
the input array will have atleast one number.
if there is only one element then [0] will returned
if the input contains x elements which are equal this would result in x number of zeros as elements
in the output array.

Example:
[6,5,4,8] -> [2, 1, 0, 3]
6 -> 2 (5, 4)
5 -> 1 (4)
4 -> 0 (there are none)
8 -> 3 (6, 5, 4)

Algorithm:
- initialize result array to an empty array
- create a copy of the input array with only unique values in it
- iterate over the input array
  -append the count for which the current number it is greater than in the array with the unique value to the result array
- return the result array
=end

def smaller_numbers_than_current(array)
  result_arr = []

  array_uniq = array.uniq

  array.each do |number|
    result_arr << array_uniq.count { |value| number > value}
  end

  result_arr

end

p smaller_numbers_than_current([8,1,2,2,3]) == [3, 0, 1, 1, 2]
p smaller_numbers_than_current([1,4,6,8,13,2,4,5,4]) == [0, 2, 4, 5, 6, 1, 2, 3, 2]
p smaller_numbers_than_current([7,7,7,7]) == [0,0,0,0]
p smaller_numbers_than_current([6,5,4,8]) == [2, 1, 0, 3]
p smaller_numbers_than_current([1]) == [0]
