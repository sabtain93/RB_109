=begin
Given a string of words, you need to find the highest scoring word.

Each letter of a word scores points according to its position in the 
alphabet: a = 1, b = 2, c = 3 etc.

For example, the score of abad is 8 (1 + 2 + 1 + 4).

You need to return the highest scoring word as a string.

If two words score the same, return the word that appears earliest in the original string.

All letters will be lowercase and all inputs will be valid.


p high('man i need a taxi up to ubud') == 'taxi'
 p high('what time are we climbing up the volcano') == 'volcano'
 p high('take me to semynak') == 'semynak'
p high('aa b') == 'aa'
 p high('b aa') == 'b'
 p high('bb d') == 'bb'
 p high('d bb') == 'd'
 p high('aaa b') == 'aaa'

Problem:
input: string
output: string

rules:
- all letters in the string are lowercase
- return the word with the highest score
- score will be calculated based on the position of the letters in the alphabetic order
- a -> 1, b-> 2...'z'-> 26
- if there are two or more highest score then return the one that comes before in the original string

Examples:
('aaa b') == 'aaa'
   3  2   -> 3 -> 'aaa'
('b aa') == 'b'
  2  2   -> 2 -> 'b'

Data Structure
array to store scores of each word
hash to have a score reference

algorithm:
- initialize a hash which will have the alphabets as key and their relative score as value
- break the string into words and store the words in word array
- iterate over the word array
- calculate score for each array
- add the scores in an array
- find the maximum score
- return the word from the word array at the index equal to the index of the maximum score
=end

def high(string)
  score_hash = {}
  ('a'..'z').to_a.each_with_index do |alpha, idx|
    score_hash[alpha] = idx + 1
  end
  score_array = []

  word_array = string.split(' ')
  word_array.each do |word|
    word_score = 0
    word.chars.each do |char|
      word_score += score_hash[char]
    end
    score_array << word_score
  end
  max_score = score_array.max
  word_array[score_array.index(max_score)]
end




p high('man i need a taxi up to ubud') == 'taxi'
 p high('what time are we climbing up the volcano') == 'volcano'
 p high('take me to semynak') == 'semynak'
p high('aa b') == 'aa'
 p high('b aa') == 'b'
 p high('bb d') == 'bb'
 p high('d bb') == 'd'
 p high('aaa b') == 'aaa'