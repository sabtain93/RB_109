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