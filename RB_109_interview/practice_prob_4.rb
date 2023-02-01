=begin
Write a method that takes an array of integers and returns the
two numbers that are closest together in value.

# Examples:
p closest_numbers([5, 25, 15, 11, 20]) == [15, 11]
p closest_numbers([19, 25, 32, 4, 27, 16]) == [25, 27]
p closest_numbers([12, 7, 17]) == [12, 7]

Problem:
- input: array of positive integers
- output: array of integers

- rules:
- return two numbers from the given array that have the least difference
- the input is never empty or nil
- the size of output array is alway equal to 2
- all the elements in the input array are unique

Examples:
[12, 7, 17]
12 - 7
17 - 12
7 - 17

data structures:
- array for input
- hash to store subarray and their differences
- array for output

The tests above should print "true".

algorithm:
- initialize a result array to empty array
- find all the possible combination (2 integers)
- find the differences for each combination
- intialize difference = 0
  - iterate over the combination subarrays
  - for each combination find the difference between its elements
  - if the subtraction is negative make it positive by multiplying by -1 
    check if the subtraction is 
  -# scrapped sort each subarray in descending order
- return the combination that has the least difference
=end

def closest_numbers(array)
  result_array = []
  combination_arrays = array.combination(2).to_a
  max differ
  combination_arrays.each do |subarr|
    difference = subarr.reduce(:-)
    if difference < 0
      difference = - difference
    end
    combination_hash[subarr] = difference
  end
  combination_hash.sort_by { |_, v| -v }[-1][0]

end



p closest_numbers([5, 25, 15, 11, 20]) == [15, 11]
p closest_numbers([19, 25, 32, 4, 27, 16]) == [25, 27]
p closest_numbers([12, 7, 17]) == [12, 7]
