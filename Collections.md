# Collections

Collections are made up of indiviual elements in a strcutured form. In order to work with collections we need know how reference each element, how to assign each element and how they are structured.

## String element reference

Strings use integer based index which represents each character in a string. The index starts at `0` and increments by one. when refering to a character we can use its index.

```ruby
str = 'good bye'
str[3] # => "d"
str[7] # => "e"
str[8] # => nil
```
We can refer multiple characters in a string

```ruby
str[2, 2] # => "od"
```
In the above code we used the String#Slice method which returns a new string when we pass in the starting index and length as parameters. The syntax used above is syntactical sugar for the String#slice method.

The `String#[]=` and `String#[]` methods returns a new string object

```ruby
str = 'hello'
str[3] # => "l"
str[0] # => "h"
str[2] # => "l"
```
So we cannot muatate each `char` in the string object. Strings are not true collections and each charaters are not objects of their own but part of the String Object.

## Array element reference

Arrays are index ordered list of elements. Where elements can be any object. The index are integers-based which are used to maintain the order of the elements and start from `0` with an increment of 
`1`.

```ruby
arr = %w(a b c d)

arr[0] # => "a"
arr[2] # => "c"
```
When we refrence an element from an array the return value is the
same object at that index.

The `Array#slice` method can be used to reference an element from
an array using range, index & length or only index as parameters.
The `Array#slice` when given an index returns the object. But with range or index & length as parameters a new array is returned as
shown in the example below.

```ruby
arr = [:a, 'b', 23, 'hello']

arr.slice(3, 1) # => ['hello']
arr.slice(3..3) # => ['hello']
arr.slice(3) # => "hello"
```

The `Array#slice` method when given a range or the start index & length as parameters it returns a new array object. But the element or the elements in the new array object returned are the same objects as in the caller array.

```ruby
arr = %w(a b c d)

word = arr.slice(0, 2) # => ["a", "b"]
word[0]  # => "a"
word[0].upcase!  # => "A"

arr  # => ["A", "b", "c", "d"]
```
## Hash element reference

Hash is a collection data structure that uses key value pairs instead of using integer based index. In hashes keys or values can be any type of Ruby object.

```ruby
hsh = {a: 1, 'b' => :d, 1 => 'name', 'age' => '25' }

hsh[:a] # => 1

hsh[1] # => "name"
```
When initializing a hash the keys must be *unique*. If keys are duplicated it will raise a warning and the fisrt occurence will be overwritten by the second occurrence.

```ruby
hsh = {'name' => 'sabtain', 'age' => 28, 'name' => 'ali'}

# the above will raise a warning and the first occurrence will be overwritten by the second occurrence
# => hsh = {'name' => 'ali', 'age' => 28}
```

values can however be duplicated.

We can access only the keys and the values from a hash with the helo of `Hash#keys` and `Hash#values` method. The method return arrays with the keys or the values.

```ruby
hsh = {Lhe: 'city', isl: 'capital', 24: 'number'}

hsh.keys # => [:Lhe, :isl, :24]
hsh.values # => ['city', 'capital', 'number']
hsh.values[1] # => "capital"
```
In the above code the `[1]` is referencing the element at index `1`
of the array `['city', 'capital', 'number']` since this is the return value of `hsh.values`.

## Element references gotchas

### out of bound indicies

when element reference is used for String objects and array objects, if the index referenced is out bounds `nil` is returned.

```ruby
str = 'sabtain'

arr = ['s', 'a', 'b', 't', 'a', 'i', 'n']

str[2] # => "b"
arr[2] # => "b"
```
```ruby
str[7] # => nil
arr[7] # => nil
```
The above code displays referencing elements out of bounds and so
`nil` is returned. For a string `nil` retrun value is understood as it is not a valid return value and we understand that the index is out of bound. But in case of an array `nil` can be an element of the array so `nil`  is a valid retrun value and we cannot be sure if the index is out of bound or it is a vlid array element.
To solve this it is better to use the `Array#fetch` as if the index is out of bound it raises `Indexerror`.

```ruby
arr = ['s', 'a', 'b', 't', 'a', nil]

arr.fetch(5) # => nil

arr.fetch(7) # => Index error
```
### Negative Indices

