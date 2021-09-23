

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

def two_sum(arr)
  raise ArgumentError if !arr.is_a?(Array)
  sum = []
  arr.each_with_index do |el1, i1|

    arr.each_with_index do |el2, i2|
      if i2 > i1 && el1 + el2 == 0
        sum << [i1, i2]
      end
    end
  end

  sum
end

