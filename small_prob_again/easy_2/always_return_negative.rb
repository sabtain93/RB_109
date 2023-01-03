=begin
Write a method that takes a number as an argument.
If the argument is a positive number, return the negative of that number.
If the number is 0 or negative, return the original number.

Examples:
negative(5) == -5
negative(-3) == -3
negative(0) == 0      # There's no such thing as -0 in ruby

Algorithm:
- if number is less than 0 or equal to 0
  return the original number
- if number is greater than 0
  return -1 * number
- if number is equal to 0
  return 0
=end

def negative(number)
  if number <= 0
    number
  else
    -number
  end
end


p negative(5) == -5
p negative(-3) == -3
p negative(0) == 0