Arrays and strings elements can be referenced using negative index.

```ruby
str = 'abcd'

arr = ['a', 'b', 'c', 'd']

str[-1] # => "d"

arr[-2] # => "c"
```
The last element is referenced by `-1` and is decreased by `1`.

### Invalid Hash element reference

As hashes can have any type of object as keys or values. so `nil`
return value may not mean that the key is nor present and it will be hard to judge if the element reference is out of bound. To resolve this Ruby equips Hash class with a `fetch` method which will raise an error if the element reference is out of bound.

When referencing an item by its key in a hash ensure to use the correct object type

## Conversion

The fact that `string` and `Array` can be referenced using index they can be converted from one to the other. There are methods that are used for this conversion among which are the `Array#join`
and the `String#chars` methods.

```ruby
str = 'RUBY'

arr = str.chars # => ["R", "U", "B", "Y"]
```
`String#chars` return an array of indiviual characters

`Array#join` return a string with the elements joined together.

```ruby
str = 'RUBY is a programming language'

arr = str.split # => ["RUBY", "is", "a", "programming", "language"]

arr.join # => "RUBYisaprogramming language"
```
The sub strings in the array referred by `arr` are not the same object as string object referred by `str`.

**Hash** has a `#to_a` method which returns an array

```ruby
hsh = {a: 'b', c: 'c', age: 56}

hsh_arr = hsh.to_a # => [[:a, "b"], [:c, "c"], [:age, 56]]
```
The `Hash` object key value pairs referred by `hsh` when convereted to an Array object are the same objects. Only the keys' are frozen and so cannot be mutated but the values if mutated by a destructive method call will mutate the object and the effect will be visible in the original Hash object referred by `hsh`.
```ruby
hsh = {a: 'b', c: 'c', age: 56}

hsh_arr = hsh.to_a # => [[:a, "b"], [:c, "c"], [:age, 56]]

hsh_arr[0][1].upcase! # => "B"

hsh # => {:a=>"B", :c=>"c", :age=>56}
```
In the above code `Symbol` objetcs are used as keys and `Symbol` objects are immutable. But if any mutable object was used for keys in the `Hash` object we still cannot mutate the keys as they are frozen.

`Array` also has a `#to_h` method.

```ruby
arr = [[:a, "b"], [:c, "c"], [:age, 56]]

hsh = arr.to_h # => {:a=>"b", :c=>"c", :age=>56}

```
In the above codee each sub-array is the key-value pair.

## Element Assignment

### String Element Assignment

By using the `String` element assignment `#[]=` method we can change a specific value in the string.

```ruby
str = "i am a student at launch school"

str[0] = "I"

str # => "I am a student at launch school"
```
Element assignmnet is a destructive method which changes the string object referred by `str` permanently.

### Array Element Assignment

Similar to how we can assign seprate element in a string we can do the same with array elements

```ruby
a = [1, 2, 3, 4, 5]

a[0] += 1
a # => [2, 2, 3, 4, 5]
```
`a[0] += 1` is Ruby syntactical sugar for `a[0] = a[0] + 1`.
We are using element reference and element assignment at the same time.

### Hash Element assignment

For a hash, keys are used for element assignment.

```ruby
hsh = {city: 'lahore', country: 'pakistan', capital: 'islamabd'}

hsh[:city] = 'manhattan'

hsh # => {:city=>"manhattan", :country=>"pakistan", :capital=>"islamabd"}
```

# Looping

When working with collections it is common to perform some action on every element of the collection. Instead of writing the action again and again loops can used to perform the action on as many elements of the collection needed. Loops helps in removing repetitive code.

## Controlling the loop

In Ruby a simple loop is created by calling `KerneL#loop` method and passing a block to it. Any code code within the block will be executed each time the loop performs an iteration. As the `loop` method is included in the `Kernel` module it is available everywhere just like `puts` and `gets`.

```ruby
loop do
  puts "HELLO"
end
```
The above code will print 'HELLO' infinite times. To cater this infinite looping the use of the reserved word `break` will be used.
Because when `break` is executed, it exits the nearest loop. `break` if not passed an argument it will return `nil` which will be the return value of the block, which will in turn be the return value of `loop` method.

