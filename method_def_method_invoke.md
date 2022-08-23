# method definition and method invocation

Method definition is when in our code we define a ruby method using the keyword `def`

eg:
```ruby
def print_name
  puts 'sabtain'
end
```

Method invocation is when a method is called, wether it is an exisiting ruby method or a cutom method defined by us using the `def` keyword.

```ruby
print_name
```
methods can be called with a block, but the block is only executed if the method defined in a particular way.

When a method is invoked with a block, the block is passed in as an argument.

```ruby
def print_name
  puts 'sabtain'
end

name = 'ali'

print_name do
  puts name
end
# outputs `sabtain`, the block is not executed as the method is not defined to use a block
```
In the above code the method is invoked with a `do..end` block but it isn't used as the method is not defines to use the block in any way. 

```ruby
def print_name
  yeild
  puts 'sabtain'
end

name = 'ali'

print_name do
  puts name
end
# outputs "ali"
# outputs "sabtain"
# the keyword `yeild` enables the method to execute the block once
```
Methods and blocks can interact with each other and the level of interaction is set by the method definition and used at method
invocation.

when defining methods we can also set that when we invoke the methdo with a block, it is not limited to executing the code in the block but can also use the return value of the block.

eg:
```ruby
[1, 2, 3, 8].map { |num| num + 1 }
# Array#map method uses the return value of the block to return an new array based on the block return value.
```




## Summary:

Method definition cannot access local variables initialized outside the method definition nor can they be reassigned from inside a method definition. Blocks can access local varibales initialized outside the block and can reassign the local varibale inside the block which is visible outside the scope of the block.

1. The `def..end` construction in Ruby is method definition.

2. Referencing a method name, either of an existing method or subsequent to definition, is method invocation.

3. Method invocation followed by `{..}` or `do..end` defines a block; the block is part of the method invocation.

4. Method definition sets a scope for local variables in terms of parameters and interaction with blocks.

5. Method invocation uses the scope set by the method definition.


