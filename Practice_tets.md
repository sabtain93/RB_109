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