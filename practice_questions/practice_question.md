## Example 1

Examining the outputs on lines 10 and 11, Explain what concept is demonstrated here.
Why does line `11` output `Hello` and not `Goodbye`.
```ruby
a = 'Hello'
b = a
a = 'Goodbye'

puts a # Goodbye
puts b # Hello
```
On line `6` the local variable `a` is intialized to a new string object `'Hello'`. Then on line `7` the local variable `b` is initialized to the object referenced by `a`, so `b` and `a` points to the same object. Then on line `8` `a` is reassigned to a new string object `'Goodbye'`.

The concept demonstrted here is that local variables act as pointers and they point to a physical space in memory that holds the value of the object. So when `a` points to `Goodbye` and `b` still points to the same string object which is `'Hello'`. What this shows is that reassignment to a variable on line `8` doesn’t mutate the object referenced by the variable `a`; instead, the variable `a` is bound to a different object.

## Example 2

Examine the outputs on lines `30` and `31`. Why does line `30` output `5` and why does line `31` raises an error?
```ruby
a = 4

loop do
  a = 5
  b = 3
  break
end

puts a # 5
puts b # raise an error
```
On line `21` the local variable `a` is initialized to the integer object `4`. Then on line `23` the `loop` method is invoked with a block passed to it as an argument.

Inside the block on line `24` `a` is reassigned to the integer object `5` and on line `25` the local variable `b` is intialized to the integer object `3`. As `do..end` block follwed by `loop` method invocation defines an inner scope. This demonstrates the concept that local variables initialized in the outer scope are accessible in an inner scope and any reassignments or modification made are reflected in the outer scope. This is why line `29` outputs `5`.

Local variables intialized in the inner scope are not accessible in the outer scope. This is why line `30` raises an error.

## Example 3

In the following code line `51` outputs `3`. Why is that so? what concept is demonstrated here?

```ruby
a = 4

loop do
  c = 3
  a = c
  break
end

puts a # 3
```
On line `43` the local variable `a` is initialized to the integer object `4`. Then on line `45` loop method is invoked with a block passed to it as an argument, and the `do..end` block defines an inner scope. Inside the block on line `46` the local variable `c` is initialized to the integer object `3` and on line `47` `a` is reassigned to the same object that `c` references.

The concept demonstrated here is the local variables initialized in the outer scope are accessible in the inner scope and any reassigments or modifications are reflected in the outer scope. This is why line `51` outputs `3`.

## Example 4

Why does line `65` output `hello`? What concept does this demonstrate?
Why does line `71` return `nil` and what concept does this demonstrate?
```ruby
def example(str)
  i = 3
  loop do
    puts str # hello
    i -= 1
    break if i == 0
  end
end

example('hello') # => nil
```
On line `71` the `example` method is invoked with the string object `'hello'` passed to it as an argument. On lines `62` till `69` the method `example` is defined with `str` as a parameter.

Method definitions have a self contained scope. So method definitions can only access local variables which are either initialized within the method definition or that are defined as parameters. So as ruby uses pass by reference value, on line `62` the method definition local variable `str` now references to the string object `'hello'` which is the same string object passed as an argument to the method invocation on line `71`.

The method definition local variable `str` is accessible within the inner scope that is defined by the `do..end` block followed by `loop` method invocation. This is why when `str` is passed as an argument to the `puts` method invocation it outputs `hello`.

Line `71` returns `nil` as the method returns `nil`. The method returns `nil` as method definitions have an implicit return value that is whatever is returned by the last statement evaluated within the method definition will be returned by the method. In our case the last statement evaluated is the `loop` method invocation with a block. 

The return value of the `loop` method invocation with a block is what is returned by the last expression evaluated within the block. Inside the block we use the `break` keyword to exit the loop if the condition `i == 0` evaluates to true, which is the last statement evaluated. So when the condition evaluates to true that will be on the third iteration and as `break` is not passed an argument it will return `nil`. So `nil` is implicitly returned by the method definition.

## Example 5

Examine the output on line `89`. what concept does this demonstrate

```ruby
def greetings(str)
  puts str # Hello
end

word = "Hello"
greetings(word)
```
On line `92` the local variable `word` is initialized to a new string object. Then on line `93` the method `greetings` is invoked with `word` passed in as an argument. On lines `88` to `90` we have the method `greetings` defined with the parameter `str`.

Ruby uses pass by reference value so on line `88` the method definition local variable `str` is now pointing to the same object that `word` references. This is why on line `89` `puts` method invocation outputs `Hello` when `str` is passed to it. This demonstrates the concept that method definition have a self contained scope and can only access local variables that are either initialized within the method definition or are defined as parameters.

## Example 6

Examine the output on line `114`. What concept is demonstarted here?

```ruby
arr = [1, 2, 3, 4]
counter = 0
sum = 0

loop do
  sum += arr[counter] 
  counter += 1
  break if counter == arr.size
end 

puts sum # 10
```
On line `104` the local variable `arr` is initialized to a new array object. Then on line `105` the local variable `counter` is initialized to the integer object `0` and on line `106` the local variable is initialized to the integer object `0`.