```ruby
loop do
  puts "HELLO"
  break
end
```
In the above code the `loop` will iterate only once.

If we want `loop` to iterate more than once we can use a conditional statement so that `break` is called only when the condition is met.

```ruby
loop do
  num = [1, 2, 3, 5].sample
  puts "Hello"
  break if num == 5
end
```
In the above code `num` is being initialized to the return value of the `Array#sample` method called on `[1, 2, 3, 4, 5]`. On each iteration num is reassigned with a random element from the array of integers and prints 'Hello' then on the last line if the conditional statement is met then `break` is executed and it exits the nearest
`loop`.

## Iteration

In the above code `loop` iterates more than once but we still cannot assume how many tiem it will iterate as `num` represents a random number amongst the array of integers provided. By using a variable we can control the number of iterations.

Lets say we want to print `'Hello'` five times. We will initialize a varibale before implementing the `loop` which will track the iteration number.

```ruby
counter = 0
loop do
  puts "Hello"
  counter += 1
  break if counter == 5
end
```
Notice that the variable `counter` is initialized outside the loop, if it were initialized inside it would get reassigned on each iteration and the condition would never be met.

In the above code we have used the `if` modifier. Which is that the keyword `if` and the condition appends a statement. In our case the statement is `break`.

## Break Placement

When the `break` is placed on the last line this mimics the behaviour of a "do/while" loop and in a "do/while" loop the code within the block is guranteed to execute at least once.

If the `break` keyword is moved to the first line within the loop this will then mimic `while` loop. The `while` keyword always precedes a condition. If the condition evaluates as true the code within the block will be executed and if the condition evaluates to false it the loop will stop.
**This means that the code below `break` may or may not execute depending on the condition**

## Next

Besides `break` Ruby provides us with the keyword `next` which when executed tells the loop to skip the rest of the iteration and start the next one.
`next` is used with a conditional, that is if the condition is met
`next` will be executed.

## Iterating over collections

### Strings

```ruby
alphabet = "abcdefghijklmnopqrstuvwxyz"
counter = 0

loop do
  break if counter >= alphabet.length
  puts alphabet[counter]
  counter += 1
end
```
We are using the string element reference to print each character and as counter conatains the iteration number we use counter value to refer the index value.

### Array

To iterate over an array the same logic is used as in the case of a string.

```ruby
arr = ['sabtain', 'ali', 'ibrahim', 'yusuf']
counter = 0
loop do
  break if counter == arr.size
  puts "My name is #{arr[counter]}"
  counter += 1
end
```

```ruby
arr = ['hey', :sym, 28, [22]]
counter = 0

loop do
  break if counter == arr.size
  puts arr[counter].class
  counter += 1
end
```
### hash

Hash use key-value pairs and not zero-based index to refer its elements so it is not possible to use a counter variable to reference the hash elements. As the keys and values can be any type of objects so it is not possible to use a simple counter variable to refer the hash elements.

```ruby
garage = {'mercedes' => 2, "bugatti" => 1, "range rover" => 1}
counter = 0

cars = garage.keys

loop do
  break if counter == cars.size
  current_car = cars[counter]
  number = garage[current_car]
  puts "I have #{number} #{current_car}"
  counter += 1
end
```
Looping requires four basic elements:
1. a loop
2. a counter
3. a way to retrieve the current value
4. a way to exit the loop

# Selection and Tarnsformation

Other than *iteration* there are two other actions that are performed on a collection they are *selection* and *trasnformation*.

*Selection* is picking out certain elements from a collection based on a certain criterion. For example selection of odd values within an array. On the other hand *transformaion* is to do with manipulating every element of the collection. For example decrement all the elements of an array. If there are `n` elements in a collection, selection results in less than `n` elements, while transformation results in exactly `n` elements.

Selection and trasnformation use the basics of looping. That is: a loop, a counter, a way to retrieve the current value, and a way to exit the loop. One add on for selection and transformation is the requirement of criteria. Selection uses this criteria to determine which elelemts are to be selected, while transformation uses the criteria to determine how to perform the trasnformation.

