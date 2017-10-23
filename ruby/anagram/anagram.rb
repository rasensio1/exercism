class Anagram
  def initialize(word)
    @test = word.downcase.chars
  end

  def match(list)
    list.select { |word| is_anagram?(word) }
  end

  def is_anagram?(word)
    cleaned = word.downcase.chars
    return false if cleaned == @test

    dup = @test.dup
    cleaned.all? do |l| 
      dup.delete_at(dup.index(l) || dup.length) 
    end && dup.empty?
  end
end

module BookKeeping
   VERSION = 2
end
