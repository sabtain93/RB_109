def nexus users
  ranks = users.keys
  honor = users.values
  
  difference = {}
  
  (0..honor.size - 1).each do |idx|
    subtraction = ranks[idx] - honor[idx]
    if subtraction < 0
      difference[ranks[idx]] = subtraction * -1
    else
      difference[ranks[idx]] = subtraction
    end
  end
  minimum_diff = difference.min_by { |_, v| v }[1]
  mini_value = difference.min_by { |_, v| v }[0]

  difference.each do |k, v|
    if v == minimum_diff
      if k < mini_value
        mini_value = k
      end
    end
  end

  mini_value

end


# users = {1 => 3, 3 => 3, 5 => 1}
# p nexus(users) #== 3

users = {1 => 10, 6 => 6, 3 => 3, 5 => 1}
p nexus(users) #== 3
