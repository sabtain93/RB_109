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
On line `6` the local variable is intialized to a new string object `'Hello'`. Then on line `7` the local variable `b` is initialized to the object referenced by `a`, so `b` and `a` points to the same object. Then on line `8` `a` is reassigned to a new string object `'Goodbye'`.
The concept demonstrted here is that local variables act as pointers and they point to a physical space in memory that holds the value of the object. So when `a` is reassigned a new pointer is created which points to the new string object `Goodbye` and `b` still points to the same string object. This is because reassignment on line `8` does not mutate the object but creates a new reference.

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

The concept demonstrated here is the local variables initialized in the outer scope are accessible in the inner scope and any reassigments or modifications are reflected in the outer scope. This is why line `51` outputs the integer object `3`.

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

The return value of the block is what is returned by the last expression evaluated. Inside the block we use the `break` keyword to exit the loop if the condition `i == 0` evaluates to true, which is the last statement evaluated. So when the condition evaluates to true that will be on the third iteration and as `break` is not passed an argument it will return `nil`. So `nil` is implicitly returned by the method definition.

## Example 5

Examine the output on line `89`. what concept does this demonstrate

```ruby
def greetings(str)
  puts str # outpus Hello
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

On line `108` the `loop` method is invoked with a `do..end` block passed to it, the block defines an inner scope. Inside the block we reassing the local variable `sum` to `sum + arr[counter]` where `arr[counter]` references the element of arr on the index value referenced by `counter`. Next counter is reassigned to the current integer object it references increment by `1`. By using `break` on line `111` we break out of loop when `if` test statement evaluates to true, which will be on the fourth iteration. When we break out of the loop now the local variable `sum` points to the integer object `10` which is the sum of all the elements of array refrenced by `arr`.

This demonstrates the concept that the local variables `arr`, `counter` and `sum` are initialized in an outer scope and so are accessible and can be reassigned and modified which is reflected in the outer scope. Here the inner scope is defined by the `do..end` block followed by the `loop` method invocation. This is why when on line `114` when `puts` method is invoked with `sum` as a parameter it outputs `10`.

## Example 7

Examine the output on line `132`. What concept does this demonstrates?

```ruby
a = 'Bob'

5.times do |x|
  a = 'Bill'
end

p a # Bill
```
On line `127` the local variable `a` is initialized to a new string object `'Bob'`.
Then on line `129` the `times` method is invoked on the integer object `5` and a `do..end` block is passed to it as an argument. Inside the block `a` is reassigned to a new string object `'Bill'`.

This demonstrates the concept that the local variable `a` is initialized in an outer scope is accessible in the inner scope. Here the `do..end` block followed by the `times` method invocation on the integer object `5` defines an inner scope. Any modifications or reassignment to `a` made in the inner scope is relected in the outer scope. This is why on line `133` when `p` is invoked and `a` is passed to it it prints `'Bill'` to the console and returns it.

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

Here the local variable `animal` is initialzied in the outer scope and so it is accesible in the inner scope and can be reassigned which is reflected in the outer scope. The inner scope is defined by the `do..end` block followed by the `loop` method invocation on line `147` and local variables initialized in an inner scope are not accessible in the outer scope.

This is why on line `153` when `puts` is invoked and `animal` is passed to it, it outputs `cat` but on line `154` when `puts` is invoked and `var` is passed to it an error is raised.

## Exapmle 9

Examine the outputs on line `173` and `177`. What concept does this demonstrates?

```ruby
a = 4

loop do |a|
  a = 5
  puts a # 5
  break
end

puts a # 4
```
On line `169` the local variable `a` is initialized to the integer object `4`. Then on line `171` the `loop` method is invoked and `do..end` block is passed to it with `a` as the block's parameter. The `do..end` block followed by `loop` method invocation defines an inner scope.

The block parameter on line `171` has the same name as the local variable `a` initialized in the outer scope. So the block parameter shadows the local variable `a`in the outer scope, and it is not accessible in the inner scope. On line `172` the local variable `a` scoped in the inner scope is assigned to the integer object `5`. This is why on line `173` when the `puts` method is invoked and `a` is passed to it as an argument it outputs `5`.

As the local variable `a` is scoped in the outer scope and is not accessible in the inner scope because it is shadowed by the blocks parameter. So it still points to the same integer object and this why on line `177` when `puts` is invoked and `a` is passed to it as an argument it ouputs `4`.

## Example 10

What does the following code return? What does it output? Why? What concept does it demonstrate?

```ruby
n = 101.times do |n|
  n = 11
end

