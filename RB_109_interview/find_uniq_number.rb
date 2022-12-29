=begin

There is an array with some numbers. All numbers are equal except for one. Try to find it!

find_uniq([ 1, 1, 1, 2, 1, 1 ]) == 2
find_uniq([ 0, 0, 0.55, 0, 0 ]) == 0.55
It’s guaranteed that array contains at least 3 numbers.

The tests contain some very huge arrays, so think about performance.

Examples:
p find_uniq([1,1,1,1,0]) == 0
p find_uniq([ 1, 1, 1, 2, 1, 1 ]) == 2
p find_uniq([ 0, 0, 0.55, 0, 0 ]) == 0.55


P - [Understand the] Problem
input: array of numbers (integers, float)
- there will be atleast 3 numbers in the input array
- all numbers are equal except one (only one number will exist once)


output: integer or float
- find the number which exist only once

E - Examples / Test cases
p find_uniq([ 1, 1, 1, 2, 1, 1 ]) == 2
p find_uniq([ 0, 0, 0.55, 0, 0 ]) == 0.55

D - Data Structure
arrays
float or integer

A - Algorithm
- delete the duplicates in the input array
- iterate over processed array
  - count each number
  - if the count in the original array is equal to one
     return that number
C - Code
=end

def find_uniq(arr)
  arr.uniq.each do |number|
    return number if arr.count(number) == 1
  end
end

p find_uniq([ 1, 1, 1, 2, 1, 1 ]) == 2
p find_uniq([ 0, 0, 0.55, 0, 0 ]) == 0.55

