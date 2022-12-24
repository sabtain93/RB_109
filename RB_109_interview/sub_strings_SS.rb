# def all_substrings(str)
#   sub_str_arr = [] 

#   (0...str.size).each do |idx| # 'asd', idx == 
#     (idx...str.size).each do |idx2|
#       sub_str_arr << str[idx..idx2]
#     end 
#   end 
#   sub_str_arr 
# end
# # p longest('asd') == 'as'
# # p longest('nab') == 'ab'
# p all_substrings('abcdeapbcdef') #==  'abcde'
# # p longest('asdfaaaabbbbcttavvfffffdf') == 'aaaabbbbctt'
# # p longest('asdfbyfgiklag') == 'fgikl'
# # p longest('z') == 'z'
# # p longest('zyba') == 'z'
#   (0...str.size).each do |idx|
# end 
# def longest(str)
#   longest_substring = ''
#   count = 0 
#   sub_strings = all_substrings(str)
#   alphabetized_subs = sub_strings.select do |word| 
#     word.chars.sort.join == word 
  
#   alphabetized_subs.each do |string|
#     if string.size > count 
#       count = string.size 
#       longest_substring = string 
#   longest_substring 
# p longest('asd') == 'as'
# p longest('nab') == 'ab'
# p longest('abcdeapbcdef') #==  'abcde'
# p longest('zyba') #== 'z'
def all_substrings(str)
  all_substring = []
  (0..str.size-1).each do |start|
    (start..str.size-1).each do |ending|
      all_substring << str[start..ending]
    end
  end
  all_substring
end
def longest(str)
  substring_arr = all_substrings(str)
  # find the substrings that are substrings
  alphabetic_arr = substring_arr.select do |substr|
    substr.chars.sort.join == substr
  #find the longest substr
  longest_str = ''
  current_size = 0
  alphabetic_arr.each do |substr|
    if substr.size > current_size
      longest_str = substr
      current_size = substr.size
  longest_str
p longest('asd')
p longest('nab') 
p longest('abcdeapbcdef') 
p longest('asdfaaaabbbbcttavvfffffdf') 
p longest('asdfbyfgiklag') 
p longest('z') 
p longest('zyba')