class PhoneNumber
  def self.clean(number)
    cleaned = number.gsub(/\D|[1](?=(\D*\d\D*){10})/, "")
    result = /(\A[2-9]\d{2}[2-9]\d{6}\z)/.match(cleaned).to_s
    result.empty? ? nil : result
  end
end

module BookKeeping
  VERSION = 2
end
