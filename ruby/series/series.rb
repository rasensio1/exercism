class Series
  def initialize(string)
    @string = string
  end

  def slices(num)
    end_index = @string.length - num
    raise ArgumentError if @string.length < num

    (0..end_index).map do |i|
      @string[i..(i + num - 1)]
    end
  end

end
