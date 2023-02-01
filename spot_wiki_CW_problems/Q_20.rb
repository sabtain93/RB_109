=begin
input : string
output: hash

rules: 
count the number of time each charcater appears in the string
add the count as key to output hash
add the group of charcaters that have a specific count
the hash has to be sorted with the highest number of occurence
the charcaters in the group should be sorted alphabeticaly
ignore spaces, special characters
treat uppercase as lowercase

Examples:
("Hello. Hello? HELLO!!") => {6=>["l"], 3=>["e", "h", "o"]}

data:
hash for output
array of strings


algo:
- initailize a hash with a default value an empty array
- convert the string into lowercase
- break the string into characters and store it in an array
- rempve the duplicates in the character array
- sort the character array 
- iterate over the character array with unique values
- for each character (a to z and 0-9) count its apperance in the lowercase string
- populate the hash where the key is the count and the value is an empty array
- iterate over the character array with unique values
-  add the values according to their count in the hash value which are []
- sort the hash based on the counts
- return the hash


- return the hash

=end


def get_char_count string
  lowercase_str = string.downcase
  char_arr = lowercase_str.chars.select {|char| char =~ /[a-z0-9]/}

  hash = char_arr.uniq.sort.group_by do |char|
      lowercase_str.count(char)
    end
  hash.sort_by {|k, _| -k }.to_h
end

p get_char_count("Mississippi") #== {4=>["i", "s"], 2=>["p"], 1=>["m"]}
p get_char_count("Hello. Hello? HELLO!!") #== {6=>["l"], 3=>["e", "h", "o"]}
p get_char_count("aaa...bb...c!") == {3=>["a"], 2=>["b"], 1=>["c"]}
p get_char_count("aaabbbccc") == {3=>["a", "b", "c"]}
p get_char_count("abc123") == {1=>["1", "2", "3", "a", "b", "c"]}