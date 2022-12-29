
=begin
Given a list of integers and a single sum value, return the first two values
(parse from the left please) in order of appearance that add up to form the sum.

If there are two or more pairs with the required sum, the pair whose second element has the
smallest index is the solution.

sum_pairs([11, 3, 7, 5],         10)
#              ^--^      3 + 7 = 10
== [3, 7]

sum_pairs([4, 3, 2, 3, 4],         6)
#          ^-----^         4 + 2 = 6, indices: 0, 2 *
#             ^-----^      3 + 3 = 6, indices: 1, 3
#                ^-----^   2 + 4 = 6, indices: 2, 4
#  * the correct answer is the pair whose second value has the smallest index
== [4, 2]

sum_pairs([0, 0, -2, 3], 2)
#  there are no pairs of values that can be added to produce 2.
== None/nil/undefined (Based on the language)

sum_pairs([10, 5, 2, 3, 7, 5],         10)
#              ^-----------^   5 + 5 = 10, indices: 1, 5
#                    ^--^      3 + 7 = 10, indices: 3, 4 *
#  * the correct answer is the pair whose second value has the smallest index
== [3, 7]

P - [Understand the] Problem
input: one array, one inetger (sum)
- the elements can be negative,and so can the sum value (the 2nd input)
- 
output: array (two element array)
- pair which give the sum equal to the integer input
- If there are more than one pair then return the pair whoes second element has
the lower index value.
- If there are no pair which produce the sum then return nil

E - Examples / Test cases
sum_pairs([10, 5, 2, 3, 7, 5], 10) == [3, 7]
sum_pairs([4, 3, 2, 3, 4], 6) == [4, 2]

## intial thoughts:
need to find pairs
      [4, 3, 2, 3, 4] -> [0, 1] [0, 2], [0, 3], [0, 4]
index->0  1  2  3  4     [1, 2] [1, 3] [1, 4]
                         [2, 3] [2, 4]
                         [3, 4]
(0..second last index)
(1..last index)

D - Data Structure
hash (to store pairs)

A - Algorithm
- create an empty hash
- find the pairs from the array
  -iterate over the range from 0 till size of the array - 2 inclusice, iteration tracking (first index)
    - iterate over the range from first index + 1 till size of array -1 inclusive , iteration tracking (last index)
      - element at first index and last index have a sum equal to the second input
        - add the pair in an array and assign it to the hash[last index]
- return the value of the key from the hash whoes value is the lowest
- if the hash is empty return nil

C - Code

=end

def sum_pairs(arr, pair_sum)
  pair_hsh = {}

  (0..arr.size-2).each do |first_index|
    (first_index+1..arr.size-1).each do |last_index|
      if arr[first_index] + arr[last_index] == pair_sum
        pair_hsh[last_index] = [arr[first_index], arr[last_index]]
      end
    end
  end
  pair_hsh[pair_hsh.keys.min]
end

l1= [1, 4, 8, 7, 3, 15]
l2= [1, -2, 3, 0, -6, 1]
l3= [20, -13, 40]
l4= [1, 2, 3, 4, 1, 0]
l5= [10, 5, 2, 3, 7, 5]
l6= [4, -2, 3, 3, 4]
l7= [0, 2, 0]
l8= [5, 9, 13, -3]

p sum_pairs(l1, 8) == [1, 7]
p sum_pairs(l2, -6) == [0, -6]
p sum_pairs(l3, -7) == nil
p sum_pairs(l4, 2) == [1, 1]
p sum_pairs(l5, 10) == [3, 7]
p sum_pairs(l6, 8) == [4, 4]
p sum_pairs(l7, 0) == [0, 0]
p sum_pairs(l8, 10) == [13, -3]



