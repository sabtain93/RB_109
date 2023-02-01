=begin
Task : 
Given a List [] of n integers , find the minimum number to be inserted in a list,
so that the sum of all elements of the list should equal the closest prime number . 


Notes 
List size is at least 2 . 

List's numbers will only have positives (n > 0) . 

Repetition of numbers in the list could occur . 

The newer list's sum should equal the closest prime number . 

Input >> Output Examples 
1- minimumNumber ({3,1,2}) ==> return (1) 
Explanation: 
Since , the sum of the list's elements equal to (6) , the minimum number to be inserted
to transform the sum to prime 

number is (1) , which will make *the sum of the List** equal the closest prime number (7)* . 
2-  minimumNumber ({2,12,8,4,6}) ==> return (5) 

Explanation: 
Since , the sum of the list's elements equal to (32) , the minimum number to be inserted 
to transform the sum to prime number is (5) , which will make *the sum of the List** 
equal the closest prime number (37)* . 
3- minimumNumber ({50,39,49,6,17,28}) ==> return (2) 
Explanation: 
Since , the sum of the list's elements equal to (189) , the minimum number to be inserted 
to transform the sum to prime number is (2) , which will make *the sum of the List** equal
the closest prime number (191)* . 

problem:
input: array of integers
output: integer

rules:
-find the minimum number which can be inserted into the array so the sum is the next prime number
- if sum is already a prime number return 0
- there will ebat;east 2 elements in the array
- elements of the array are positive
- integers in array can repeat

Example:
[3,1,2] -> 6
next prime number is 7 so if we add 1 we get 7
6..6+50
6 to 65 check for prime numbers in this range
(0..65)
0
1
2
3
if adding these number the result is prime and exists in the 6 to 65 range
return that number

data:
array of integer
integer

algo:
- create helper method for checking prime numbers
- initialize a variable sum to sum of the elements in the input array
- iterate over from 0 till sum plus 50, track itertaion, current number
  - if add current number to sum and it is prime
    - return the current number
  - if not check next number

- implementaion
- create helper method for checking prime numbers
- if the number is divisible by 1 and itself only
  - return true
- if not
  -return false

=end 
def is_prime?(number)
  !(2..number - 1).any? {|num| number % num == 0 }
end

def minimum_number(array)
  sum = array.sum
  iterator = sum
  loop do
    if is_prime?(iterator)
      return iterator - sum
    end
    iterator += 1
  end
end



p minimum_number([3,1,2]) == 1 
p minimum_number([5,2]) == 0 
p minimum_number([1,1,1]) == 0 
p minimum_number([2,12,8,4,6]) == 5 
p minimum_number([50,39,49,6,17,28]) == 2 