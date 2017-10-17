class RunLengthEncoding

  def self.encode(input)
    input.chars.chunk{|x| x}.map do |let, arr|
      count = arr.count
      count = "" if count == 1
      "#{count}#{let}"
    end.join
  end

  def self.decode(input)
    input.scan(/(\d+)?(.)/).reduce("") do |str, coded|
      str + (coded[1] * (coded[0] || 1).to_i)
    end
  end

end


module BookKeeping
  VERSION = 3
end
