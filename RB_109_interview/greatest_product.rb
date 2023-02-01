=begin
Complete the greatestProduct method so that it'll find the greatest product of five 
consecutive digits in the given string of digits.

For example:

greatestProduct("123834539327238239583") // should return 3240

The input string always has more than five digits.

p greatest_product("123834539327238239583") == 3240
p greatest_product("395831238345393272382") == 3240
p greatest_product("92494737828244222221111111532909999") == 5292
p greatest_product("92494737828244222221111111532909999") == 5292
p greatest_product("02494037820244202221011110532909999") == 0

Problem:
input: string of digits
output: integer

rules:
- find the greatest product(5 consecutive digits) among the given digit string.
- the input will always have more than five digits

Examples:
"123834539327238239583" -> 3240
'12383'-> 0, 5
'23834' -> 1, 5
'38345' -> 2, 5
.
.
.
'39583' -> 16(length 0f string - 5), 5
'12383' -> '1' '2' '3' '8' '3' -> 1*2*3*8*3(product)

Datastructure:
array of substrings
array of integers
integer

Algorithm:
- initialize substring to an empty array
- find all possible substrings that are consecutive and have a length of 5
- store substring in the substring array.
-iterate over the substring array
  - for each substring (convert it into digits )
    - find the product for each substring
    - add the products into a product array
- return the maximum product from the product array

implementation:
- find all possible substrings that are consecutive and have a length of 5
  - iterate over the range 0 till size of string - 5 (inclusive), track iteration (start)
    -slice the string from starting index start for the length of 5
=end
def substring_5(string)
  substring_array = []

  (0..string.size - 1).each do |start|
    (start..string.size - 1).each do |ending|
      substring_array << string[start..ending]
    end
  end
  substring_array
end


def greatest_product(string)
  substring_arr = substring_5(string).select {|substring| substring.size == 5 }

  substring_arr.map do |substr|
    substr.chars.map { |char| char.to_i}.reduce(:*)
  end.max
end




p greatest_product("123834539327238239583") == 3240
p greatest_product("395831238345393272382") == 3240
p greatest_product("92494737828244222221111111532909999") == 5292
p greatest_product("92494737828244222221111111532909999") == 5292
p greatest_product("02494037820244202221011110532909999") == 0