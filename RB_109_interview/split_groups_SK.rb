
=begin 

Problem: Given the input string of characters, return an array of the string 
seperated by grouping the same characters as a string element.


Problem:
input: string (characters without spaces)
output: array (string elements )

rules:
- seprate the charcaters into groupings
- grouping is ("5557799!!55") -> '555', '77', '99', '!!', '55'
- groups maintain order.
- input can be a string with only one group
- input will have atleast one group of characters.

Example:
"aaabbbaabbab" -> (a, a, a) (b, b, b) (a, a) (b, b) (a), (b)
need a starting point which will be the 0th index of the string
'a'
start iterating from the next character in the string
check if it is equal to the current character
use it

reassign my starting point 

Algortithm:
- initialize start_point to the character at the 0th index of the string
- initialize a result string to empty string
-# scrapped initialize a result array to empty array
- break the input string into characters and store them in an array
- iterate over the array of charcaters
- for each character
  - if it is equal to the starting point #aaabbbaabbab
    - add it to the result string
  - if not
    - add a space in the result string
    - reassing the starting point to the current character
    - add current character to the result string
- convert the result string into an array (split at the spaces)
=end

def split_groups(string)
  starting_point = string[0]
  result_str = ''
  string.chars.each do |char|
    if char == starting_point
      result_str << char
    else
      result_str << ' '
      starting_point = char
      result_str << char
    end
  end
  result_str.split(' ')

end



p split_groups("555") #== ["555"]
p split_groups("5556667788") == ["555", "666", "77", "88"]
p split_groups("aaabbbaabbab") == ["aaa", "bbb", "aa", "bb", "a", "b"]
p split_groups("abbbcc88999&&!!!*") == ["a", "bbb", "cc", "88", "999", "&&", "!!!", "*"]