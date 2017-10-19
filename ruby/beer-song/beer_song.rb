require 'pry'
class BeerSong
  def initialize
    @first = <<-TEXT
! bottles of beer on the wall, ! bottles of beer.
TEXT
    @second = <<-TEXT
Take one down and pass it around, ? bottles of beer on the wall.
TEXT
  end

  def verse(num)
    first_part(num) + second_part(num)
  end

  def verses(start, fin)
    (fin..start).map { |num| verse(num) }.reverse.join("\n")
  end

  def first_part(num)
    num = "no more" if num == 0
    case num
    when 1
      @first.gsub("!", num.to_s).gsub("bottles", "bottle")
    else
      @first.gsub("!", num.to_s).capitalize
    end
  end
  
  def second_part(num)
    case num
    when 0 
      "Go to the store and buy some more, 99 bottles of beer on the wall.\n"
    when 1
      @second.gsub("?", "no more").gsub("one", "it")

    when 2
      @second.gsub("?", (num-1).to_s).gsub("bottles", "bottle")
    else
      @second.gsub("?", (num-1).to_s)
    end

  end
end

module BookKeeping
  VERSION = 3
end
