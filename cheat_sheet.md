# Cheat Sheet

## each

```ruby
[[1, 2], [3, 4]].each do |arr|
  puts arr.first
end
<!-- # 1
# 3
# => [[1, 2], [3, 4]]
 -->
```

the `each` method is called on the nested array `[[1, 2], [3, 4]]`. `each` iterates over the elements of the calling array and invokes the block on each iteration passing in the current element where it is assigned to block's local variable `arr`. Within the block `Array#first` method is invoked on `arr`.

The `Array#first` method returns the `0` index element of the current array that `arr` refrences, which in this case will be the integers `1` and `3` respectively. `puts` method is invoked and the return value of `arr.first` is passed to it as an argument. `puts` will output `1` and `3` to the console and returns `nil` which is the blocks return value, as this is the last statement evaluated by the the block.

`each` method does not care for the blocks return value and returns the calling collection which in this case is `[[1, 2], [3, 4]]`.

***Expalin how does the `Array#each` method works?***

The `Array#each` method is invoked with a block passed to it an argument. The `each` method iterates over the elements of the caling collection and invokes the block on each iteration passing the current element into the block where it is assigned to the block's local variable. The expression within the block is executed for each element of the calling collection. The `Array#each` method returns the original calling object regardless of the block's return value.

## map

```ruby
[[1, 2], [3, 4]].map do |arr|
  puts arr.first
  arr.first
end
```

`map` method is invoked on the nested array `[[1, 2], [3, 4]]`. `map` method iterates over the calling array and invokes the block on each itreration passing in the current element into the block where it is assigned to the block's local variable `arr`.

Inside the block on line 3 `puts` method is invoked and the return value of `arr.first` is passed to it as an argument. `Array#first` method returns the `0` index element the current array which in this case will be the integer `1` and `3` respectively. Then `puts` outputs the string representation of the integer and returns `nil`.

On `line 4` again `Array#first` method is called on `arr` which will return integers `1` and `3` respectively and this will also be the blocks return value as it's the last statement evaluated inside the block. `map` returns a new array containing the objects returned by the block on each iteration and so in this case the map returns a new array `[1,3]`.

***Explain how `Array#map` method works?***

The `Array#map` method is invoked with a block passed to it as an argument. The `Array#map` method iterates over the elements of the calling collection and invokes the block on each iteration passing the current element into the block where the element is assigned to the block's local variable. On the each iteration, the code within the block is executed and the return value of the block is saved to a new array. This new array is then returned by the `map` method.

***Explain how `Hash#map` method works?***

The `Hash#map` method is invoked with a block passed to it as an argument. The `map` method iterates over elements of the calling hash and invokes the block on each iteration passing the current key/value pair into the block where it is assigned to the block's local variables. Where the first local variable of the block references the current key and the second references the current value of the calling hash. The expression within the block is executed for each Key/value pair of the hash. `Hash#map` uses the block's return value to perform trasnformation. It returns a new array object where each element is the block's return value on each iteration.

## Select

```ruby
[{ a: 'ant', b: 'elephant' }, { c: 'cat' }].select do |hash|
  hash.all? do |key, value|
    value[0] == key.to_s
  end
end
# => [{ :c => "cat" }]
```

`select` method is invoked on the array of hashes. The `select` method iterates over the elements of the calling hash and invokes the block on each iteration passing the current element into the block where it is assigned to the block's local varibale `hash`.

Inside the block `Hash#all?` is invoked on `hash` which references to hashes `{ a: 'ant', b: 'elephant' }` and `{ c: 'cat' }` respectively. `all?` method returns `true` if for all the elements of the calling object the block returns a truthy value and if even for one element the block returns a falsy value then `all?` will return `false`.

Inside the inner block the respective hash key string representaion returned by `key.to_s` is evaluated for equality with the `0` index character of the string referenced by `value`. For the `hash` value `{ a: 'ant', b: 'elephant' }` the `all?` returns `false` and `true` for `{ c: 'cat' }` and this will be the outer block's return value as it is the last statement evaluated within the outer block.

`select` method evaluates the truthiness of the blocks return value and perform selection based on it. `select` will return a new array with the selected elements from the calling array for ehich the block returns a truthy value, which will be `[{ c: 'cat' }]`.
s
***Explain how `Array#select` works?***

It is invoked with a block passed to it as an argument.The `select` method iterates over the elements of the calling array and invokes the block on each iteration passing in the current element of the calling array into the block where it is assigned it to the block's local variable. The expression within the block is executed for each item of the calling collection. The `Array#select` method evaluates the return value of block for its truthiness. It returns a new array with the elements of the calling collection for which the the block returns a truthy value.

***Explain how `Hash#select` works?***

It is invoked with a block passed to it as an argument. The `select` method iterates over the key/value pair of the calling hash and invokes the block on each iteration passing the current key/value pair into the block. Where the first local variable of the block references the current key and the second references the current value. The expression within the block is executed for each key/value pair of the calling hash object. The `Hash#select` method evaluates the return value of block for its truthiness. It returns a new hash with the Key/value pair of the calling collection for which the the block returns a truthy value.

## sort/sort_by

**Array#sort**

The `Array#sort` when called on an array, it returns a new array sorted sequentially. Sorting is perfomed by comparing the items in the collection with each other and placing them in an order based on the return value of the comparison.

Calling `Array#sort` on an array of characters, return a new array of characters ordered alphabectically.

