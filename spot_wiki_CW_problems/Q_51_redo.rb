=begin
You are given a secret message you need to decipher.
Here are the things you need to know to decipher it: 

For each word:
the second and the last letter is switched (e.g. Hello becomes Holle) 
the first letter is replaced by its character code (e.g. H becomes 72) 
Note: there are no special characters used, only letters and spaces 

Examples:
decipherThis('72olle 103doo 100ya'); // 'Hello good day' 
decipherThis('82yade 115te 103o'); // 'Ready set go' 

P - [Understand the] Problem
input:string
output:string

rules:
- replace the prepending digits with its corresponding character
- replace the second and last letter is to be switched
- there are no special characters
- words are seprated by spaces
- the input string will not be empty

E - Examples / Test cases
'72olle 103doo 100ya'
72 olle 103 doo 100 ya
Holle gdoo dya
Hello good day

D - Data Structure
array of strings
strings
A - Algorithm
- break the input string into words, assign it into a word array
- iterate over word array
  - replace the first number characters into its corresponding character
  - repace the transformed word in the word array
    - create num str to empty string
    - create schar str to empty string
    -iterate over character in the current word
      - append the num str if the current character is a number character
      - appedn the str if the current characetr is a alphabet character
- iterate over the word array
  - replace in the words whose size is greater than 2
    - repace the character in the 1st index with the character at the last index
    - transform the words in the word array
- return the string that is returned by the joining the words in the word array
C - Code

=end 

def decipher_this(string)
  word_arr = string.split

  word_arr.map! do |word|
    num_str = ''
    char_str = ''
    word.chars.each { |char| char =~ /[a-z]/ ? char_str << char : num_str << char }
    num_str.to_i.chr + char_str
  end
  word_arr.map do |word|
    if word.size > 2
      word[1], word[-1] = word[-1], word[1]
      word
    else
      word
    end
  end.join(' ')

end



p decipher_this("65 119esi 111dl 111lw 108dvei 105n 97n 111ka") == "A wise old owl lived in an oak" 
p decipher_this("84eh 109ero 104e 115wa 116eh 108sse 104e 115eokp") == "The more he saw the less he spoke" 
p decipher_this("84eh 108sse 104e 115eokp 116eh 109ero 104e 104dare") == "The less he spoke the more he heard" 
p decipher_this("87yh 99na 119e 110to 97ll 98e 108eki 116tah 119esi 111dl 98dri") == "Why can we not all be like that wise old bird" 
p decipher_this("84kanh 121uo 80roti 102ro 97ll 121ruo 104ple") == "Thank you Piotr for all your help" 



