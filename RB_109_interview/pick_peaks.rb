
=begin

In this kata, you will write a function that returns the positions and the values of the "peaks" 
(or local maxima) of a numeric array.
For example, the array arr = [0, 1, 2, 5, 1, 0] has a peak at position 3 with a value of 5 
(since arr[3] equals 5).
The output will be returned as an object with two properties: pos and peaks.
Both of these properties should be arrays. If there is no peak in the given array, then the
output should be {pos: [], peaks: []}.

Example: pickPeaks([3, 2, 3, 6, 4, 1, 2, 3, 2, 1, 2, 3]) should
return {pos: [3, 7], peaks: [6, 3]} (or equivalent in other languages)

All input arrays will be valid integer arrays (although it could still be empty),
so you won't need to validate the input.

The first and last elements of the array will not be considered as peaks 
(in the context of a mathematical function, we don't know what is after and before and therefore,
we don't know if it is a peak or not).

Also, beware of plateaus !!! [1, 2, 2, 2, 1] has a peak while [1, 2, 2, 2, 3] and [1, 2, 2, 2, 2]
do not. In case of a plateau-peak, please only return the position and value of the
beginning of the plateau.
For example: pickPeaks([1, 2, 2, 2, 1]) returns {pos: [1], peaks: [2]} 
(or equivalent in other languages)

Problem:
input: array of positive integers
output: hash (includes index and the values)

rules:
find the local maxima
return the position and value if an integer is a local maxima
input can be empty -> return empty hash
don't have to consider the first and the last element as peaks
if there is a plateau then return the start of the plateau if it is a peak
a plateau is a peak only if the integer right after it and before it are less than it

Example
[3, 2, 3, 6, 4, 1, 2, 3, 2, 1, 2, 3]
          6           3            

[2,1,3,1,2,2,2,2]
     3          

[1, 2, 2, 2, 1]
    2         

Data structure:
Hash
array 

Algorithm:
- initialize hash
- iterate over the input array with index
  - do not check for the values at index 0 and index -1 (last value)
  - if current value greater than value at index - 1 and value at index + 1
    - append the index and value to my hash
  - if current value greater than value at index -1 and equal to value at index + 1
    iterate from current index till the last index 
    if there is any value which is not equal to current value
      check if it is less than
        add the current value and the running index to the hash
    update the running index to the index at which the value changed
- return the hash


=end

def pick_peaks(array)
  hash = {'pos' => [], 'peaks' => []}

  index = 1

  while index <= (array.size - 2) do 

    if array[index] > array[index - 1] && array[index] > array[index + 1] # if we have peak
      hash['pos'] << index
      hash['peaks'] << array[index]
    elsif array[index] > array[index - 1] && array[index] == array[index + 1] # if we have a plateau
      (index + 2..array.size - 1).each do |current_index| # iterate from the index + 2(we know index and index + 1 values are equal)
         if array[index] > array[current_index] # check for the next value that is less than the start of the peak
          hash['pos'] << index # add the index of start of the peak
          hash['peaks'] << array[index] # add the value of start of the peak
          index = current_index # update the index to the index of the value which breaked the plateau, so our outer most loop will check for the value which is next to the value where the pleatu was broken
          break
        end
      end
    end
    index += 1 # update the running index value
  end
  hash
end


p pick_peaks([1,2,3,6,4,1,2,3,2,1]) ==  {"pos"=>[3,7], "peaks"=>[6,3]}
p pick_peaks([3,2,3,6,4,1,2,3,2,1,2,3]) == {"pos"=>[3,7], "peaks"=>[6,3]}
p pick_peaks([3,2,3,6,4,1,2,3,2,1,2,2,2,1]) == {"pos"=>[3,7,10], "peaks"=>[6,3,2]}
p pick_peaks([2,1,3,1,2,2,2,2,1]) == {"pos"=>[2,4], "peaks"=>[3,2]}
p pick_peaks([2,1,3,1,2,2,2,2]) == {"pos"=>[2], "peaks"=>[3]}