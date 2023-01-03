=begin
Write a method that counts the number of occurrences of each element in a given array.

Example:

vehicles = ['car', 'car', 'truck', 'car', 'SUV', 'truck', 'motorcycle', 'motorcycle',
 'car', 'truck']

count_occurrences(vehicles)
The words in the array are case-sensitive: 'suv' != 'SUV'. Once counted, print each element
alongside the number of occurrences.

Expected output:
car => 4
truck => 3
SUV => 1
motorcycle => 2

P - [Understand the] Problem
input: array of strings
output: each string with its count in the array

rules:
- words in the array are case sensitive
E - Examples / Test cases

D - Data Structure

A - Algorithm
- delete the duplicates in the array
- iterate over the array 
  - find the count of each string in the original array
  - output the string along with its count
C - Code

=end

def count_occurrences(array)
  array.uniq.each do |word|
    puts "#{word} => #{array.count(word)}"
  end
end


vehicles = ['car', 'car', 'truck', 'car', 'SUV', 'truck', 'motorcycle', 'motorcycle',
 'car', 'truck']

count_occurrences(vehicles)