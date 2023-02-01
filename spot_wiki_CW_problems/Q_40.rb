=begin
The goal of this exercise is to convert a string to a new string where each character
in the new string is "(" if that character appears only once in the original string, or ")"
if that character appears more than once in the original string.

Ignore capitalization when determining if a character is a duplicate.

Examples 
"din"      =>  "(((" 
"recede"   =>  "()()()" 
"Success"  =>  ")())())" 
"(( @"     =>  "))(("  

problem:
input: string
output: string of ("(" and ")")

rules:
if a character appears only once replace it with "("
if a character appears more than once replace it with ")"
ignore uppercase when determining repeition of characters
consider space and special characters as a valid character

Example:
'(( @'
[( (   @] -> [')' ')' '(' '(']

data:
array of strings
string

algo:
- convert the input string into lowecase
- break the lowercse input string into characters and store it in an array
- iterate over the character array
  - transform the characters in character array
    - if its count is more than 1
      - replace it with ')'
    - if only once
      - replcae it with '('
- convert the transformed character array into a string
- return the string

=end
def duplicate_encode(string)
  string = string.downcase

  string.chars.map do |char|
    if string.count(char) > 1
      ')'
    else
      '('
    end
  end.join


end


p duplicate_encode("din") == "(((" 
p duplicate_encode("recede") == "()()()" 
p duplicate_encode("Success") == ")())())" 
p duplicate_encode("(( @") == "))(("