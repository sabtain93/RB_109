
The Pedac process is **one way** to solve problems. The motive behind pedac is to code with intent.





P - [Understand the] Problem
input:
output:

rules:

E - Examples / Test cases

D - Data Structure

A - Algorithm

C - Code




The PEDAC process helps in solving complex problems.

For the first interview assessment the *P* and the *D* steps are important. As the test and examples cases will be provided.

P - [Understand the] Problem

Understanding the problem has three steps

1. understnding the problem description
2. checking the test cases if any.
3. asking the interviewer question if there is any clarification reqiured in the problem description.

```ruby
# PROBLEM:

# Given a string, write a method change_me which returns the same
# string but with all the words in it that are palindromes uppercased.

# change_me("We will meet at noon") == "We will meet at NOON"
# change_me("No palindromes here") == "No palindromes here"
# change_me("") == ""
# change_me("I LOVE my mom and dad equally") == "I LOVE my MOM and DAD equally"
```
Question to be cleared:

- What is a plaindrome?
  A word that reads the same forward and backwards.

- shall I consider letter case when considring a word for palindrome?
  Yes, as "mom" is a plaindrome but "Mom" is not.

- shall the words already uppercased remain uppercased?
  Yes, as this can be verified in the test case # 4, "LOVE" uses uppercase and remains uppercase in the solution.

- Can I assume that all inputs are strings?
  For this Problem we will assume that all the inputs are strings.

- Am I suppose to return the same string object or a new string object?
  For this problem you should return the same string.

Now we will write the inputs and the outputs for the above problem. Describe the rules that must be followed. Rules should include the explicit and implicit requirements.

```ruby
=begin

P-Problem:

-input: string
-output: string (not the same object)
rules:
      Explicit requirements:
      - every palindrome in the string must be converted to uppercase
      - Palindromes are case sensitive ("dad" is a palindrome, "DAD" is not )

      Implicit requirements:
       - The return string must not be the same string object
       - If the string is an empty string, the result must be an empty string.
=end

```
# Data Structures & Algorithm

As Data Structures influence the algorithm. figuring out the Data Structure is easy but writing algorithm is hard.

```ruby
# PROBLEM:

# Given a string, write a method `palindrome_substrings` which returns
# all the substrings from a given string which are palindromes. Consider
# palindrome words case sensitive.

# Test cases:

# palindrome_substrings("supercalifragilisticexpialidocious") == ["ili"]
# palindrome_substrings("abcddcbA") == ["bcddcb", "cddc", "dd"]
# palindrome_substrings("palindrome") == []
# palindrome_substrings("") == []

=begin
P - Understand the problem

Input: string
output: array of string

Explicit requirements:
  - return all the sub-strings which are plaindromes.
  - palindromes words are case sensitive("mom" is a palindrome but "Mom" is not).

Implicit requirements:
  - palindrome substring are to be returned in an array object.
  - a palindrome substring shall be considred of atleast 2 characters
  - If an empty string is passed, return an empty array
  - If there are no palindrome substrings, return an empty array.

=end
```


```ruby




p alphabetized("The Holy Bible") #== "BbeehHilloTy"
p alphabetized("!@$%^&*()_+=-`,") #== ""
p alphabetized("CodeWars can't Load Today") #== "aaaaCcdddeLnooorstTWy"
```