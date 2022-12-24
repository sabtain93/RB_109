=begin
Modify the kebabize function so that it converts a camel case string into a kebab case.

kebabize('camelsHaveThreeHumps') // camels-have-three-humps
kebabize('camelsHave3Humps') // camels-have-humps
Notes:

the returned string should only contain lowercase letters

Examples:
p kebabize('myCamelCasedString') == 'my-camel-cased-string'
p kebabize('myCamelHas3Humps') == 'my-camel-has-humps'

P - [Understand the] Problem
input:string which is in camel case
output:string in kebabize format (- instead of spaces and all alphabets are in downcase)

rules:
-output is in downcse
- only consider alphabets
- ignore integer and punctuations
- camel case starts with lowercase rest words are capitalized
E - Examples / Test cases
p kebabize('myCamelCasedString') == 'my-camel-cased-string'
p kebabize('myCamelHas3Humps') == 'my-camel-has-humps'

D - Data Structure
array
string
A - Algorithm
# scrapped - create an empty array
- create a temp string to an empty string
- iterate over the input string character by character
# scrapped  - create a temp string to store each word
  - check if the current character is an alphabet and it is in lower case
  - store the character in the temp str
  - if the current character is in upper case
    append the temp string with a -
    append it with the current character in lower case
- return my final temp string
C - Code
=end

def kebabize(str)
  temp_str = ''

  str.chars.each_with_index do |char, idx| #m,y,C,a,m,e,l
    if char =~ /[a-z]/i && char == char.downcase
      temp_str << char
    elsif char =~ /[A-z]/
      if temp_str.empty?
      temp_str << char.downcase
    else
      temp_str << '-' << char.downcase
    end
  end
  end

  temp_str
end


p kebabize('myCamelCasedString') == 'my-camel-cased-string'
p kebabize('4myCamelHas3Humps') == 'my-camel-has-humps'
