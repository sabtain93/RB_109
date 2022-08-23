# Variables as pointers

Variables are pointers which means that a varibale does not contian the object value but it contains a pointer or refrence to a specific area in memory that contains the value of the object.

> **variables are pointers to physical space in memory**

```ruby
a = "hi there" # local variabel `a` is intialized to the string object with
               # value `hi there'
               # `a` is pointing to a physical space in memory
b = a          # local varibale `b` is intialized with a copy of the
               # reference contained by `a`
a = "not here" # `a` is reassinged to a string object with value `not here`
               # now `a` is referencing to the string object `not here` 
               # which is not the same as the refrence contained by `b`.
```

> *Different memory spaces can hold the same value, but they are still different places in memory*

eg:
```ruby
a = [1, 2, 3, 3]
b = a
c = a.uniq # the `Array#uniq` method returns a new array and `c` is intialized to the return value of the `uniq` method call on `a` which points to array object `[1, 2, 3, 3]`. `c` now points to the array object `[1, 2, 3]`. `a` and `b` are still pointing to the array object `[1, 2, 3, 3]`.
```

eg:
```ruby
a = [1, 2, 3, 3]
b = a
c = a.uniq! # the `Array#uniq!` mutates the caller. `c` local intialized to the return value of `Array#uniq!` method call on `a` which point to the array object `[1, 2, 3, 3]`. As the array object referenced by `a` is mutated so now `a` is pointing to the array object `[1, 2, 3]` this change reflects on to `b` as it contains the copy of reference contained by `a`. Now `c` is pointing to the same object which is referenced by `a` and `b`
```

eg:
```ruby
def print_name(arr)
  arr.map {|name| "I am #{name}"}
end

names = %w('ali', 'sabtain', 'yusuf')

print_name(names)
```
In the above code the local varibale `name` is being passed as an argument
to the method `print_name`. ruby passes the copy of the refrence contained by the `names` variable to the method local varibale `arr`. The operations being performed on `arr` will determine wehter the object beign refrenced by `a` will be subject to mutation.