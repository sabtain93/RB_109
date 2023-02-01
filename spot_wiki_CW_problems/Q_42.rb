=begin
Sort the given strings in alphabetical order, case insensitive. For example: 

 

["Hello", "there", "I'm", "fine"]  -->  ["fine", "Hello", "I'm", "there"] 
["C", "d", "a", "B"])              -->  ["a", "B", "C", "d"] 
=end 
def sortme(array)
  array.sort_by {|str| str.downcase }
end

p sortme(["Hello", "there", "I'm", "fine"]) == ["fine", "Hello", "I'm", "there"] 
p sortme(["C", "d", "a", "Ba", "be"]) == ["a", "Ba", "be", "C", "d"] 
p sortme(["CodeWars"]) == ["CodeWars"] 