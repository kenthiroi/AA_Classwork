class MaxIntSet
  attr_reader :store
  def initialize(max)
    @max = max
    @store = Array.new(max)
  end

  def insert(num)
    if num <= @max && num > 0
      store[num] = true
    else
      raise "Out of bounds"
    end
  end

  def remove(num)
    store[num] = nil
  end

  def include?(num)
    !store[num].nil?
  end

  private

  def is_valid?(num)
  end

  def validate!(num)
  end
end


class IntSet
  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
  end

  def insert(num)
    @store[num % @store.size] << num if !@store.include?(num)
  end

  def remove(num)
    idx = @store[num % @store.size].index(num) 
    @store[num % @store.size].delete_at(idx)
  end

  def include?(num)
    @store[num % @store.size].include?(num) 
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
  end

  def num_buckets
    @store.length
  end
end

class ResizingIntSet
  attr_reader :count

  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(num)
    if !include?(num)
      if @count == @store.length
        resize!
      end
      @store[num % @store.length] << num 
      @count += 1
    end
  end

  def remove(num)
    if include?(num)
      @store[num % @store.length].delete(num)
      @count -= 1
    end
  end

  def include?(num)
    @store[num % @store.length].include?(num)
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
  end

  def num_buckets
    @store.length
  end

  def resize!
    new_array = Array.new(@store.length * 2) { Array.new }
    flattened_array = @store.flatten
    bucket_size = @store.length * 2 
    flattened_array.each do |ele|
      new_array[ele % bucket_size] << ele
    end
    @store = new_array
  end
end
