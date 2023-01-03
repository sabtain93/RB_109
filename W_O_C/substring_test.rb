=begin
Given 2 strings, your job is to find out if there is a substring that appears in both strings.
You will return true if you find a substring that appears in both strings, or false if you do not.
We only care about substrings that are longer than one character long.

p substring_test("Something", "Fun") == false
p substring_test("Something", "Home") == true
p substring_test("Something", "") == false
p substring_test("", "Something") == false
p substring_test("BANANA", "banana" ) == true
p substring_test("test", "lllt" ) == false
p substring_test("", "" ) == false
p substring_test("1234567", "541265" ) == true
p substring_test("Supercalifragilisticexpialidocious", "SoundOfItIsAtrociou" ) == true


P - [Understand the] Problem
input: two strings
output: boolean (false or true)

rules:
- return true if the two strings have a substring in common
- a substring is atleast 2 characters long
- return false if no common substring is found
- if either of the strings are empty return false
- the substrings are case insensitive
E - Examples / Test cases
p substring_test("Something", "Fun") == false
p substring_test("Something", "Home") == true
p substring_test("Something", "") == false
p substring_test("", "Something") == false
p substring_test("BANANA", "banana" ) == true
p substring_test("test", "lllt" ) == false
p substring_test("", "" ) == false
p substring_test("1234567", "541265" ) == true
p substring_test("Supercalifragilisticexpialidocious", "SoundOfItIsAtrociou" ) == true

D - Data Structure
2d array
boolean

#initial thoughts
- check for the smaller string (if its substrings are found in the larger substring)

A - Algorithm
- return false if either of the input strings are empty
- create an all substring array to empty array
- add the string inputs in an array
- find all the substrings in both the inputs (both strings downcased)
  - iterate from (0..size of string - 2) , iteration tracking (start index)
    - iterate from (start index + 1..size of string - 1), iteration tracking (end index)
      - slice the string from start index till end index
- add the substrings array in the all substring array
- find the smaller substring array in size
- iterate over the samller array in size
  - check for each subtring if any of them exists in both 
   -return true if yes
   - return false if no
C - Code

=end
def substrings(str)

  substrings_arr = []

  (0..str.size - 2).each do |start_index|
    (start_index + 1..str.size - 1).each do |end_index|
      substrings_arr << str[start_index..end_index]
    end
  end
  substrings_arr
end


def substring_test(string1, string2)
  return false if string1.empty? || string2.empty?

  all_substrings = [[], []]
  input = [string1, string2]
  index = 0
  input.each do |string|
    all_substrings[index] = substrings(string.downcase)
    index += 1
  end
  small_array = all_substrings.min_by { |arr| arr.size }

  small_array.each do |substring|
    if all_substrings.all? { |arr| arr.include?(substring) }
      return true
    end
  end
  false
end


p substring_test("Something", "Fun") == false # Fu, Fun, un
p substring_test("Something", "Home") == true
p substring_test("Something", "") == false
p substring_test("", "Something") == false
p substring_test("BANANA", "banana" ) == true
p substring_test("test", "lllt" ) == false
p substring_test("", "" ) == false
p substring_test("1234567", "541265" ) == true
p substring_test("Supercalifragilisticexpialidocious", "SoundOfItIsAtrociou" ) == true