On line `108` the `loop` method is invoked with a `do..end` block passed to it, the block defines an inner scope. Inside the block we reassing the local variable `sum` to `sum + arr[counter]` where `arr[counter]` references the element of arr on the index value referenced by `counter`. Next counter is reassigned to the current integer object it references incremented by `1`. By using `break` on line `111` we break out of loop when `if` test statement evaluates to true, which will be on the fourth iteration. When we break out of the loop now the local variable `sum` points to the integer object `10` which is the sum of all the elements of array refrenced by `arr`.

This demonstrates the concept that the local variables `arr`, `counter` and `sum` are initialized in an outer scope and so are accessible and can be reassigned and modified in the inner scope which is reflected in the outer scope. Here the inner scope is defined by the `do..end` block followed by the `loop` method invocation.

This is why when on line `114` when `puts` method is invoked with `sum` as an argument it outputs `10`.

## Example 7

Examine the output on line `132`. What concept does this demonstrates?

```ruby
a = 'Bob'

5.times do |x|
  a = 'Bill'
end

p a # 'Bill'
```
On line `129` the local variable `a` is initialized to a new string object `'Bob'`.
Then on line `131` the `times` method is invoked on the integer object `5` and a `do..end` block is passed to it as an argument. Inside the block `a` is reassigned to a new string object `'Bill'`.

This demonstrates the concept that the local variable `a` is initialized in an outer scope is accessible in the inner scope. Here the `do..end` block followed by the `times` method invocation on the integer object `5` defines an inner scope. Any modifications or reassignment to `a` made in the inner scope is reflected in the outer scope. This is why on line `135` when `p` is invoked and `a` is passed to it it prints `'Bill'` to the console and returns it.

### Example 8

What does the following code return? What does it output? Why? What concept does it demonstrate?

```ruby
animal = "dog"

loop do |_|
  animal = "cat"
  var = "ball"
  break
end

puts animal # cat
puts var # raises an error
```
On line `145` the local variable `animal` is initialized to a new string object `'dog'`.

On line `147` the `loop` method is invoked and `do..end` is passed to it. Inside the block on line `148` `animal` is reassigned to a new string object `'cat'`. Then on line `149` the local variable `var` is initialized to a new string object `'ball'`.

Here the local variable `animal` is initialzied in the outer scope and so it is accesible and can be reassigned in the inner scope which is reflected in the outer scope. The inner scope is defined by the `do..end` block followed by the `loop` method invocation on line `147` and local variables initialized in an inner scope are not accessible in the outer scope.

This is why on line `153` when `puts` is invoked and `animal` is passed to it, it outputs `cat` but on line `154` when `puts` is invoked and `var` is passed to it an error is raised.

## Exapmle 9

Examine the outputs on line `175` and `179`. What concept does this demonstrates?

```ruby
a = 4

loop do |a|
  a = 5
  puts a # 5
  break
end

puts a # 4
```
On line `171` the local variable `a` is initialized to the integer object `4`. Then on line `171` the `loop` method is invoked and `do..end` block is passed to it with `a` as the block's parameter. The `do..end` block followed by `loop` method invocation defines an inner scope.

The block parameter on line `171` has the same name as the local variable `a` initialized in the outer scope. So the block parameter shadows the local variable `a` which is initialized in the outer scope, so it is not accessible in the inner scope. On line `174` the inner scope local variable `a` is assigned to the integer object `5`. This is why on line `175` when the `puts` method is invoked and `a` is passed to it as an argument it outputs `5`.

As the outer scope local variable `a` is not accessible in the inner scope because it is shadowed by the blocks parameter, so it still points to the same integer object and this why on line `179` when `puts` is invoked and `a` is passed to it as an argument it ouputs `4`.

## Example 10

What does the following code return? What does it output? Why? What concept does it demonstrate?

```ruby
n = 101.times do |n|
  n = 11
end

puts n # 101
```
On line `192` the local variable `n` is initialized in the outer scope to the return value of the `times` method invocation on the integer object `101` with a `do..end` block passed to it, which defines an inner scope.

The `do..end` block's parameter `n` has the same name as the outer scope local variable and this prevents the access of the outer scope local variable in the inner scope. As the block parameter shadows the outer scope local variable `n`.

Inside the block the inner scope local variable is assigned to the integer object `11`. As inner scope local variables are not accessible in the outer scope, on line `196` the `puts` method invocation with the outer scope local variable `n` passed in as an argument outputs the string representation of the integer `101`. This is because outer scope local variable `n` points to the return value of `times` method invocation on integer object `101` which returns the calling object which in this case is the integer `101`.

## Example 11

why does line `214` outputs the string `dog` and not `cat`. what concept is demonstrated here?

```ruby
animal = "dog"

loop do |animal|
  animal = "cat"
  break
end

puts animal
```
On line `209` the local variable `animal` is initialized in the outer scope to a new string object `'dog'`.

