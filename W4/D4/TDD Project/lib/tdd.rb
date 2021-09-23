

def uniq(arr)
  raise ArgumentError if !arr.is_a?(Array)
  ele_hash = Hash.new(0)
  arr.each_with_index do |ele, i|
    ele_hash[ele] += 1
    if ele_hash[ele] > 1
      arr.delete_at(i)
    end
  end
  return arr
end