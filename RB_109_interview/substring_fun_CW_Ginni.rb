=begin
problem:
Complete the function that takes an array of words.

You must concatenate the nth letter from each word to construct
a new word which should be returned as a string, where n is the position of the word in the list.
["yoda", "best", "has"]  -->  "yes"
  ^        ^        ^
  n=0     n=1     n=2
Note: Test cases contain valid input only
 - i.e. a string array or an empty array; and each word will have enough letters.

Examples:

p nth_char(['yoda', 'best', 'has']) == 'yes'
p nth_char([]) == ''
p nth_char(['X-ray']).== 'X'
p nth_char(['No','No']).== 'No'
p nth_char(['Chad','Morocco','India','Algeria','Botswana','Bahamas','Ecuador','Micronesia']) == 'Codewars'

P - [Understand the] Problem
input: array of strings
output: string (one word string)

rules:
return a string which is the concatenation of the nth letter of each word in the array
n is the index of each word in the array
the array can be empty
the words will have enough letters

E - Examples / Test cases
p nth_char(['yoda', 'best', 'has']) == 'yes'
p nth_char([]) == ''
p nth_char(['X-ray']).== 'X'
p nth_char(['No','No']).== 'No'

D - Data Structure
array
string
integer

A - Algorithm
- #scrapped find the size of the array
- create a empty string
- create a range starting from 0 till size of array - 1
- iterate over the range
- for each value of the range
  - extract the character from the element at the current value
  - store the character in an empty string
- return the string


C - Code
=end

def nth_char(str_arr)
  result = ''
  (0...str_arr.size).each do |index|
    result << str_arr[index][index]
  end

  result

end


p nth_char(['yoda', 'best', 'has']) == 'yes'
p nth_char([]) == ''
p nth_char(['X-ray']).== 'X'
p nth_char(['No','No']).== 'No'
p nth_char(['Chad','Morocco','India','Algeria','Botswana','Bahamas','Ecuador','Micronesia']) == 'Codewars'