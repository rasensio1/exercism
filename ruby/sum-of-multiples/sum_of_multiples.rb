class SumOfMultiples
  def initialize(*args)
    @multiples=*args
  end

  def to(num)
    @multiples.flat_map do |mult|
      mult.my_fam_upto(num)
    end.uniq.reduce(0,:+)
  end
end

class Integer
  def my_fam_upto(num)
    (self..(num-1)).step(self).to_a
  end
end

module BookKeeping
  VERSION = 1
end
