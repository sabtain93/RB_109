=begin
Problem:
Complete the function scramble(str1, str2) that returns true if a portion of str1 characters
can be rearranged to match str2, otherwise returns false.

Notes:

Only lower case letters will be used (a-z). No punctuation or digits will be included.
Performance needs to be considered.

Examples:
p scramble('rkqodlw', 'world') == true
p scramble('cedewaraaossoqqyt', 'codewars') == true
p scramble('katas', 'steak').== false
p scramble('scriptjava', 'javascript') == true
p scramble('scriptingjava', 'javascript') == true

P - [Understand the] Problem
input: 2 strings
output: boolean (true or false)

rules:
check if part of the first argument can be rearranged so that it is equal to the second
string argument.
if it is so then return true else return false
the arguments will only have lowercase letters no punctucations or digits.

E - Examples / Test cases
p scramble('rkqodlw', 'world') == true
p scramble('cedewaraaossoqqyt', 'codewars') == true
p scramble('katas', 'steak').== false
p scramble('scriptjava', 'javascript') == true
p scramble('scriptingjava', 'javascript') == true

D - Data Structure
string
boolean
array
A - Algorithm
- break down the characters in 1st string and sort them alphabetically
- create a directory where each alphabet will reference the frequency it occurs
- break down the characters in the 2nd string
-create a directory where each alphabet will reference the frequency it occurs
- compare the second directory to the first
- if the frequency matches
  return true
- if not
  return fasle
C - Code
=end
def scramble(str1, str2)
  hsh1 = str1.chars.sort.each_with_object(Hash.new(0)) { |char, hsh| hsh[char] += 1 }
  hsh2 = str2.chars.sort.each_with_object(Hash.new(0)) { |char, hsh| hsh[char] += 1 }

  hsh2.all? do |k, v|
    if hsh1.keys.include?(k)
      true if hsh1[k] >= v
    else
      false
    end
  end
end





p scramble('rkqodlw', 'world') == true
p scramble('cedewaraaossoqqyt', 'codewars') == true
p scramble('katas', 'steak').== false
p scramble('scriptjava', 'javascript') == true
p scramble('scriptingjava', 'javascript') == true