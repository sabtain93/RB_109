
=begin
Your task is to Reverse and Combine Words. 

Input: String containing different "words" separated by spaces 
1. More than one word? Reverse each word and combine first with second, third with fourth and so on
(odd number of words => last one stays alone, but has to be reversed too) 

2. Start it again until there's only one word without spaces 
3. Return your result.

Input:  "abc def"
Output: "cbafed"

Input:  "abc def ghi 123"
Output: "defabc123ghi"

Input:  "abc def gh34 434ff 55_eri 123 343"
Output: "43hgff434cbafed343ire_55321"


add string into an array
iterate in an infinite loop
if size of array is equal to 1
  - return the string
  - break out of the loop
if the sizeof the array is even
  - reverse each word
  - initialize an empty array
  - combine the value index 0 with 1 append it to array
  - combine the value index 2 with 3 append it to array
  - till the last index
  - update the initial string array with the new array
if the size of the array is odd
  - reverse each word
  - initialize an empty array
  - combine the value index 0 with 1 append it to array
  - combine the value index 2 with 3 append it to array
  - do this till the value at the second last index
  - update the initial string array with the new array

=end

def reverse_and_combine_text(string)
  word_array = string.split
  loop do
    if word_array.size == 1
      return word_array.join
    elsif word_array.size > 1 && word_array.size.even?
      word_array.map! { |word| word.reverse }
      join_array = []
      index = 0
      while index <= word_array.size - 2
        join_array << word_array[index, 2].join
        index += 2
      end
      word_array = join_array
    elsif word_array.size > 1 && word_array.size.odd?
      word_array.map! { |word| word.reverse }
      join_array2 = []
      index = 0
      while index <= word_array.size - 3
        join_array2 << word_array[index, 2].join
        index += 2
      end
      word_array = join_array2 << word_array[-1]
    end
  end
end

# p reverse_and_combine_text("abc def") == "cbafed" 
# p reverse_and_combine_text("abc def ghi jkl") == "defabcjklghi" 
# p reverse_and_combine_text("dfghrtcbafed") == "dfghrtcbafed" 
p reverse_and_combine_text("234hh54 53455 sdfqwzrt rtteetrt hjhjh lllll12  44") == "trzwqfdstrteettr45hh4325543544hjhjh21lllll" 
p reverse_and_combine_text("sdfsdf wee sdffg 342234 ftt") == "gffds432243fdsfdseewttf"