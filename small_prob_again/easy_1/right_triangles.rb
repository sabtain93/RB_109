=begin

Write a method that takes a positive integer, n, as an argument, and displays a right triangle
whose sides each have n stars. The hypotenuse of the triangle (the diagonal side in the
images below) should have one end at the lower-left of the triangle,
and the other end at the upper-right.

Example:
triangle(5)

    *
   **
  ***
 ****
*****
triangle(9)

        *
       **
      ***
     ****
    *****
   ******
  *******
 ********
*********

P - [Understand the] Problem
input: 
E - Examples / Test cases

D - Data Structure

A - Algorithm
- create a variable space equal to " "
- create a variable star equal to "*"
- iterate over (1 till number inclusive)
  - print space for (current iteration - 1) and star for (current iteration)

C - Code
=end
def triangle(num)
  space = ' '
  star = '*'

  (1..num).each do |number|
    puts "#{space * (num - number)}" + "#{star * number}"
  end
end

triangle(5)
triangle(9)