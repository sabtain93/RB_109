=begin
If we list all the natural numbers below 10 that are multiples of 3 or 5, we get 3, 5, 6 and 9.
The sum of these multiples is 23.

Finish the solution so that it returns the sum of all the multiples of 3 or 5 below the number passed in.
Additionally, if the number is negative, return 0 (for languages that do have them).

Note: If the number is a multiple of both 3 and 5, only count it once.

Examples:

p test(10) == 23
p test(20) == 78
p test(200)  == 9168

P - [Understand the] Problem
input: integer (end of range of numbers)
output: integer (sum of multiples)

rules:
- the integer passed is not to be included
- start from 1 till one less than the input integer
- count the integer only once if it is multiple of 3 and 5
- if the input number is negative return 0

E - Examples / Test cases

D - Data Structure
integer
array to store the muiltiples

A - Algorithm
- create a multiplie array
- check if the input integer is less than zero
  - return 0
- create a range starting from 1 till one less than the input integer
- iterate over the range
  -check if the current integer is a multiple of 3 and 5
    - if yes add it to the multipel array
  - check if the current integer is a multipel of 3 or 5
    - if yes add it to the multiple array
- return the sum of all the elements in the multiple array
C - Code

=end

def solution(end_point)
  multiple_arr = []
  return 0 if end_point <= 0

  (1...end_point).each do |num|
    if num % 3 == 0 && num % 5 == 0
      multiple_arr << num
    elsif num % 3 == 0 || num % 5 == 0
      multiple_arr << num
    end
  end

  multiple_arr.reduce(:+)
end


p solution(10) == 23
p solution(20) == 78
p solution(200)  == 9168
