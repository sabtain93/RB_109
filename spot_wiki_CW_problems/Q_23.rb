=begin
Find the longest substring in alphabetical order. 

Example: the longest alphabetical substring in "asdfaaaabbbbcttavvfffffdf" is "aaaabbbbctt". 

There are tests with strings up to 10 000 characters long so your code will need
to be efficient. 

The input will only consist of lowercase characters and will be at least one letter long. 

If there are multiple solutions, return the one that appears first.

problem:
input: string
output: string

rules:
find the longest alphabetical substring
input has only lowercase characters and atleast 1 character long
if there are multiple solutions return that comes before

Examples:
'abcdeapbcdef'
a, abc, abcd, abcde, abcdea,
b, bcd,bcde, bcdea
c, cd, cde, cdea
d, de, dea                      (abcde) -> sort this aplhabetically it stays the same
e, ea
a, ap, apb
p, pb
b, bc, bcd,bcde, bcdef

Data:
array of strings
string


algo:
- initialize subtring array
- find the substrings
  - iterate from 0 to size of string exclusive, track iteration (start)
    - iterate from start to size of string exclusive, track iteration (ending)
      - slice from the string from start till ending
- if a substring if sorted alphabetically equals to the orignal subtring
  - add it to the substring array
- iterate over the subatring array
- find the one with maximum length
- return the substring with the maximum length


=end 
def longest(string)
  substring_array = []

  (0...string.size).each do |start|
    (start...string.size).each do |ending|
      if string[start..ending].chars.sort.join == string[start..ending]
        substring_array << string[start..ending]
      end
    end
  end
  substring_array.max_by {|substr| substr.size }

end


p longest('asd') == 'as' 
p longest('nab') == 'ab' 
p longest('abcdeapbcdef') #== 'abcde' 
p longest('asdfaaaabbbbcttavvfffffdf') == 'aaaabbbbctt' 
p longest('asdfbyfgiklag') =='fgikl' 
p longest('z') == 'z' 
p longest('zyba') == 'z' 