question_study_session.md

```ruby
# question solved by me and given to smilja
=begin
Problem:

Assume "#" is like a backspace in string. This means that string "a#bc#d" actually is "bd"

Your task is to process a string with "#" symbols.

Example:
clean_string("abc#d##c") == "ac"
clean_string("abc##d######") == ""
clean_string("#######") == ""
clean_string("") == ""
=end
```

```ruby

# questions solved by me and given to smilja to solve
=begin
You live in the city of Cartesia where all roads are laid out in a perfect grid. You arrived ten minutes too early to an appointment, so you decided to take the opportunity to go for a short walk. The city provides its citizens with a Walk Generating App on their phones -- everytime you press the button it sends you an array of one-letter strings representing directions to walk (eg. ['n', 's', 'w', 'e']). You always walk only a single block for each letter (direction) and you know it takes you one minute to traverse one city block, so create a function that will return true if the walk the app gives you will take you exactly ten minutes (you don't want to be early or late!) and will, of course, return you to your starting point. Return false otherwise.

Note: you will always receive a valid array containing a random assortment of direction letters ('n', 's', 'e', or 'w' only). It will never give you an empty array (that's not a walk, that's standing still!)

Examples:
is_valid_walk['n','s','n','s','n','s','n','s','n','s'].== true)
is_valid_walk(['w','e','w','e','w','e','w','e','w','e','w','e']).== false
is_valid_walk(['w']).== false
is_valid_walk(['n','n','n','s','n','s','n','s','n','s']) == false

=end
```

```ruby
=begin 
# question solved by me during study session with smilja.
Given an integer array nums, move all 0's to the end of it while maintaining the relative order of the non-zero elements.

Example 1:
Input: nums = [0,1,0,3,12] Output: [1,3,12,0,0]
Example 2:
Input: nums = [0] Output: [0]

P - [Understand the] Problem
input: array (intgers)
output: array (all zeros moved at the end)

rules:
- Input array will have atleast on element
- move zeros to the end if any
- maintain the order of the non zero elements
E - Examples / Test cases
Input: nums = [0] Output: [0]
Input: nums = [0,1,0,3,12] Output: [1,3,12,0,0]

D - Data Structure
array
integer
A - Algorithm [0,12,3,0,4]
- create a counter valriable 0
- iterate through the input Array
- count the number of zeros in the input array
- delete the zeros in the input Array
- append the number of zeros equal to counter at the end of the modified Array
- return the array
C - Code

=end 

```
```ruby
=begin
#question from matic to Paco
Maximum subarray sum

The maximum sum subarray problem consists in finding the maximum sum of a contiguous subsequence in an array or list of integers:

maxSequence [-2, 1, -3, 4, -1, 2, 1, -5, 4]
-- should be 6: [4, -1, 2, 1]
Easy case is when the list is made up of only positive numbers and the maximum sum is the sum of the whole array. If the list is made up of only negative numbers, return 0 instead.

Empty list is considered to have zero greatest sum. Note that the empty list or array is also a valid sublist/subarray.
=end
```

```ruby

# given to me by M. Ali
=begin

# Given an array of numbers, for each number find out how many numbers
# in the array are smaller than it. When counting numbers, only count
# unique values. That is, if a given number occurs multiple times in
# the array, it should only be counted once.

# Examples:

p smaller_numbers_than_current([8,1,2,2,3]) == [3, 0, 1, 1, 2]
p smaller_numbers_than_current([1,4,6,8,13,2,4,5,4])
                            == [0, 2, 4, 5, 6, 1, 2, 3, 2]
p smaller_numbers_than_current([7,7,7,7]) == [0,0,0,0]
p smaller_numbers_than_current([6,5,4,8]) == [2, 1, 0, 3]
p smaller_numbers_than_current([1]) == [0]



```

