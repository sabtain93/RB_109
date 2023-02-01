=begin
Complete the function scramble(str1, str2) that returns true if a portion of
str1 characters can be rearranged to match 
str2, otherwise returns false.
Notes:
Only lower case letters will be used (a-z). No punctuation or digits will be included. 
Performance needs to be considered 
Input strings s1 and s2 are null terminated.

problem:
input: 2 strings
output: boolean true or false

rules:
check if a portion of string 1 charcaters if rearranged can match string 2
only lowercase letters are used, no special characters or punctuations or spaces are used
input strings cannot be null

examples:
'rkqodlw', 'world'
r, o, d, l, w -> world -> true

'katas', 'steak'
s, t, no e so return false

data structure
array of strings

algo:
- break the string 2 into characters and store it in an array and remove duplicates
- iterate over the character array (from string 2)
- for each charcater 
  - check if the count in string 2 is less than or equal to in string 1
  - if the above is true for all the characters in string 2
    - return true
=end

def scramble(string1, string2)
  string2.chars.uniq.all? {|char| string2.count(char) <= string1.count(char)}
end


p scramble('rkqodlw', 'world') == true 
p scramble('cedewaraaossoqqyt', 'codewars') == true 
p scramble('katas', 'steak') == false 
p scramble('rkqodlw','world') == true 
p scramble('cedewaraaossoqqyt','codewars') == true 
p scramble('scriptjava','javascript') == true 
