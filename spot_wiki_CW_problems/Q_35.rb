=begin
In this simple Kata your task is to create a function that turns a string into a Mexican Wave.
You will be passed a string and you must return that string in an array where an 
uppercase letter is a person standing up. 

Rules 
1. The input string will always be lower case but maybe empty. 
2. If the character in the string is whitespace then pass over it as if it was an empty seat.

problem:
input: string
output: array of strings

rules:
-return an array with elements where the input string has variation in one of its charcaters upcassed
- the character are alphabets in lowercase
- whitespace are to be treated as empty seats
- input can be empty, return empty array

Example:
" gap "
(  g a p  )->( Gap , gAp , gaP )


data:
array of strings

algo:
- initialize result array tio empty array
- initialize index to 0
- iterate from 0 till index equal to or less than size of input string
  - assign processing strig to input string
  -if the character at the current index in input string is an alphabet
  - change the character at the current index value in the processsing string to uppercase
  - append the modified processing string to resulr array
  - increment the index by 1
- return the result array
=end 

def wave(string)
  result_arr = []
  index = 0


  while index <= string.size - 1 do
    string = string.downcase
    if string[index] =~ /[a-z]/
      string[index] = string[index].upcase
      result_arr << string
    end
    index += 1
  end
  result_arr
end
str  = "hello"
p wave(str) == ["Hello", "hEllo", "heLlo", "helLo", "hellO"] 
p str
p wave("codewars") == ["Codewars", "cOdewars", "coDewars", "codEwars", "codeWars", "codewArs", "codewaRs", 
"codewarS"] 
p wave("") == [] 
p wave("two words") == ["Two words", "tWo words", "twO words", "two Words", "two wOrds", "two woRds", "two worDs", 
"two wordS"] 
p wave(" gap ") == [" Gap ", " gAp ", " gaP "]