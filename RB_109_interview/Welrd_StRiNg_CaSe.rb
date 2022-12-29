=begin
Write a function toWeirdCase (weirdcase in Ruby) that accepts a string, and returns the same string
with all even indexed characters in each word upper cased, and all odd indexed characters in 
each word lower cased. The indexing just explained is zero based, so the zero-ith index is even, 
therefore that character should be upper cased and you need to start over for each word.

The passed in string will only consist of alphabetical characters and spaces(' ').
Spaces will only be present if there are multiple words.
Words will be separated by a single space(' ').

Examples:

weirdcase( "String" )#=> returns "StRiNg"
weirdcase( "Weird string case" );#=> returns "WeIrD StRiNg CaSe"

P - [Understand the] Problem
input: string (one word or multiple words seprated with a single space)

output: same string but cased differently
- each word in the string is to be processed
- for each word the even indexed characters are to be upper cased
  and the odd index characetrs are to be lower cased

E - Examples / Test cases
weirdcase( "Weird string case" );#=> returns "WeIrD StRiNg CaSe"
            01234                             01234

D - Data Structure
array to store my strings
string to return my final processed string

A - Algorithm
- split the words in the string and save it in a lsit
- iterate over each word
  -for each word iterate over each character with its index
  - if the index is even
      - make it upper cased
  - if ithe index is odd
      - make it lower cased
  - append the character in a string
  - append the string into an array
- join the strings in the array 
- return the joined string

C - Code

=end

def weirdcase(string)
  str_arr = string.split(' ')

  str_arr.each_with_object([]) do |word, arr|
    result_str = ''
    word.chars.each_with_index do |char, idx|
      if idx.even?
        result_str << char.upcase
      elsif idx.odd?
        result_str << char.downcase
      end
    end
    arr << result_str
  end.join(' ')

end


p weirdcase('This') ==  'ThIs'
p weirdcase('is') == 'Is'
p weirdcase('This is a test') == 'ThIs Is A TeSt'
p weirdcase( "Weird string case" ) == "WeIrD StRiNg CaSe"