=begin
Your goal is to write the group_and_count method, which should receive and array as unique
parameter and return a hash.
Empty or nil input must return nil instead of a hash.
This hash returned must contain as keys the unique values of the array, and as values the counting
of each value.

Example usage:

input = [1,1,2,2,2,3]

group_and_count(input)# == {1=>2, 2=>3, 3=>1}
The following methods were disabled:

Array#count
Array#length

Test cases:
group_and_count([0,1,1,0]) == {0=>2, 1=>2}

P - [Understand the] Problem
input: array
- input can be empty or nil

output: Hash or nil
- hash keys are the unique values of the input array
- hash value is the count of each unique value
- return nil instead of hash if the input is empty or nil



E - Examples / Test cases
group_and_count(input)# == {1=>2, 2=>3, 3=>1}

D - Data Structure
input: array
output: hash

A - Algorithm
- initialize an empty hash
- return nil if the input is empty of nil
- find the unique value in the input array
- iterate over the array which has the unique values
  -count each element in the original array
  - update the hash where the key is the current element and value is the count
- return the final hash

C - Code
=end

def group_and_count(array)
  hash = {}
  return nil if array.empty? || array == nil

  array.uniq.each do |number|
    hash[number] = array.count(number)
  end
  hash

end

input = [1,1,2,2,2,3]

p group_and_count(input) == {1=>2, 2=>3, 3=>1}
