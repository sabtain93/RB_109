=begin

Complete the greatestProduct method so that it'll find the greatest product of
five consecutive digits in the given string of digits.

For example:
greatestProduct("123834539327238239583") // should return 3240 
The input string always has more than five digits.

problem:
input: string of integer
output: integer

rules:
- find the greatest product of five consecutive number from the string of integer
- the input string will always have atleast 5 digits

example:
"123834539327238239583"
12383
23834
38345
83453
find all possible subtrings for length of 5
0 till size of string of string -5
data
array of strings
array of inetegrs
integer

algo:
- initialize substring array to empty array
- find all possible subtrings for len of 5
- store the substring of len 5 in substring array
- find the product of all the substrings in the substring array
  - iterate over the substring array
  - transform each substring into array of integers
  - find the product of each array of integers
- find the maximum product and return it

implementaion:
- find all possible subtrings for len of 5
- iterate from 0 to size of string - 5, track iteration (start index)
  - slice from the string from start index for len of 5
  - append the substring to the substring array


=end
def greatest_product(string)
  substring_arr = []

  (0..string.size - 5).each do |start_index|
    substring_arr << string[start_index, 5]
  end
  substring_arr.map do |substr|
    substr.chars.map {|char| char.to_i }.reduce(:*)
  end.max

end

p greatest_product("123834539327238239583") == 3240 
p greatest_product("395831238345393272382") == 3240 
p greatest_product("92494737828244222221111111532909999") == 5292 
p greatest_product("92494737828244222221111111532909999") == 5292 
p greatest_product("02494037820244202221011110532909999") == 0