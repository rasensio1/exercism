class Alphametics
  def self.solve(input)
    result = potential_solns(unique_letters(input)).select { |soln| valid?(input, soln) }
    result.empty? ? {} : result.first
  end

  private

  def self.unique_letters(string)
    string.gsub(/[^\w]/, "").chars.uniq
  end

  def self.potential_solns(chars)
    (0..9).to_a.permutation(chars.size).map do |nums|
      chars.zip(nums).to_h
    end
  end

  def self.valid?(string, potential_soln)
    begin
      subbed = sub_numbers(string, potential_soln)
      addends_equal_result?(addends_and_result(subbed))
    rescue LeadingZeroError
      return false
    end
  end

  def self.sub_numbers(string, sub_map)
    string.gsub(/[A-Z]/, sub_map) 
  end

  def self.addends_and_result(string)
    to_add, result = string.split(" == ")
    str_addends = to_add.split(" + ")
    leading_zeroes?(str_addends.dup.push(result))
    {addends: str_addends.map(&:to_i), result: result.to_i}
  end

  def self.addends_equal_result?(addends:, result:)
    addends.reduce(:+) == result
  end

  def self.leading_zeroes?(str_nums)
    raise LeadingZeroError if str_nums.any? { |num| num[0] == "0"} 
  end

end

class LeadingZeroError < StandardError
end

module BookKeeping
  VERSION = 4 
end
