=begin
The vowel substrings in the word codewarriors are o,e,a,io. The longest of these has a length of
2. Given a lowercase string that has alphabetic characters only (both vowels and consonants)
and no spaces, return the length of the longest vowel substring. Vowels are any of aeiou.

Examples:
p solve("codewarriors") == 2
p solve("suoidea") == 3
p solve("iuuvgheaae") == 4
p solve("ultrarevolutionariees" == 3
p solve("strengthlessnesses") == 1
p solve("cuboideonavicuare") == 2
p solve("chrononhotonthuooaos") == 5
p solve("iiihoovaeaaaoougjyaw") == 8

P - [Understand the] Problem
input: string
- the string is lowercase
- the string has no spaces
- the string has only alphabetic characters

output: integer
- integer represent the value of the longest vowel substring

- a substring is atleast 1 char long
- vowel are any of aeiou
E - Examples / Test cases

D - Data Structure
string
array (to store the substrings)

A - Algorithm
- create an empty list (substr_arr)
- find all the substring and add them to all_substrings
  - create a helper method all_substrings
  - iterate from 0 to size of the current string
    - iterate from current iteration to size of the current string
      - return the substring from starting from the outer iteration number till the inner iteration number
- create vowel_substr
- iterate over the all_substring array
- select the vowel substrings and append them into vowel_substr array
- find the longest string in vowel_substr
- return the size of the longest vowel substring.

C - Code
=end

def solve(str)

  vowel_arr = []
  longest_str = 0

  (0...str.size).each do |start|
    (start...str.size).each do |last|
      vowel_arr << str[start..last] if str[start..last].chars.all? { |char| char =~ /[aeiou]/ } 
    end
  end

  vowel_arr.sort_by { |substr| substr.size }.last.size
end



p solve("codewarriors") == 2
p solve("suoidea") == 3
p solve("iuuvgheaae") == 4
p solve("ultrarevolutionariees") == 3
p solve("strengthlessnesses") == 1
p solve("cuboideonavicuare") == 2
p solve("chrononhotonthuooaos") == 5
p solve("iiihoovaeaaaoougjyaw") == 8
