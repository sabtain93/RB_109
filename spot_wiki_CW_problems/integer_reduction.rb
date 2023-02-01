=begin
123056,2 ->  1056

all possible combinations while maintaining order
3056 []
1256
1230
2305
1306

iterate
[0 1 2 3 4 5]

=end

def solve(n,k)
  string_arr = n.to_s.chars
  counter = string_arr.size - k
  combination_array = string_arr.combination(counter).to_a

  combination_array.map { |sub_array| sub_array.join }.min

end



p solve(123056,1) == '12056'
p solve(123056,2) == '1056'
p solve(123056,3) == '056'
p solve(123056,4) == '05'
p solve(1284569,1) == '124569'
p solve(1284569,2) == '12456'
p solve(1284569,3) == '1245'
p solve(1284569,4) == '124'