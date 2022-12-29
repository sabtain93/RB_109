# study session question (to me from matic)

def non_repeating_count(str)
  return '' if str.empty?
  str_arr = str.downcase.chars

  str.chars.uniq.detect do |char|
    str_arr.count(char.downcase) == 1
  end
end


p non_repeating_count('stress') == 't'
p non_repeating_count('sTress') == 'T'
p non_repeating_count('a') == 'a'
p non_repeating_count('') == ''
p non_repeating_count('Sabtain') == 'S'
p non_repeating_count('SATqttas') == 'q'
p non_repeating_count('SATQattas') == 'Q'