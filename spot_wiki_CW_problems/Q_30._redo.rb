=begin
Given two words, how many letters do you have to remove from them to make them anagrams? 
Example 
First word : c od e w ar s (4 letters removed) 
Second word : ha c k er r a nk (6 letters removed) 
Result : 10 
Hints 
A word is an anagram of another word if they have the same letters 
(usually in a different order).

Do not worry about case. All inputs will be lowercase.

problem:
input: 2 strings
output: integer

rules:
return the number of words we have to remove from string 1 and string 2 so they are anagrams of
each other
anagram - if the 2 strings have the same letters (order doesnt matter)
both stirngs will have lowercase letters
empty string is an anagram of an empty string

examples:
'codewars', 'hackerrank'
c o d e w a r s -> 8
h a c k e r r a n k -> 10
c e a r
iterate over the string which is smaller in size
if eqaul size then iterate over any one
calculate the number of characters that are common

data:
string
array fo strings
integer

algo:
- find out the smaller string
- iterate over the smaller string charcters
- for each character
  - if the count of current character in smaller string is equal or greater than in 
    other string
  - increment counter by 1
- return the number = size of smaller - counter + size of greater - smaller
=end 

def anagram_difference(str1, str2)

    if str1.size < str2.size
      smallest = str1
      larger = str2
    else
      smallest = str2
      larger = str1
    end
  counter = 0
  smallest.chars.each do |char|
    if smallest.count(char) <= larger.count(char)
      counter += 1
    end
  end

  (smallest.size - counter) + (larger.size - counter)
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