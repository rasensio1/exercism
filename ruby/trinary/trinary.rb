class Trinary
  def initialize(string)
    @string = string
  end

  def to_decimal
    return 0 if !@string.match(/\A[012]*\z/)
    nums = @string.chars.map(&:to_i).reverse
    nums.map.with_index {|num, i| 3**i * num}.sum
  end
end

module BookKeeping
  VERSION = 1
end
