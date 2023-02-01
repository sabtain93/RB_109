=begin
You've just discovered a square (NxN) field and you notice a warning sign.
The sign states that there's a single bomb in the 2D grid-like field in front of you.

Write a function mineLocation/MineLocation that accepts a 2D array,
and returns the location of the mine. The mine is represented as the integer 1 in 
the 2D array. Areas in the 2D array that are not the mine will be represented as 0s.

The location returned should be an array (Tuple<int, int> in C#) where the first element
is the row index, and the second element is the column index of the bomb location
(both should be 0 based). All 2D arrays passed into your function will be square (NxN),
and there will only be one mine in the array.

Examples:
mineLocation( [ [1, 0, 0], [0, 0, 0], [0, 0, 0] ] ) => returns [0, 0]
mineLocation( [ [0, 0, 0], [0, 1, 0], [0, 0, 0] ] ) => returns [1, 1]
mineLocation( [ [0, 0, 0], [0, 0, 0], [0, 1, 0] ] ) => returns [2, 1]
problem:
input: 2d array
output: array (2 elements)

rules:
te 2d array will always be a square
it will only have one mine
a mine is represented by 1
we have to return the location
row x column

Data:
arrays

Alogo:
-iterate over the input array along with index
  -iterate over the currnet array along with its index
    - if a 1 is detected 
      - return the outer current index and the inner current index
      appended in array
      - end the iteration


=end
def mineLocation(grid)
  grid.each_with_index do |array, idx1|
    array.each_with_index do |value, idx2|
      return [idx1, idx2] if value == 1
    end
  end
end

p mineLocation( [ [1, 0, 0], [0, 0, 0], [0, 0, 0] ] ) == [0, 0]
p mineLocation( [ [0, 0, 0], [0, 1, 0], [0, 0, 0] ] ) == [1, 1]
p mineLocation( [ [0, 0, 0], [0, 0, 0], [0, 1, 0] ] ) == [2, 1]