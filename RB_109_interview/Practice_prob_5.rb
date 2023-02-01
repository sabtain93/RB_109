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


problem:
input: string
output: string (a single character)

rules:
- return the character in the string that occurs the least times
- if there are more than one charcaters that fit the description return the one which comes
  before
- uppercase and lowercase are the same
- consider all charcaters including spaces


Example:


data structure:
array of charcaters
hash to store counts along with the character

algo-
- initialize count hash to empty hash
- convert the input string into lowercase form
- break the lowercase string into characters and store in char array(including spaces)
- delete duplicates in the char array
- iterate over the char array with values from the input string
- check the count of current character in the lowercase string
- populate the hash with count as value and character as key
=end

def least_common_char(string)
  count_hash = {}
  lowercase_str = string.downcase
  lowercase_str.chars.uniq.each do |char|
    count_hash[char] = lowercase_str.count(char)
  end

  count_hash.min_by {|_, v| v }[0]



end


p least_common_char("Hello World") #== "h"
p least_common_char("Peter Piper picked a peck of pickled peppers") #== "t"
p least_common_char("Mississippi") #== "m"
p least_common_char("Happy birthday!") #== ' '
p least_common_char("aaaaaAAAA") #== 'a'