# Truthiness, Logical operators `&&` and `||`

Logical operators will return a truthy or falsey value when evaluating two expressions.

## The `&&` operator

`&&` this is the 'and' operator, it returns a truthy value if all
expressions evaluates to be true. Even if one of the expressions 
evaluates to be false then the return value will be a falsy value.

Examples:

```ruby
num = 5
puts num < 10 && num.odd? # outputs `true` and returns `nil`
puts num < 10 && num.even? # outputs `false` and return `nil`
puts 2 && 3  # outputs `3` and returs `nil`
```

## The `||` operator

`||` is the 'or' operator, it returns a truthy value if one of the expressions evalutes to be true. If none of the expressions evaluates 
to be true the return value of the `||` operator will be falsy.

```ruby
num = 5
puts num < 5 || num < 10 # outputs `true` and returns `nil`
puts num < 5 || num.even? # outputs `false` and returns `nil`
puts 2 || nil # outputs '2` and returns 'nil'
puts nil || false # outputs `false` and returns `nil`
```


## Short Circuiting

The `&&` and `||` operators have a behaviour called short circuting 
which means that the operators will stop evaluating once they can guarantee the return value.

The `&&` will short cicuit once it evalutes the first false.
Eg: 
```ruby
puts false && 3 / 0 # outputs 'false' and returns `nil`.
```
In the above code the `&&` short circuit as it evaluates the first
false. which in this case was the boolean `false`.

The `||` will short circuit once it evaluates the first true.
Eg:
```ruby
puts true || 3 / 0 # outputs `true` and returns `nil`
```
In the above code the `||` short circuited at the first expression as it evaluates to be true. Moreover, in this case it is the ruby object 
`true`. The expression `3/0` is not evaluated.

## Truthiness

Ruby consider everything to be truthy other than `false` and `nil`.This means that we can use any expression in a conditional, or with logical operators, and as long as it does not evaluates to `nil` or `false` it is considered true but not the ruby object `true`.

Eg 1:
```ruby
num = 10

if num
  puts 'it is a valid number'
else
  puts 'not a valid number'
end
# the output is `it is a valid number' and returns `nil`
# this is because in ruby everything truthy other than `false` and `nil`
# and in the `if` caluse  the condition `num` returns `10` which evaluates to be true as it is neither `false` nor `nil`.
```
Eg 2:
```ruby
num = 11
num == true
# this returns false, as `num` returns the Integer object 
# `11` which evaluates to true but not equal to the object `true`
```
