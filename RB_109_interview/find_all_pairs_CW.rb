=begin

You are given array of integers, your task will be to count all pairs in that array 
and return their count.

Notes:

Array can be empty or contain only one value; in this case return 0
If there are more pairs of a certain number, count each pair only once. E.g.: for [0, 0, 0, 0] the
return value is 2 (= 2 pairs of 0s)
Random tests: maximum array length is 1000, range of values in an array is between 0 and 1000
Examples
[1, 2, 5, 6, 5, 2]  -->  2
...because there are 2 pairs: 2 and 5

[1, 2, 2, 20, 6, 20, 2, 6, 2]  -->  4
...because there are 4 pairs: 2, 20, 6 and 2 (again)

Examples:

pairs([1, 2, 5, 6, 5, 2]) == 2
pairs([1, 2, 2, 20, 6, 20, 2, 6, 2]) == 4)
pairs([0, 0, 0, 0, 0, 0, 0]) == 3
pairs([1000, 1000]) == 1
pairs([]) == 0
pairs([54]) == 0

P - [Understand the] Problem
input: array of integers
output: integer (that represents the number of pairs found in the input array)

- the input array can be empty or only one value in this case the result is zero
- count each pair only once ([0, 0, 0, 0] there are only two pairs of 0s)

E - Examples / Test cases
pairs([1, 2, 5, 6, 5, 2]) == 2
pairs([1, 2, 2, 20, 6, 20, 2, 6, 2]) == 4)
pairs([0, 0, 0, 0, 0, 0, 0]) == 3
pairs([1000, 1000]) == 1
pairs([]) == 0
pairs([54]) == 0
D - Data Structure
array
hash
integer
A - Algorithm
- create a hash called pair_hsh
- iterate over the input array
- scrapped-append the pair_arr for each element of the input array which occurs more than once.
- update the hash with each element as key and their count as their corresponding values
- divide each value by 2 to get the number of pairs for each element
- add the counts for each element and return the final integer

C - Code

=end

def pairs(arr)
  pair_hsh = Hash.new(0)

  arr.each do |num1| # 1
    pair_hsh[num1] += 1
  end
  pair = 0
  pair_hsh.each_value { |count| pair += count / 2 }
  pair

end


p pairs([1, 2, 5, 6, 5, 2]) == 2
p pairs([1, 2, 2, 20, 6, 20, 2, 6, 2]) == 4
p pairs([0, 0, 0, 0, 0, 0, 0]) == 3
p pairs([1000, 1000]) == 1
p pairs([]) == 0
p pairs([54]) == 0






