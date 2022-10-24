# local variable scope, especially how local variables interact with method invocations with blocks and method definitions

 ## local varibale scope w.r.t method invocation with blocks

Ruby blocks `{..}` or `do..end` create a new scope for local variables. The scope created by block followed by a method invocation is an inner scope. A local varibale scope is determined by where it is intialized. So the key point is that a local varibale initialized in an outer scope can be accessed in an inner scope but not the other way around.

Eg: outer scope local variables can be accessed by inner scope
```ruby
num = 2

loop do 
  puts num 
  num = 3 # `num` local varibale is reassigned to integer object `3`

  break
puts num # outputs `3` as the reassignment in the inner scope is visible in the outer scope.
end

# the output is `2` and `3` in this order. `nil` is the return value
```

Eg: inner scope local varibales are not accessibe in the outer scope
```ruby
loop do # the block `do..end` following the `loop` method innvocation creates an inner loop
  b = 2 # local varibale `b` is intialized to an Integer object `2`
  break
end

puts b # raises an error undefined local varibale or method

# as `b` local variable is intialized in an inner scope it is not accessible in the outer scope.
```
### Variable shadowing

some method invocation are passed blocks as arguments, the block can have a parameter. 
eg:
```ruby
[1, 2, 3].each { |n| puts n }
```
In the above code the each method is invoked on an array of integers with a block `{..}` passed as an agrument which has a parameter `n`. 

eg:
```ruby
num = 10

[1, 2, 3].each do |num|
  puts num
end

# `puts num` disregards the outer scope `num` and uses the block paramter which represents the elements of the Integer array
```
As in this case above a local variable was initalized in the outer scope with same name as the block parameter this is called variable shadowing and this prevents access of the outer scope local varibale inside the block. The block parameter shadows the outer scope local variable. 
variable shadowing also prevent from making changes to the outer scope variable `num` in the inner scope.

## Local varibale scope w.r.t method definition

A method defintion scope is self-contained. Methods can only access local varibales which are initalized within the method definition or that are defined as parameters.

Local variables which are not initalized inside a method definition must be defined as parameters.

the local variable scoping rules for method invocation with a block apply in a method definition.