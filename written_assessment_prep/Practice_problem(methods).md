# Practice problem(methods)

## Problem 1

```ruby
[1, 2, 3].select do |num|
  num > 5
  'hi'
end
```
The `select` method performs selection based on the truthiness of the block's return value. In the above code the block will always return `"hi"` which evealuates to be true. Hence `select` will return a new array with all of the elements from the original array.

## Problem 2

How does `count` treat the block's return value? How can we find out?

```ruby
['ant', 'bat', 'caterpillar'].count do |str|
  str
end
```
If `count` is passed a block it evaluates the block's return value for its truthiness and counts the number of elements for which the block returns a truthy value.

## Problem 3

What is the return value of `reject` in the following code? Why?

```ruby
[1, 2, 3].reject do |num|
  puts num
end
```
The method `reject` makes selection based on the falsiness of the block's return value. In the above code the block's return value will always be the return value of `puts num` which is `nil` and it evaluates to false. `reject` will return a new array which will have all the elements of the original array.

## Problem 4

What is the return value of `each_with_object` in the following code? Why?

```ruby
['ant', 'bear', 'cat'].each_with_object({}) do |value, hash|
  hash[value[0]] = value
end
```

The `each_with_object` method takes a collection object as an argument. In this case a `Hash` object is passed as an argument to the method. The `Hash` object is passed into the block and after each iteration the `Hash` object represented here by `hash` is updated and returned. when all the iterations are complete the `each_with_index` method returns the initially given `Hash` object which contains all the updates.

## Problem 5

What does shift do in the following code? How can we find out?

```ruby
hash = { a: 'ant', b: 'bear' }
hash.shift
```
`Shift` method destructively removes the first key value pair and returns it in a two element array or the hash's default value if it is empty.

## Problem 6

What is the return value of the following statement? Why?

```ruby
['ant', 'bear', 'caterpillar'].pop.size
```
`pop` method is invoked on an array of string. `pop` destructively removes the last element of the calling array and return it. In our case `'catepillar`is the string removed from the array and returned on which the `String#size` method is invoked which returns the length of the string which will be `11` and the return value of the statement.

## Problem 7

What is the block's return value in the following code? How is it determined? Also, what is the return value of any? in this code and what does it output?

```ruby
[1, 2, 3].any? do |num|
  puts num
  num.odd?
end
```

The block's return value is the return value of the last expression evaluated within the block. In this case the last expression is `num.odd?` which returns `true` if `num` is an odd number. The method `any?` is invoked on an array of integers, `any?` returns `true` if even for one element of the caller object the block returns a truthy value. In this case the first element is `1` which is odd and so the block returns a truthy value and `any?` will stop iterating and return `true`. The `puts` method will only be invoked once for the first element so the output will be `1`.

## Problem 8

What is the return value of map in the following code? Why?

```ruby
{ a: 'ant', b: 'bear' }.map do |key, value|
  if value.size > 3
    value
  end
end
```
The `map` method evaluates the return value of the block and uses it to make transformation and returns an array conating the trasnformations. In our case the block return value will be `value` if the if expression evaluates to be true. The `if` condition will evaluate to be true only for the second element of the calling collection which is `bear` and hence it will eb returned by the block. For the first iteration `nil` is returned beacuse if no `if` condition is met `if` itself returns `nil` which will be returned as the `if` expression is the last expression within the block. `map` will return `[nil, 'bear']`.

## Problem 10

What is the return value of the following code? Why?

```ruby
[1, 2, 3].map do |num|
  if num > 1
    puts num
  else
    num
  end
end
```

`map` method will return an array containig trasnformed values based on the block's return value. The blocks return value is the last expression evaluated within the block. In our case for the first iteration the `if` condition  evaluates to false and so `num` is the last expression evaluated which is returned by the block. For the rest the `if` condition `num > 1` evaluates to true so `puts num` is the last expression evaluated which returns `nil` and so that will be the return value of the block for those iterations. The array `[1, nil, nil]` is returned by the `map` method.
