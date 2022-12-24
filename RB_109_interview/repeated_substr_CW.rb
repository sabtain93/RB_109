=begin
For a given nonempty string s find a minimum substring t and the maximum number k, such that the
entire string s is equal to t repeated k times.

The input string consists of lowercase latin letters.

Examples:

solve("ababab") == ["ab", 3]
solve("abcde") == ["abcde", 1]

P - [Understand the] Problem
input: string
- the string is in lowercase
- the string has no spaces

output: array (first value is a substring, second value is integer)
- the inetegr is the maximun value by which the smallest substring can be repeated to
form the original string.

E - Examples / Test cases
solve("ababab") == ["ab", 3]
solve("abcde") == ["abcde", 1]

D - Data Structure
array to store the substring
array for output
A - Algorithm
- find all the substrings
- store the substrings in an array
- arrange the substrings in the array in ascending order based on their size
- create a multiplier initialized to 1
- check each substring multiplied by multiplier
- if the answer is equal to the input string
  - store the current substring and the value of the multiplier in an array
- return the array
C - Code

=end

def substrings(str)
  substr_arr = []

  (0...str.size).each do |starting_idx|
    (starting_idx...str.size).each do |last|
      substr_arr << str[starting_idx..last]
    end
  end
  substr_arr
end


def solve(str)
  result_arr = []

  str_arr = substrings(str).sort_by { |substr| substr.size }.uniq

  str_arr.each do |substring|
    (1..str.size).each do |multiplier|
      if substring * multiplier == str
        result_arr << substring << multiplier
        break
      end
    end
    if !result_arr.empty?
      break
    end
  end

  result_arr
end

p solve("ababab") #== ["ab", 3]
p solve("abcde") #== ["abcde", 1]