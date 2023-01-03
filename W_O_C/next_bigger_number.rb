=begin
You have to create a method that takes a positive integer number and returns the next bigger number
formed by the same digits.
12 => 21
513 => 531
2017 => 2071
If no bigger number can be composed using those digits, return -1:

Examples:
p next_bigger_num(9) == -1
p next_bigger_num(12) == 21
p next_bigger_num(513) == 531
p next_bigger_num(2017) == 2071
p next_bigger_num(111) == -1
p next_bigger_num(531) == -1
p next_bigger_num(123456789) == 123456798

P - [Understand the] Problem
input: integer
output: integer

rules:
- the input is a positive integer
- return the next bigger number formed b y the same digits
- return -1 if we cannot find the next bigger number

E - Examples / Test cases
p next_bigger_num(9) == -1
p next_bigger_num(12) == 21
p next_bigger_num(513) == 531
p next_bigger_num(2017) == 2071
p next_bigger_num(111) == -1
p next_bigger_num(531) == -1
p next_bigger_num(123456789) == 123456798

D - Data Structure
string
array
integer for output

# initial thoughts
- convert the integer into string
- if the size of the string is less than or equal to 1
  - this implies that no bigger number can be created
- break the string into characters
- we can only create a next bigger number if the second last character inetegr value is
less than the last character integer value


A - Algorithm
- convert the integer into a string 
-check if the size is equal or greater than 1
  if not
    return -1
  if yes
    replace the second last charcater with the last charcater
-convert new string to integer
- if the new integer is greater than the original\
  - the return the new integer
- if not
  - return -1


C - Code
=end

def next_bigger_num(number)
  num_str = number.to_s
  return -1 if num_str.size <= 1

  num_str[-1], num_str[-2] = num_str[-2], num_str[-1]

  if num_str.to_i > number
    num_str.to_i
  else
    -1
  end
end




p next_bigger_num(9) == -1
p next_bigger_num(12) == 21
p next_bigger_num(513) == 531
p next_bigger_num(2017) == 2071
p next_bigger_num(111) == -1
p next_bigger_num(531) == -1
p next_bigger_num(123456789) == 123456798