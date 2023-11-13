class Integer
  # Integer#hash already implemented for you
end

class Array
  def hash
    return 0 if empty?
    self.inject { |acc, ele| acc + ele * 2 }
  end
end

class String
  def hash
    self.chars.map { |char| char.ord }.inject { |acc, ele| acc + ele * 2 }.hash
  end
end

class Hash
  # This returns 0 because rspec will break if it returns nil
  # Make sure to implement an actual Hash#hash method
  def hash
    self.keys.map { |key| key.hash }.sum
  end
end