## Loopin to select and transform

A basic example of selection. Select the character `m` from the given string.

```ruby
str = 'abcdefghijklmnop'
selected_str = ''
counter = 0

loop do
  current_char = str[counter]

  if current_char == 'm'
    selected_str << current_char
  end

  counter += 1
  break if counter == str.size
end

selected_str # => "m"
```
In the above code the `if` statement is the selection criteria.

A simple example of transformation is adding `s` to each element of an array of string objects.

```ruby
arr = ['car', 'bike', 'jet']
transformed_arr = []

counter = 0

loop do
  current_element = arr[counter]

  transformed_arr << current_element + 's'

  counter += 1
  break if counter == arr.size
end

transformed_arr
```

In the above code the `line 44` is all trasnformation. As all elements are to be trasnformed the `if` statement is not needed.
Here the trasnformed elements are in a new array object. when trasnfoming is to be noted if the original collection is mutated or a new collection is returned.

Another example of selection.

```ruby
def select_fruit(hsh)
  fruits = {}
  counter = 0
  arr_key = hsh.keys

  loop do
    current_value = hsh[arr_key[counter]]
    if current_value == 'Fruit'
      fruits[arr_key[counter]] = current_value
    end

    counter += 1
    break if counter == arr_key.size
  end
  fruits
end


produce = {
  'apple' => 'Fruit',
  'carrot' => 'Vegetable',
  'pear' => 'Fruit',
  'broccoli' => 'Vegetable'
}

select_fruit(produce) # => {"apple"=>"Fruit", "pear"=>"Fruit"}
```
To cater an edge case that an empty hash is passed in as an argument
the `line 71` should be placed on top inside the `loop` method invocation with a block.

It is also to be noted that a new hash object is returned.

Now a few exapmles on trasnformation.

```ruby
def double_numbers(numbers)
  doubled_numbers = []
  counter = 0

  loop do
    break if counter == numbers.size

    current_number = numbers[counter]
    doubled_numbers << current_number * 2

    counter += 1
  end

  doubled_numbers
end

my_numbers = [1, 4, 3, 7, 2, 6]
double_numbers(my_numbers) # => [2, 8, 6, 14, 4, 12]

```

In the above code the original array is not mutated but a new array is returned by the method.

Below is an example where the original array object is mutated


```ruby
def double_numbers!(numbers)
  counter = 0

  loop do
    break if counter == numbers.size

    numbers[counter] *=  2

    counter += 1
  end

  numbers
end
```
Trasnformation can be on all th elements of a collection or it can be on a subset from the collection. Below is an example of trasnformation based on the criteria that the element is `odd`.

```ruby
def double_odd_numbers(numbers)
  doubled_numbers = []
  counter = 0

  loop do
    break if counter == numbers.size

    current_number = numbers[counter]
    current_number *= 2 if current_number.odd?
    doubled_numbers << current_number

    counter += 1
  end

  doubled_numbers
end

my_numbers = [1, 4, 3, 7, 2, 6]
double_odd_numbers(my_numbers)  # => [2, 4, 6, 14, 2, 6]

# not mutated
my_numbers                      # => [1, 4, 3, 7, 2, 6]
```
We can modify the above example with the `produce` hash where rather than hard lining the selection criteria we can pass the criteria.

similarly the above code we can pass in the number we want to multiply each element with in order for the transformation.

# Each Select and map

## each

each method is similar to the `loop` method. We will look at the example of the implementaion of `Array#each` method.

```ruby
[1, 2, 3].each do |num|
  puts num
end
```

In the above code the `each` method is invoked on the array
`[1, 2, 3]`. `each` is a passed a block `do..end`. On each iteration
the code within the block is executed. Each element in the array will be output by the `puts` method. On every iteration `each` sends in the current element of the array in the form of an argument. The `do..end` block parameter `num` represents the value of the current element of the array on each iteration.

`each` method for Hashes works a bit different as the they need two arguments per iteration.

