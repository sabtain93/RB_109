
=begin
In this kata you are required to, given a string, replace every letter with its
position in the alphabet. 

If anything in the text isn't a letter, ignore it and don't return it. 

"a" = 1, "b" = 2, etc.

Example:
alphabet_position("The sunset sets at twelve o' clock.") 
Should return "20 8 5 19 21 14 19 5 20 19 5 20 19 1 20 20 23 5 12 22 5 15 3 12 15 3 11"
(as a string) 

input: string
output: string of numbers
rules:
return the number that is position of every character that is an alphabet
do not return anything for the characters that are not alphabets
uppercase treated as lowercase
examples:
"-.-'"
- . - ' none of them are characetrs

data structure:
array of strings
output string
hash

algo:
- initialize a pos hash where keys are alphabets and their position is value
- select the characters from the string that are alphabets
- store the selected characters in an array char_arr
- if char array is empty return empty string
- iterate over the character array
  - transform every character into its position in the alphabets
  - store the position in a position array
- transform the position array elements into string
- return the numbered string
=end

def alphabet_position(string)
  char_arr = string.downcase.chars.select { |char| char =~ /[a-z]/ }


  pos_hash = {}

  ('a'..'z').to_a.each_with_index do |char, idx|
    pos_hash[char] = idx + 1
  end

  char_arr.map do |char|
    pos_hash[char].to_s
  end.join(' ') # when calling array is empty map returns empty array

end

p alphabet_position("The sunset sets at twelve o' clock.") ==
"20 8 5 19 21 14 19 5 20 19 5 20 19 1 20 20 23 5 12 22 5 15 3 12 15 3 11" 
p alphabet_position("-.-'") == ""