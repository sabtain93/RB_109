=begin
# Write a method named to_weird_case that accepts a string, and
# returns the same sequence of characters with every 2nd character
# in every third word converted to uppercase. Other characters
# should remain the same.

# Examples:

p to_weird_case('Lorem Ipsum is simply dummy text of the printing') ==
                'Lorem Ipsum iS simply dummy tExT of the pRiNtInG'
p to_weird_case(
  'It is a long established fact that a reader will be distracted') ==
  'It is a long established fAcT that a rEaDeR will be dIsTrAcTeD'
p to_weird_case('aaA bB c') == 'aaA bB c'
p to_weird_case(
  'Miss Mary Poppins word is supercalifragilisticexpialidocious') ==
  'Miss Mary POpPiNs word is sUpErCaLiFrAgIlIsTiCeXpIaLiDoCiOuS'

# The tests above should print "true".

P - [Understand the] Problem
input: string
output: string

rules:
- convert to upcase every 2nd character in every third word
- there will not be any empty strings
- if every third word is not 2 characters long then it will remain the same
- the remaining string words will be the same
- if the 2nd character in every third word is uppercased it will remain so


E - Examples / Test cases
'Lorem Ipsum is simply dummy text of the printing'
  0      1    2   3     4      5   6  7     8     
position of every third word 2 5 8
position of every second character 1 (1 3) (1 3 5 7)
D - Data Structure
input string
output string
subprocess - array of strings
A - Algorithm
- break the input string into words and store it in a list of words
- initialize index1 variable to integer value 2
- initialize index2 variable to integer value 1
- iterate over the list of words untill index1 less than or equal to size of list of words
  - iterate over over the current word at index1 in input string till index2 not greater than size of current word
    - upcase the current character at index 2
    - update index2 with an incremnet of 2
  - update index1 with an increment of 3
  - transform the list of words
- return the string fromed by joining the words in the list of words
C - Code
=end
def to_weird_case(string)
  word_arr = string.split

  index1 = 2
  index2 = 1

  while index1 <= word_arr.size - 1
    p word_arr[index1]
    current_word = word_arr[index1]
    index2 = 1
    while index2 <= current_word.size - 1
      current_word[index2] = current_word[index2].upcase
      index2 += 2
    end
    index1 += 3
  end
  word_arr.join(' ')


end

p to_weird_case('Lorem Ipsum is simply dummy text of the printing') #== 'Lorem Ipsum iS simply dummy tExT of the pRiNtInG'
# p to_weird_case(
#   'It is a long established fact that a reader will be distracted') ==
#   'It is a long established fAcT that a rEaDeR will be dIsTrAcTeD'
# p to_weird_case('aaA bB c') == 'aaA bB c'
# p to_weird_case(
#   'Miss Mary Poppins word is supercalifragilisticexpialidocious') ==
#   'Miss Mary POpPiNs word is sUpErCaLiFrAgIlIsTiCeXpIaLiDoCiOuS'