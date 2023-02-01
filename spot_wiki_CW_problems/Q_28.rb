=begin
What is an anagram? Well, two words are anagrams of each other if they both contain
the same letters. For example: 

'abba' & 'baab' == true 
'abba' & 'bbaa' == true 
'abba' & 'abbba' == false 
'abba' & 'abca' == false 

Write a function that will find all the anagrams of a word from a list.
 You will be given two inputs a word and an array 
with words. You should return an array of all the anagrams or an empty array if there are
none.

problem:
input: array & a string
output: array

rules: 
find the possible anagrams in the array of strings of the string input
return the anagrams in an array
if there are none return an empty array
anagram will be a word with the same charcaters (order doesnt matter)

Examples:
'abba', ['aabb', 'abcd', 'bbaa', 'dada']
a a b b -> [1...............1........] -> [2 elements]
'laser', ['lazing', 'lazy',  'lacer']
l a s e r[                          ] -> []


Data structure
array output
strings
array of string in the subprocess

algo:
- iterate over the input array of strings
- for each string check if the charaters in it match with the input string
- if there are any then add it to an array
- return the array

=end

def anagrams(str, array)
  array.select do |string|
    string.chars.sort == str.chars.sort
  end
end

p anagrams('abba', ['aabb', 'abcd', 'bbaa', 'dada']) == ['aabb', 'bbaa'] 
p anagrams('racer', ['crazer', 'carer', 'racar', 'caers', 'racer']) == ['carer', 'racer'] 
p anagrams('laser', ['lazing', 'lazy',  'lacer']) == [] 