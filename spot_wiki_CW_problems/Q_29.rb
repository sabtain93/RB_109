=begin
Complete the solution so that it splits the string into pairs of two characters.
If the string contains an odd number of characters then it should replace 
 the missing second character of the final pair with an underscore ('_'). 

problem:
input: string
output: array of strings

rules:
split the string into pairs of 2 characters
if the length is odd then the last charcater is to be paired with a "_"
the string has all lowercase alphabets
if the string is empty then output an wmpty array

Examples:
'abcdef' -> ab cd ef
(0-1) (2-3) (4-5)
(0, 2) (2-3) (4-5)

data structure
string input
array output


algo:
- initialize my result array to empty array
- if the size of the string is odd
- append the string with a "_" character
- iterate from 0 till size of string of string - 1 inclusive, track iteration idx
  - slice from the string from idx till idx + 1 append it to my result array
  - increment index by 2
- return the result array
=end 
def solution(string)
  result = []

  string = string + '_' if string.size.odd?
  index = 0
  while index <= string.size - 1 do
    result << string[index..index + 1]
    index += 2
  end
  result


end


p solution('abc') == ['ab', 'c_'] 
p solution('abcdef') == ['ab', 'cd', 'ef'] 
p solution("abcdef") == ["ab", "cd", "ef"] 
p solution("abcdefg") == ["ab", "cd", "ef", "g_"] 
p solution("") == [] 