```ruby
hsh = {a: 1, b: 2 c: 3}

hsh.each do |k, v|
  puts "the key is #{k} and its value is #{v}"
end

```
We can iterate over an array and hash using `loop` or `each` but there is difference in the return value. Once `each` is done iterating, it returns the *original collection*.

```ruby
def a_method
  [1, 2, 3].each do |num|
    puts num * 2
  end
end
```
The return value of `a_method` is the return value of the last expression evaluated. As `[1, 2, 3].each` is the last expression evaluated so the array `[1, 2, 3]` is the return value of `a_method`, as `each` returns the original object it was called upon.

## select

`select` method evaluates the return value of the block. Similar to a real method a block's return value is the last expression evaluated. 

While evaluating the return value of the block `select` method only cares about the *truthiness* of the return value. In Ruby everything is considered to be truthy except for `nil` and `false`.
If the return value of the block is "truthy" then the element during that iteration will be selected. If the return value of the block is "falsey" it will not be selected. When an element is selected it is placed in a new collection. Once `select` stops iterating, it returns a new collection containing all the selected elements.

## map

`map` method uses the return value of the block to perform transformation. `map` takes the return value of the block and places it in a *new collection* and does this on each iteration.

*map always performs transformation based on the return value of the block*

`map` does not care for the truthiness of the block's return value it just takes the return value as the transformation criteria.

```ruby
[1, 2, 3].map do |num|
  'hi'
end
```
what will be the output?

Since the string object `'hi'` is the last expression of the block it will be returned implicitly by the block which will be used as a transformation criteria by the `map` method. So the return value of
`map` method will be `['hi', 'hi', 'hi']`.

# More Methods

## `Enumerabel#any?`

```ruby
[1, 2, 3].any? do |num|
  num > 2
end
# => true
```
`any?` looks at the truthiness of the block's return value. If for any of the elements in the collection the block returns a truthy value the method will return `true`.

`any?` can also be used with Hash as `Enumerable` module includes Hash and Array. For Hash the block will require two parametersto access the key value pair of the Hash.

```ruby
{a: 'yes', b: 'no', c: 'all of the above'}.any? do |k, v|
  v.size > 3
end
# => true

```

## `Enumerable#all?`

`all?` works similar as it also checks the truthiness of the block's return value. But it returns `true` only if for all the elements of the collection the block returns a truthy value. If for even one element of the collection the block returns a falsy value the method will return `false`.

```ruby
[1, 2, 3, 4].all? do |num|
  num == 3
end

# => false
```

`all?` like `any?` can also be used with Hash.

```ruby
{name: 'stan', city: 'LA', car: 'range rover'}.all? do |k, v|
  v.size < 15
end

# => true
```

## `Enumerable#each_with_index`

similar to `each` the method `each_with_index` takes a block and execute the code within the block, the block's return value is ignored. `each_with_index` takes two arguments, when called on an array the first argument is the element value and the second is the index value of the element.

```ruby
[1, 2, 3, 4].each_with_index do |value, idx|
  puts "on index #{idx} the value is #{value}"
end

# on index 0 the value is 1
# on index 1 the value is 2
# on index 2 the value is 3
# on index 3 the value is 4
# => [1, 2, 3, 4]

```
As it can be verifed from the above code that similar to `each`,
`each_with_index` also returns the original collection.


When used with a Hash the first argument represents an array containing the key value pair and the second argument the index of the pair.

```ruby
{car: 'ranger rover', bike: 'bugatti', truck: 'mazda'}.each_with_index do |pair, idx|
  puts "The index of #{pair} is #{idx}"
end

# The index of [:car, "ranger rover"] is 0
# The index of [:bike, "bugatti"] is 1
# The index of [:truck, "mazda"] is 2
# => {:car=>"ranger rover", :bike=>"bugatti", :truck=>"mazda"}
```
## `Enumerable#each_with_object`

This method takes a block and also a method argument. The method argument is the collection which will be returned by the method. The block takes two of its own arguments, the first argument represents the current element and the second represents the collection object that was passed in as an argument to the method.

```ruby
[1, 2, 3, 4, 5].each_with_object([]) do |v, arr|
  arr << v + 2
end

# => [3, 4, 5, 6, 7]
```
In the above code the `arr` is initialized to an empty array.

