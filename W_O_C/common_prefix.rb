=begin
Write a method to find the longest common prefix string among an array of strings. If there are no 
common prefix
return an empty string "".
Example:
input: ["Flower", "flow", "flight"]
Output: "fl"
Example_2:
input: ["dog", "racecar", "car"]
Output: ""
Explaination: There is no common prefix among the input strings


All given inputs are in lowercase letters a-z
p common_prefix(["flower", "flow", "flight"]) == "fl"
p common_prefix(["dog", "racecar", "car"]) == ""
p common_prefix(["interspecies", "interstellar", "interstate"]) == "inters"
p common_prefix(["throne", "dungeon"]) == ""
p common_prefix(["throne", "throne"]) == "throne"


P - [Understand the] Problem
input: array of strings
output: string

rules:
- all the strings are in lowercase
- find the longest prefix
- return empty if there are none
- the samllest prefix can be of 1 character long and it can be the whole string


E - Examples / Test cases
p common_prefix(["flower", "flow", "flight"]) == "fl"
p common_prefix(["dog", "racecar", "car"]) == ""
p common_prefix(["interspecies", "interstellar", "interstate"]) == "inters"
p common_prefix(["throne", "dungeon"]) == ""
p common_prefix(["throne", "throne"]) == "throne"

D - Data Structure
string

# initial thoughts
- parse through the first element
- go from the first character to the last 
- check for every prefix common in the rest of the elements
- if common store it in result string
-# "flower" -> f, fl, flo, flow, flowe, flower
- (0..0), (0..1), (0..2)... (0..size string - 1)
A - Algorithm
# scrapped- create a result variable initialized to empty string
- create a common prefix array
- find all the possible prefix for all the elements in the array # "flower"
  -iterate from 
- sotre all the possible prefix for every element in an array
- create a directory where each elements position refers to the array of all possible prefix
- put all the common prefix in the common prefix array
- return the prefix which is the longest.


C - Code
=end

def find_prefix(str)
  all_prefix = []
  (0..str.size - 1).each do |end_index|
    all_prefix << str[0..end_index]
  end
  all_prefix
end

def common_prefix(array)
  common_array = []
  hsh = {}
  (0..array.size - 1).each do |index|
    hsh[index] = find_prefix(array[index])
  end
  hsh[0].each do |prefix|
    if hsh.all? { |_, arr| arr.include?(prefix)}
      common_array << prefix
    end
  end
  return "" if common_array.empty?
  common_array.max

end


p common_prefix(["flower", "flow", "flight"]) == "fl"
p common_prefix(["dog", "racecar", "car"]) == ""
p common_prefix(["interspecies", "interstellar", "interstate"]) == "inters"
p common_prefix(["throne", "dungeon"]) == ""
p common_prefix(["throne", "throne"]) == "throne"