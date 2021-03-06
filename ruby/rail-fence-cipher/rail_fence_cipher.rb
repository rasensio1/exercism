class RailFenceCipher
  VERSION = 1

  def self.encode(to_code, rails)
    return to_code if rails == 1
    idxs_for_chars(to_code, rails).map {|n| to_code.chars[n]}.join
  end

  def self.decode(coded, rails)
    return coded if rails == 1
    idxs_for_chars(coded, rails).zip(coded.chars).sort.map(&:last).join
  end

  private

  def self.rail_number(chr_index, rails)
    mod = rails - 1
    ((chr_index % (mod * 2) - mod).abs - mod).abs
  end

  def self.idxs_for_chars(string, rails)
    (0..string.length).sort_by { |n| rail_number(n, rails) }
  end

end

