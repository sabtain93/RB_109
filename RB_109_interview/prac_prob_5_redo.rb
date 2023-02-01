=begin
# Write a method that takes a string as an argument and returns
# the character that occurs least often in the given string.
# If there are multiple characters with the equal lowest number
# of occurrences, then return the one that appears first in the
# string. When counting characters, consider the uppercase and
# lowercase version to be the same.

# Examples:

p least_common_char("Hello World") #== "h"
p least_common_char("Peter Piper picked a peck of pickled peppers") #== "t"
p least_common_char("Mississippi") #== "m"
p least_common_char("Happy birthday!") #== ' '
p least_common_char("aaaaaAAAA") #== 'a'

# The tests above should print "true".

P - [Understand the] Problem
input: string
output: string

rules:
- return the character from the string with the least count
- return the one that comes earlier if there are more than one with the same count
- uppercase and lowercas are the same
- count sapces as well

E - Examples / Test cases
"Happy birthday!"
h - 2
a - 2
p - 2
y - 2
  - 1
b - 1
i - 1
r - 1
t - 1
d - 1

D - Data Structure
hash- subprocess
string- output

A - Algorithm
- initialize the hash with a default value eqaul to 0
- break the string into array of characters 
- iterate over the array of characters with unique values
  - update the hash
    - each character is the key and its count in the string the value
- find the minimam value in the hash
- return the key with the minimum value
C - Code


=end
def least_common_char(string)
  hash = {}
  lowercase_str = string.downcase
  lowercase_str.chars.uniq.each do |char|
    hash[char] = lowercase_str.count(char)
  end
  hash.min_by {|_, v| v }.first

end



p least_common_char("Hello World") #== "h"
p least_common_char("Peter Piper picked a peck of pickled peppers") #== "t"
p least_common_char("Mississippi") #== "m"
p least_common_char("Happy birthday!") #== ' '
p least_common_char("aaaaaAAAA") #== 'a'
