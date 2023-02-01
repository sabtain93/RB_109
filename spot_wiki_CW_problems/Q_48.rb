=begin
Where's my parent? 

Mothers arranged a dance party for the children in school. At that party, there are only
mothers and their children. All are having great fun on the dance floor when suddenly all the 
lights went out. It's a dark night and no one can see each other. But you were flying nearby
and you can see in the dark and have ability to teleport people anywhere you want. 

Legend: 
-Uppercase letters stands for mothers, lowercase stand for their children,
i.e. "A" mother's children are "aaaa". 

-Function input: String contains only letters, uppercase letters are unique.

Task:
Place all people in alphabetical order where Mothers are followed by their children,
i.e."aAbaBb" => "AaaBbb"

P - [Understand the] Problem
input: string
output: string
rules:
- input string has upper case and lowercase
- upper case alphabets are unique
- lower case alphabets are counterparts of uppercase letters
- return a string where the upcase alphabet follows its lower case version alphabetically

E - Examples / Test cases
"AaaaaZazzz"
upcase -> A Z
lowercase -> aaaaa zzz
D - Data Structure
array of strings
strings
A - Algorithm
- initialize result string to empty string
- create a upcase list and include the upper case alphabets from the input string
- scrapped #create a lowercase list and include the lower case alphabets
- iterate over the upcase list
  - for each upcase character 
    - append the cuurent upcase character to result string
    check the counts of the lowercase version in the original string
    append the lowercase version of the current alhabet in result string
    as many times as its count
  - return result string

C - Code

=end
def find_children(family)
  result_str = ''
  upcase_arr = []
  family.chars.each {|char| upcase_arr << char if char =~ /[A-Z]/}
  upcase_arr.sort.each do |char|
    result_str << char
    family.count(char.downcase).times { result_str << char.downcase }
  end
  result_str
end


p find_children("abBA") == "AaBb" 
p find_children("AaaaaZazzz") == "AaaaaaZzzz" 
p find_children("CbcBcbaA") == "AaBbbCcc" 
p find_children("xXfuUuuF") == "FfUuuuXx" 
p find_children("") == "" 