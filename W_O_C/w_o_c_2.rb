=begin
Given an array of strings made only from lowercase letters, return an array of all
characters that show up in all strings within the given array (including duplicates).
For example, if a character appears 3 times in all strings but not 4 times, you need
include that character 3 times in the final answer.

p common_chars(['bella', 'label', 'roller']) == ['e', 'l', 'l']
p common_chars(['cool', 'lock', 'cook']) == ['c', 'o']
p common_chars(['hello', 'goodbye', 'booya', 'random']) == ['o']
p common_chars(['aabbaaaa', 'ccdddddd', 'eeffee', 'ggrrrrr', 'yyyzzz']) == []

P - [Understand the] Problem
input: array of strings
output: array of strings

rules:
- all the strings are in lowercase characters
- return all the characters that are common among all the strings
- include duplicates (that is only if the duplicates appear in all of the strings)
- if the common characters count varies, then add it only once in the result array
- if no common characters are found then return an empty string
E - Examples / Test cases
p common_chars(['bella', 'label', 'roller']) == ['e', 'l', 'l']
p common_chars(['cool', 'lock', 'cook']) == ['c', 'o']
p common_chars(['hello', 'goodbye', 'booya', 'random']) == ['o']
p common_chars(['aabbaaaa', 'ccdddddd', 'eeffee', 'ggrrrrr', 'yyyzzz']) == []

D - Data Structure
array 
strings

# initial thoughts
- a character will only be added into the final array if it exists in all the strings
- parse through each character in the first element and compare it with the characters in the rest
 of the strings
- if there is a commonality then we have to check for the count of the character

A - Algorithm
- initalize a result array to empty array
- iterate over the characters of the first string in the array after deleting the common characters
- for eACH character 
  -comapre it with the rest of the strings characters
    - if there is a common character 
      - then find if its count in all of the string is equal
         initalize a count array to empty array
         iterate over input array
          store the count of character in the all the string into the array
- then add the character into the result array equal to the minimum value in the count array
      - if the count is not equal
        - then add it to the result array only once
- return the result array
C - Code

=end

def common_chars(arr)
  result = []

  arr[0].chars.uniq.each do |char|
    if arr.all? { |str| str.chars.include?(char)}
      count = []
      arr.each { |word| count << word.count(char) }
      count.min.times { result << char }
    end
  end
  result
end




p common_chars(['bella', 'label', 'roller']) == ['e', 'l', 'l']
p common_chars(['cool', 'lock', 'cook']) == ['c', 'o']
p common_chars(['hello', 'goodbye', 'booya', 'random']) == ['o']
p common_chars(['aabbaaaa', 'ccdddddd', 'eeffee', 'ggrrrrr', 'yyyzzz']) == []
