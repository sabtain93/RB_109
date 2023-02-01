=begin
Write a method named to_weird_case that accepts a string, and
returns the same sequence of characters with every 2nd character
in every third word converted to uppercase. Other characters
should remain the same.

# Examples:

p to_weird_case('Lorem Ipsum is simply dummy text of the printing') ==
'Lorem Ipsum iS simply dummy tExT of the pRiNtInG'
p to_weird_case('It is a long established fact that a reader will be distracted') ==
'It is a long established fAcT that a rEaDeR will be dIsTrAcTeD'
p to_weird_case('aaA bB c') == 'aaA bB c'
p to_weird_case('Miss Mary Poppins word is supercalifragilisticexpialidocious') ==
'Miss Mary POpPiNs word is sUpErCaLiFrAgIlIsTiCeXpIaLiDoCiOuS'

# The tests above should print "true".

problem:
input: string
output: string

- return the same sequence of characters
- every 2nd character in every thrid word is to be converted to uppercase other characters
should remain the same.

Examples:
'Lorem Ipsum is simply dummy text of the printing'
'Lorem Ipsum iS simply dummy tExT of the pRiNtInG'
  0      1   2    3      4    5    6  7    8     
index 2 charcater 2
index 5 character 2
index 8 character 2

algorithm:
- store the words in the string in an array
- initialize variable string_index to 2
- iterate till the value of string_index is equal to size of array
  - initialize character_index = 1
  - iterate till the value of the character_index is eqaul to size of the current word
    - check if the charcater at the index returns a valid charcater
      - upper case the charcater at character_index
      - increment the character index by 2
  - reassign the index by incrementing the current value by 3
- convert the array into string
- return the string
=end
def to_weird_case(string)

  word_arr = string.split(" ")

  str_index = 2

  while str_index <= word_arr.size do
    char_index = 1
    while char_index <= word_arr[str_index].size do
      if word_arr[str_index][char_index] != nil
        word_arr[str_index][char_index] = word_arr[str_index][char_index].upcase
      end
      char_index += 2
    end
    str_index += 3
  end
  word_arr.join(' ')
end

p to_weird_case('Lorem Ipsum is simply dummy text of the printing') == 'Lorem Ipsum iS simply dummy tExT of the pRiNtInG'
p to_weird_case('It is a long established fact that a reader will be distracted') =='It is a long established fAcT that a rEaDeR will be dIsTrAcTeD'
p to_weird_case('aaA bB c') == 'aaA bB c'
p to_weird_case('Miss Mary Poppins word is supercalifragilisticexpialidocious') == 'Miss Mary POpPiNs word is sUpErCaLiFrAgIlIsTiCeXpIaLiDoCiOuS'