when `each_with_object` is called on a Hash the block takes two arguments the first represents an array of key value pair and the second represents the collection object which will be returned by the method.

```ruby
{a: "no", b: "yes", c: "maybe"}.each_with_object([]) do |pair, arr|
  arr << pair.first
end
# => [:a, :b, :c]
```
There is one other syntax where paranthese can be used to capture the key value pair.

```ruby
{a: "no", b: "yes", c: "maybe"}.each_with_object({}) do |(k, v), h|
  h[v] = k
end

# => {"no"=>:a, "yes"=>:b, "maybe"=>:c}
```

# Sorting

So far we have seen the actions we can perform on a collection. Sorting is another action which can be performed on collections.

Sorting is mostly performed on arrays as the items can be accessed via their index and the order the items appears in is also important.

Strings do not have access to any sorting mehtods, but by converting them into an array we can perform sorting.

Hashes also didnt have access to sorting but now they have but as Hash values are accessed via their keys their is not a need to do this.

## What is Sorting?

Sorting is setting the order of the items in a collection based on a certain criterion.

```ruby
[2, 4, 3, 1, 5]
[1, 2, 3, 4 ,5]
```
In the above example the first array is our starting point and after sortign we reach at the second array. As we can the first array is in no particular order but the second array is ordered squentially.

Ruby has methods `#sort` and `#sort_by` to perfoming sorting. We can call the `Array#sort` method and that will give us the sqeuntially ordered array as a return value. When sort is called on an array a new array is returned in which the items are ordered squentially according to their value.

```ruby
[2, 1, 4, 5, 3].sort # => [1, 2, 3, 4, 5]
```

## Comparison

sorting is essetinally carried out by comparing the items in a collection and ordering them based on the result.

> Comparison is at the heart of how sorting works.

We have seen how an array of integers is sorted when the `sort` method is called on it. But an array can conatin any type of object like strings.

```ruby
['c', 'd', 'e', 'a', 'f', 'b']. sort # => ["a", "b", "c", "d", "e", "f"]
```
As we can see in the above example the array of strings is sorted alphabetically. But as how does sort know what the array contains. The answer is that it uses the method `<=>` to detrmine the order of the array elements.

## The `<=>` method

The `<=>` method performs comparison between two object of the same type and returns `-1`, `0`, or `1` depending on whether the first object is less than, equal to, or greater than the second object. If the objects cannot be compared `nil` is returned.

```ruby
2 <=> 1 # => 1
1 <=> 2 # => -1
2 <=> 2 # => 0
'b' <=> 'a' # => 1
'a' <=> 'b' # => -1
'b' <=> 'b' # => 0
1 <=> 'a' # => nil
```
The return value of `<=>` is used by `sort` TO determine in which order we must place the items. If `<=>` return `nil` to `sort` then an argument error is thrown.

```ruby
['s', 2].sort # ArgumentError (comparison of Integer with String failed)
```
The `sort` method does not actually care about how `<=>` method performs the comparison but only aoput the return values (`1`, `0`, `-1`). When using `sort` method it is important to check how `<=>` method performs comparison for that type of object which you want to sort. There are two things to take notice of
  1.Does that object type implement a `<=>` method.
  2.if yes, then what is the specific implementation of `<=>`  method for that type of object.

## The `sort` method

we can call `sort` on an array it returns a new array of ordered items and comparisons are performed using the `<=>` method on the items beign sorted.

We can call `sort` with a block this gives us more control on how the items are sorted. The block requires two arguments passed to it (the two items to be compared) and the return value of the block has to be `-1`, `1` or `0` or `nil`.

```ruby
[2, 1, 4, 5, 3].sort do |a, b|
  a <=> b
end
# => [1, 2, 3, 4, 5
```
The above code we call `<=>` on `a` and `b` to perform comparison using the `Integer#<=>` inside the block which the `sort` would have done if we simply called `sort` on the array without passing the block.

We can switch the order in which the items are compared and it would result in a new array with items sorted in a desecnding order.

