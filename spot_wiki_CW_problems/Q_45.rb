=begin
The alphabetized kata 
Re-order the characters of a string, so that they are concatenated into a new string in 
"case-insensitively-alphabetical-order-of-appearance" order.
 Whitespace and punctuation shall simply be removed! 

 

The input is restricted to contain no numerals and only words containing the english alphabet letters. 

 

Example: 

 

alphabetized("The Holy Bible") # "BbeehHilloTy" 
=end
def alphabetized(s)
  s.chars.select {|char| char =~ /[a-z]/i }.sort_by {|char| char.downcase }.join
end

# p alphabetized("") == "" 
# p alphabetized(" ") == "" 
# p alphabetized(" a") == "a" 
# p alphabetized("a ") == "a" 
# p alphabetized(" a ") == "a" 
p alphabetized("A b B a *** ") #== "AabB" 
p alphabetized("The Holy Bible") # "BbeehHilloTy" 
# p alphabetized(" a b c d e f g h i j k l m n o p q r s t u v w x y z A B C D E F G H I J K L M N O P Q R S T U V W X Y Z") 
# == "aAbBcCdDeEfFgGhHiIjJkKlLmMnNoOpPqQrRsStTuUvVwWxXyYzZ"
