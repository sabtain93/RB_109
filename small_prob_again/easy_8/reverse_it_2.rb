=begin
Write a method that takes one argument, a string containing one or more words,
and returns the given string with words that contain five or more characters reversed.
Each string will consist of only letters and spaces.
Spaces should be included only when more than one word is present.

Examples:

Copy Code
puts reverse_words('Professional')          # => lanoisseforP
puts reverse_words('Walk around the block') # => Walk dnuora the kcolb
puts reverse_words('Launch School')         # => hcnuaL loohcS

P - [Understand the] Problem
input: string
output: string

rules:
- input string can have one or more words
- reverse the words that are atleast 5 characters long
- only letters and spaces
- spaces are used only if more than two characters are used
E - Examples / Test cases
puts reverse_words('Walk around the block')
D - Data Structure
string for input
array to store my words
string for output
A - Algorithm
- break the string and seperate the words (between spaces) and store it in a list
- iterate over the list of words
  - check if the current word length is greater than 5 or equal to 5
   - reverse the word in the list
  - if the current word's length is less than 5
    - do not reverse
- convert the trasnformed list into a string
- return the transformed string

C - Code
=end
def reverse_words(string)
  string.split(' ').map do |word|
    if word.size >= 5
      word.reverse
    else
      word
    end
  end.join(' ')
end


puts reverse_words('Professional')
puts reverse_words('Walk around the block')
puts reverse_words('Launch School')

