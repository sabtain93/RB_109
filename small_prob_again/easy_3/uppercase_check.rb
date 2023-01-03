=begin

Write a method that takes a string argument, and returns true if
all of the alphabetic characters inside the string are uppercase, false otherwise.
Characters that are not alphabetic should be ignored.

Examples:

uppercase?('t') == false
uppercase?('T') == true
uppercase?('Four Score') == false
uppercase?('FOUR SCORE') == true
uppercase?('4SCORE!') == true
uppercase?('') == true

algorithm:
- split the string into characters and store it in an array
- iterate over the character array
- select characters that are only alphabets
- check in the selected charcaters if all are in uppercase
  - return false
- else
  - return true

=end

def uppercase?(string)
  alphabetic_arr = string.chars.select { |char| char =~ /[a-z]/i }

  if alphabetic_arr.all? { |char| char == char.upcase }
    true
  else
    false
  end
end

p uppercase?('t') == false
p uppercase?('T') == true
p uppercase?('Four Score') == false
p uppercase?('FOUR SCORE') == true
p uppercase?('4SCORE!') == true
p uppercase?('') == true
