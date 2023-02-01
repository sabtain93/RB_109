
=begin
Given two words, how many letters do you have to remove 
from them to make them anagrams?

Example
First word : c od e w ar s (4 letters removed)
Second word : ha c k er r a nk (6 letters removed)
Result : 10

Hints
A word is an anagram of another word if they have the same letters
(usually in a different order).
Do not worry about case. All inputs will be lowercase.

Problem:
input: 2 strings
output: integer

rules:
we have to make the 2 string anagrams
empty strings are anagrams of each other
one word is an anagram of the other if there are any words tha are commom among them
order of the characters doesnt matter
if both strings are empty this implies that we cannot remove any more characters so return 0
if there are no common characters then return the sum of the sizes of both input strings

Example:

'codewars', 'hackerrank' -> 10
---8-----------10---------
--cear--------acer-------- -> 4 common characters
we will have to remover 8-4 = 4 from string one
and 10 - 4 = 6 characters from string 2
6 + 4 is 10

data structure:
string
integer as output


algorithm:
- find the samller string among the two inputs
- assign the other one as the larger string
- break the smaller string into characetrs store it in an array
- iterate over the array with the characters of the smaller string
- initialize char_count eqaul to 0
  - check if the count in the smaller string is equal to or greater than the character count in the
  larger string
  - if it is true then incremnet char_count by one
- return the value eqaul to (smaller string size - char_count) + (larger string - char_count)
=end

def anagram_difference(str1, str2)
  if str1 < str2
    smallest = str1
    larger = str2
  else
    smallest = str2
    larger = str1
  end
  char_count = 0
  smallest.chars.each do |char|
    if smallest.count(char) <= larger.count(char)
      char_count += 1
    end
  end

  (smallest.size - char_count) + (larger.size - char_count)
end


p anagram_difference('', '') == 0
p anagram_difference('a', '') == 1
p anagram_difference('', 'a') == 1
p anagram_difference('ab', 'a') == 1
p anagram_difference('ab', 'ba') == 0
p anagram_difference('ab', 'cd') == 4
p anagram_difference('aab', 'a') == 2
p anagram_difference('a', 'aab') == 2
p anagram_difference('codewars', 'hackerrank') == 10