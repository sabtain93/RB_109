=begin

Given a non-empty string check if it can be constructed by taking a substring of it
and appending multiple copies of the substring togather.
You may assume that the given string
contains lowercase english letters only.

Example-1
Input: "abab" # ab * 2 => 'abab'
Ouput: True
Example-2
Input: "aba" # a, ab, ba, a
Output: False

P - [Understand the] Problem
- input: string
- contains lowercase letter only
- no spaces

-output: return boolean (True or False)
- return True 
  - if the origial string can be constructed by appending the input string substring multiple times
  - return false
  - if we cannot

# substring: can be atleast one chara ter long (the original string is not a possible substring)

E - Examples / Test cases
check_substr("aba") == True
check_substr('aba') == False

D - Data Structure
array to store the substrings

## initial thoughts
- find all possible substrings
- make sure that the string it self is not included
- check if a substring can be appended multiple times so it makes the original string

A - Algorithm
- create a helper method all substrings
  - creatre substring array initalized to empty array
  - iterate over the range from 0 till the size of the string exclusive, track iteration (start index)
    - iterate over the range from start index till the size of the string exclusive, track iteration (end index)
      - slice the string from start index till end index and append it to my array
      - do not append it to array if substring == original string
- return the substring array.

- main method
- substring array (with all the substrings)
- iterate over the substring array
  - for each substring
  check if it is appended multiple times starting from 1 till the size of the array inclusive
  - if teh above condition returns true
      - stop iterating and return True
- either return false
C - Code

=end

def all_substrings(str)
  substr_arr = []

  (0...str.size).each do |start_index|
    (start_index...str.size).each do |end_index|
      substr_arr << str[start_index..end_index] if str[start_index..end_index] != str
    end
  end
  substr_arr
end

def check_substr(str)
  substr_arr = all_substrings(str)

  substr_arr.each do |substring|
    (1..str.size).each do |number|
      return true if substring * number == str
    end
  end

  false
end



p check_substr("aaaaa") == true
p check_substr("abab") == true
p check_substr("aba") == false
p check_substr("aabaaba") == false
p check_substr("abaababaab") == true
p check_substr("abcabcabcabc") == true