# found in ginni's repo
=begin
Consider the word "abode". We can see that the letter a is in position 1 and b is in position 2.
In the alphabet, a and b are also in positions 1 and 2. Notice also that d and e in abode occupy
the positions they would occupy in the alphabet, which are positions 4 and 5.

Given an array of words, return an array of the number of letters that occupy their positions in the
alphabet for each word. For example,
solve(["abode","ABc","xyzD"]) = [4, 3, 1]

Examples:

p solve(["abode","ABc","xyzD"]) == [4,3,1]
p solve(["abide","ABc","xyz"]) == [4,3,0]
p solve(["IAMDEFANDJKL","thedefgh","xyzDEFghijabc"]) == [6,5,7]
p solve(["encode","abc","xyzD","ABmD"]) == [1, 3, 1, 3]

P - [Understand the] Problem
input: array of string
output: array of integers

-return the number of alphabets in the strings that are in the position that they are in
the actual alphabetical order.
- letter case does not matter
E - Examples / Test cases

D - Data Structure
hash
integer
array
string
A - Algorithm
- create a result array
- create a count initialize to 0
- create a directory where each alphabet points to their position
- iterate through the input array
- for each character of each string compare its position in the substring to its position in 
alphabet directory
- if it is the same then increment count
  -append the result array with count for the current string
- return the result array
C - Code
=end

def solve(arr)
  result_arr = []

  num = 0
  alphabet_hash = ('a'..'z').each_with_object({}) do |char, hsh|
    hsh[char] = num
    num += 1
  end
  arr.each do |sub_str|
      count = 0
    sub_str.chars.each_with_index do |char, idx|
      if idx == alphabet_hash[char.downcase]
        count += 1
      end
    end
    result_arr << count
  end
  result_arr
end

p solve(["abode","ABc","xyzD"]) == [4,3,1]
p solve(["abide","ABc","xyz"]) == [4,3,0]
p solve(["IAMDEFANDJKL","thedefgh","xyzDEFghijabc"]) == [6,5,7]
p solve(["encode","abc","xyzD","ABmD"]) == [1, 3, 1, 3]