```ruby
[2, 1, 4, 5, 3].sort do |a, b|
  b <=> a
end
# => [5, 4, 3, 2, 1]
```
We are allowed to write additional code inside the block as long as the block returns `-1`, `0`, `1`or `nil`

```ruby
[2, 1, 4, 5, 3].sort do |a, b|
  puts "#{b} is being compared with #{a}"
  b <=> a
end
# 2 is being compared with 1
# 1 is being compared with 4
# 1 is being compared with 5
# 1 is being compared with 3
# 2 is being compared with 3
# 2 is being compared with 4
# 2 is being compared with 5
# 5 is being compared with 3
# 3 is being compared with 4
# 5 is being compared with 4
# # => [5, 4, 3, 2, 1]
```

## The `sort_by` method

`sort_by` method is usually called with a block. The code in the block determines how the items are compared.

```Ruby
['ali', 'stan', 'jack'].sort_by do |name|
  name[2]
end

# => ["stan", "jack", "ali"]
```
In the above code we sorting the strings by comparing the character at index `2`, the rest of the characters are ignored.

Hash do not need to be sorted as the values are accessed by their keys rather than position, but if still we would want to sort a hash then calling `sort_by` would be a way to do so. When calling `sort_by` on a hash two agruments are passed to the block, the key and the value. Then the last argument evaluated inside the block should be the thing by which we want to sort.

```ruby
height = {sabtain: 6, ali: 4, jack: 4, stan: 7}
height.sort_by do |name, height|
  height
end

# => [[:ali, 4], [:jack, 4], [:sabtain, 6], [:stan, 7]]

```
`sort_by` whenever called on hash will return an array where the key-value pairs are objects in a nested array.

We can sort the hash by comparing the keys. The hash in the above code uses `symbol` for keys so in order to be sort based on keys we need to check the implementation of the `symbol#<=>` method. The `<=>` for `symbol` states that `symbols` are compared after `#to_s` is applied on the `symbol`. This tells us that when we use `Symbol#<=>` we are effectively comparing strings.

# Nested Data Structures

## Refrencing nested array elements

```ruby
arr = [[1, 2], [4, 5]]

arr[0] # => [1, 2]

arr[1][0] # => 4

arr[0][0] # => 1
```
By chaining element reference we can retrieve nested elements from an array.

## updating collection items

```ruby
arr = [[1, 2], [4, 5]]

arr[0] = "hello"

arr # => ["hello", [4, 5]]
```
By using element assignmet the element at index `0` is permanently changed to the string `'hello'`. This is a destructive action.

```ruby
arr = [[1, 2], [4, 5]]

arr[1][0] = 8

arr # => [[1, 2], [8, 5]]
```
In the above code we chained the element reference and element replacemnet to destructively change the element of the nested array in `arr`. The line `arr[1][0] = 8` can also be seen as `[4,5][0] = 5`. Here the `arr[1]` is element reference and the `[4,5][0] = 5` is element replacement.

We can add an element into an inner array by chaining element reference with appending an element.

```ruby
arr = [[1, 2], [4, 5]]
arr[0] << 3

arr # => [[1, 2, 3], [4, 5]]
```
In the above code the `arr[0]` is the relement reference which returns the inner array `[1]` and the second part `[1] <<  3` destructively appends `3` into the array referred.

instead of an integer we can also add an array

```ruby
arr = [[1, 2], [4, 5]]

arr << [3, 5]

arr # => [[1, 2], [4, 5], [3, 5]]
```
This results in a three layer data structure.

## Other nested structures

Arrays are not the only data structures that can be nested. Hashes can also be nested in an array.

For example we have an array with nested hashes and we want to add a key/value pair in the firts hash

```ruby
arr = [{a: 22, b: 33}, {c: 23, d: 34}]

arr[0][:b] = 56

arr # => [{:a=>22, :b=>56}, {:c=>23, :d=>34}]
```
In the above code there is a two part process. The first part `arr[0]` is element refrence which returns `{a: 22, b: 33}` and the second part is the hash key/value pair creation syntax to create a new key/value pair. The change is destructive, so the array `arr` reflects the change when we inspect it.

## Variable reference of nested collections

In a nested collection variables can be used to reference the inner collections directly.

