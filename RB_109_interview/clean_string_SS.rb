=begin
Problem:
Assume "#" is like a backspace in string. This means that string "a#bc#d" actually is "bd"

Your task is to process a string with "#" symbols.

Example:
clean_string("abc#d##c") == "ac"
clean_string("abc##d######") == ""
clean_string("#######") == ""
clean_string("") == ""

P - [Understand the] Problem
input: string
output: string (processed)

rules:
- '#' represents a backspace
- return the processed string, where '#' leading a character is deleted
- empty string will return an empty string

E - Examples / Test cases
clean_string("abc#d##c") == "ac"
clean_string("abc##d######") == ""
clean_string("#######") == ""
clean_string("") == ""

D - Data Structure
array

A - Algorithm
- set a an empty array to result
- store the string in a list (char_arr)
- iterate through the list of charaters
- append the result list with the current character
- delete the character from the result list if the current character is a '#'.
- return the characters in the result list joined into a string.

C - Code

=end

def clean_string(str)
  result = []
  char_arr = str.chars
  char_arr.each do |char|
    if char != '#'
      result << char
    else
      result.delete(result.last)
    end
  end
  result.join
end

p clean_string("abc#d##c") == "ac"
p clean_string("abc##d######") == ""
p clean_string("#######") == ""
p clean_string("") == ""

