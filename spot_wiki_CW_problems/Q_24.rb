
=begin
The marketing team is spending way too much time typing in hashtags. 
Let's help them with our own Hashtag Generator! 

Here's the deal:

It must start with a hashtag (#). 
All words must have their first letter capitalized. 
If the final result is longer than 140 chars it must return false. 
If the input or the result is an empty string it must return false. 

Examples 
" Hello there thanks for trying my Kata"  =>  "#HelloThereThanksForTryingMyKata" 
"    Hello     World   "                  =>  "#HelloWorld" 
""                                        =>  false 
problem:
input: string
output: string

rules:
make a hashtag of the given string
return false if string is empty
to make hash tag each word is to be capitalized and remove spaces and add '#' before

Example:


data structure
- array of strings
- string for output


algo:
-return false if string is empty
- break the string into words and store it in an array
- iterate over the word array
- make each word capitalized
- return the word array converted to string with removing spaces and adding a "#" before the string


=end 
def generateHashtag(string) 
  result_str = '#'
  word_arr = string.split
  return false if word_arr.empty?
  word_arr.each do |word|
    result_str << word.capitalize
  end
  if result_str.size <= 140
    result_str
  else
    false
  end

end


p generateHashtag("") == false 
p generateHashtag(" " * 200) == false 
p generateHashtag("Do We have A Hashtag") == "#DoWeHaveAHashtag" 
p generateHashtag("Codewars") == "#Codewars" 
p generateHashtag("Codewars Is Nice") ==  "#CodewarsIsNice" 
p generateHashtag("Codewars is nice") == "#CodewarsIsNice" 
p generateHashtag("code" + " " * 140 + "wars") == "#CodeWars"
p generateHashtag("Looooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooong Cat") == false 
p generateHashtag("a" * 139) == "#A" + "a" * 138 
p generateHashtag("a" * 140) == false 