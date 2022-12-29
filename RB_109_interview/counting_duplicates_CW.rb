=begin
Write a function that will return the count of distinct case-insensitive alphabetic characters and
numeric digits that occur more than once in the input string. The input string can be assumed to contain
only alphabets (both uppercase and lowercase) and numeric digits.

Example
"abcde" -> 0 # no characters repeats more than once
"aabbcde" -> 2 # 'a' and 'b'
"aabBcde" -> 2 # 'a' occurs twice and 'b' twice (`b` and `B`)
"indivisibility" -> 1 # 'i' occurs six times
"Indivisibilities" -> 2 # 'i' occurs seven times and 's' occurs twice
"aA11" -> 2 # 'a' and '1'
"ABBA" -> 2 # 'A' and 'B' each occur twice

P - [Understand the] Problem
input: string
- has upper case and lowercase aplhabets
- has numeric digits
output: integer
- is the count of the characters that appear more than once
- characters include numeric and aplhabetic case-insensitive

E - Examples / Test cases
p duplicate_count("") == 0
p duplicate_count("abcde") == 0
p duplicate_count("abcdeaa") == 1
p duplicate_count("abcdeaB") == 2
p duplicate_count("Indivisibilities") == 2

D - Data Structure
array
strings

A - Algorithm
# scrapped- create a list of all the aphabets a-z
#scrapped- create a list of number 0-9
- store the characters in a array
- downcase all the characters
- eliminate the duplicates from the array
- create the counter to 0
-iterate over processed array
  - get count of current character in the original array
  - if the count is greater than 1 increment the counter
- return the value of the counter


C - Code

=end

def duplicate_count(str)
  str_arr = str.downcase.chars

  str_arr_uniq = str_arr.uniq
  counter = 0
  str_arr_uniq.each do |char|
    counter += 1 if str_arr.count(char) > 1
  end
  counter
end


p duplicate_count("") == 0
p duplicate_count("abcde") == 0
p duplicate_count("abcdeaa") == 1
p duplicate_count("abcdeaB") == 2
p duplicate_count("Indivisibilities") == 2