On line `209` the `do..end` block followed by the `loop` method invocation defines an inner scope. But as the `do..end` block has a parameter with the same name as the outer scope variable, the block parameter shadows the outer scope local variable and perevents its access in the inner scope.

On line `212` the inner scope local variable is assigned to a new string object `'cat'` and this is not reassignment of the outer scope local variable as it is not accessbile in the inner scope. So when on line `214` the `puts` method is invoked with `animal` passed to it as an argument it outputs `dog`. As the outer scope local variable `animal` still points to the same string object `'dog'`.

## Example 11

What are a and b? what conept is demonstrated here?

```ruby
a = "hi there"
b = a
a = "not here"
```
On line `229` the local variable `a` is initialized to a new string object `"hi there"`. Then on line `230` the local variable `b` is initialized to the same string object referenced by `a`. Now both `a` and `b` point to the same string object `"hi there"`. 

On line `229` the local variable `a` is reassigned to a new string object `"not there"`. Now `b` is still pointing to the same string object `"hi there"` but the local variable `a` points to a new and different string object `"not there"`.

What this shows is that variables act as pointers and reassignment to the variable on line `231` doesn’t mutate the object referenced by the variable `a`; instead, the variable `a` is bound to a different object.

### Example 12

What are a and b? what concept does this demonstrates?

```ruby
a = "hi there"
b = a
a << ", Bob"
```
on line `244` the local variable `a` is initialized to a new string object `"hi there"`. Then on line `245` the local variable `b` is initialized to the same string object referenced by `a`. So now `a` and `b` points to the same string object `"hi there"`.

On line `246` the `<<` is called on `a` and the string `", bob"` is passed to it as an argument. So now the local variables `a` and `b` points to the same string object which is now mutated.

This demonstartes the concept that the `<<` method mutates the calling object and does not create a new object. So now `a` and `b` both point to the same string object `"hi there, Bob"`.

## Example 13

What are a, b, and c? What if the last line was `c = a.uniq!`?

```ruby
a = [1, 2, 3, 3]
b = a
c = a.uniq
```
On line `259` the local variable `a` is initialized to a new array object `[1, 2, 3, 3]`. Then on line `260` the local variable `b` is initialized to the same array object that `a` points to.

On line `261` the local variable `c` is initialized to the return value of `uniq` method invocation on the object referenced by `a`. `uniq` method returns a new array by removing the duplicate values in the calling array object. So `c` points to the array object `[1, 2, 3]` which is a new array and `a` and `b` still point to the original array object.

If line `259` was `c = a.uniq!` then `a`, `b` and `c` will point to the same array object which is mutated by the method invocation `uniq!` on `a`. This is because the `uniq!` method mutates the calling array and returns the calling array which is now mutated. So now `a`, `b` and `c` points to the same array object which is now mutated.

## Example 14

What is `a`? What if we called `map!` instead of `map`?

```ruby
def test(b)
  b.map {|letter| "I like the letter: #{letter}"}
end

a = ['a', 'b', 'c']

test(a)
```
On line `278` the local variable `a` is initilaized to a new aray object `['a', 'b', 'c']`.
Then on line `280` we invoke the `test` method with `a` passed to it as an argument.

On lines `274` to `276` the `test` method is defined with `b` as its parameter. So as Ruby uses pass by reference value, so on line `272` the method definition local variable `b` points to the same array object that `a` points to.

On line `275` the `map` method is called on the array object referenced by `b`. `map` will return new array with elements based on the return value of the block. The original collection is not mutated. `a` and `b` points to the same array object `['a', 'b', 'c']`.

This demonstrtaes that the `test` method is not a mutating method as the original array is not affected. If we would have used the `map!` method it would have transformed the calling collection and `a` and `b` will be pointing to the same array object now mutated/transformed.

## Example 15

What is `a` and `b`? Why?

```ruby
a = 5.2
b = 7.3
a = b
b += 1.1
```

on line `296` the local variable `a` is initilazied to a new float object `5.2` and on line `297` the local variable `b` is initialized to the float object `7.3`. 

On line `298` `a` is reassigned to the float object that `b` references. So now `a` and `b` points to the same float object `7.3`. Then on line `299` `b` is reassigned to the return value of `b + 1.1` which will return the float object referenced by `b` incremented by `1.1`. Now `b` is pointing to a new and different float object which is `8.4` and `a` is still pointing to the float object `7.3`.

This demonstrates that the `+` method does not mutate the calling object but returns a new object. Also reassigment does not mutate the object.

## Example 16

What does the following code return? What does it output? Why? What concept does it demonstrate?
```ruby
def test(str)
  str += '!' 
  str.downcase!
end

test_str = 'Written Assessment'
test(test_str)
puts test_str # 'Written Assessment'
```
On line `317` the local variable `test_str` is initialized to a new string object `'Written Assessment'`. Then on line `318` the `test` method is invoked with `test_str` passed to it as an argument.

On line `310` to `313` the `test` method is defined with `str` as a parameter. As Ruby uses pass by reference value to pass objects to method definition, so on line `310` local variable `str` is pointing to the same string object that `test_str` points to.

