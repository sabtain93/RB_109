Written assessment questions for practice:
1. Explain what line 9 will return and what underlying concept is being demonstrated on lines 2-6.
def repeater(string)
  result = ‘’
  string.each_char do |char|
    result << char << char
  end
  result
end
repeater(‘Hello’)

On line 9 the method `repeater` is invoked and passed the string object `'Hello'`.  The method definition for `repeater` is on onlines 2-6.  The string object `'Hello'` is linked to the local variable `string` on line 2.

On line 3 the local variable `result` is initialized to an empty string object. On lines 4 the `each_char` method is invoked on the string object referenced by `string` and passed the `do...end` block on lines 4-6.

As the method invocation iterates over the input string object '`Hello'` on line 5 the mutating method `<<` is used to append each character twice to the new string object `result`.  This method uses a separate string object so the original string object is untouched by this method.

------

## Thomas

The underlying concepts demonstrated on lines 2-6 are the functionality of the `each_char` method and how it itterates through a string and passes individual characters in the string to a block. It also demonstrates how the mutating `<<` can be chained to append the block variable `char` to the block variable `char` before appending it to the block variable `result`. This action demonstrates Ruby passing variables to an method like pass by reference beacuase the object referenced by `result` is permanently changed by the code in the `repeater` method.



---

2. Explain what the concept being demonstrated in the following code is.
x = “hi there”
my_hash = {x: “some value”}
my_hash2 = {x => “some value”}



---

3. Examine the following code and explain why line outputs `6`.  What underlying concept is being demonstrated?
total = 0
[1, 2, 3].each do |number|
  total += number
end
puts total # 6



















---

4. Use the following code to explain the method `map`.
def test(b)
  b.map {|letter| “I like the letter: #{letter}“}
end
a = [‘a’, ‘b’, ‘c’]
test(a)

















---

5. Explain what line 5 will return and what concept this demonstrates.
def include?(arr, search_item)
  !arr.each { |item| return true if item == search_item }
end
include?([1, 2, 3, 4, 5], 6)



















---

6. What will line 9 return and what concept is this demonstrating?
def short_long_short(string1, string2)
  if string1.length > string2.length
    string2 + string1 + string2
  else
    string1 + string2 + string1
  end
end
short_long_short(‘abc’, ‘defgh’)











---

7. Using the following code, explain how the method `each` functions.
[1, 2, 3].each do |num|
  puts num
end



---

8. Explain what line 9 outputs and is the underlying concept.
a = 1
loop do
  puts a
  a = a + 1
  break
end
puts a











---

9. Examine the code below.  What is the return value of line 6 and what is the underlying concept demonstrated on lines 4?
arr = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
new_array = arr.map do |n|
  n > 1
end
p new_array

















---

10. What do lines 8, 9, and 10 output and what are the underlying concepts influencing this behavior?
```Ruby

def merge(array_1, array_2)
  array_1 | array_2
end

arr1, arr2 = ['hello'], ['hello', 'world']
merged = merge(arr1, arr2)
merged[0][0] = 'J' # => 'Jello' 'hello'
p merged # => ['Jello', 'world']
p arr1  # => ['Jello']
p arr2 # => ['hello', 'world']
xed string object 'hello'.
---
11. Examine the code example above. Explain what is happening on line 3, and why this line returns the Integer 3. Looking at the structure of my_hash and the way that 3 is returned, what concept regarding collections in Ruby does this demonstrate?
Ruby
my_hash = {a: 1, b: {d: 3, e: 5}, c: 7}

my_hash[:b][:d] # => 3
---
12. Explain why line 11 some_method(greeting) in the code below outputs hello but line 12 another_method raises an exception. What underlying principle does this example illustrate with regards to the structure defined on lines 5 to 7 and its relationship to line 9?
def some_method(greeting)
  puts greeting
end

def another_method
  puts greeting
end

greeting = "hello"

some_method(greeting)
another_method # => NameError: undefined local variable or method `greeting' for main:Object
---
13. Explain why line 2 is evaluated instead of line 4.
if 3
  puts "I evaluate to true"
else
  puts "I evaluate to false?"
