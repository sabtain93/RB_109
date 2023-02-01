
=begin
Write a program that reads the content of a text file and then prints the longest sentence
 in the file based on number of words. Sentences may end with periods (.),
 exclamation points (!), or question marks (?).
 Any sequence of characters that are not spaces or sentence-ending characters should
 be treated as a word. You should also print the number of words in the longest sentence.

The longest sentence in the above text is the last sentence;
it is 86 words long. (Note that each -- counts as a word.)
=end

text = File.read('file.txt')

sentences = text.split(/\.|\?|!/)
puts largest_sentence = sentences.max_by { |sentence| sentence.split.size }
puts largest_sentence = largest_sentence.strip
number_of_words = largest_sentence.split.size

puts "#{largest_sentence}"
puts "Containing #{number_of_words} words"


https://rubular.com/

https://layoffs.fyi/