Inside the method definition on line `311` `str` is reassigned to the return value of `str + '!'`. As the `+` method returns a new string object so now `str` points to a different string object `'Written Assessment!'` and no longer reference the string object referenced by `test_str`.

The `test` method does not mutate the string object referenced by `test_str` and so on line `317` when we invoke the `puts` method with `test_str` passed to it as an argument it outputs `written Assessment`.

## Example 17

What does the following code return? What does it output? Why? What concept does it demonstrate?

```ruby
def plus(x, y)
  x = x + y
end

a = 3
b = plus(a, 2)

puts a # 3
puts b
```
On line `338` the local variable `a` is intialized to the integer object `3`. Then on line `339` the local variable `b` is initialized to the return value of the method `plus` invocation with `a` and `2` passed to it as an argument

On lines `334` to `336` the `plus` method is defined with `x` and `y` as parameters. As ruby uses pass by reference value so on line `332` `x` references the same object referenced by `a` and `y` points to the integer object `2`.

Inside the method definition on line `335` `x` is reassigned to the return value of `x + y`. The `+` method does not muatate the caller and returns a new integer object `5` and now `x` points to this new integr object.

So when on line `341` the `puts` method is invoked with `a` passed in as an argument it outputs `3`. `Integer` objects are immutable and the `+` does not mutates the calling object so the `plus` method did not mutate the object referenced by `a`.

## Example 18

Examine the output on line `361`. Why is the output not `a`.

```ruby
def increment(x)
  x << 'b'
end

y = 'a'
increment(y)
puts y # ab
```
On line `361` the local variable `y` is initialized to a new string object `'a'`. Then on line `362` the `increment` method is invoked with `y` passed to it as an argument.

On lines `357` to `359` the the method `increment` is defined with `x` as its parameter.

As ruby uses pass by reference value to pass object to method definitions. So on line `357` the method definition local variable `x` points to the same string object `'a'` that `y` points to.

Inside the method definition on line `356` the `<<` method is invoked on the object referenced by `x` and `'b'` is passed to it as an argument. The `<<` is a mutating method and mutates the calling object and so `x` points to the same string object which is now mutated.

So `increment` mutates the object passed to it. This is why when we invoke the `puts` method on line `363` with `y` passed to it as an argument it outputs `ab`.

## Example 19

What does the following code return? What does it output? Why? What concept does it demonstrate?
```ruby
def change_name(name)
  name = 'bob'# does this reassignment change the object outside the method?
end

name = 'jim'
change_name(name)
puts name
```
On line `383` the local variable `name` is initialized to a new string object `'jim'`. then on line `384` the `change_name` method is invoked with `name` passed to it as an argument.

On lines `379` to `381` the `change_name` method is defined with a parameter `name`. As Ruby uses pass by reference value to pass object to method definitions. So on line `379` the method definition local variable `name` points to the same string object that the local variable `name` point to.

Inside the method on line `380` `name` is reassigned to a new sting object `'bob'`.
Reassignment to a local variable doesn’t mutate the object referenced by that local variable; instead, the variable points to a different object. This is why when we invoke the `puts` method on line `385` with `name` passed to it as an argument it outputs `jim`. 

The `change_name` does not mutate the object passed to it as argument.

## Example 20

What does the following code return? What does it output? Why? What concept does it demonstrate?

```ruby
def cap(str) 
  str.capitalize! # does this affect the object outside the method?
end

name = "jim"
cap(name)
puts name
```
On line `405` the local variable `name` is initialized to the a new string object `'jim'`.
Then on line `406` the `cap` method is invoked and `name` is passed to it as an argument.

On lines `401` to `403` the `cap` method is defined with the parameter `str`. As Ruby uses pass by reference value to pass objects to method definitions. So on line `401` the method definition local variable `str` points to the same string object that the local variable `name` points to.

On line `402` the object referenced by `str` is invoked by the `capitalize!` method. The `capitalize` method mutates the calling object. So now `str` points to the same string object which is now capiatlized. This does effect the object outside the method and this is why when we invoke `puts` method on line `407` and pass it `name` as an argument it outputs `Jim`.

`cap` is a mutating method as it mutates the object passed to it as an argumnet.

## Example 21

Examine the outputs on line `429` and `430`. why is that so.

```ruby
a = [1, 3]
b = [2]

arr = [a, b]
arr[1] = 5

p arr # [[1, 2], 5]
p b # [2]
```
On line `423` we initialize the local variable `a` to the array object `[1, 3]` and on line `424` the local variable `b` is initialized to the array object `[2]`.

On line `426` the local variable `arr` is initialized to the array object where the elements are the objects referenced by `a` and `b` respectively. So now `arr[0]` refrences the object referecend by `a` and `arr[1]` references the object refrenced by `b`.

When on line `427` the element reassignment is called on `arr`, which is a mutating method, the array object refrenced by `arr` is mutated. Now `arr[1]` no longer references the object referenced by `b` but it is bound to a different object. `b` still points to the same array object `[2]`.

## Example 22

Examine the outputs on lines `448` and `449`. why is that so?

