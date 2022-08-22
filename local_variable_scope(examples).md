
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

- Local variable `a` is beign initialized to an integer object 
with value of `4` to it

- `loop` method is being invoked with a `do..end` block passed to it as an argument. Inside the block the local variable `a` is reassigned to 
an integer object with value of `5`. So now the local variable `a` is pointing to the integer object with value `5`, as ruby local varibale scoping rules allows a local variable initialized in `main` be availble in the inner scope of the a block, hence the local variable `a` is reassigned. Next, local variable `b` is being initalized to an integer object with a value of `3` to it.
the loop iterates only once as the 'break'keyword terminates the loop on `line 8`. 

- on `line 11` `puts` method is invoked with the local varibale a passed to it as an argument. On line `12` we invoke the method `puts` with local varibale b passed to it as an argument.
The code outputs `5` and return `nil` as the return value of `puts` method is `nil`. The `puts` method call on `line 12` raises an error, as per the ruby varibale scoping rules, a local variable initialized inside a block is not accessible in the outer scope.

## local variables that are initialized in an inner scope CAN’T be accessed in the outer scope, but local variables that are initialized in the outer scope CAN be accessed in an inner scope.