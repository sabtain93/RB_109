=begin

Given a string of words, you need to find the highest scoring word. 

Each letter of a word scores points according to its position in the 
alphabet: a = 1, b = 2, c = 3 etc. 

You need to return the highest scoring word as a string. 

If two words score the same, return the word that appears earliest in the original string. 

All letters will be lowercase and all inputs will be valid. 

problem:
input: string of words with spaces
output: string (one word)

rules:
return the word in the input string with the highest score
a words score can be evaluated based on the characters it has
every character scores based on its position in the alphabet
input string characters are spaces and alphabets
all alphabetic characters are lowercase
lowest score a character has is 1 and highest score an alphabet has is 26
if there are two or more words with the same score then return the word that comes earlier
no null or empty input

Examples:
'aaa b'
  3  2--> highest score 'aaa'

data structures:
input- string
output- string

subprocess:
array of strings
hash- score and alphabets
array of integers


algo:
- initialize a score hash where the keys are lowercase alphabets
and values are there positions in alphabet
- initialize score array to empty array
- break the string into words store it in an word array
- iterate over the word array
  - for each word check its score from the score hash
    - append it to the score array
- find the maximum score in the score array
- find the index of the maximum score
- return the string in word array at index (maximum score)
=end 
def high(string)
  score_hash = {}
  ('a'..'z').to_a.each_with_index do |alphabet, idx|
    score_hash[alphabet] = idx + 1
  end
  score_arr = []
  word_arr = string.split
  score_arr = word_arr.map do |word|
    score = 0
    word.chars.each do |char|
      score = score + score_hash[char]
    end
    score
  end

  max_score = score_arr.max
  word_arr[score_arr.index(max_score)]

end



p high('man i need a taxi up to ubud') == 'taxi' 
p high('what time are we climbing up the volcano') == 'volcano' 
p high('take me to semynak') == 'semynak' 
p high('aaa b') == 'aaa' 