puts n # 101
```
On line `190` the local variable `n` is initialized in the outer scope to the return value of the `times` method invocation on the integer object `101` with a `do..end` block passed to it, which defines an inner scope.

The `do..end` block's parameter `n` has the same name as the outer scope local variable and this perevents the access of the outer scope local variable in the inner scope. As the block parameter shadows the outer scope local variable `n`.

Inside the block the inner scope local variable is assigned to the integer object `11`. As inner scope local variables are not accessible in the outer scope, on line `194` the puts method invocation with the outer scope local variable `n` passed in as an argument outputs the string representation of the integer `101`. This is because outer scope local variable `n` points to the return value of `times` method invocation on integer object `101` which returns the calling object which in this case is the integer `101`.

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
On line `207` the local variable `animal` is initialized in the outer scope to a new string object `'dog'`.

On line `209` the `do..end` block followed by the `loop` method invocation defines an inner scope. But as the `do..end` block has a parameter with the same name as the outer scope variable, the block parameter shadows the outer scope local variable and perevents its access in the inner scope.

On line `210` the inner scope local variable is assigned to a new string character `'cat'` and this is not reassignment of the outer scope local variable as it is not accessbile in the inner scope. So when on line `214` the `puts` method is invoked with `animal` passed to it as an argument it outputs `dog`. As the outer scope local variable `animal` still points to the same string object `'dog'`.

## Example 11

What are a and b? what conept is demonstrated here?

```ruby
a = "hi there"
b = a
a = "not here"
```
On line `227` the local variable `a` is initialized to a new string object `"hi there"`. Then on line `228` the local variable `b` is initialized to the same string object referenced by `a`. Now both `a` and `b` point to the same string object `"hi there"`. 

On line `229` the local variable `a` is reassigned to a new string object `"not there"`. Now `b` is still pointing to the same string object `"hi there"` but the local variable `a` points to a new and different string object `"not there"`.

This demonstrates the concept that loacl variables act as pointers to physical space in memory and reassignment creates a new and different object and does not mutate the previous object referenced by the local variable.

### Example 12

What are a and b? what concept does this demonstrates?

```ruby
a = "hi there"
b = a
a << ", Bob"
```
on line `242` the local variable `a` is initialized to a new string object `"hi there"`. Then on line `243` the local variable `b` is initialized to the same string object referenced by `a`. So now `a` and `b` points to the same string object `"hi there"`.

On line `244` the local variable `a` is invoked by the `<<` method and the string `", bob"` is passed to it as an argument. So now the local variables `a` and `b` points to the same string object which is now mutated.

This demonstartes the concept that the `<<` method mutates the calling object and does not create a new object. So now `a` and `b` both point to the same string object `"hi there, Bob"`.

## Example 13

What are a, b, and c? What if the last line was `c = a.uniq!`?

```ruby
a = [1, 2, 3, 3]
b = a
c = a.uniq
```
On line `257` the local variable `a` is initialized to a new array object `[1, 2, 3, 3]`. Then on line `258` the local variable `b` is initialized to the same object that `a` points to.

On line `259` the local variable `c` is initialized to the return value of `uniq` method invocation on the object referenced by `a`. `uniq` method returns a new array by removing the duplicate values in the calling array object. So `c` points to the array object `[1, 2, 3]` which is a new array and `a` and `b` still point to the original array object.

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
On line `276` the local variable `a` is initilaized to a new aray object `['a', 'b', 'c']`.
Then on line `278` we invoke the `test` method with `a` passed to it as an argument.

On lines `272` to `274` the `test` method is defined with `b` as its parameter. So as Ruby uses pass by reference value, so on line `272` the method definition local variable `b` points to the same array object that `a` points to.

On line `273` the `map` method is called on the array object referenced by `b`. `map` will return new array with elements based on the return value of the block. The original collection is not mutated. `a` points to the same array object `['a', 'b', 'c']`.

This demonstrtaes that the `test` method is not a mutating method as the original array is not affected. If we would have used the `map!` method it would have transformed the calling collection and `a` and `b` will be pointing to the same array object now mutated/transformed.

## Example 15

What is `a` and `b`? Why?

```ruby
a = 5.2
b = 7.3
a = b
b += 1.1
```

on line `294` the local variable `a` is initilazied to anew float object `5.2` and on line `295` the local variable `b` is initialized to the float object `7.3`. 

On line `296` `a` is reassigned to the float object that `b` references. So now `a` and `b` points to the same float object `7.3`. Then on line `297` `b` is reassigned to the return value of `b + 1.1` which will return the float object referenced by `b` incremented by `1.1`. Now `b` is pointing to a new and different float object which is `8.4` and `a` is still pointing to the float object `7.3`.

This demonstrates that the `+` method does not mutate the calling object but returns a new object. Also `Float` objects are immutable and reassigment does not mutate the object.

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
On line `315` the local variable `test_str` is initialized to a new sting object `'Written Assessment'`. Then on line `316` the `test` method is invoked with `test_str` passed to it as an argument.

On line `310` to `313` the `test` method is defined with `str` as a parameter. As Ruby uses pass by reference value to pass objects to method definition, so on line `310` local variable `str` is pointing to the same string object that `test_str` points to.

Inside the method definition on line `311` `str` is reassigned to the return value of `str + '!'`. As the `+` method returns a new string object so now `str` points to a different string object `'Written Assessment!'` and no longer reference the string object referenced by `test_str`.

The `test` method does not mutate the string object referenced by `test_str` and so on line `317` when we invoke the `puts` method with `test_str` passed to it as an argument and it outputs `written Assessment`.

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
On line `336` the locla variable `a` is intialized to the integer object `3`. Then on line `337` the local variable `b` is initialized to the return value of the method `plus` invocation with `a` and `2` passed to it as an argument

On lines `332` to `334` the `plus` method is defined with `x` and `y` as parameters. As ruby uses pass by reference value so on line `332` `x` references the same object referenced by `a` and `y` points to the integer object `2`.

Inside the method definition on line `333` `x` is reassigned to the return value of `x + y`. The `+` method does not muatate the caller and returns a new integer object `5` and now `x` points to this inetegr object.

So when on line `339` the `puts` method is invoked with `a` passed in as an argument it outputs `3`. `Integer` objects are immutable and the `+` does not mutates the calling object so the `plus` method did not mutate the object referenced by `a`.

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
On line `359` the local variable `y` is initialized to a new string object `'a'`. Then on line `360` the `increment` method is invoked with `y` passed to it as an argument.

On lines `355` to `357` the the method `increment` is defined with `x` as its parameter.

As ruby uses pass by reference value to pass object to method definitions. So on line `355` the method definition local variable `x` points to the same string object `'a'` that `y` points to.

Inside the method definition on line `356` the `<<` method is invoked on the object referenced by `x` and `'b'` is passed to it as argument. The `<<` is a mutating method and mutates the calling object and so `x` points to the same string object which is now mutated.

So `increment` mutates the object passed to it. This is why when we invoke the `puts` method on line `361` with `y` passed to it as an argument it outputs `ab`.

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
On line `381` the local variable `name` is initialized to a new string object `'jim'`. then on line `382` the `change_name` is invoked with `name` passed to it as an argument.

On lines `377` to `379` the `change_name` method is defined with a parameter `name`. As Ruby uses pass by reference value to pass object to method definitions. So on line `377` the method definition local variable `name` points to the same string object that the local variable `name` point to.

Inside the method on line `378` `name` is reassigned to a new sting object `'Bob`.
Reassignment to a local variable doesn’t mutate the object referenced by that local variable; instead, the variable points to a different object. This is why when we invoke the `puts` method on line `383` with `name` passed to it as an argument it outputs `jim`. 

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
On line `403` the local variable `name` is initialized to the a new string object `'jim'`.
Then on line `404` the `cap` method is invoked and `name` is passed to it as an argument.

