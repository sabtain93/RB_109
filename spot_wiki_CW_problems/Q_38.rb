=begin
Given a string, return a new string that has transformed based on the input:

Change case of every character, ie. lower case to upper case, upper case to lower case.
Reverse the order of words from the input.

Note: You will have to handle multiple spaces, and leading/trailing spaces.

For example:

"Example Input" ==> "iNPUT eXAMPLE" 
You may assume the input only contain English alphabet and spaces. 

problem:
input: string
output: string

rules:
- change the case of every character
- reverse the order of the words
- the input will only have alphabets and spaces
- keep the spaces reverse them

Example:
 Example  Input 

 eXAMPLE  iNPUT 
 iNPUT  eXAMPLE 
split the string at the word boundry

data:
array of strings
strings

algo:
- break the input string into words inlcude spaces store it in word array
- iterate over the word array
  - change csae of every character of each word
- reverse the order of  the words in the word array
- convert the word array into a string
- return teh string
=end
def reverse_order(string)
  string.split(/\b/).map {|word| word.swapcase }.reverse.join
end

p reverse_order(" Example  Input ") #== " iNPUT  eXAMPLE "