=begin

An anagram is the result of rearranging the letters of a word to produce a new word 
(see wikipedia).

Note: anagrams are case insensitive

Complete the function to return true if the two arguments given are 
anagrams of each other; return false otherwise.

Examples:
"foefet" is an anagram of "toffee" 
"Buckethead" is an anagram of "DeathCubeK" 

Problem:
Input: 2 strings
output: boolean (true or false)

rules:
return true if the two string input are anagrams of each other
return fals if not
anagram are words that have the same characters
case doesnt matter/order doesnt matter

Example:
'Creative', 'Reactive'
1c 1r 2e 1a 1t 1i 1v
1c 1r 2e 1a 1t 1i 1v
if i sort both the strings alphabetically they will be the same

data structure
array of string - subprocess
string- input
boolean output

algo:
- convert 1st string input into its lowecased form
- break 1st string into characters
  - store them in an array
  - sort the characters alphabetically
  - join the characters back into string
  - store the string in sorted string 1
- convert 2nd string input into its lowecased form
- break 2nd string into characters
  - store them in an array
  - sort the characters alphabetically
  - join the characters back into string
  - store the string in sorted string 2
- if sorted string 1 and sorted string 2 are equal when compared
  - return true
  - if not
  -return false
=end
def is_anagram(str1, str2)
  sorted_str1 = str1.downcase.chars.sort.join
  sorted_str2 = str2.downcase.chars.sort.join

  (sorted_str1 <=> sorted_str2) == 0
end




p is_anagram('Creative', 'Reactive') == true 
p is_anagram("foefet", "toffee") == true 
p is_anagram("Buckethead", "DeathCubeK") == true 
p is_anagram("Twoo", "WooT") == true 
p is_anagram("dumble", "bumble") == false 
p is_anagram("ound", "round") == false 
p is_anagram("apple", "pale") == false