```ruby
arr1 = ["a", "b", "c"]
arr2 = arr1.dup

arr2.map! do |char|
  char.upcase
end

p arr1 # ["a", "b", "c"]
puts arr2 # ["A", "B", "C"]
```
On line `441` the local variable `arr1` is initialized to the array object `["a", "b", "c"]`.
Then on line `442` the local variable `arr2` is initilaized to the return value of the `dup` method invocation on the array object referenced by `arr1`.

`dup` returns a shallow copy of the calling collection but the objects contained by the collection are shared.

When on line `444` the `map!` method is invoked on `arr2`. each element is passed to the block and is assigned to the block's local variable `char`. inside the block the `upcase` is called on the current element and it returns a new string which is upcased. So `map!` method will mutate the array object referenced by `arr2` and it contains elements which are returned by the block on each iteration.

As `map!` mutates the calling object, which is a shallow copy, and `upcase` method inside the block does not mutate the calling object so the original collection referenced by `arr1` is not mutated.

## Example 23

What values do `s` and `t` have? Why?

```ruby
def fix(value)
  value.upcase!
  value.concat('!')
  value
end

s = 'hello'
t = fix(s)
```
`s` and `t` points to the same string object `HELLO!`.

On line `473` the local variable `s` is initialized to a new string object `'hello'`. Then on line `474` the local variable `t` is initialized to the return value of the `fix` method invocation with `s` passed to it as an argument.

On lines `467` till `471` the `fix` method is defined with a parameter `value`. As ruby uses pass by reference value when passing objects to method definition. so on line `467` the method definition local variable `value` points to the same object that the local variable `s` points to.

Inside the method on line `468` the `upcase!` method is invoked on the object referenced by `value`. `upcase!` mutates the calling object, so now value is pointing to the same string object which is now upcased.

Then on line `469` the `concat` method is invoked on `value` with the string object `'!'` passed as an argument. `concat` mutates the calling object by appending the object passed to it as an argument. So now `value` references to the same string object which is now appended with the string object `'!'`.

On line `470` we implicity return the object referenced by `value`. So now `t` references to the same object referenced by `s` and `value`. The `fix` method mutates the object passed to it as an argument.

## Example 24

What values do `s` and `t` have? Why?
```ruby
def fix(value)
value = value.upcase
value.concat('!')
end

s = 'hello'
t = fix(s)
```
On line `497` the local variable `s` is initialized to a new string object `'hello'`. Then on line `498` the local variable `t` is initialized to the the return value of the `fix` method invocation with `s` passed to it as an argument.

On lines `492` till `495` the `fix` method is defined with `value` as a parameter. As Ruby uses pass by reference value so the method definition local variable `value` points to the same string object referenced by `s`.

inside the method definition `value` is reassigned to the return value of the `upcase` method invocation on the string object referenced by`value`. As `upcase` does not mutate the calling object but returns a new string object which is upcased so now `value` points to a new string object `'HELLO'`. Then on line `494` the `concat` method is called on the string object referenced by `value` with the string `'!'` passed to it as an argument . The `concat` method mutates the calling object by appending the string object passed to it as an argument so now `value` points to the same string object which is now appended with `'!'` and this is returned by the `fix` method definition implicitly.

This is why `s` still points to the same string object `'hello'` and `t` points to a different string object `'HELLO!'`.

## Example 25

What values do `s` and `t` have? Why?
```ruby
def fix(value)
  value << 'xyz'
  value = value.upcase
  value.concat('!')
end

s = 'hello'
t = fix(s)
```
The local variable `s` is initialized to a new string object `'hello'` on line `518`. Then on line `519` the local variable `t` is initialized to the return value of the method `fix` invocation with `s` passed to it as an argument.

As Ruby uses pass by reference value to pass objects to method definitions. So on line `512` the method definition local variable `value` references the same string object referenced by `s`.On line `513` the `<<` method is invoked on `value` and the string object `xyz` passed to it as an argument, as the `<<` method mutates the calling object by appending the string object passed to it as an argument so the object is also affected outside the method definition referenced by `s`.

So now `s` and `value` refer to the same string object which is now mutated. But on line `514` `value` is reassigned to the return value of the `upcase` method invocation on `value`, which returns a new string object now upcased. Now `value` points to a different string object.

On line `515` the `concat` method is invoked on the object referenced by `value` with `'!'` passed to it as an argument. The `concat` method mutates the calling object by appending the string object passed to it as an argument. As this is the last statement evaluated within the method definition so it is returned implicitly and so `t` now points to the string object `'HELLOXYZ!'` returned by the `fix` method definition. But `s` points to the same string object which is now mutated `'helloxyz'`.

## Example 26

What values do `s` and `t` have? Why?
```ruby
def fix(value)
  value = value.upcase!
  value.concat('!')
end
s = 'hello'
t = fix(s)
```
Because the `fix` method mutates the object passed to it as an argument.

