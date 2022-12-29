=begin

Given a List [] of n integers, find minimum number to be inserted in a list, so that sum of
all elements of list should equal the closest prime number.

List size is at least 2.

List's numbers will only positives (n > 0).

Repetition of numbers in the list could occur.

The newer list's sum should equal the closest prime number.

Example:

p minimum_number([3,1,2]) == 1
p minimum_number([5,2]) == 0
p minimum_number([1,1,1]) == 0
p minimum_number([2,12,8,4,6] == 5
p minimum_number([50,39,49,6,17,28] == 2

P - [Understand the] Problem
input: array of numbers
- input array will have all the numbers > 0
- numbers can repeat

output:integer
- the ineteger is the least number which can be added to the sum of input array so the sum becomes
the closest prime numbers

E - Examples / Test cases
p minimum_number([3,1,2]) == 1
p minimum_number([5,2]) == 0
p minimum_number([1,1,1]) == 0
p minimum_number([2,12,8,4,6] == 5
p minimum_number([50,39,49,6,17,28] == 2


D - Data Structure
array integers

A - Algorithm
- create a helper method to check if a number is a prime number
  - create a range of natural numbers from 1..number
  - if the number can be divided by any of the number other than itself and 1
    - return true (which implies it is a prime number)

- main method
- find the sum of input array
- create a counter = 0
- if the sum is prime (calling the helper method)
  - do not increment counter
- if the sum is not a prime number
  increase counter by 1
  add it to the sum of the array until the sum is a prime number
- return the counter
C - Code

=end

def is_prime?(num)
  num_range = (1..num)
  counter = 0
  num_range.each do |number|
    counter += 1 if num % number == 0
  end
  if counter == 2
    true
  else
    false
  end
end

# - main method
# - find the sum of input array
# - create a counter = 0
# - if the sum is prime (calling the helper method)
#   - do not increment counter
# - if the sum is not a prime number
#   increase counter by 1
#   add the counter value to the sum of the array until the sum is a prime number
# - return the counter

def minimum_number(arr)
  sum = arr.sum
  counter = 0

  return counter if is_prime?(sum)

  until is_prime?(sum) do
    sum = arr.sum
    counter += 1
    sum += counter
  end
  counter
end

p minimum_number([3,1,2]) == 1
p minimum_number([5,2]) == 0
p minimum_number([1,1,1]) == 0
p minimum_number([2,12,8,4,6]) == 5
p minimum_number([50,39,49,6,17,28]) == 2
