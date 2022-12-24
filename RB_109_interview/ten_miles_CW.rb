# code wars problem.

=begin
You live in the city of Cartesia where all roads are laid out in a perfect grid.
You arrived ten minutes too early to an appointment, so you decided to take the opportunity
to go for a short walk. The city provides its citizens with a Walk Generating App on their
phones everytime you press the button it sends you an array of one-letter strings representing
directions to walk (eg. ['n', 's', 'w', 'e']). You always walk only a single block for each
letter (direction) and you know it takes you one minute to traverse one city block,
so create a function that will return true if the walk the app gives you will take you exactly
ten minutes (you don't want to be early or late!) and will, of course, return you to your
starting point. Return false otherwise.

Note: you will always receive a valid array containing a random assortment of direction letters
('n', 's', 'e', or 'w' only). It will never give you an empty array 
(that's not a walk, that's standing still!)

Examples:
is_valid_walk['n','s','n','s','n','s','n','s','n','s'].== true)
is_valid_walk(['w','e','w','e','w','e','w','e','w','e','w','e']).== false
is_valid_walk(['w']).== false
is_valid_walk(['n','n','n','s','n','s','n','s','n','s']) == false

P - [Understand the] Problem
input: array (characters that represent directions)
output: true (if we return back to start point and total time is 10 mins)
        false (if total time is less or more than 10 mins and we return back to start point)
- the input will never be an empty array
- 1 letter represents 1 block and 1 block takes 1 min to travel
- we need to travel for 10 mins

E - Examples / Test cases
is_valid_walk(['n','s','n','s','n','s','n','s','n','s']) == true
is_valid_walk(['w','e','w','e','w','e','w','e','w','e','w','e']) == false
is_valid_walk(['w']) == false
is_valid_walk(['n','n','n','s','n','s','n','s','n','s']) == false

D - Data Structure
array of characters
integer

A - Algorithm
- set a database with the directions associated to integer values 
- set a counter = 0
- set the starting point to the integer value 0
- iterate through the input list
- add the integer values respective to their character values to the starting point
- if the starting point is zero and counter is equal to 10
  - return true
- if not then return false

C - Code

=end
# solved by me

DIRECTION_HSH = {'n' => 1, 's' => -1, 'e' => 1, 'w' => -1}

def is_valid_walk(direction_arr)
  counter = 0
  starting_point = 0

  direction_arr.each do |direction|
    starting_point += DIRECTION_HSH[direction]
    counter += 1
  end
  if starting_point == 0 && counter == 10
    true
  else
    false
  end
end

p is_valid_walk(['n','s','n','s','n','s','n','s','n','s']) == true
p is_valid_walk(['w','e','w','e','w','e','w','e','w','e','w','e']) == false
p is_valid_walk(['w']) == false
p is_valid_walk(['n','n','n','s','n','s','n','s','n','s']) == false


# solved by smilja
# Rules: 
#   - each direction is one miinute 
#     - 10 minutes total 
#   - return to starting point 
#   - input array will always contain valid arguments 
#   - use a counter 
#     - want to have it be zero at the end 
#   - return false if input array size is less than or greater than 10 

# is_valid_walk['n','s','n','s','n','s','n','s','n','s'].== true
# n + 1
# s - 1
#   -
# is_valid_walk(['w','e','w','e','w','e','w','e','w','e','w','e'] == false
# is_valid_walk(['w']).== false 
# is_valid_walk(['n','n','n','s','n','s','n','s','n','s']) == false
#   3 - 1 + 1 -1 +1 -1 +1 -1 = 2 

# Steps: 
#   - return false if the input array size is less than or greater than 10 
#   - initialize n_s counter at 0 
#   - initialize e_w counter at 0 

#   iterate through input array 
#     - when 'n'
#       - increment n_s by 1 
#     - when 's'
#       - decrement n_s by 1 
#     - when 'e'
#       - increment e_w by 1 
#     - when 'w'
#       - decrement e_w by 1 
  
#   return a boolean of true if n_s is zero and e_w is zero