```ruby
3given to by mike

=begin
Complete the greatestProduct method so that it'll find the greatest product of five consecutive digits in the given string of digits.

For example:

greatestProduct("123834539327238239583") // should return 3240

The input string always has more than five digits.
p greatest_product("123834539327238239583") == 3240
p greatest_product("395831238345393272382") == 3240
p greatest_product("92494737828244222221111111532909999") == 5292
p greatest_product("92494737828244222221111111532909999") == 5292
p greatest_product("02494037820244202221011110532909999") == 0
```
```ruby
=begin 

Mothers arranged a dance party for the children in school. At that party, there are only mothers and their children. All are having great fun on the dance floor when suddenly all the lights went out. It's a dark night and no one can see each other. But you were flying nearby and you can see in the dark and have ability to teleport people anywhere you want.
Legend:
-Uppercase letters stands for mothers, lowercase stand for their children, i.e. "A" mother's children are "aaaa". 
-Function input: String contains only letters, uppercase letters are unique.
Task:
Place all people in alphabetical order where Mothers are followed by their children, i.e. "aAbaBb" => "AaaBbb". 
```
```ruby
# given to smilja by herself
=begin 

Problem: Given the input string of characters, return an array of the string seperated by grouping the same characters as a string element.

Problem: Given the input string of characters, return an array of the string split into elements of the same characters. 

p split_groups("555") == ["555"]
p split_groups("5556667788") == ["555", "666", "77", "88"]
p split_groups("aaabbbaabbab") == ["aaa", "bbb", "aa", "bb", "a", "b"]
p split_groups("abbbcc88999&&!!!*") == ["a", "bbb", "cc", "88", "999", "&&", "!!!", "*"]
=end
```




```ruby
# given to me by smilja
=begin 

Write a method that takes a string as an argument, and returns true if all parentheses in the string are properly balanced, false otherwise. To be properly balanced, parentheses must occur in matching '(' and ')' pairs.

problem:
input: string
output: boolean (true or false)
rules:
return true if the paranthese are balanced every opening para has an ending
if there are no paranthese then return true

Examples:
'((What)) (is this))?'
number of '(' == 3
number of ')' == 4
this implies unbalanced paranthese -> false
')Hey!('
'(' = 1
")" = 1
closing paranthese is before my ending paranthese

'What ((is))) up('
number of '(' and ')' are equal
we can see an ''(' and no ')' following it

algorithm:
- breaking my string into characetrs and adding them into an array
- select characetrs that are eithier '(' or ')'
- if the count of '('== ')'
  - check the if there is any "(" that is not followed by a ')'
    - return true
  - else
    - return false
- if the count is not equal
  - return false
```


```ruby
# spot wiki question 30
=begin
Given two words, how many letters do you have to remove from them to make them anagrams?
  Example
  
      First word : c od e w ar s (4 letters removed)
      Second word : ha c k er r a nk (6 letters removed)
      Result : 10


    A word is an anagram of another word if they have the same letters (usually in a different order).
    Do not worry about case. All inputs will be lowercase.
probelms:
input: 2 strings
output: Integer
https://www.codewars.com/kata/5b1b27c8f60e99a467000041/train/ruby

```



```ruby
# spot wiki question 32
=begin
Given a string of words, you need to find the highest scoring word.

Each letter of a word scores points according to its position in the alphabet: a = 1, b = 2, c = 3 etc.

For example, the score of abad is 8 (1 + 2 + 1 + 4).

You need to return the highest scoring word as a string.

If two words score the same, return the word that appears earliest in the original string.

All letters will be lowercase and all inputs will be valid.


p high('man i need a taxi up to ubud') #'taxi'
# p high('what time are we climbing up the volcano'), 'volcano'
# p high('take me to semynak'), 'semynak'
 p high('aa b') #'aa'
# p high('b aa'), 'b'
# p high('bb d') == 'bb'
# p high('d bb') == 'd'
# p high('aaa b') == 'aaa'


````