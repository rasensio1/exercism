class Grains

  def self.square(num)
    raise ArgumentError if !num.between?(1, 64)
    1 << (num-1)
  end

  def self.total
    2**64 - 1
  end

end

module BookKeeping
  VERSION = 1
end
