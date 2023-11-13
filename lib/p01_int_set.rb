class MaxIntSet
  
  attr_reader :store

  def initialize(max)
    @store = Array.new(max) { false }
  end

  def insert(num)
    if num > @store.length || num < 0
      raise "Out of bounds"
    else
      @store[num] = true
    end
  end

  def remove(num)
    @store[num] = false
  end

  def include?(num)
    @store[num]
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
    idx = num % 20
    unless include?(num)
      @store[idx] << num
    end
  end

  def remove(num)
    idx = num % 20
    @store[idx].delete(num)
  end

  def include?(num)
    idx = num % 20
    @store[idx].include?(num)
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
    if count == @store.length 
      resize! 
    end  
    idx = num % @store.length  
    unless include?(num)
      @store[idx] << num 
      @count += 1
    end  
  end

  def remove(num)
    if include?(num)
      idx = num % @store.length  
      @store[idx].delete(num)
      @count -= 1
    end  
  end

  def include?(num)
    idx = num % @store.length  
    @store[idx].include?(num)
  end

  def inspect 
    "ResizingIntSet, #{self.object_id}, count is : #{self.count}"
  end  

  private

  def num_buckets
    @store.length
  end

  def resize!
    # @store = Array.new(num_buckets) { Array.new }
    # if @count > @store.length 
    new_store = Array.new(@store.length * 2) {Array.new}
    @store.each do |bucket|
      bucket.each do |el|
        idx = el % new_store.length  
        new_store[idx] << el  
      end
    end   

    @store = new_store
  end

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
  end


end