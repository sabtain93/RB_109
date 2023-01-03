=begin
Problem:

Write a method that will take a short line of text, and print it within a box.

Example:


print_in_box('To boldly go where no one has gone before.')
+--------------------------------------------+
|                                            |
| To boldly go where no one has gone before. |
|                                            |
+--------------------------------------------+


print_in_box('')
+--+
|  |
|  |
|  |
+--+
You may assume that the input will always fit in your terminal window.

P - [Understand the] Problem
input: string
ouput: banner with string printed in it.

rules:
- return empty box 
+--+
|  |
|  |   # emoty box
|  |
+--+
- the box length is one size larger on each side than the size of the string
- one line above and one below is empty

E - Examples / Test cases


D - Data Structure
- strings

A - Algorithm
- print the + charcter
- print the - character for size of string + 2, print the + character
- print | charater print space for the size of string + 2,print | character
- print | character, print space, print string, print space
- - print | charater print space for the size of string + 2,print | character
- print the + charcter
- print the - character for size of string + 2, print+ character

C - Code
=end

def print_in_box(str)
  print "+"
  (str.size + 2).times { print "-" }
  print "+\n"
  print "|"
  (str.size + 2).times { print " "}
  print "|\n"
  print "|"
  print " "
  print str
  print " "
  print "|\n"
  print "|"
   (str.size + 2).times { print " "}
  print "|\n"
  print "+"
  (str.size + 2).times { print "-" }
  print "+\n"
end



print_in_box('To boldly go where no one has gone before.')
print_in_box("")