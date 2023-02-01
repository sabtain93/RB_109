=begin
Pete likes to bake some cakes. He has some recipes and ingredients.
Unfortunately he is not good in maths. Can you help him to find out,
how many cakes he could bake considering his recipes? 

Write a function cakes(), which takes the recipe (object) and the available ingredients
(also an object) and returns the maximum number of cakes Pete can bake (integer).
For simplicity there are no units for the amounts (e.g. 1 lb of flour or 
200 g of sugar are simply 1 or 200). Ingredients that are not present in the objects,
can be considered as 0.

Examples:
// must return 2 
cakes({flour: 500, sugar: 200, eggs: 1}, {flour: 1200, sugar: 1200, eggs: 5, milk: 200});  
// must return 0 
cakes({apples: 3, flour: 300, sugar: 150, milk: 100, oil: 100},
 {sugar: 500, flour: 2000, milk: 2000});  

problem:
input: 2 hashes
output: integer

rules:
check if we have enough ingredients compared to the recipe
return the amount cakes that can be made

Examples:
flour, sugar, eggs 
flour, sugar, eggs, milk
Check if my recipe items exist in the ingredients list

data structures
hash
array

algo
- extarct the recipe items in a list
- extract the ingedients items in a list
- check if all the recipe items exist in the ingerdients list
- then check how many can we make
- return the value of how many cakes can be made
=end 
def cakes(recipe, ing)
  recipe_list = recipe.keys
  ing_list = ing.keys
  amount_of_ing = []

  if recipe_list.all? { |items| ing_list.include?(items) }
    recipe.each do |k, v|
      amount_of_ing << ing[k] / v
    end
  else
    return 0
  end
  amount_of_ing.min
end

p cakes({"flour"=>500, "sugar"=>200, "eggs"=>1},{"flour"=>1200, "sugar"=>1200, "eggs"=>5,
 "milk"=>200}) == 2 
p cakes({"cream"=>200, "flour"=>300, "sugar"=>150, "milk"=>100, "oil"=>100},{"sugar"=>1700, "flour"=>20000, 
"milk"=>20000, "oil"=>30000, "cream"=>5000}) == 11 
p cakes({"apples"=>3, "flour"=>300, "sugar"=>150, "milk"=>100, "oil"=>100},{"sugar"=>500,
 "flour"=>2000, "milk"=>2000}) == 0 
p cakes({"apples"=>3, "flour"=>300, "sugar"=>150, "milk"=>100, "oil"=>100},{"sugar"=>500, "flour"=>2000, 
"milk"=>2000, "apples"=>15, "oil"=>20}) == 0 
p cakes({"eggs"=>4, "flour"=>400},{}) == 0 
p cakes({"cream"=>1, "flour"=>3, "sugar"=>1, "milk"=>1, "oil"=>1, "eggs"=>1},{"sugar"=>1, "eggs"=>1, "flour"=>3, 
"cream"=>1, "oil"=>1, "milk"=>1}) == 1 