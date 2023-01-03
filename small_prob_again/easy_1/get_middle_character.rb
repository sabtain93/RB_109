=begin
input: string
output: string

rules:
- return the middle character
- if length is odd return only one character
- if length is even return two middle characters

algorithm:
- initialize number equal to size of string / 2
- if the legnth of string is odd
  -return the character at the number (number = size of string / 2)
- if the length of the string is even 
  - return the characters at the number + 1 till number


=end
def center_of(str)
  number = str.size / 2

  if str.size.odd?
    str[number]
  else
    str[number - 1..number]
  end
end


p center_of('I love ruby') #== 'e'
p center_of('Launch School') #== ' '
p center_of('Launch') #== 'un'
p center_of('Launchschool') #== 'hs'
p center_of('x') #== 'x'