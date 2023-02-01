=begin
Task 
Given an integer n, find the maximal number you can obtain by deleting exactly one digit
of the given number.

Example 
For n = 152, the output should be 52; 

For n = 1001, the output should be 101. 

Input/Output 

[input] integer n
Constraints: 10 ≤ n ≤ 1000000. 

[output] an integer 

problem:
input: integer
output: integer

rules:
find the maximam number by removing one of the digits from the output number
the inetegr will be between 10 and 1000000


Examples:
152 - number of digits = 3 -1 = 2
find the maximum number that contains the combination of 1 or 5, 
5 or 2, 1 or 2
0.....152 exculding

data:
strings
array of strings
integer

algo:
- convert the input integer into string
- break the number string into characters and store it in an array of characters
- find size of the integer to be returned
  - the size of the array of characters minus one assign it to combinations
- find the possible combinations using the array of characters and and combinations
- store the combinatons in result array
- find the maximum number with the result array and return it as an integer
=end 
def delete_digit(number)
  num_str = number.to_s
  str_arr = num_str.chars

  combination_arr = str_arr.combination(str_arr.size - 1).to_a
  combination_arr.map {|subarr| subarr.join }.max.to_i

end

p delete_digit(152) #== 52 
p delete_digit(1001) #== 101 
p delete_digit(10) #== 1