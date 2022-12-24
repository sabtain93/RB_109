# Practice Exam

You will have 3 hours to complete the test. This test has 23 questions. That is slightly less than 8 mins per question.

Suggested response format (based on feedback from other students & Srdjan’s blog post):

- What does the code output? What are the return values?
- Answer the why behind the output/return:
  - Focus only on the lines of code that deliver the output and return values.
- Summarize what the problem demonstrates and why: i.e. "This problem demonstrates the concept of local variable scope/etc…"
  - This can be at the beginning or end of your answer - personal preference.

The following questions are taken from the shared [RB109 Written Assessment: Practice Problems Google Doc](https://docs.google.com/document/d/16XteFXEm3lFbcavrXDZs45rNEc1iBxSYC8e4pLhT0Rw/edit#)

## 1

What does the following code return? What does it output? Why? What concept does it demonstrate?

```ruby
arr = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

arr.select { |n| n.odd? }
```
The above code return an array of integers `[1, 3, 5, 7, 9]`. It outputs nothing.

In the code on line 20 the local variable `arr` is initialized to the an array object. Then on line 22 the `select` method is invoked on the array object that `arr` references.

The select method iterates over the calling array passing each element into the block assigning it to the block's local variable `n`. Within the block the `odd?` method is invoked on `n`, which returns `true` if the current element referenced by `n` is odd and `false` otherwise.

The `select` method evaluates the return value of the block for its truthiness and select the elements of the calling collection for which trhe block returns a truthy value and storing them in a new array. At the end of the last iteration it returns a new array object containing the selected element.

## 2

What does the following code return? What does it output? Why? What concept does it demonstrate?

```ruby
arr = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

new_array = arr.map do |n| 
  n > 1
end
p new_array
```
The above code returns and outputs the array of booleans `[false, true, true, true, true, true, true, true, true, true]`.

On line 37 the local variable `arr` is initialized to an array of integers. Then on line 39 the local variable `new_array` is initialized to the return value of the `map` method call on the array object that `arr` references.

The `map` method iterates over the calling array referenced by `arr` passing each element into the block assigning it to the block's local variable `n`. Within the block the `>` is called on `n` and `1` is passed to it as an argument. This will return `true` if the element referenced by `n` is greater than `1` and `false` otherwise.

The `map` method returns a new array whose elements are the return value of the block. In our case the block reuturns booleans and that is what is returned.

Now the `new_array` points to this array of booleans returned by `map`. This is why when on line 42 `p` is invoked and `new_array` is passed to it as an argument it prints the array and returns it to.

## 3

What does the following code return? What does it output? Why? What concept does it demonstrate?

```ruby
{ a: "ant", b: "bear", c: "cat" }.all? do |key, value|
  value.length >= 3
end
```
The code returns `true` and outputs nothing.

On line 59 the `all?` method is invoked on a hash object witha block passed to it as an argument. It iterates over the calling hash passing in the key/value pairs into the block where they are assigned to the block's local variable `key` and `value` respectively.

The `all?` method executes the block for each key/value pair and it evaluates the block's return value for its turthiness. If the block returns a truthy value for all the elements in the calling collection the `all?` returns `true` otherwise `false`.

In our case the expression within the block checks the length of the string referenced by `value`
,on each iteration, if it is greater than or equal to `3` and this returns `true` for all the strings referenced by `value`. So, the `all?` method returns `true`.

## 4

What does the following code return? What does it output? Why? What concept does it demonstrate?

```ruby
{ a: "ant", b: "bear", c: "cat" }.each_with_object({}) do |(key, value), hash|
  hash[value] = key
end
```
The above code returns `{"ant"=>:a, "bear"=>:b, "cat"=>:c}`.

On line 77 the `each_with_object` method is called on a hash with a block passed to it as an argument. The `each_with_object` takes a method argument which is a collection object and in this case `{}` a hash which will be returned by the method.

`each_with_object` iterates over the the calling object passing in the key/value pairs to the block where they are assigned to `key` and `value` respectively and the the method argument is assigned to `hash` inside the block.

The `each_with_object` method will return the hash object originally passed in as an argument which is updated on each iteration within the block. Inside the block on each iteration the hash element assigment method is called to set the key referenced by `value` to the value that is referenced by `key` on each iteration.

So a new hash is returned after all iterations are completed where the keys from the calling hash are now values and the values from the calling hash are now set as keys.



## 5

What does the following code return? What does it output? Why? What concept does it demonstrate?

What are a, b, and c? What if the last line was `c = a.uniq!`?

```ruby
a = [1, 2, 3, 3]
b = a
c = a.uniq
```
The above code returns `[1, 2, 3]`.

On line 94 the local variable `a` is initialized to an array object. Then on line 95 the local variable `b` is initiliazed to the object referenced by `a`.

On line 96 the local variable `c` is intialized to the return value of the `uniq` method call on the array object referenced by `a`. `uniq` returns a new array object with the elements of the calling array removing the duplicate elements in it. So, `c` points to a new array `[1, 2, 3]`.

`a` and `b` still point to the same array object `[1, 2, 3, 3]`.

If the last line was `c = a.uniq!`. Then `a`, `b` and `c` will be pointing to the same array object. As `uniq!` is a desturctive method and it removes the duplicate elements of the calling collection and returns same object now mutated.

This demonstrates that variable act as pointers and mutating method mutate the calling object and do not create a new object.


## 6

What does the following code return? What does it output? Why? What concept does it demonstrate?

What values do `s` and `t` have? Why?

```ruby
def fix(value)
 value[1] = 'x'
 value 
end

s = 'abc'
t = fix(s)
```
The code returns the string object `axc`.

`s` is now `axc` and so is `t` and they both point to the same object.

On line 123 the local variable `s` is initialized to a new string object `abc`. Then on line 124 the local variable `t` initialized to the return value of the method call `fix` passing in the string object that `s` references.

On lines 118 to 121 the `fix` method is defined with one parameter `value`. As Ruby uses pass by reference value when passing object to method definitions, so now `value` references to the same string object that `s` references.

Inside the method definition on line 119 the `[]=` method is called on `value` with `'x'` passed to it as an argument. The character reassignment method is destructive and so the string object referenced by `value` is mutated and the object is also affected outside the method definition. The mutates string referenced by `value` is implicitly returned by `fix` method definition on line 120.

Now `t` references the string object `'axc` which is the same object referenced by `s`.

## 7

What does the following code return? What does it output? Why? What concept does it demonstrate?

```ruby
def a_method(string)
  string << ' world'
end

a = 'hello'
a_method(a)

p a
```
The code returns and outputs the string object referenced by `a` which is `'hello world'`.

As on line 147 the local variable `a` is initialized to a new string object. Then on line 148 the the `a_method` is invoked with `a` passed in as an argument.

On lines 143 to 145 the `a_method` method is defined with one parameter `string`. As Ruby uses pass by reference value when passing object to method definitions, so now `string` references to the same string object that `a` references.

Within the method definition the `<<` method is invoked on `string` with `' world'` passed in as an argument. The `<<` method mutates the calling object by appending it with the string passed in as an argument and retruns the calling object which is now mutated. This mutation affects the object outside the method definition.

Now the local variable `a` points to the same string object which has the value `'hello world'`.
## 8

What does the following code return? What does it output? Why? What concept does it demonstrate?

What values do `s` and `t` have? Why?

```ruby
def fix(value)
  value = value.upcase!
  value.concat('!')
end

s = 'hello'
t = fix(s)
```
The above code will return the string `'HELLO!'` and no output.

On line 179 the local variable `s` is initilaized to a new string object `'hello'`. Then on line 180 the local variable `t` is initialized to the return value of the `fix` method call with `s` passed in as an argument.

On lines 174 to 177 the `fix` method is defined with `value` as a parameter. As Ruby uses pass by reference value to pass objects to method definitions, so `value` points to the same string object that `s` points to.

Inisde the `fix` method definition `value` is reassigned to the return value of the `upcase!` method call on `value`. The `upcase!` method mutates the calling object and returns the calling object which is mutated. So `value` still points to the same object now upcased. Then on line 176 the `concat` method is called on `value` with `'!'` passed in as an argument. The `concat` method mutates the calling object by appending the object passed to it as a parameter. So now `value` still points to the same object whoes value is `'HELLO!` which is implicitly returned by the `fix` method definition.

So now `s` and `t` both point to the same object whose value is `'HELLO!'`.

This demonstrtaes the concept that `fix` method mutates the object passed to it as an argument.


## 9

What does the following code return? What does it output? Why? What concept does it demonstrate?

```ruby
a = “Hello”
b = a
a = “Goodbye”
puts a
puts b
```
The above code outputs `Goodbye` and `Hello` in this order and returns `nil`.

On line 200 the local variable `a` is initialized to a new string object `'Hello'`. Then on line 201 the local variable is intialized to the same string object that `a` references.

Then on line 202 `a` is reassigned to a new string object `'Goodbye'`, `b` still points to the same object. What this shows is that reassignment to a variable doesn’t mutate the object referenced by that variable; instead, the variable is bound to a different object.

So when on line 203 `puts` is invoked with `a` passed to it as an argument it outputs `Goodbye` and on line 204 when puts is invoked with `b` passed to it as an argument it outputs `Hello`.


## 10

What does the following code return? What does it output? Why? What concept does it demonstrate?

```ruby
a = "hello"

[1, 2, 3].map { |num| a }
```
The above code returns `["hello", "hello", "hello"]` and outputs nothing.

On line 220 the local variable `b` is initialized to a new string object `'hello'`. Then on line 222 the `map` method is called on an array of integers with a block passed to it as an argument.

The `map` method iterates through the calling array passing each element into the block where it is assigned to the blocks local variable `num`. The code within the block is executed for each element of the calling array. `map` stores the return value of the block on each iteration in a new array and returns the array when the iterations are complete. 

In our case the block returns the string object referenced by `a`, as `a` is initialized in the outer scope it is accessible in the inner scope defined by the block `{..}` follwed by `map` method invocation. On each iteration the block returns the string `'hello'` which is stored on each iteration in a new array and returned by `map` when it stops iterating on the calling array.


## 11

What does the following code return? What does it output? Why? What concept does it demonstrate?

```ruby
[1, 2, 3].each do |num|
  puts num
end
```
The above code returns the array `[1, 2, 3]`.

As on line 238 the `each` method is called on the array object `[1, 2, 3]` with a block passed to it as an argument. The `each` iterates through the calling array executing the block for each element.

The `each` method returns the original calling collection regardless of the block's return value.


## 12

What does the following code return? What does it output? Why? What concept does it demonstrate?

```ruby
arr = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

incremented = arr.map do |n|
              n + 1
            end
p incremented
```
The above code outputs and returns `[2, 3, 4, 5, 6, 7, 8, 9, 10, 11]`.

As on line 254 the `arr` local variable is initialized to the array object `[1, 2, 3, 4, 5, 6, 7, 8, 9, 10]`. 

Then on line 256 the local variable `incremented` is initialized to the return value of the `map` method call on `arr` with a block passed to it as an argument.

The map method iterates over the calling array and invokes the block passing the current element into the block on each iteration where it is assigned to the block's local variable `n`.
The map method executes the expression within the block on each iteration and in our case the current integer referenced by `n` is incremented by `1` and returned by the block. The `map` method returns a new array object where the elements are the block's return value on each iteration.

So now `incremented` points to the array object `[2, 3, 4, 5, 6, 7, 8, 9, 10, 11]` and when on line 259 the `p` method is invoked and `incremented` is passed to it as an argument it outputs `[2, 3, 4, 5, 6, 7, 8, 9, 10, 11]`.
## 13

What does the following code return? What does it output? Why? What concept does it demonstrate?

```ruby
a = 4

loop do
  a = 5
  b = 3


  break
end

puts a
puts b
```
The above code outputs `5` and raises an error `undefined local variable or method`.

As on line 276 the local variable `a` is initialized to integer object `4`. Then on line 278 the `loop` method is invocation with a `do..end` passed to it as argument defines a block.

Inside the block `a` is reassigned to the integer object `5`. Then on line 280 the local variable `b` is initialized to the integer object `3` in the inner scope defined by the `do..end` follwed by the `loop` method invocation.

A local varibale initialized in an outer scope can be accessed in an inner scope but not the other way around.


So when on line 286 the `puts` method is invoked with `a` passed to it as an argument it outputs `5`but line 287 raises an error as `b` is intialized in an inner scope and so is not accessible in the outer scope.



## 14

What does the following code return? What does it output? Why? What concept does it demonstrate?

```ruby
a = 'Bob'

5.times do |x|
  a = 'Bill'
end

p a
```
The above code will output `'Bill'` and returns the same.

As on line 307 the local variable is initalized to a new string `'Bob'`.

Then on line 309 the `times` method is invoked on the integer object `5` with a `do..end` block passed to it as an argument. The `do..end` block follwed by the `times` method invocation defines an inner scope and in Ruby the outer scope local variable is accessible in an inner scope.

So on line 310 `a` is reassigned to a new string object `Bill` and so when on line 313 the `p` method is invoked with `a` passed to it as an argument it outputs `'Bill'`.


## 15

What does the following code return? What does it output? Why? What concept does it demonstrate?

```ruby
def increment(x)
  x << 'b'
end

y = 'a'
increment(y) 

puts y
```
The above code outputs `ab` and returns `nil`.

As on line 333 the local variable `y` is initialized to a new string object `'a'`. Then on line 334 the `increment` method is invoked with `y` passed to it as an argument.

On lines 329 to 331 the `increment` method is defined with onw parameter `x`. As Ruby uses pass by reference value when passing objects to method definition so `x` points to the same string object that `y`points to.

Within the method definiton on line 330 the `<<` method is invoked on `x` with `'b'` passed to it as an argument. The `<<` mutates the calling object by appending it with the object passed to it and returns the same calling object now mutated.

So now `y` points to the same object which is now mutated which has the value `'ab'`. This is why when `puts` is invoked on line 336 with `y` passed to it as an argumnet it outputs the string `ab`.

## 16

What does the following code return? What does it output? Why? What concept does it demonstrate?

```ruby
arr1 = ["a", "b", "c"]
arr2 = arr1.dup
arr2.map! do |char|
  char.upcase
end

puts arr1 
puts arr2
```
The above code outputs `a` `b` `c` and `A`, `B`, `C` in this order and retuns `nil`.

In the above code the local variable `arr1` is intialized to the array object `["a", "b", "c"]`.
Then on line 354 the local variable `arr2` is initialized to the return value of `dup` method call on `arr1`. The `dup` returns a copy of the object it is called on but the object within that object are shared. So now `arr2` points to the copy of the array object referenced by `arr1` but the string objects within the arrays are shared.

Then on line `355` the `map!` method is called on `arr2` with a block passed to it as an argument. The `map!` iterates through the calling array and invokes the block on each iteration passing the current element into the block where it is assigned to the block's local variable `char`. The code within the block is executed on each iteration. `map!` mutates the calling array by transforming its elements based on te block's return value. 

Inside the block the `upcase` method is called on `char` and so the block returns the upcassed string referenced by `char` on respective iteration. So now `arr2` now points to the same array object with all elements upcassed. As the `upcase` method is non-mutating so `arr1` still points to the same object with the value `["a", "b", "c"]`.

This is why when on lines 359 and 360 `puts` outputs `a` `b` `c`, `A`, `B`, `C` respectively.

## 17

What does the following code return? What does it output? Why? What concept does it demonstrate?

```ruby
arr = [1, 2, 3, 4]

counter = 0
sum = 0

loop do
  sum += arr[counter]
  counter += 1
  break if counter == arr.size
end 

puts "Your total is #{sum}"
```

## 18

What does the following code return? What does it output? Why? What concept does it demonstrate?

```ruby
arr = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

new_array = arr.select do |n|
  n + 1
end
p new_array
```
The above code will output the array `[1, 2, 3, 4, 5, 6, 7, 8, 9, 10]`.

As on line 397 the local variable `arr` is initialized to the array `[1, 2, 3, 4, 5, 6, 7, 8, 9, 10]`. Then on line 399 the local variable is initialized to the return value of the `select` method call on `arr` with a block passed to it as an argument.

The `select` method iterates over the calling array and invokes the block on each iteration passing current element into the block where it is assigned to the block's local variable `n`. The `select` method executes the block on each iteration and evaluates the truthiness of the block's retun value.

Within the block the current element referenced by `n` is increment by `1` and is returned by the block and it evaluates to true. As in Ruby only `false` and `nil` evaluates to false, so the `select` method returns a new array object with all the elements of the calling array as the block return value for all the elements of the calling array evaluates to true.

This is why on line 402 the `p` method invocation with `new_array` passed to it outputs the array object `[1, 2, 3, 4, 5, 6, 7, 8, 9, 10]`.

## 19

What does the following code return? What does it output? Why? What concept does it demonstrate?

```ruby
[1, 2, 3].any? do |num|
  num > 2
end
```
The above code returns the boolean `true`.

As on line 419 the `any?` method is invoked on the array object `[1, 2, 3]` with a block passed to it as an argument. `any?` iterates over the calling array passing each element into the block and assigning it to the block's local variable `num`. `any?` returns `true` if for any element of the calling array the block returns a truthy value.

In our case the block returns a truthy value on the the third iteration and so `any?` returns `true`.


## 20

What does the following code return? What does it output? Why? What concept does it demonstrate?

```ruby
def fix(value)
  value.upcase!
  value += '!'
  value
end

s = 'hello'
t = fix(s)
```
The above code returns the string `'HELLO!'`.

As on line 441 the local variable `s` is initialized to the a new string object `'hello'`. then on line 442 the local variable `t` is initialized to the return value of `fix` method invocation with `s` passed to it as an argument.

On lines 435 to 439 the `fix` method is defines with one parameter `value`. As Ruby uses pass by reference value to pass object to method definitions so `value` points to the same string object that `s` points to.

Inside the method the string object referenced by `value` is mutated by the destrutive `upcase!` method call on `value`. Now value points to the same string object which is now mutated. Then on line 437 `value` is reassigned to the return value of `+` method call on `value` with `'!'` passed to it as an argument. As the `+` method is non destructive and reassignement bounds the varaible to different object so now `value` points to a new string object which is returned implicitly by the method definition

This is why `s` and `t` points to different string objects.


## 21

What does the following code return? What does it output? Why? What concept does it demonstrate?

What values do `s` and `t` have? Why?

```ruby
a = 4
b = 2

loop do
  c = 3
  a = c
  break
end

puts a
puts b
```
Line 471 outputs `3` and returns `nil`.

As the local variable `a` is initialized  to the integer `4` in the outer scope. Then on line 465 the `loop` method is invoked with `do..end` passed to it as an argument which defines an inner scope. 

Inside the block the local variable `c` is initialzied to the integer object `3`. On line 467 `a` is reassigned to the integer object that `c` points to.

As local variables initialized in the outer scopr are accessible in the inner scope and any modification or reassigments to them are reflected in the outer scope. This is why when on line 471 the `puts` method is invoked with `a` passed to it as an argument its outputs `3`.

## 22

What does the following code return? What does it output? Why? What
concept does it demonstrate?

```ruby
a = %w(a b c)
a[1] = '-'
p a
```
The above code outputs and return the array `['a', '_', 'c']`.
This demonstrates that the array element reassignment is destructive and the local variable `a` still points to the same array object which is now mutated.


## 23

What does the following code return? What does it output? Why? What
concept does it demonstrate?

```ruby
def add_name(arr, name)
  arr = arr + [name]
end

names = ['bob', 'kim']
add_name(names, 'jim')
puts names
```
This demonstrates that reassigment is non destrutive and it bound the variable with a new object. Line 488 outputs the array `['bob', 'kim']`.

As on line 486 the local variable `names` is initialized to the array object `['bob', 'kim']`.
Then on line 487 the `add_name` method is called with `names` and the string `'jim'` passed to it as an argument.

On lines 482 to 484 the `add_name` method is defined with two parameters `arr` and `name`. As Ruby uses pass by reference value when passing object to method definitions so `arr` points to the same object that `names` points to and `name` points to the array object `'jim'`.

Within the method `arr` is reassigned to the `+` method call on `arr` with `[name]` passed to it as an argument. As `+` is a non-destructive call so now `arr` points to a new array object.

`names` still points to the same array object and this is why line 488 outputs `['bob', 'kim']`.





## 1

What does the following code return? What does it output? Why? What concept does it demonstrate?

```ruby
arr = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

arr.select { |n| n.odd? }
```
`arr` is intialized to an array of integers. On `line 8` `select` method is called on `arr`.
Each element of `arr` is passed into the block and assigned to the block's local variable `n`. Within the block the `Integer#odd?` method is invoked on `n`, which returns `true` if the current element is odd and `false` otherwise. As `n.odd?` is the last statement evaluated inside the block it de3termines the blocks return value. `select` method evaluates the block's return value for its truthiness and select the elements for which the block returns a truthy value. In our case the `select` will return a new array containing elements from the calling collection which will be `[1, 3, 5, 7, 9]`. There will be no output. This demonstrates the concept that blocks have an implicit return value and how `select` evaluates and performs selection based on the blocks return value.

## 2

What does the following code return? What does it output? Why? What concept does it demonstrate?

```ruby
arr = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

new_array = arr.map do |n| 
  n > 1
end
p new_array
```
On `line 18` `arr` is intialized to an array of integers. On `line 20` `new_arr` is intialized to the return value of `Array#map` method call on `arr`. Each element of the `arr` is passed to the block by and assigned to the block's local varibale `n`. `map` method evaluates the block's return value and performs transformation based on it. The blocks return value is the last statement evaluated within the block, in our case the last statement evaluated is `n > 1` which returns `true` if the current element is greater than `1` and retruns `false` otherwise. So `map` will return a new array with elements based on the blocks return value which will be `[false, true, true, true, true, true, true, true, true, true]`. On `line 23` `p` method is invoked and `new_array` is passed to it as an argument this will print the array `[false, true, true, true, true, true, true, true, true, true]` referred by `new_array` and return this array too. This demonstrates the concept of block's implict return value and how map uses the blocks return value to perform transformation.

## 3

What does the following code return? What does it output? Why? What concept does it demonstrate?

```ruby
{ a: "ant", b: "bear", c: "cat" }.all? do |key, value|
  value.length >= 3
end
```
On `line 31` `all?` method is called on the hash. Each key/value pair is passed to the block and is assigned to `key` and `value` respectively. `all?` method returns `true` if for every element of the calling object the block returns a truthy value, if for even one element the block returns a falsy value then `all?` will return `false`. The block's return value is determined by the last statement evaluated within the block. In our case the statement `value.length >= 3` is last satemenet evaluated and it evaluates to true for all the strings refrenced by `value` respectively. So `true` is returned by `all?` method call on the hash `{ a: "ant", b: "bear", c: "cat" }`. This demonstrates the concept that blocks have an implicit return value and how `all?` method uses the blocks return value.

## 4

What does the following code return? What does it output? Why? What concept does it demonstrate?

```ruby
{ a: "ant", b: "bear", c: "cat" }.each_with_object({}) do |(key, value), hash|
  hash[value] = key
end
```
On `line 43` the `each_with_object()` is called on a hash and `{}` is passed as an argument to the method. Each key/value pair is passed to the block and is assigned to the block's local variable `key` and `value` respectively and `hash` is intialized to an empty hash `{}` which was originally passed to the method as an argument which will be returned by `each_with_object()` after it has completed iterating over the calling object. Inside the block the `hash` is updated with key as `value` and value as `key` on each iteration using the hash element assignment method `[]=`. The block returns the updated `hash` on each iteration and so the `each_with_object()` will return the final updated Hash object referred by `hash`. This demonstrates how the `each_with_object()` uses the blocks return value and return the original object passed to it as an argument.

## 5

What does the following code return? What does it output? Why? What concept does it demonstrate?
What are a, b, and c? What if the last line was c = a.uniq!?

```ruby


a = [1, 2, 3, 3]
b = a
c = a.uniq
```

 on `line 56` `a` is intialized to an array of integers. On `line 57` `b` is intialized to the object referenced by `a`. On `line 58` `c` is intialized to the return value of `a.uniq` which will return a new array by removing the duplicate values in the array which is referenced by `a`. So now `c` points to the array of integer `[1, 2, 3]` and `a` points to the original object it was intialized to and `b` is also pointing to the same object. If the last line was changed to `c = a.uniq!`, here `uniq!` method is a destructive method which will mutate the array by removing the duplicate elements in the original object. Now `c`, `a`, and `b` will point to the same array object `[1, 2, 3]`. This demonstartes the concpet of variables as pointers and the difference between mutating and non-mutating methods.

## 6

What does the following code return? What does it output? Why? What concept does it demonstrate?

What values do s and t have? Why?

```ruby
def fix(value)
 value[1] = 'x'
 value 
end

s = 'abc'
t = fix(s)
```
On `line 76` `s` is initialized to a string object. On `line 77` `t` is intialized to the return value of the `fix` method invocation with `s` passed to it as an argument. From `line 71` to `line 74` the `fix` method is defined with `value` as a parameter. Now `value` is assigned to the string object referenced by `s`. inside the method string element assignment method `[]=` is invoked and the character on index `1` is changed to `x` which is a mutating method. As `value` is the last statement evaluated inside the method so `value` is implicitly returned by it which references the mutated string object `'axc'`. `t` also references to the string object `'axc'` which is the same object refrenced by `s`. This demonstrates the concept of mutating methods and how variables are passed to method defintions.

## 7

What does the following code return? What does it output? Why? What concept does it demonstrate?

```ruby
def a_method(string)
  string << ' world'
end

a = 'hello'
a_method(a)

p a
```
On `line 90` the local variable `a` is intialized to a string object. On `line 91` the method `a_method` is invoked and `a` is passed to it as an argument. On `line 86` to `line 88` the `a_method` is defined with `string` as a parameter. Now `string` refrences the same object referenced by `a`. Inside the method the `String#<<` method is invoked on `string` and `' world'` is passed in as an argument the `#<<` method is a destructive method which will concatenate the object passed to it as an argiment to the calling object. Now `string` and `a` refrence the mutated string object `'hello world'`. On `line 93` `p` method is invoked and `a` is passed to it as an argument which will print the object referenced by `a` to the console and return the same object. Thsi demonstartes the concept of mutating methods and how variables are passed to method definitions.

## 8
What does the following code return? What does it output? Why? What concept does it demonstrate?

What values do s and t have? Why?

```ruby
def fix(value)
  value = value.upcase!
  value.concat('!')
end

s = 'hello'
t = fix(s)
```
On line `108` the local varibale `s` is intialized to a new string object `"hello"`.
On line `109` The local varibale `t` is initializied to the return value of `fix` method invocation and `s` is passed to it as an argument. from line `103` to line `106` the `fix` method is defined with a parameter `value`. Now `value` references the same string object that `s` points to. On line `104` method local varibale `value` is reassinged to the return value of `String#upcase!` method call on the string refrenced by `value`. `upcase!` is a destructive method which mutates the calling object and returns it. Now `value` is reassigned to the same  string object which is now upcased. On line `105` the `String#concat` method is called on the string object referenced by `value` and `'!'` is passed in as an argument. The `concat()` method will mutate the calling object by appending the string object refrenced by `value` with the `'!'` and return the string `'HELLO!'`, which is implicitly returned by the method `fix` as it the last statement evaluated within the method. Now `s` points to the same string object which is now upcased and appended with `"!"` and `t` points to the same string object which is `'HELLO!'`. This demonstrates the concept of mutating and non mutating methods and how variable are passed to method definitions.

## 9

What does the following code return? What does it output? Why? What concept does it demonstrate?

```ruby
a = “Hello”
b = a
a = “Goodbye”
puts a
puts b
```
On line `119` the local variable `a` is initialized to a new string object `"Hello"`. On line `120` the local varibale `b` is initialized to the string object referenced by the local varibale `a`. On line `121` the local varibale `a` is reassigned to a new string object `"Goodbye"`. On line `122` `puts` will output the string object referenced by the local variable `a` which is `"Goodbye"` and return `nil`. On line `123` `puts` will output the string object referenced by the local varibale `b` which is `"Hello"`. This demonstartes the concept of local variables as pointers.

## 10

What does the following code return? What does it output? Why? What concept does it demonstrate?

```ruby
a = "hello"

[1, 2, 3].map { |num| a }
```
On line `132` the local variable `a` is initialized to a new string object `"hello"`.
On line `134` the `Array#map` method is called on the array of integers. Each element of the array is passed to the block and is assigned to the block's local variable `num`. `map` evaluates the blocks return value and performs transformation based on it. Block's return value is determined by the last statement evaluated within the block. In our case `a` is the last statement evaluated within the block  which will return the string object `"hello"`. `map` method will return a new array which will contain the block's return value for each iterration performed. So `map` returns the array `["hello", "hello", "hello"]`. This demonstrates the concept of implicit return value of blocks and how `map` method uses it to perform transformation.

## 11

What does the following code return? What does it output? Why? What concept does it demonstrate?

```ruby
[1, 2, 3].each do |num|
  puts num
end
```
On line `144` the `Array#each` method is invoked on the array object `[1, 2, 3]`. Each element of the array is passed to the block and is assigned to the block's local variable `num`. Within the block `puts` method is invoked and `num` is passed to it as an argument. `puts` will output the object referenced by `num` which is `1`, `2`, and `3` respectively and return `nil`. `each` method does not care for the blocks return value and returns the calling object which will be returned by the code.

## 12

What does the following code return? What does it output? Why? What concept does it demonstrate?

```ruby
arr = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

incremented = arr.map do |n|
              n + 1
            end
p incremented
```
On line `155` the local variable is initialized to the array `[1, 2, 3, 4, 5, 6, 7, 8, 9, 10]`.
On line `157` the local varibale `incremented` is initialized to the return value of the `map` method call on the local varibale `arr`. Each element of the array object referred by `arr` is passed to the block and is assigned to the block's local variable `n`. within the block each element is incremented by `1` and is returned respectively which is also the block's return value as it is the last statemnet evaluated within the block. `map` evaluates the blocks return value and performs transformation based on it. `map` will return a new array object which conatins the values returned by the block on each iteration. Now the local varibale points to the array object `[2, 3, 4, 5, 6, 7, 8, 9, 10, 11]`. On line `160` `p` will print out the array object that the local variable `incremented` references to the console and return it to. This demonstrates that blocks have an implicit return value and `map` uses the block's return value to perform transformation.

## 13

What does the following code return? What does it output? Why? What concept does it demonstrate?

```ruby
a = 4

loop do
  a = 5
  b = 3


  break
end

puts a
puts b
```
On line `170` the local variable `a` is initialized to a new integer object `4`. On line `172` the `loop` method is invoked and the `do..end` block is passed in as an argument. Inside the block on line `173` the local variable `a` is reassigned to a new integer object `5` and then on line `174` the local variable `b` is intialized to a new integer object `3`. Then on line `177` the `break` keyword is executed and we exit the `loop` method invocation with a block. On line `180` the `puts`outputs the object referenced by `a` which is now `5`. Then line `181` is executed which will raise a error 'undefined local variable or method'. This demonstartes the concept of local variable scoping rule that local variable initialized outside a block are accessible and can be reassigned inside the block but local variables initialized inside a block are not accessible outside it.

## 14

What does the following code return? What does it output? Why? What concept does it demonstrate?

```ruby
a = 'Bob'

5.times do |x|
  a = 'Bill'
end

p a
```
On line `190` the local varibale `a` is initialized to a new string object `'Bob`. On line `192` the `#times` method is invoked on the integer `5` and is passed a block as an argument. The `#times` method will iterate the given block `5` times, passing in values from zero to `5-1` and will return the calling object which in our case is the integer `5`. Inside the block on each iteration the local variable `a` is reassigned to a new string `Bill`. On line `196` `p` method will print string object pointed by `a` which is now the string `'Bill'` and returns this string too. This demonstrates the concept that local variables initialized outside a block are accessible and can be reassigned inside a block.

## 15

What does the following code return? What does it output? Why? What concept does it demonstrate?

```ruby
def increment(x)
  x << 'b'
end

y = 'a'
increment(y) 

puts y
```

On line `209` the local variable `y` is initialized to a new string object `'a'`. On line `210` `increment` method is invoked and `y` is passed in as an argument. On line `205` to `207` the `increment` method is defined with a parameter `x`. So now `x` and `y` point the same string object. On line `206` the `String#<<` is invoked on `y` and string `'b'` is passed to it as an argument. The `#<<` method mutates the calling object by appending the string `'b'` to it and returns it too. On line `212` the `puts` method will out the string object referred by the local variable `y` which is now `'ab'`. This demonstartes concept that in Ruby objects are passed by reference value to method definitiona and the object passed can be mutated by the method definition if the object is mutable and the method invoked on the object mutates it.

## 16

What does the following code return? What does it output? Why? What concept does it demonstrate?

```ruby
arr1 = ["a", "b", "c"]
arr2 = arr1.dup
arr2.map! do |char|
  char.upcase
end

puts arr1 
puts arr2 
```
On line `222` the local variable `arr1` is intialized to an array of strings `["a", "b", "c"]`. On line `223` the local variable `arr2` is intialized to return value of the `dup` method invocation on the array object referenced by `arr1`. So now `arr2` points to a shallow copy of the array object referenced by `arr1`. on line `224` the `map!` method is invoked on the array object refrenced by `arr2`. Each element of array is passed into the block and is assigned to the block's local variable `char`. Inside the block the `#upcase` method is invoked on `char`, this will return a new string object upcased which is referenced by `char` on each iteration which is also the block's return value as it is the last statement evaluated within the block. The `#map!` method evaluates the blocks return value and performs transformation based on it. As the `#map!` is a mutating method it will transform the calling collection based on the block's return value and will return the same collection now trasnformed. On line `228` `puts` will output the string representation of each element referenced by `arr1` which will be `a`, `b`, `c` respectively. On line `229` `puts` will output the string representation of each element of the array referenced by `arr2` which will be `A`, `B`, and `C` respectively. This demonstrates the concept of that when a shallow copy of collection is created using the method `#dup` the objects contained by the collection are shared and as in our case the `#map!` is destructive method called on the array object and not on the objects contained by it so the array object referenced by `arr1` is not mutated.

## 17

What does the following code return? What does it output? Why? What concept does it demonstrate?

```ruby
arr = [1, 2, 3, 4]

counter = 0
sum = 0

loop do
  sum += arr[counter]
  counter += 1
  break if counter == arr.size
end 

puts "Your total is #{sum}"
```
On line `238` the local varibale `arr` is initialized to a new array object `[1, 2, 3, 4]`. On line `240` the local variable `counter` is initialized to the integer `0` and on line `241` the local variable `sum` is initialized to the integer `0`. On line `243` the `loop` method is invoked with a `do..end` block passed to it as an argument. Inside the block on each iteration the loacl varibale `sum` is reassigned to the sum of the integer referenced by it and the current element of array refrenced by `arr` by using the array element reference method `#[]`. Then the integer object refrenced by `counter` is incremented by `1` and then on line `246` the we break out of the loop if the `if` condition `counter == arr.size` is evaluated to be true. When `loop` stops iterating the local variable `sum` now references to the integer object `10`. On line `249` `puts` outputs `your total sum is 10`. This demonstrates the concept that local variables scoped outside a block are accessible and can be reassigned inside the block

## 18
What does the following code return? What does it output? Why? What concept does it demonstrate?

```ruby
arr = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

new_array = arr.select do |n|
  n + 1
end
p new_array
```
On line `257` the local variable `arr` is initialized to a new array `[1, 2, 3, 4, 5, 6, 7, 8, 9, 10]`. On line `259` the local variable `new_array` is initialized to the return value of `select` method invocation on the array object referenced by `arr`. Each element of the array is passed to the block and is assigned to the block's local variable `n`. Within the block the `#+` method is invoked on `n` and the integer `1` is passed to as an argument which will return the current element incremented by one which is also the block's return value as it is the last statement evaluated within the block. `select` method evaluates the truthiness of the block's return value to and returns a new array with the elements for which the block returns a truthy value. in our case on each iteration the return value is an integer which evaluates to true. So `select` method will return a new array with all the elements from the original collection. On line `262` `p` will print the array referenced by the local variable `new_array` which is `[1, 2, 3, 4, 5, 6, 7, 8, 9, 10]`. This demonstrates the concept that blocks have an implicit return value and how the #select method evaluates the blocks return value.

## 19

What does the following code return? What does it output? Why? What concept does it demonstrate?

```ruby
[1, 2, 3].any? do |num|
  num > 2
end
```
On line `271` the method `#any?` is invoked on the array `[1, 2, 3]`. Each element is passed to the block and is assigned to the block's local varibale `num`. `any?` evaluates the blocks return value for its truthiness that if for any element the block returns a truthy value then `any?` returns `true` otherwise it will return `false`. In our case the block returns a truthy value on the second iteration as `num > 2` when `num` referes to `2` evaluates to true and as this is the last statement evaluated inside the block it is also the blocks return value. This demonstrates that blocks have an implicit return value and `any?` stops iterating when the block returns a truthy value and returns `true`.

## 20

What does the following code return? What does it output? Why? What concept does it demonstrate?

```ruby
def fix(value)
  value.upcase!
  value += '!'
  value
end

s = 'hello'
t = fix(s)
```
On line `228` the local varibale is initialized to a new string `'hello'`. On line `289` the local varibale `t` is initialized to the return value of the `fix` method invocation with the local varibale `s` passed to it as an argument. On line `282` to `286` the `fix` method is defined with a parameter `value`. Now `value` references the same string object that `s` rererences.On line `283` the `#upcase!` method is called on `value`, the `#upcase!` method mutates the calling object and returns the same object which is now upcased. So now the `value` is pointing to the same string object which is now upcased which will be `HELLO`. Then on line `284` `value` is reassigned to the return value of the `#+` method invocation on `value` with the string object `'!'` passed to it as an argument which will return a new string object which will be `'hello!'` to which now `value` points towards. The return value of method definition is the last statement evaluated which in our case is on line `285` which is `value`, this will return the string object referenced by it.So now `t` is referencing the string object that is returned by `fix(s)` method invocation which is the string `'HELLO!'`. This demonstrates the concept that method definition can access local varibales which are passed to them as arguments. Also that local variables are passed by reference value to method definition and they can be mutated inside the method definition given that the object is mutable and that the method called on the object mutates the calling object. In this code the method `#upcase!` mutates the caller but the method `#+` does not mutate the caller but returns a new object and the reassignment also creates a new pointer and is not mutating. From this we can conclude that the local variable `s` points to the string object with the value `'HELLO'` and `t` points to the string object `'HELLO!'`.

## 21

What does the following code return? What does it output? Why? What concept does it demonstrate?

What values do s and t have? Why?

```ruby
a = 4
b = 2

loop do
  c = 3
  a = c
  break
end

puts a
puts b
```
On line `300` the local variable `a` is initialized to a new integer object `4` and on line `301` the local variable `b` is initialized to a new integer object `2`. On line `303` the `loop` method is invoked with a `do..end` block passed to it as an argument. Inside the block on line `304` the local variable `c` is initialized to a new integer object `3` then on line `305` `a` is reassigned to the same integer object which `c` references. On line `306` the `break` keyword is executed and we exit the loop. On line `309` `puts` will output the string representation of the integer object referenced by `a` which will be `3` and on line `310` `puts` will output the string representation of the integer object referenced by `b` which is `2`. This demonstrates the concept that local variables initialized in an outer scope are accessible and can be reassigned in an inner scope. Also that the blocks follwed by method invocation create an inner scope.

## 22

What does the following code return? What does it output? Why? What concept does it demonstrate?

```ruby
a = %w(a b c)
a[1] = '-'
p a
```
On line `319` the local variable `a` initialized to a new array of strings `%w(a b c)`. On line `320` the array element assingment is used to reassign the `1` index element with the string `'-'`. then on line `321` `p` will print the array object referenced by `a` to the console and return it to, which is `["a", "-", "c"]`. This demonstrates the concept that the array element assigment method `#[]=` mutates the array object.

## 23

What does the following code return? What does it output? Why? What concept does it demonstrate?

```ruby
def add_name(arr, name)
  arr = arr + [name]
end

names = ['bob', 'kim']
add_name(names, 'jim')
puts names
```
On line `334` the local variable `names` is initialized to a new array object `['bob', 'kim']`. On line `335` the method `add_names` is invoked and the local varibale `names` and the string object `"jim"` is passed to it as an argument. On line `330` to line `332` the method `add_name` is defined with two parameters `arr` and `name`. Now `arr` points to the same array object as `names` and `name` points to the string object `"jim"` which is passed in as an argument. Inside the method definition `arr` is reassigned to the return value of the `#+` method invocation and the array object `[name]`passed in as an argument, this will return a new array with the elements of the array referenced by `arr` appended with the element of the array object with `name` as it's element which referes to the string object `"jim"`. So now `arr` points to the array object `['bob', 'kim', 'jim']` which is also implicity returned by the method definition as it is the last statement evaluated. On line `336` `puts` will output the string representation of each element of the array object referenced by `names` which is `bob` and `kim` and returns `nil`. This demonstrates the concept that the `Array#+` method does not mutate the callin array object and returns a new array object. Also that methods can access local variables which are passed to them as arguments and they have an implicit return value.