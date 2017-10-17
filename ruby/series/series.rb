class Series
  def initialize(string)
    @string = string
  end

  def slices(num)
    raise ArgumentError if @string.length < num
    (0..(@string.length - num)).map do |i|
      @string[i..(i + num - 1)]
    end
  end

end
