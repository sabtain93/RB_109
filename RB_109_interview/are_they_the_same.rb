=begin
# problem:

Given two arrays a and b write a function comp(a, b) (orcompSame(a, b)) that checks whether the two
arrays have the "same" elements, with the same multiplicities (the multiplicity of a member is the
number of times it appears). "Same" means, here, that the elements in b are the elements
in a squared, regardless of the order.

Examples
Valid arrays
a = [121, 144, 19, 161, 19, 144, 19, 11]  
b = [121, 14641, 20736, 361, 25921, 361, 20736, 361]
comp(a, b) returns true because in b 121 is the square of 11, 14641 is the square of 121, 20736 the
square of 144, 361 the square of 19, 25921 the square of 161, and so on.
It gets obvious if we write b's elements in terms of squares:

a = [121, 144, 19, 161, 19, 144, 19, 11] 
b = [11*11, 121*121, 144*144, 19*19, 161*161, 19*19, 144*144, 19*19]
Invalid arrays
If, for example, we change the first number to something else, comp is not returning true anymore:

a = [121, 144, 19, 161, 19, 144, 19, 11]  
b = [132, 14641, 20736, 361, 25921, 361, 20736, 361]
comp(a,b) returns false because in b 132 is not the square of any number of a.

a = [121, 144, 19, 161, 19, 144, 19, 11]  
b = [121, 14641, 20736, 36100, 25921, 361, 20736, 361]
comp(a,b) returns false because in b 36100 is not the square of any number of a.

Remarks
a or b might be [] or {} (all languages except R, Shell).
a or b might be nil or null or None or nothing (except in C++, COBOL, Crystal, D, Dart, Elixir, Fortran, F#, Haskell, Nim, OCaml, Pascal, Perl, PowerShell, Prolog, PureScript, R, Racket, Rust, Shell, Swift).
If a or b are nil (or null or None, depending on the language),
the problem doesn't make sense so return false.

Note for C
The two arrays have the same size (> 0) given as parameter in function comp.

Test cases:
p comp([121, 144, 19, 161, 19, 144, 19, 11], 
       [11*11, 121*121, 144*144, 19*19, 161*161, 19*19, 144*144, 19*19]) == true

P - [Understand the] Problem
input: two array (both have inetegers)
- input can be empty
- can be null
- inputs have the same size which is > 0

output: boolean (true or false)
- retrun true if the a and b are the same
- 'same' implies that the elements in b are squares of th elements in a (order doesnt matter)
- if there is any element in the second array which isnt a square of any elements in the first array
 then return false
- if either first or second array input is nil return false
- if 
E - Examples / Test cases

D - Data Structure

A - Algorithm
- check if either any of the inputs arrays are empty or nil
  - if true then return false
- transform the second input by returning the square root of each value
- sort the first array
- sort tthe second array transformed
- compare the first and second array (transformed) and sorted
  - return true if they are same
  - return false if not
C - Code
=end

def comp(a, b)
  return false if a == nil || b == nil

  b_transformed = b.map { |number| Math.sqrt(number).to_i }.sort

  if (a.sort <=> b_transformed) == 0
    true
  else
    false
  end
end



p comp([121, 144, 19, 161, 19, 144, 19, 11], 
       [11*11, 121*121, 144*144, 19*19, 161*161, 19*19, 144*144, 19*19]) == true

p comp([19, 8, 13, ], 
       [11*11, 121*121, 144*144, 19*19, 161*161, 19*19, 144*144, 19*19])