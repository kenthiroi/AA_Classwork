class HashSet
  attr_reader :count

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(key)
    hash_value = key.hash
    @store[hash_value % @store.length] << key
    @count += 1
    if @count >= num_buckets
      resize!
    end
  end

  def include?(key)
    hash_value = key.hash
    @store[hash_value % @store.length].include?(key)
  end

  def remove(key)
    hash_value = key.hash
    if include?(key)
      @store[hash_value % @store.length].delete(key)
      @count -= 1
    end
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
  end

  def num_buckets
    @store.length
  end

  def resize!
    if @count == @store.length
      new_hash = Array.new(num_buckets * 2) { Array.new }
      old = @store.flatten(1)
      old.each do |ele|
        hash_value = ele.hash
        new_hash[hash_value % new_hash.length] << ele
      end
      @store = new_hash
    end
  end
end
