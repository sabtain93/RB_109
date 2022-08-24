# pass-by-reference vs pass-by-value

## Pass by value

Pass by value means that when an object is passed to a method as an argument the value is passed which is that the copy of the object value is passed. This will not effect the local variable if there are any changes made inside the method def.

```ruby
def update_age(age) # `age` is not the local varibale initalize outside 
  age = 12          # the method def. This is not varibale shadowing
end                 # as the local varibale `age` is not accessible inside 
                    # the method def
age = 22

update_age(age)

puts age # this outputs `22` and not `12`, It looks like ruby is pass by value as the reassignment inside the method def did not effect the value of the local variable `age`
```

## Pass by reference

pass by reference means that the when passing an object as an argument to a method, a refrence to the object is passed. This would imply that any changes made to the object inside the method def will effect the object value outside the method def.

```ruby
def uppercase(str)
  str.upcase!
end

name = 'sabtain'

uppercase(name)

puts name # the output is `SABTAIN` this looks like ruby is pass by refrence
```
## What ruby actually does

Ruby exhibits behaviors from both 'pass by refrence' and 'pass by value'.

Important take away is:

> *when an operation inside the method mutates the caller it will affect the original object*

Reassingment is not destructive. There are ruby methods which are destructive and they have a naming convention as they end with a `!`.
But there are mthods which are destructive but do not follow the above mentioned naming convention eg. the shovel method `<<`.

## Mutability

Objects can be mutable or immutable. Mutable objects can be mutated i.e. there values can be altered. Immutable object canno be mutated i.e. there values cannot be altered but can be reassigned.