As on line `537` the local variable `s` is initialized to a new string object `'hello'` and the local variable `t` is intialized to the return value of the `fix` method invocation with `s` passed to it as an argument. As Ruby uses pass by reference value to pass objects to method definitions so the method definition local variable `value` referes to the same string object that `s` points to.

Inside the method `value` is reassigned to the `upcase!` method invocation on `value`. As `upcase!` method mutates the calling object and returns it so value still points to the same string object which is now upcased and this also affects the object outside the method definition and `s` to the same string object now upcased.

Then on line `535` the `concat` method is called on `value` with `'!'` passed in as an argument. the `concat` method mutates the calling object by appending the string object passed to it and returns it and so `value` points to the same string object which is now appended with `'!'` and the object is also affected outside the method definition and is also returned implicitly by the method definition.

This shows that `fix` method  mutates the objects passed to it and so `s` and `t` points to the same string object `'HELLO!'`.

## Example 27

What values do `s` and `t` have? Why?

```ruby
def fix(value)
  value[1] = 'x'
  value
end
s = 'abc'
t = fix(s)
```
On line `559` `s` is initialized to a new string object `'abc'`. then on line `560` the local variable `t` is initialzed to the return value of the `fix` method invocation with `s` passed to it as an argument.

On lines `555` to `558` the `fix` method is defined with the parameter `value`. As Ruby uses pass by reference value to pass objects to method definitions so the methdo definition local variable `value` referes the same string object that `s` points to.

inside the method defintion on line `556` the string element reassingment method is called on the string objkect referenced by `value` and the character on index `1` is set to `'x'`. The element reassigment is a mutating method and so `value` points to the same string object which is mutated. then on line `557` the string object referenced by `value` is implicitly returned by the `fix` method definition.

As the `fix` method mutates the object passed to it  and returns it so `s` and `t` point to the same string object `'axc'`.

## Example 28


```ruby
def a_method(string)
  string << ' world'
end

a = 'hello'
a_method(a)

p a
```

on line `578` the local variable `a` is initialized to a new string object `'hello'`. then on line `579` the `a_method` is invoked with `a` passed to it as an argument.

As Ruby uses pass by reference value to pass object to method definitions, so the method definition local variable `string` references the same string object referenced by `a`.

On line `575` the `<<` method is called on `string` with `' world'` passed to it as an argument. The `<<` method mutates the calling object by appending the string object passed as an argument to it. So now `string` and `a` points to the same string object which is now mutated.

This shows that `a_method` mutates the objects passed to it and so line `581` prints `'hello world'` to the console.

## Example 29

```ruby
a = %w(a b c)
a[1] = '-'
p a
```
on line `595` the local variable `a` is initialized to a new array of string.

Then on line `596` using the array element reassignment the element on index `1` of the array object referenced by `a` is reassigned to `'-'`. The element reassignment is a mutating method.

`a` still references the same array object which is now mutated and this is why line on `597` when `p` is invoked with `a` passed to it as an argument it outputs `['a', '-', 'c']`.

## Example 39

```ruby
def add_name(arr, name)
  arr = arr + [name]
end

names = ['bob', 'kim']
add_name(names, 'jim')
puts names
```
On line `612` the local variable `names` is initialized to a array of strings. then on line `613` the `add_names` method is invoked with `names` and the string object `'jim'` passed as an argument.

As Ruby uses pass by reference value to pass objects to method definition, so on line `608` the method definition local variable `arr` and `name` point to the array that `names` references and the string `'jim'` respectively.

On line `609` `name` is reassigned to the return value of `arr + [name]`. As the `+` does not mutate the calling object but returns a new object so `arr` now points to a different array which is appended with a new element `'jim'`.

This shows that `add_name` does not mutate the objects passed to it. So, names still points to the same array object.

## Example 40

```ruby
def add_name(arr, name)
  arr = arr << name
end

names = ['bob', 'kim']
add_name(names, 'jim')
puts names
```
On line `631` the local variable `names` is initialized to a array of strings. then on line `632` the `add_names` method is invoked with `names` and the string object `'jim'` passed as an argument.

As Ruby uses pass by reference value to pass objects to method definition, so on line `627` the method definition local variable `arr` and `name` point to the array that `names` references and the string `'jim'` respectively.

On line `628` `arr` is reassigned to the return value of the `<<` method call on `arr` with `name` as an argument. The `<<` method mutates the calling object and returns the same object now muatated.
`arr` still points to the same array object which is now mutated.

This shows that the `add_name` method mutates the object passed to it and so now `names` points to the same array of string which is now appended with the string `'jim'`.

## Example 41

What does the following code return? What does it output? Why? What concept does it demonstrate?

```ruby
array = [1, 2, 3, 4, 5]

array.select do |num|
  puts num if num.odd?
end
```
The above code returns an empty array and output the string representation of the elemets of the array, referenced by `array`, that are odd.

This is because on line `651` the `select` method is called on the array object referenced by `array`. The `select` method passes each element to the block and is assigned to the block's local variable `num`. The `select` method cares for the truthiness of the block's return value and return a new array with elements for which the block returns a truthy value. In our case the block returns `nil` on each iteration which evaluates to false so none of the elements are selected and an empty array is returned.

