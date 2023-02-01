=begin
Count the number of Duplicates 
Write a function that will return the count of distinct case-insensitive alphabetic characters
and numeric digits that occur more than once in the input string.
The input string can be assumed to contain only alphabets (both uppercase and 
lowercase) and numeric digits. 
Example 
"abcde" -> 0 # no characters repeats more than once 
"aabbcde" -> 2 # 'a' and 'b' 
"aabBcde" -> 2 # 'a' occurs twice and 'b' twice (`b` and `B`) 
"indivisibility" -> 1 # 'i' occurs six times 
"Indivisibilities" -> 2 # 'i' occurs seven times and 's' occurs twice 
"aA11" -> 2 # 'a' and '1' 
"ABBA" -> 2 # 'A' and 'B' each occur twice 

problem:
input string
output: integer

rules:
- return the count of the characters in the string that occure more than once
- when the alphabets are case in sensitive
- input string has uppercase lowercase and numeric characters and no spaces
- if all characters appear only once then return 0
- if empty string return 0

Examples:
"abcdeaB" -> "abcdeab" -> [a b c d e a b] -> [a b c d e]
check each character in the list [a b c d e] for its count in the lowercase string

data:
array of string
integer

algo:
- convert the input string into lowercase
- break the characters and add the unique characters in a list
- iterate over the list
- add the count in the lowercase string of those characters that have a count of more than one
- return the final count
=end 
def duplicate_count(string)
  string = string.downcase
  string.chars.uniq.count {|char| string.count(char) > 1 }

end


# p duplicate_count("") == 0 
# p duplicate_count("abcde") == 0 
# p duplicate_count("abcdeaa") == 1 
# p duplicate_count("abcdeaB") == 2 
# p duplicate_count("Indivisibilities") == 2 