```ruby
a = [1, 2]

b = [5, 6]

arr = [a, b]

```
we can state that `arr[0]` and `a` refer to the same `Array` object `[1, 2]` so if we change the elements of the array using element assignment `#[]=` or chaining element reference and element update the action is destructive and will be reflected directly in the array referenced by `a`.

```ruby
a = [1, 2]

b = [5, 6]

arr = [a, b] # => [[1, 2], [5, 6]]

a[1] = 6

arr # => [[1, 6], [5, 6]]

a # => [1, 6]
```
As we can see if we update the elemenet in the array using `a[1] = 6` this change is destructive and the change will reflect in `arr` when w einspect it.

Now what if we update the element in another way.

```ruby
a = [1, 2]

b = [5, 6]

arr = [a, b]

arr[0][1] = 6

arr # => [[1, 6], [5, 6]]

a # => [1, 6]

```
As we can see that by updating the nested array in `arr` we also updated the element in `a`. The reason behind this is that variables act as pointers. We can say that we are changing the object that `arr[0]` and `a` points to and they both are different ways to refer the same object.

## Shallow copy

When working with collections there might be a time when we want to copy a collection as whole before we make some major modifications. Ruby provides with methods that lets us make copies of objects and collections: `dup` and `clone`. Both of these methods create a shallow copy of the object they are called on. Shallow copy means that the object it is called on is copied but if the object on which the method is called on conatins other object, then thoes object are shred not copied.

`dup` and `clone` allows object within the copied object to be modified.

```ruby
arr1 = ['a', 'b', 'c']
arr2 = arr1.dup

arr2[0].upcase! # => "A"

arr1 # => ["A", "b", "c"]

arr2 # => ["A", "b", "c"]
```
It can be seen that the arr1 and arr2 are both effected this is because the destructive method `upcase!` is called on the object within the array but not the array itself. since the objects within the array are shared so if we reference them from within a particular array or other collection the object is beign effected not the array object.

```ruby
arr1 = ["a", "b", "c"]
arr2 = arr1.dup
arr2.map! do |char|
  char.upcase
end

arr1 # => ["a", "b", "c"]
arr2 # => ["A", "B", "C"]
```
Here the destructive method `map!` is being called on the array and not on the objects within it. So, `arr1` is left unchanged.

```ruby
arr1 = ["a", "b", "c"]
arr2 = arr1.dup
arr2.each do |char|
  char.upcase!
end

arr1 # => ["A", "B", "C"]
arr2 # => ["A", "B", "C"]
```
Here the destructive method `upcase!` is called on each element of `arr2` and not on the array object itself. As every element of `arr2` is a reference to the object referenced by the corresponding elements in `arr1`. So, when `upcase!` mutates the elements in `arr2`, `arr1` elements are also effected. We have changed the array elements not the array.

## Freezing Objects

Main difference between `dup` and `clone` is that `clone` preserves the frozen state of an object.

```ruby
arr1 = ["a", "b", "c"].freeze
arr2 = arr1.clone

arr2 << 3 # FrozenError (can't modify frozen Array: ["a", "b", "c"])
```
`dup` does not preseve the frozen state of the object.

```ruby
arr1 = ["a", "b", "c"].freeze
arr2 = arr1.dup

arr2 << 3 # => ["a", "b", "c", 3]
```
Objects in Ruby can be frozen so they cannot be modified.
Only immuatable objects can be mutated as non-mutated objects, like Integer, are already frozen. To check if an object is frozen we can call `frozen?` on that object.

```ruby
3.frozen? # => true
```
`freeze` only freezes the object its called on. If an object contains other objects and we call `freeze` on it, the objects within it won't be frozen. For eg if we have a nested array the nested object won't be frozen if we call `freeze` on the outer array.

```ruby
arr = [[1, 2], [3, 4], [5, 6]].freeze

arr[0] << 3 # => [1, 2, 3]

arr # => [[1, 2, 3], [3, 4], [5, 6]]
```
The above aslo applies for string within an array.

```ruby
arr = ['a', 'b', 'c'].freeze

arr[0].upcase! # => "A"

arr # => "A"
```