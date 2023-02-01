=begin
Sherlock has to find suspects on his latest case. He will use your method,
dear Watson. Suspect in this case is a person which has something not allowed 
in his/her pockets. 

Allowed items are defined by array of numbers.
Pockets contents are defined by map entries where key is a person and value
is one or few things represented by an array of numbers (can be nil or empty array if empty),

example:
pockets = {  
  bob: [1], 
  tom: [2, 5], 
  jane: [7] 
}

Write a method which helps Sherlock to find suspects. If no suspect is found or there are
 no pockets (pockets == nil), the method should return nil. 

problem:
input: hash and array of numbers
output: nil, array

rules:
- return nil if no people
- return nil if all people have no pockets or pockets are empty
- if allowed items is empty then all are suspects
- return nil if no suspects are found
- check the pockts if any item is found which is not in allowed list the person is a suspect


examples:

data
array

algo
- initialize suspect array to empty array
- return all people if allowed item list is empty
- return nil if pockets is empty
- initialize people array and store the names of people in it
- initalize pockets array which holds the list of the items people have
- iterate over the pockets array along with index
  - for each pocket
    - move onto next pocket if pocket is empty or nil
    - check if there is any item which is not in the allowed list
      - append the index of the pocket in the suspect array
  - return nil if suspect array is empty
  - return the suspect array if not empty
=end

def find_suspects(pockets, allowed_list)
  suspect_arr = []
  return nil if pockets.empty?

  if allowed_list.empty? && !pockets.values.select {|array| array != nil || !array.empty?}.empty?
      return pockets.keys
  end

  people_arr = pockets.keys
  pockets_arr = pockets.values

  pockets_arr.each_with_index do |pocket, idx|
    next if pocket == nil || pocket.empty?
    if pocket.any? {|item| !allowed_list.include?(item)}
      suspect_arr << idx
    end
  end
  return nil if suspect_arr.empty?
  suspect_arr.map do |pos|
    people_arr[pos]
  end


end

pockets = {}
p find_suspects(pockets, [1, 3]) == nil

pockets = { tom: [2], bob: [2], julia: [3], meg: [3] }
p find_suspects(pockets, [2, 3]) == nil

pockets = { julia: nil, meg: [] }
p find_suspects(pockets, [1, 6]) == nil

pockets = { meg: [3], tom: [5] }
p find_suspects(pockets, []) ==  [:meg, :tom]

pockets = { meg: [1, 3], tom: [5, 3] }
p find_suspects(pockets, [1, 3]) == [:tom]

