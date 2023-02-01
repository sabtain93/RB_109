def letter_changes(string)

  arr = ('a'..'z').to_a

  arr2 = arr.rotate(3)

  lowercase_hsh = arr.zip(arr2).to_h

  upcase_arr = ('A'..'Z').to_a

  upcase_arr2 = upcase_arr.rotate(3)

  uppercase_hsh = upcase_arr.zip(upcase_arr2).to_h
  # p uppercase_hsh

  string.chars.map do |char|
    if char =~ /[a-z]/
      lowercase_hsh[char]
    elsif char =~ /[A-z]/
      uppercase_hsh[char]
    else
      char
    end
  end.join

end


p letter_changes("this long cake@&") == "wklv orqj fdnh@&"
p letter_changes("Road trip9") == "Urdg wuls9"
p letter_changes("EMAILZ@gmail.com") == "HPDLOC@jpdlo.frp"
p letter_changes('xyz') == ('abc')
