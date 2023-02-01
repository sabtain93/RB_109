=begin
Reverse or rotate? 
The input is a string str of digits. Cut the string into chunks 
(a chunk here is a substring of the initial string) of size sz (ignore the last chunk
if its size is less than sz). 

If a chunk represents an integer such as the sum of the cubes of its digits is divisible by 2,
reverse that chunk; otherwise rotate it to the left by one position.
Put together these modified chunks and return the result as a string. 

If 
sz is <= 0 or if str is empty return "" 
sz is greater (>) than the length of str it is impossible to take a chunk of 
size sz hence return "". 

Examples: 
revrot("123456987654", 6) --> "234561876549" 
revrot("123456987653", 6) --> "234561356789" 
revrot("66443875", 4) --> "44668753" 
revrot("66443875", 8) --> "64438756" 
revrot("664438769", 8) --> "67834466" 
revrot("123456779", 8) --> "23456771" 
revrot("", 8) --> "" 
revrot("123456779", 0) --> ""  
revrot("563000655734469485", 4) --> "0365065073456944" 

P - [Understand the] Problem
input: numbr string, integer
output: number string

rules:
- seprate the input string into equal substring of length eqaul to second input
- ignore the chunk if it is less than the length of the second input
- analyze each chunk
- if the digits is cubes's sum is a multiple of 2 then reverse the chunk
- if not then rotate to left by 1 position
- return empty string if second input is less than or equal to zero
- return empy string if first input is empty

E - Examples / Test cases
"123456987654", 6
123456 987654
len is 12
12/6 = 2

D - Data Structure
array of strings
array of integers
string for output
A - Algorithm
- initialzie substring array to empty array
- break the string into substrings eqaul to length of seconf input
- add the possible substrings into the substring array
- iterate over the substring array
  - for each substring
  - check if the digits cube sum is multiple of 2
    - reverse it
  - if not
    - shift to left by one space
  - 
C - Code

=end 
def revrot(string, len)
  substring_arr = []
  return '' if string.empty? || len == 0

  index = 0
  len_str = string.size / len

  len_str.times do
    substring_arr << string[index, len]
    index += len
  end
  substring_arr.map do |substr|
    int_arr = substr.chars.map {|char| (char.to_i ** 3) }
    # p int_arr
    if int_arr.reduce(:+) % 2 == 0
      substr.reverse
    else
      substr.chars.rotate(1).join
    end
  end.join
end


p revrot("1234", 0) == "" 
p revrot("", 0) == "" 
p revrot("1234", 5) == "" 
p revrot("733049910872815764", 5) == "330479108928157" 
p revrot("123456987654", 6) == "234561876549" 
p revrot("123456987653", 6) == "234561356789" 
p revrot("66443875", 4) == "44668753" 
p revrot("66443875", 8) == "64438756" 
p revrot("664438769", 8) == "67834466" 
p revrot("123456779", 8) == "23456771" 
p revrot("", 8) == "" 
p revrot("123456779", 0) == ""

