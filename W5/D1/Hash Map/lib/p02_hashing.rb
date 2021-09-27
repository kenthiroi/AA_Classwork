class Integer
  # Integer#hash already implemented for you
end

class Array
  def hash
    sum = 0
    self.each_with_index { |n, i| sum += (i * n).hash }
    sum
  end
end

class String
  def hash
    sum = 0
    self.each_char.with_index { |char, i| sum += (char.ord * i).hash }
    sum
  end
end

class Hash
  # This returns 0 because rspec will break if it returns nil
  # Make sure to implement an actual Hash#hash method
  def hash
    sum = 0
    hash_array = self.to_a.sort
    hash_array.each do |sub|
      sum += sub.join.hash
    end
    sum
  end
end
