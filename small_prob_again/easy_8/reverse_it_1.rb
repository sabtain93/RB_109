=begin
Write a method that takes one argument, a string, and returns a new string with
the words in reverse order.

Examples:
puts reverse_sentence('Hello World') == 'World Hello'
puts reverse_sentence('Reverse these words') == 'words these Reverse'
puts reverse_sentence('') == ''
puts reverse_sentence('    ') == '' # Any number of spaces results in ''
The tests above should print true.

P - [Understand the] Problem
input: string
output: string

-rules:
empty string or string with all spaces reurn ("")
return the string where the words are in reverse
E - Examples / Test cases

D - Data Structure

A - Algorithm

C - Code


=end

def reverse_sentence(string)
  return '' if string.empty? || string.chars.all? { |char| char == " " }
  string.split.reverse.join(' ')
end

puts reverse_sentence('Hello World') == 'World Hello'
puts reverse_sentence('Reverse these words') == 'words these Reverse'
puts reverse_sentence('') == ''
puts reverse_sentence('    ') == ''