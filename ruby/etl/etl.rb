class ETL

  def self.transform(old)
    old.reduce({}) do |result, numlets|
      numlets[1].each { |let| result[let.downcase] = numlets[0] }
      result
    end
  end
end

module BookKeeping
  VERSION = 1 # Where the version number matches the one in the test.
end
