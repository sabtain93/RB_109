

# Have the method letter_changes(str) take the str parameter being passed and
# modify it using the following algorithm. Replace every letter in the string
# with the 3rd letter following it in the alphabet (ie. c becomes f, Z becomes C).
# Then return this modified string.

# p letter_changes("this long cake@&") == "wklv orqj fdnh@&"
# p letter_changes("Road trip9") == "Urdg wuls9"
# p letter_changes("EMAILZ@gmail.com") == "HPDLOC@jpdlo.frp"
# p letter_changes('xyz') == ('abc')

=begin
Problem:
Input: string
output: string

rules:
- replace every letter in string with the 3rd letter following it
- we have uppercase and lower case letters
- if uppercase return uppercase
- if the character is not an alphabet do not change it

Examples:
"this long cake@&" -> "wklv orqj fdnh@&"
t -> w, h -> k, i -> l, s -> v.... 
spaces remain sapces
charcaters like @ and & remain the same

 c becomes f
if c is 3 
d is 4, e is 5, f is 6
so add 3 to the number assigned to c

this tells me that i have to iterate over all characters in the string


Data structutr:
hash (where the keys are alphabets uppercase and lowercase
and values are number assigned to each alphabet)
subprocess - array of characetrs
output- string

Algorithm:
- initialize a result string to empty string
- create a hash where alphabets 'a'-'z' + 'A'-'Z' are keys and numbers
are assigned to them as values in increasing order

- break the string into characters
- itertae over the charcater
  - if the current character is included in the hash
    - retrieve the alphabets number from the hash
      - check if the number value goes over 26 in the hash
        - find the modula of the number with 26 and use the result
          - add that alphabet at that number to the result string
      - if number is in limit
        - add the corrsponding alphabet from the hash to the key
  - if not inlcuded in the hash
    -add the alphabet as it is in the result string
- return the result string
=end

def letter_changes(str)
  result_str = ''
  # str.tr("A-Za-z", "D-ZA-Cd-za-c") # "this long cake@&" 
  loweralpha = ('a'..'z').to_a
  upperalpha = ('A'.. 'Z').to_a

  uppercase = ('D'..'Z').to_a << 'A' << 'B' << 'C'
  lowercase = ('d'..'z').to_a << 'a' << 'b' << 'c'

  uppercase_hash = upperalpha.zip(uppercase).to_h
  lowercase_hash = loweralpha.zip(lowercase).to_h

  str.chars.each do |char|
    if uppercase_hash.has_key?(char)
      result_str << uppercase_hash[char]
    elsif lowercase_hash.has_key?(char)
      result_str << lowercase_hash[char]
    else
      result_str << char
    end
  end

  result_str
end



# def letter_changes(string)
#   alpha_lower = {}
#   alpha_upper = {}

#   result = ''
#   counter = 1
#   ('a'..'z').each do |char|
#     alpha_lower[char] = counter 
#     counter += 1
#   end

#   counter = 1
#     ('A'..'Z').each do |char|
#     alpha_upper[char] = counter 
#     counter += 1
#   end

#   string.chars.each do |char|
#     if alpha_lower.keys.include?(char)
#       if alpha_lower[char] + 3 > 26
#         pos = (alpha_lower[char] + 3) % 26
#         result << alpha_lower.key(pos)
#       else
#         result << alpha_lower.key(alpha_lower[char] + 3)
#       end
#     elsif alpha_upper.keys.include?(char)
#       if alpha_upper[char] + 3 > 26
#         pos = (alpha_upper[char] + 3) % 26
#         result << alpha_upper.key(pos)
#       else
#         result << alpha_upper.key(alpha_upper[char] + 3)
#       end
#     else
#       result << char
#     end
#   end
#   result
# end



p letter_changes("this long cake@&") == "wklv orqj fdnh@&"
p letter_changes("Road trip9") == "Urdg wuls9"
p letter_changes("EMAILZ@gmail.com") == "HPDLOC@jpdlo.frp"
p letter_changes('xyz') == ('abc')
