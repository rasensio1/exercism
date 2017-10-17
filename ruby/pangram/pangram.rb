class Pangram

  def self.pangram?(phrase)
    split = phrase.downcase.split("")
    ("a".."z").all?{ |x| split.include?(x)}
  end

end


module BookKeeping
  VERSION = 5
end
