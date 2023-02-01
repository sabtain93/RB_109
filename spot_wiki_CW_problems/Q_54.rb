
def comp(array1, array2)
  return false if array1 == nil || array2 == nil

  array1.all? {|number| array2.include?((number * number).to_i) }
end





 arr1 = [82, 95, 49, 24, 63, 77, 67]
 arr2 = [6724, 9025, 2401, 577, 3969, 5929, 4489]
 p comp(arr1, arr2)