## Example 42

What does the following code return? What does it output? Why? What concept does it demonstrate?
```ruby
arr = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
arr.select { |n| n.odd? }
```
The above code will return the array `[1, 3, 5, 7, 9]` and there is no output.

On line `663` the local variable `arr` is initialized to the array object `[1, 2, 3, 4, 5, 6, 7, 8, 9, 10]`. On line `664` the `select` method is called on `arr` with a block passed to it.

The `select` method cares for the truthiness of the block's return value for each element passed to the block. in our case the block returns `true` for the elements which are odd. So the `select` method will return a new array with the odd elements of the calling array.

## Example 43

What does the following code return? What does it output? Why? What concept does it demonstrate?
```ruby
arr = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

new_array = arr.select do |n|
  n + 1
end

p new_array
```
The above code outputs and returns the array object `[1, 2, 3, 4, 5, 6, 7, 8, 9, 10]`.

As on line `676` the local variable `arr` is initialized to the array object `[1, 2, 3, 4, 5, 6, 7, 8, 9, 10]`. Then on line `678` the local variable `new_array` is initialized to the return value of the `select` method call on the array referenced by `arr`.

the `select` method cares for the truthiness of the blocks return value on each iteration. in our case the block returns an integer on each iteration which evaluates to true. So the `select` method returns a new array with all the elements from the calling collection. 

This is why on line `682` when `p` is invoked with `new_array` passed to it as an argument it prints `[1, 2, 3, 4, 5, 6, 7, 8, 9, 10]` and returns the same.

## Example 44

What does the following code return? What does it output? Why? What concept does it demonstrate?

```ruby
arr = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

new_array = arr.select do |n|
  n + 1
  puts n
end

p new_array
```
The code outputs and returns an empty array.

Because `new_array` references an empty array. As on line `699` the `new_array` is initialized to the retun value of `select` method call on the array object referenced by `arr`, which is initialized to an array of integers on line `697`.

The `select` method cares for the truthiness of the blocks return value on each iteration. In our case the block returns `nil`, as the last statement evaluated within the block is `puts n` which returns `nil`, which evaluates to false and so none of the elements of the calling collection are selected. This is why `new_array` points to an empty array.

## Example 45

What does the following code return? What does it output? Why? What concept does it demonstrate?
```ruby
words = %w(jump trip laugh run talk)

new_array = words.map do |word|
  word.start_with?("t")
end

p new_array
```
The above code returns and outputs an array of booleans `[false, true, false, false, true]`.

As on line `716` the local variable `words` is initialzied to a new array of strings. Then on line `718` the local variable `new_array` is initialized to the rerturn value of `map` method call on the array referenced by `words`.

The `map` method uses the blocks return value on each iteration to perform transformation. In our case the block returns a boolean `true` if the element starts with `'t'` and `false` otherwise. So, the `map` method will return a new array of booleans based on the block's return value.

## Example 46

What does the following code return? What does it output? Why? What concept does it demonstrate?

```ruby
arr = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
arr.each { |n| puts n }
```
The above code returns the array object `[1, 2, 3, 4, 5, 6, 7, 8, 9, 10]` and outputs the string representation of each element of the array.

On line `735` the local variable `arr` is initialized to the array of integers. Then on line `736` the `each` method is called on `arr`.

The `each` method does not care for the blocks return value and returns the original calling collection. Inside the block `puts` is invoked and so each element of the calling array is output to the console on respective iteration.

### Example 47

What does the following code return? What does it output? Why? What concept does it demonstrate?

```ruby
arr = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

incremented = arr.map do |n|
  n + 1
end

p incremented
```
The code outputs and returns the array object `[2, 3, 4, 5, 6, 7, 8, 9, 10, 11]`.

On line `749` the local variable `arr` is initialized to the array of integers.

Then on line `751` the local variable `incremented` is initilaized to the return value of the `map` method call on `arr`. On each iteartion the `map` method passes each element of the array object into the block and is assigned to the block's local variable `n`.

Inside the block on each iteration the current element referenced by `n` is incremented by `1`. As `map` uses the block's return value to perform transfomation, so `map` returns a new array with all the elements from the calling collection incremented by `1`. 

`incremented` now points to the array object `[2, 3, 4, 5, 6, 7, 8, 9, 10, 11]`.

## Example 48

What does the following code return? What does it output? Why? What concept does it demonstrate?

```ruby
arr = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
new_array = arr.map do |n|
  n > 1
end

p new_array
```
The code returns and outputs array of booleans `[false, true, true, true, true, true, true, true, true, true]`.

Beacuse `new_array` is initialized on line `773` to the return value of the `map` method call on `arr`, which is initialized on line `772` to array of integers. On each iteration the current element is passed to the block and is assigned to the block's local variable `n`.

The `map` method performs transformation based on the block's return value on each iteration. in our case the block returns `true` for elemenets greater than `1` and `false` otherwise. So, `map` returns a new array of booleans based on the block's return value.

`new_array` points to the array of booleans `[false, true, true, true, true, true, true, true, true, true]`.

