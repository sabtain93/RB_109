=begin

In this kata, you must create a digital root function. 

 

A digital root is the recursive sum of all the digits in a number. Given n,
take the sum of the digits of n. If that value has more than one digit,
continue reducing in this way until a single-digit number is produced.
This is only applicable to the 
natural numbers. 

Here's how it works: 

digital_root(16) 
=> 1 + 6 
=> 7 

 

digital_root(942) 
=> 9 + 4 + 2 
=> 15 ... 
=> 1 + 5 
=> 6 

 

digital_root(132189) 
=> 1 + 3 + 2 + 1 + 8 + 9 
=> 24 ... 
=> 2 + 4 
=> 6 

 

digital_root(493193) 
=> 4 + 9 + 3 + 1 + 9 + 3 
=> 29 ... 
=> 2 + 9 
=> 11 ... 
=> 1 + 1 
=> 2 

problem:
input: integer
output: integer

rules:
return the sum of digits until the integer has only one digit
input integer is a positive number
input integer will alwasy be a valid input

Example:
16 -> 1 6 thes sum is 7 -> one digit so return 7

data:
array of strings
string
integer

algo:
- convert the integer into string
- break the string into characters and add it in a list
- ietrate until the list size is eqaul 1
  - if size of character list greater than 1
    - convert the characters into integer and find the sum of the digits
- return the integer
=end 

def digital_root(number)
  number = number.to_s

  until number.size == 1 do
    sum = number.chars.map {|char| char.to_i}.sum
    number = sum.to_s
  end
  number.to_i
end

p digital_root(16) == 7 
p digital_root(456) == 6