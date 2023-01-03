=begin
input: array
output: array

rules:
-input array can have string or integers as its elements
- return an array which contains the elements at the even index in the input array

algorithm
- create a result array initialized to empty array
- iterate over the input array
- select the elements at the odd index
- return the selected elements stored in an array
=end

def oddities(array)
  result = []
  array.each_with_index do |value, index|
    result << value if index.even?
  end
  result
end


p oddities([2, 3, 4, 5, 6]) == [2, 4, 6]
p oddities([1, 2, 3, 4, 5, 6]) == [1, 3, 5]
p oddities(['abc', 'def']) == ['abc']
p oddities([123]) == [123]
p oddities([]) == []
p oddities([1, 2, 3, 4, 1]) == [1, 3, 1]