## Example 49

What does the following code return? What does it output? Why? What concept does it demonstrate?

```ruby
arr = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

new_array = arr.map do |n|
  n > 1
  puts n
end

p new_array
```
The code outputs and returns an array of `nil`  `[nil, nil, nil, nil, nil, nil, nil, nil, nil, nil]`.

On line `792` the local variable is initialized to an array of integers.

On line `794` the local variable `new_array` si intialized to the return value of the `map` method call on `arr`. On each iteration the current element is assigned to the block's local variable `n`. 

The `map` method uses the block's return value on each iteration to perform transformation. in our case the block returns `nil` on each iteration as the last statement evaluated within the block is `puts` method invocation which returns `nil`. So `map` method returns a new array with all elements of the calling collection are transformed to `nil`.

## Example 50

What does the following code return? What does it output? Why? What concept does it demonstrate?

```ruby
a = "hello"
[1, 2, 3].map { |num| a }
```
The code returns the array of strings `["hello", "hello", "hello"]`.

On line `814` the local variable `a` is initialized to a new string object `"hello"`. Then on line `815` the `map` method is called on the array of integers `[1, 2, 3]`. On each iteration the current element is passed to the block and the block's return value is used to perform transformation.

In our case the block returns the string object referenced by `a`. As `a` is initialized in the outer scope it is accessible in the inner scope defined by the `{..}` followed by the `map` invocation. So, `map` returns a new array object where the elements of the calling array are transformed based on the block's return value.

## Example 51
What does the following code return? What does it output? Why? What concept does it demonstrate?

```ruby
[1, 2, 3].each do |num|
  puts num
end
```
The code returns the array of integers `[1, 2, 3]` and outputs the string representaion of each element of the array `[1, 2, 3]`

As on line `827` the `each` method is called on the array `[1, 2, 3]`. On each iteration the current element of the calling array is passed to the block and is assigned to the block's local variable `num`. Inside the block `puts` method outputs the current element repsectively.

The `each` method does not care for the block's return value and returns the calling object which is the array of integers `[1, 2, 3]`.

## Example 52

```ruby
[1, 2, 3].any? do |num|
  num > 2
end
```
On line `840` the `any?` method is called on the array of integers.

The `any?` method returns `true` if for any elements in the calling array the block returns a truthy value. In our case the block returns a truthy value on the third iteration and so `true` is returned.

## Example 53
```ruby
{ a: "ant", b: "bear", c: "cat" }.any? do |key, value|
  value.size > 4
end
```
On line `850` the `any?` method is called on a hash. On each iteration the current key value pair is passed to the block and are assigned to the block's local variables `key` and `value` respectively.

The `any?` method returns `true` if for any element of the calling object the block returns a truthy value. In our case the block never returns a truthy value and so `any?` returns `false`.

## Example 54
```ruby
[1, 2, 3].all? do |num|
  num > 2
end
```
On line `860` the `all?` method is called on the array object `[1, 2, 3]`.

on each iteration the current element is passed into the block and is assigned to the block's local variable `num`. The `all?` method returns `true` if the block never returns a falsy value for any elements of the calling object.

In our case the block returns a falsy value on the first iteration and so the `all?` method returns `false`.

## Example 55
```ruby
{ a: "ant", b: "bear", c: "cat" }.all? do |key, value|
 value.length >= 3
end
```
On line `872` the `any?` method is called on a hash. On each iteration the current key value pair is passed to the block and are assigned to the block's local variables `key` and `value` respectively.

The `all?` method returns `true` if the block never returns a falsy value on any iteraton. In our case the block returns a truthy value on all the iterations and so the `all?` method returns `true`.

## Example 56

```ruby
[1, 2, 3].each_with_index do |num, index|
  puts "The index of #{num} is #{index}."
end
```
returns the callling object.

outputs three strings where `num` represents the current element and `index` represents the current element index value.

## Example 57
```ruby
{ a: "ant", b: "bear", c: "cat" }.each_with_object([]) do |pair, array|
  array << pair.last
end
```
The `each_with_object` method is called on a hash object.

The `each_with_object ` takes a collection object as an argument which in our case is `[]`. On each iteration the current key/value pair is passed to the block and is assigned to the block's local variable `pair` in the form of a two element array and `array` represents the initial collection passed to the method.

The collection represented by `array` is updated on each iteration. Inside the block on each iteration the last element of the array object represented by `pair` is appended into the array represented by `array` .

The `each_with_object` returns the collection object initially passed in as an argument which is now updated which is `["ant", "bear", "cat"]`.

## Example 58

Why does this code execute line `4`?

```ruby
a = "Hello"

if a
  puts "Hello is truthy"
else
  puts "Hello is falsey"
end
```
On line `1` the local variable `a` is initialized to a new string object `"Hello"`.

Then on line `3` we have the `if` expression where the test case is `a`, which evaluates to true as in Ruby only `false` and `nil` evaluates to false so in our case the test case evaluates to true. 

This is why line `4` is executed and it outputs the string `Hello is truthy`.