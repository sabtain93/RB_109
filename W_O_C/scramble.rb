
=begin
problem:
Write function scramble(str1, str2) that returns true if a portion of str1 characters 
can be rearranged to match str2, otherwrise return false.
For example:
str1 is 'rkqodlw' and str2 is 'world' the output should be true.
str1 is 'codewaraaossoqqyt' and str2 is 'codewars' should return true
str1 is 'katas' and str2 is 'steak' should return false.

Test cases:

p scramble('javaass', 'jjss') == false
p scramble('rkqodlw', 'world') == true
p scramble('codewaraaossoqqyt', 'codewars') == true
p scramble('katas', 'steak') == false
p scramble('scriptjava', 'javascript') == true
p scramble('scriptingjava', 'javascript') == true

only lower case letter will be used (a-z). No punctuation or digits will be included.

P - [Understand the] Problem
input: two strings
output: true or false

rules:
- return true if some part of string 1 can be reassembled to form string 2
- return false otherwise
- only lower case letters are used

E - Examples / Test cases
p scramble('javaass', 'jjss') == false
p scramble('rkqodlw', 'world') == true
p scramble('codewaraaossoqqyt', 'codewars') == true
p scramble('katas', 'steak') == false
p scramble('scriptjava', 'javascript') == true
p scramble('scriptingjava', 'javascript') == true

D - Data Structure
array to store the characters of each string

#initial thougts
- break the characters into a list
- check each character count in the 1st string is greater or equal to the count in the second string

A - Algorithm
- break the characters in the 2nd string and store it in a list (string array)
- delete the duplicates if any in the string array
- iterate over the string array
  - if for all the characters count of the current character in 1st string is equal
   or greater than the count in 2nd string
    - return true
  if not
    - return false

C - Code

=end

def scramble(string1, string2)
  string2.chars.uniq.all? { |char| string1.count(char) >= string2.count(char) }

end


p scramble('javaass', 'jjss') == false
p scramble('rkqodlw', 'world') == true
p scramble('codewaraaossoqqyt', 'codewars') == true
p scramble('katas', 'steak') == false
p scramble('scriptjava', 'javascript') == true
p scramble('scriptingjava', 'javascript') == true