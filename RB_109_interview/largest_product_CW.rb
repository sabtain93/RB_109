=begin
Complete the greatestProduct method so that it'll find the greatest product of five consecutive
digits in the given string of digits.

For example:

greatestProduct("123834539327238239583") // should return 3240
The input string always has more than five digits.

=end



def greatest_product(num_str)
  sub_str = []
  (0..num_str.size - 5).each do |idx1|
    (idx1 + 4..num_str.size - 1).each do |idx2|
      sub_str << num_str[idx1..idx2] if num_str[idx1..idx2].size == 5
      end
    end

  sub_str.map do |str|
    str.chars.reduce(1) { |product, num| product * num.to_i }
    end.sort.last
    
end


p greatest_product("1238345393")