end
---
14. Explain what this code returns and how the method works.
arr = [['a', 'cat', 'b', 'c'], ['b', 2], ['a', 'car', 'd', 3], ['a', 'car', 'd']]
arr.sort
---
15. Why does line 9 output 4 and how are on lines 4-7 influencing the local variable a?  Use line 10 to explain the underlying concept.
a = 4
b = 2

2.times do |a|
  a = 5
  puts a
end

puts a # 4
puts b # 2
---
16. Examine the following code.  Using the lines 3, 7, 11, 16, and 17 to explain what concept is demonstrated.
Ruby
a = 'hello world'
puts a # 'hello world'
a.object_id # => 260

a.upcase!
puts a # 'HELLO WORLD'
a.object_id # => 260

a.upcase
puts a # 'HELLO WORLD'
a.object_id # => 260

b = a.upcase
puts a # 'HELLO WORLD'
puts b # 'HELLO WORLD'
a.object_id # => 260
b.object_id # => 280
---
17. What does the following code return? What does it output? Why? What concept does it demonstrate?
arr = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

new_array = arr.select do |n|
    n + 1
end

p new_array
---
18. Explain how the method sort_by functions using the following code.
['cot', 'bed', 'mat'].sort_by do |word|
  word[1]
end
# => ["mat", "bed", "cot"]
---
19. Explain how the method all? functions and what underlying concept is being demonstrated.
{ a: "ant", b: "bear", c: "cat" }.all? do |key, value|
  value.length >= 3
end
---
20. What do a and b return?  Why?  What concept does it demonstrate?
a = 'hello'
b = a
a = 'goodbye'
---
21. Examine the following code.  Follow the code and explain the return values of the local variables a, b, and c are using the method invocations of object_id.
a = 'name'
b = 'name'
c = 'name'

# Are these three local variables pointing to the same object?

# no, these three variables are pointing to different string objects.

puts a.object_id
puts b.object_id
puts c.object_id

# And when we add these two lines of code... ?

a = c
b = a

# Now all three of these are pointing to the same object.



puts a.object_id
puts b.object_id
puts c.object_id

# What about now?
a = 5
b = 5
c = 5

puts a.object_id
puts b.object_id
puts c.object_id

# These are all pointing to the same object, as the integer 5 is assigned its own space in memory.

# 30. What do lines 4 and 7 output and why?  What concepts are influencing this behavior?

  trees = ['PINE', 'birch', 'MAple', 'fIR', 'cEdaR']

  trees = trees.each { |tree| tree.downcase! }
  p trees

  trees = trees.map { |tree| tree.capitalize }
  p trees

=begin

On line 3 the local variable `trees` is reassigned to the return value of the method invocation `each` on the array object referenced by `trees`. On line 3 the method `each` is passed a block that iterates over each element in the array `['PINE', 'birch', 'MAple', 'fIR', 'cEdaR]` and permanently mutates each element to downcase characters.  The return value and new object referenced by `trees` is `['pine', 'birch', 'maple', 'fir', 'cedar']`. This is output and returned by the `p` method invocation on line 4.