On lines `399` to `401` the `cap` method is defined with the parameter `str`. As Ruby uses pass by reference value to pass objects to method definitions. So on line `399` the method definition local variable `str` points to the same string object that the local variable `name` points to.

On line `400` the object referenced by `str` is invoked by the `capitalize!` method. The `capitalize` method mutates the calling object. So now `str` points to the same string object which now capiatlized. This does effect the object outside the method and this is why when we invoke `puts` method on line `405` and pass it `name` as an argument it outputs `Jim`.

`cap` is a mutating method as it mutates the object passed to it as an argumnet.

## Example 21

Examine the outputs on line `427` and `428`. why is that so.

```ruby
a = [1, 3]
b = [2]

arr = [a, b]
arr[1] = 5

p arr # [[1, 2], 5]
p b # [2]
```
On line `421` we initialize the local variable `a` to the array object `[1, 3]` and on line `422` the local variable `b` is initialized to the array object `[2]`.

On line `424` the local variable `arr` is initialized to the array object where the elements are `a` and `b`. So now `arr[0]` refrences the object referecend by `a` and `arr[1]` references the object refrenced by `b`.

When on line `425` the element reassiment is called on `arr`, which is a mutating method, the array object refrenced by `arr` is mutated. Now `arr[1]` no longer references the object referenced by `b` but it is bound to a different object. `b` still points to the same array object `[2]`.

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

On line `471` the local variable `s` is initialized to a new string object `'hello'`. Then on line `472` the local variable `t` is initialized to the return value of the `fix` method invocation with `s` passed to it as an argument.

On lines `465` till `469` the `fix` method is defined with a parameter `value`. As ruby uses pass by reference value when passing objects to method definition. so on line `465` the method definition local variable `value` points to the same object that the local variable `s` points to.

Inside the method on line `466` the `upcase!` method is invoked on the object referenced by `value`. `upcase!` mutates the calling object, so now value is pointing to the same string object which is now upcase.

Then on line `467` the `concat` method is invoked on `value` with the string object `'!'` passed as an argument. `concat` mutates the calling object by appending the object passed to it as an argument. So now `value` references to the same string object which is now appended with the string object `'!'`.

On line `468` we implicity return the object referenced by `value`. So now `t` references to the same object referenced by `s`. The `fix` method mutates the object passed to it as an argument.

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
