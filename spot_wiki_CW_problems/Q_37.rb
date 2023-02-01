=begin

If we list all the natural numbers below 10 that are multiples of 3 or 5,
we get 3, 5, 6 and 9. The sum of these multiples is 23.

Finish the solution so that it returns the sum of all the multiples of 3 or 5 below the
number passed in.

Note: If the number is a multiple of both 3 and 5, only count it once.

problem:
input: integer
output: integer

rules:
find the sum of the numbers that are multiples of 3 or 5
if it is a multiple of 3 and 5 include it only once
the number passed is not included in the range
start from 1 end at the input integer
multiple mean the number is completely divisible by 3 or 5

examples:
10
3 5 6 9 10 is not included
sum of 3 5 6 9 is 23
data
array of integers

algo:
- initialize an array of integers that include all the natural numbers from 1 till the integer
input, excluding
- select the number from the array of numbers that are multiples of 3 or 5
- store the selected numbers in an array
- return the sum of the array 

=end
def solution(number)
  (1...number).to_a.select {|num| (num % 3 == 0) || (num % 5 == 0) }.sum

end



p solution(10) == 23 
p solution(20) == 78 
p solution(200) == 9168