method definition and method invocation

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
# the keyword enables the method to execute the block once
```



