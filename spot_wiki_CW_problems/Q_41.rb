=begin

Assume "#" is like a backspace in string. This means that string "a#bc#d" actually is "bd" 

Your task is to process a string with "#" symbols. 

Examples 
"abc#d##c"      ==>  "ac" 
"abc##d######"  ==>  "" 
"#######"       ==>  "" 
""              ==>  "" 
problem:
input: string
output: string

rules:
- # character is backspace
- lowercase alphabets
- a input string with all '#' returns empty string
- empty string returns empty string

Example:
"abc#d##c"
[a, c] -> ac

data:
array of strings
string

algo:
- break the input string into characters and assign it to character array
- initialize result array to empty array
- iterate over the character array, track iteration current character
  -if the current character is a '#'
    delete the last element from result array
  - if it is not a '#'
    append the current character to my result array
- convert he result array to a string
- return the string
=end
def clean_string(string)
  result_arr = []
  character_arr = string.chars

  character_arr.each do |char|
    if char == '#'
      result_arr.delete_at(-1)
    elsif char != '#'
      result_arr << char
    end
  end
  result_arr.join
end


p clean_string('abc#d##c') #== "ac" 
p clean_string('abc####d##c#') #== ""