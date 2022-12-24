# PEDAC

## Introduction to PEDAC Process

The PEDAC process is one way of solving programming problems. The main goal is to aviod pitfalls that we fall in when we do not code with intent.

P Problem

E Example/Test cases

D Data Structures

A Algorithm

C Code

```ruby
# PROBLEM:

# Given a string, write a method `palindrome_substrings` which returns
# all the substrings from a given string which are palindromes. Consider
# palindrome words case sensitive.

# Test cases:

# palindrome_substrings("supercalifragilisticexpialidocious") == ["ili"]
# palindrome_substrings("abcddcbA") == ["bcddcb", "cddc", "dd"]
# palindrome_substrings("palindrome") == []
# palindrome_substrings("") == []

=begin
input = string
output = array of substrings
rules:
        Explicit requirements
         - return all substrings, from a given string, that are
           palindromes
         - palindromes are case sensitive
        Implicit requirements
         - The returned palindrome substrings are in an array
         - If no palindrome substring return an empty array
         - If input is an empty string output is an empty array

Data Strutures
- String for input
- array for substrings

Algorithm
- initalze a result variable to an empty array
- create an array named substr_arr which contains all the
  substrings of the input string that are at least 2 characters long
- iterate through the words in the substr_arr
- if the word is a palindrome, add it to the result array
- return the result array

Implementation
- create an empty array called `result` that will contain all the required
  substrings.
- create a `starting_index` variable (value = 0) for the starting index of
  the substring
- start a loop that iterates over `starting_index` from `0` to string length
  minus 2
  - create a `num_chars` variable (value `2`) for the length of a substring
  - start an inner loop that iterates over `num_chars` from 2 to string
    length minus starting index
    - extract a substring of length `num_chars` from string starting at
      `starting_index`
    - append the extracted substring into the `result` array
    - increment the `num_chars` varibale by 1
  - end the inner loop
  - increment the `starting_index` by `1`
- end the outer loop
- return the result array
=end

def substring(str)
  result = []
  starting_index = 0

  while starting_index <= str.length - 2
    num_chars = 2
    while num_chars <= str.length - starting_index
      result << str[starting_index, num_chars]
      num_chars += 1
    end
    starting_index += 1
  end
  result
end

def is_palindrome?(str)
  str == str.reverse
end

def palindrome_substrings(str)
  result = []
  substr_arr = substring(str)

  substr_arr.each do |sub_str|
    result << sub_str if is_palindrome?(sub_str)
  end
  result
end

```