The `sort` method uses the `<=>` method for the comaprison. Any object in a collection we want to sort must implement the `<=>` method. The `<=>` method performs comparison between two object of the same type. It returns `1` if first object is greater than the second, `0` if the first object is equal to the second, `-1` if the first object is smaller than the second and `nil` if the two object cannot be compared. The return value of the `<=>` method is used by `sort` to decide the order in which the items are to be placed. If `<=>` returns `nil` to `sort` then the `sort` method throws an argument error.


**string#<=>**

The string order is decided by a characters position in the ASCII table.

It is the ASCII character order that determines the result if we compare one ASCII character with another using the `String#<=>`. To determine the ASCII position we can call `.ord` on the string.

Some rules of ASCII table are.
1. Uppercase letters come before lowercase letters.
2. Digits and most punctuations come before letters.

**sort method**

We can call `sort` method on an array, which returns a new array of orderd items.

We can call sort with a block. This gives us more control on how items are sorted. The block need two argument passed to it which are to be compared. The return value of the block has to be -1, 0 or 1. We can switch the order from ascending to desencding by switching the comparison. We can add additional code inside the block as long as the return value of the block is -1, 0 or 1.

**sort_by**

It is usally called with a block. The block determines how the items are compared. 

```ruby
['cot', 'bed', 'mat'].sort_by do |word|
  word[1]
end
```
In the above code the characters at index `1` is beign compared of each string. So only characters `'o'`, `'e'` and `'a'` are compared the rest are ignored.

On line 107 the `sort_by` method is invoked on the array object `['cot', 'bed', 'mat']` and passed in a block as an argument. Each element is passed into the block and is assigned to the block's local variable `word`.

The `sort_by` method sorts the elements of the calling object based on the blocks return value, which in our case is the character at index `1` of the current element.

`sort_by` uses `<=>` method to compare the return values of the block, and sort the elements in the calling array accordingly. `<=>` compares two values by returning `-1` if the first operand is smaller than the second, `0` if they are equal, `1` if the first operand is larger than the second.  In Ruby strings are sorted using ASCIIbetical order. so the array `["mat", "bed", "cot"]` is returned.

**Hash#sort_by**

Hash can be sorted using sort_by method. When using `sort_by` with a hash, two arguments need to be passed to the block. The last thing evaluated in the block should be the thing by which we want to sort the hash.

`sort_by` always returns an array even when called on a hash. So the result will be a new array with key/value pairs as objects in nested array.

If hash keys are symbols then the `Symbol#<=>` is used for comparison. In Ruby symbols are compared after `to_s` is called on them. The `Symbol#to_s` returns the name or string corresponding to the symbol. By using `Symbol#<=>` we are basically comparing strings.

## shallow copy

There are two methods in ruby that create a shallow copy of objects.
1. dup
2. clone

Both of these methods create a shallow copy, this means that the object they are called on is copied. If the object contain other objects then those objects are shared, not copied. If a destrutive method is called on the object and not on the array itself, then the mutation will be reflected on the original object.

## freezing objects

The main difference between clone and dup is that. The clone method preserves the frozen state of the object.

An object can be freezed by calling `freeze` method on the object. In Ruby objects are frozen to prevent them from modification. Only mutable objects can be freezed. Immutable objects are already frozen.

We can use the `frozen?` method to check if an object is frozen.

**freeze**

The `freeze` method only freezes the object it is called on and not the objects conatined by that object.

```ruby
arr = [[1], [2], [3]].freeze
arr[2] << 4
arr # => [[1], [2], [3, 4]]
```


## Reassignment

What this shows is that reassignment to a variable doesn’t mutate the object referenced by that variable; instead, the variable is bound to a different object.

## Methods

Method definition cannot directly access local variables initialized outside the method definition nor can they be reassigned from inside a method definition.

A method defintion scope is self-contained. Methods can only access local varibales which are initalized within the method definition or that are defined as parameters.

Local variables which are not initalized inside a method definition must be defined as parameters.

the local variable scoping rules for method invocation with a block apply in a method definition.

## local variable scoping rule

Ruby blocks `{..}` or `do..end` create a new scope for local variables. The scope created by a block followed by a method invocation is an inner scope. A local varibale scope is determined by where it is intialized. So the key point is that a local varibale initialized in an outer scope can be accessed in an inner scope but not the other way around.

## variable shadowing

As in this case above a local variable was initalized in the outer scope with same name as the block parameter this is called variable shadowing and this prevents access of the outer scope local varibale inside the block. The block parameter shadows the outer scope local variable. 
variable shadowing also prevent from making changes to the outer scope variable in the inner scope.

## pass by reference value

when an operation inside the method mutates the caller it will affect the original object

## Short Circuiting (logical operators)

The `&&` and `||` operators have a behaviour called short circuting 
which means that the operators will stop evaluating once they can guarantee the return value.

The `&&` will short cicuit once it evalutes the first false.

The `||` will short circuit once it evaluates the first true.

## Truthiness

Ruby consider everything to be truthy other than `false` and `nil`.This means that we can use any expression in a conditional, or with logical operators, and as long as it does not evaluates to `nil` or `false` it is considered true but not the ruby object `true`

## Variables as pointers

Variables are pointers which means that a varibale does not contian the object value but it contains a pointer or refrence to a specific area in memory that contains the value of the object.

Different memory spaces can hold the same value, but they are still different places in memory

```ruby
def print_name(arr)
  arr.map {|name| "I am #{name}"}
end

names = %w('ali', 'sabtain', 'yusuf')

print_name(names)
```
In the above code the local varibale `name` is being passed as an argument
to the method `print_name`. ruby passes the copy of the refrence contained by the `names` variable to the method local varibale `arr`. The operations being performed on `arr` will determine wehter the object beign refrenced by `arr` will be subject to mutation.