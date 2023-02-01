=begin
You have to create a method that takes a positive integer number and returns the next bigger number
formed by the same digits.
12 => 21
513 => 531
2017 => 2071
2071 -> 2701
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
return the next bigger number that can be formed using the digits in the inout number
return -1 if no bigger number can be formed using the digits in the input number


E - Examples / Test cases
123456789 -> 123456789
the next bigger number can be found in the range starting from the input number till
the max number that can be made up from the digits in the input number
(123456789 -> max number )


D - Data Structure
integer- input
integer- output
subprocess- convert integer into string (to rearrange single digits)

A - Algorithm
- find the maximum number with the digits in the input number
  - convert the number to string object
  - break the string into characters
  - sort the characters in descending order
  - join the characters into a single string
  - convert it back to integer
- iterate from the input number + 1 till the maximum number
  if there is any number that has the same digits as the input number
    return the number

C - Code
=end
def find_max?(number)
  number.to_s.chars.sort.reverse.join.to_i
end

def next_bigger_num(number)
  max_num = find_max?(number)

  ((number + 1)..max_num).each do |current_number|
    return current_number if find_max?(current_number) == max_num
  end
  -1
end

p next_bigger_num(9) == -1
p next_bigger_num(12) == 21
p next_bigger_num(513) == 531
p next_bigger_num(2017)== 2071
p next_bigger_num(111) == -1
p next_bigger_num(531) == -1
p next_bigger_num(123456789) == 123456798
p next_bigger_num(2071) #== 2107
p next_bigger_num(5092) #== 5290