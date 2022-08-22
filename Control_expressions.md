# Control expression

## `if` Expression

- The `if` expression has a `test` expression and a 
'then' expreesion. if the `tets` expression is evaluated to be 
true then the `then` expression is evaluated.
The `else` expression can be added which will evaluate if all the
test are not evaluated to be true the `else` expression is executed.
We can add arbitrary number of tests to the `if` expression using 
`eslif`, which only executes if all the test above it do not evaluate to be true.

The `if` expression is complete when either the `if` condition or 
`elsif` condition matches.

The return value of an `if` expression is the last value executed in the expression. If no condition is met the return value of the `if` 
expression is `nil`.