On line 6 the local variable `trees` is reassigned to the return value of the method invocation `map` on the array object referencd by `trees`. On the same line the method `map` is passed a block that iterates over each element in the array `['pine', 'birch', 'maple', 'fir', 'cedar'] and capitalizes each letter of each element.  The `map` method invocation returns a new transformed array object `['Pine', 'Birch', 'Maple', 'Fir', 'Cedar']`. `trees` now points to this new array object because of the reassignment operation `=` on line 6.  Thus, the output of line 7's `p` method invocation on `trees` outputs `['Pine', 'Birch', 'Maple', 'Fir', 'Cedar']`.
22. Use lines 3 and 7 to explain what happens to the local variable a.  What concept does this demonstrate?
a = 'Launch '
puts a
puts a.object_id

a += 'School'
puts a
puts a.object_id
---
23. Examine the following code.  What will lines 9 and 10 output and why?
a = 4

loop do
  a = 5
  b = 3
  break
end

puts a
puts b
---
24. Examine the following code.  What will lines 10 and 11 output and why?
a = 1
b = 3

loop do
  c = 5
  a = c
  break
end

puts a
puts b
---
25. Explain the code.
def a_method
  puts "hello world"
end
---
26. What will line 10 output and return?  What is the fundamental concept at work here?
def example(str)
  i = 3
  loop do
    puts str
    i -= 1
    break if i == 0
  end
end

example('hello')
---
27. What does this code below output? Why
a = puts "Chocolate"
b = "Vanilla"

if a
  puts "Chocolate"
elsif b
  puts "Vanilla"
end
---
28. The line p arr in the code below outputs [1, 2, 3]. Explain why arr is [1, 2, 3].  Is the [1, 2, 3] which is output on line 3 the same as the [1, 2, 3] on which #map is called on line 1?
arr = [1, 2, 3].map { |num| num }
p arr
---
29. If we use #select instead of #map, the line p arr again outputs [1, 2, 3]. Explain why arr is [1, 2, 3] in this case, in particular how it is different from the previous example.
arr = [1, 2, 3].select { |num| num }
p arr
---
30. What do lines 4 and 7 output and why?  What concepts are influencing this behavior?
trees = ['PINE', 'birch', 'MAple', 'fIR', 'cEdaR']

trees = trees.each { |tree| tree.downcase! }
p trees

trees = trees.map { |tree| tree.capitalize }
p trees
---
31. What is the difference between line 2 and 5. Is one preferred over the other? Why?
Ruby
arr1 = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
incremented1 = arr1.map { |n| n + 1 }

arr2 = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
incremented2 = arr2.map { |n| n += 1 }

p incremented1
p incremented2
32. What does the following code return?  What does it output?  Why?  What concept does it demonstrate?
def greetings(str)
  puts str
  puts "Goodbye"
end

word = "Hello"
[9:05 AM] 33. What does the following code return?  What does it output?  Why?  What concept does it demonstrate?
arr = [1, 2, 3, 4]
counter = 0
sum = 0
loop do
  sum += arr[counter]
  counter += 1
  break if counter == arr.size
end
puts “Your total is #{sum}”

---

34. What does the following code return?  What does it output?  Why?  What concept does it demonstrate?
a = ‘Bob’
5.times do |x|
  a = ‘Bill’
end
p a

---

35. What does the following code return?  What does it output?  Why?  What concept does it demonstrate?
```Ruby
n = 10

1.times do |n|
  n = 11
end

puts n
=end
```
36. What does the following code return?  What does it output?  Why?  What concept does it demonstrate?
```Ruby
animal = “dog”
loop do |animal|
  animal = “cat”
  break
end
puts animal
```
---
37. What are `a` and `b` referencing?  Why?  What concept does this demonstrate?
```
a = “hi there”
b = a
a << “, Bob”
```
---
38. What are `a`, `b`, and `c` referencing?  Why?  What concept does this demonstrate?
```
a = [1, 2, 3, 3]
b = a
c = a.uniq
```
---
39.  What does the following code return?  What does it output?  Why?  What concept does it demonstrate?
```
def test(str)
  str  += ‘!’
  str.downcase!
end
test_str = ‘Written Assessment’
test(test_str)
puts test_str
---
40. What does the following code return?  What does it output?  Why?  What concept does it demonstrate?
```
def plus(x, y)
  x = x + y
end
a = 3
b = plus(a, 2)
puts a
puts b
```
---
41.  What does the following code return?  What does it output?  Why?  What concept does it demonstrate?
```
def increment(x)
  x << ‘b’
end
y = ‘a’
increment(y)
puts y
---
42.  What does the following code return?  What does it output?  Why?  What concept does it demonstrate?
```
def change_name(name)
  name = ‘bob’      # does this reassignment change the object outside the method?
end
name = ‘jim’
change_name(name)
puts name
```
---
43.  What does the following code return?  What does it output?  Why?  What concept does it demonstrate?
```
def cap(str)
  str.capitalize!   # does this affect the object outside the method?
end
name = “jim”
cap(name)
puts name
```
---
44.  What does the following code return?  What does it output?  Why?  What concept does it demonstrate?
```
a = [1, 3]
b = [2]
arr = [a, b]
arr
a[1] = 5
```
---
45. What does the following code return...
arr1 = [“a”, “b”, “c”]
arr2 = arr1.dup
arr2.map do |char|
  char.upcase!
end
puts arr1
puts arr2
