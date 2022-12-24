=begin
Given a string of integers, return the number of odd-numbered substrings that can be formed.

For example, in the case of "1341", they are 1, 1, 3, 13, 41, 341, 1341, a total of 7 numbers.

solve("1341") = 7. See test cases for more examples.

Examples:
p solve("1341") == 7
p solve("1357") == 10
p solve("13471") == 12
p solve("134721") == 13
p solve("1347231") == 20
p solve("13472315") == 28

P - [Understand the] Problem
input = string (of integers)

output: integer 

- return the number of odd-numbered substrings in the input integer string
- there are no spaces in the numbered string
E - Examples / Test cases
p solve("1341") == 7
p solve("1357") == 10
p solve("13471") == 12
p solve("134721") == 13
p solve("1347231") == 20
p solve("13472315") == 28

D - Data Structure
string
array for substrings

A - Algorithm
- find all the substrings of the input string
  - create a helper method all_substrings
    - create a empty array to store the sub strings
    - iterate over the range (0...string size)
      - iterate over the range (current_ieteration...string size)
         - append the substring by slicing within the [current_ieteration..string.size-1]
    - return the array with all the substrings
- store the substrings in an array
- iterate over the array
- detect the integer strings that are odd
    - select the integer strings that are odd
- count the detected integer strings
- return the count

C - Code

=end
def all_substrings(int_str)
  all_substring = []

  (0...int_str.size).each do |starting_idx|
    (starting_idx...int_str.size).each do |ending|
      all_substring << int_str[starting_idx..ending]
    end
  end
  all_substring
end


def solve(int_str)
  interger_substr = all_substrings(int_str)

  odd_substr = interger_substr.select do |substr|
    substr.to_i.odd?
  end
  odd_substr.size

end



p solve("1341") == 7
p solve("1357") == 10
p solve("13471") == 12
p solve("134721") == 13
p solve("1347231") == 20
p solve("13472315") == 28