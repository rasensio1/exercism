class Crypto
  def initialize(string)
    @text = string.downcase.gsub(/[^a-z1-9]/, "")
  end

  def ciphertext
    len = @text.length
    return @text if len == 0
    c = (len**0.5).ceil
    r = (len/c.to_f).ceil

    res = Array.new(r) {Array.new(c, " ")}
    uncoded = res.map.with_index do |e, y|
      e.map.with_index do |l, x|
        @text[x + c*y] || " "
      end
    end

    coded = Array.new(c) {Array.new(r, " ")}
    coded.map.with_index do |l, y|
      l.map.with_index do |e, x|
        uncoded[x][y]
      end.join
    end.join(" ")
  end
end

module BookKeeping
  VERSION = 1
end
