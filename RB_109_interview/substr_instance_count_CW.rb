=begin
Complete the solution so that it returns the number of times the search_text 
is found within the full_text.

solution('aa_bb_cc_dd_bb_e', 'bb') # should return 2 since bb shows up twice
solution('aaabbbcccc', 'bbb') # should return 1

Examples:
p solution('abcdeb','b') == 2
p solution('abcdeb', 'a') == 1
p solution('abbc', 'bb') == 1

P - [Understand the] Problem
input: string, substring to b =e detected
output: integer (which represents the count that the substring has occurred)

rules:
return the number of times the sub-string is found in the input string
the substring is either one character or if it contains multiple characters they are repeated

E - Examples / Test cases
p solution('abcdeb','b') == 2
p solution('abcdeb', 'a') == 1
p solution('abbc', 'bb') == 1

D - Data Structure
string
integer
A - Algorithm
- create a counter variable
- create a result variable
- assign the counter to the count of the substring occurred in the input string
- divide the counter by the size of the substring and assign it to result
- return the value of the result
C - Code

=end

def solution(full_text, search_text)
  counter = full_text.count(search_text)
  result = counter / (search_text.size)
end


p solution('abcdeb','b') == 2
p solution('abcdeb', 'a') == 1
p solution('abbc', 'bb') == 1




