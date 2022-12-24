=begin
A pangram is a sentence that contains every single letter of the alphabet at least once.
For example, the sentence "The quick brown fox jumps over the lazy dog" is a pangram, because
it uses the letters A-Z at least once (case is irrelevant).

Given a string, detect whether or not it is a pangram.
Return True if it is, False if not. Ignore numbers and punctuation.

Examples:
pangram?("The quick brown fox jumps over the lazy dog.") == true
pangram?("This is not a pangram.") == false

P - [Understand the] Problem
input: string
output: bollean (true or false)

- detect panagram (sentence in which the alphabets a-z are used atleast once case irrelevant)
- ignore numbers and punctuations
- return true if the strinh input is a panagram
- return false if iti is not

E - Examples / Test cases
pangram?("The quick brown fox jumps over the lazy dog.") == true
pangram?("This is not a pangram.") == false

D - Data Structure
array to store the alphabets
boolean for return value

A - Algorithm
- create a constant array of alphabets 
- find all the characters in the input string
  - elminate repetions
  - delete the punctuations
  - have them arranges in the alphabetic order (all in downcase)
  - store them in an array
- compare the array to the constant array
- return true if same
- return false other wise

C - Code
=end

ALPHABET_ARR = %w(a b c d e f g h i j k l m n o p q r s t u v w x y z)

def pangram?(str)
  str_arr = []

  str.each_char { |char| str_arr << char.downcase if char =~ /[a-z]/i }
  str_arr.uniq.sort == ALPHABET_ARR ? true : false
end

p pangram?("The quick brown fox jumps over the lazy dog.") == true
p pangram?("This is not a pangram.") == false