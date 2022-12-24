# pass-by-reference vs pass-by-value

## Variables as pointers

local variables are used to assign ruby objects to them.

```ruby
str = "greetings"
```
In the above code we have initialized the local varibale `str` to the string object `greetings`. The local varibale do not contain the value of the string object but instead it holds a refrence to the string object or we can say it points to the string object.

> **Variables are pointer to the physical space in memory**

The refrences the varibales have can be copied in some other variable. This will have two variables pointing to the same object. As in the code below.

```ruby
str = "greetings"
new_str = str
```
Here we have initialized the local variable `new_str` and have assigned it the the same string object that `str` references.

Reassingment provides a new refrence to the local variable even if the ruby objects' may have the same value.

```ruby
str = "greetings"
new_str = str

str = "greetings"
```
The last line of the above code, we have reassigned `str` to a new string object which has the same value as the string object on `line 25`
This we can confirm using the `object_id` method by calling on the objects. So basically the variables store the object_id of the object they point to.
```ruby
str = "greetings"
new_str = str
puts str.object_id # 70101471431160
puts new_str.object_id # 70101471431160

str = "greetings"
puts str.object_id # 70101471431174

puts new_str.object_id # 70101471431160
```
In the above code the outputs of `line 33` and `line 34` indicate that the local varibales `str` and `new_str` reference the same string object. Then on `line38` `str` is reassigned to a different string object which has the same value as the previous string object. 

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

Objects can be mutable or immutable. Mutable objects can be mutated i.e. there values can be altered. Immutable object cannot be mutated i.e. there values cannot be altered but can be reassigned.


## Immutable objects

In ruby `Integer`, `True`, `False`, `Nil` and `Symbol` class objects are immutable. This is because the respective classes do not contain any method which mutates the object.


## Mutable objects

Most of the objects in Ruby are mutable. They are objets of class that permit changes to the object's state in some way

## Non - mutating methods

A method is non mutating w.r.t the caller object or the argument passed in if the given object is not mutated. In Ruby there are some methods that do mutate the caller but a few mutate the arguments.All methods are non-mutating w.r.t immutable objects.

## reassignment

What this shows is that reassignment to a variable doesn’t mutate the object referenced by that variable; instead, the variable is bound to a different object.


