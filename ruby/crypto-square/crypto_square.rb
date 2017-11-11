class Crypto
  def initialize(string)
    @text = string.downcase.gsub(/[^a-z1-9]/, "")
  end

  def format(len, str)
    "%-#{len}s" % str
  end

  def ciphertext
    len = @text.length
    return @text if len == 0
    columns = (len**0.5).ceil
    rows = (len / columns.to_f).ceil

    splits = @text.each_char.each_slice(columns)

    columns.times.map do |y|
      str = splits.map{ |str| str[y]}.join
      format(rows, str)
    end.join(" ")
  end
end


module BookKeeping
  VERSION = 1
end
