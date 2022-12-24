

def pick_peaks(array)
  peaks = {"pos" => [], "peaks" => []}
  
  array.each_with_index do |num, idx|
    next if idx == 0 || idx == array.size - 1
    if array[idx + 1] <= num && array[idx - 1] < num && !(array[idx..-1].all? { |n| n == num})
      peaks["pos"] << idx
      peaks["peaks"] << num
    end
  end
  
  peaks
end

p pick_peaks([1,2,3,6,4,1,2,3,2,1]) ==  {"pos"=>[3,7], "peaks"=>[6,3]}
p pick_peaks([3,2,3,6,4,1,2,3,2,1,2,3]) == {"pos"=>[3,7], "peaks"=>[6,3]}
p pick_peaks([3,2,3,6,4,1,2,3,2,1,2,2,2,1]) == {"pos"=>[3,7,10], "peaks"=>[6,3,2]}
p pick_peaks([2,1,3,1,2,2,2,2,1]) == {"pos"=>[2,4], "peaks"=>[3,2]}
p pick_peaks([2,1,3,1,2,2,2,2]) == {"pos"=>[2], "peaks"=>[3]}