class Series
  def initialize(string)
    @string = string
  end

  def slices(num)
    num_slices = @string.length - num + 1
    raise ArgumentError if num_slices <= 0

    (0..(num_slices -1)).reduce([]) do |sum, i|
      sum << @string[i..(i + num - 1)]
    end
  end

end
