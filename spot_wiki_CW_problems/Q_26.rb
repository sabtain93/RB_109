=begin
Complete the function that 

accepts two integer arrays of equal length 
compares the value each member in one array to the corresponding member in the other 
squares the absolute value difference between those two values 
and returns the average of those squared absolute value difference between each member pair. 
Examples 
[1, 2, 3], [4, 5, 6]              -->   9   because (9 + 9 + 9) / 3 
[10, 20, 10, 2], [10, 25, 5, -2]  -->  16.5 because (0 + 25 + 25 + 16) / 4 
[-1, 0], [0, -1]                  -->   1   because (1 + 1) / 2 

problem:
input: 2 arrays of integers 
output:integer

rules:
both input arrays have equal size
find the difference of the element in the first array with there corredponding numbers
in second array
find the square of the difference and return the average of these numbers
sizes can vary but both have same size

examples:
[1, 2, 3], [4, 5, 6]
1-4, 2-5, 3-6
-3, -3, -3
-3 *-3, -3 * -3, -3*-3

data sructure
arrays
integers

algo:
- initalize diff array to empty array
- iterate over the first array input with its index
  - append the diff array with current value - value at index of second input array
- initialize square array
- iterate over the diff array
  - multiply each number with itself and append it to square array
- return the average of the square array
=end 
def solution(arr1, arr2)
  diff = []
  arr1.each_with_index do |number, idx|
    diff << (number - arr2[idx])
  end
  square = diff.map {|number| number * number}
  avg = square.reduce(:+).to_f / arr1.size
  if avg.round == avg
    avg.round
  else
    avg
  end
end


p solution([1, 2, 3], [4, 5, 6]) #== 9 
p solution([10, 20, 10, 2], [10, 25, 5, -2]) #== 16.5 
p solution([-1, 0], [0, -1]) #== 1