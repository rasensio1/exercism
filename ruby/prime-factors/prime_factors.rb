require 'prime'
class PrimeFactors

  def self.for(num)
    Prime.prime_division(num).flat_map do |fac, exp| #[[2, 2], [5, 2]]
      [fac] * exp
    end
  end

end
