class BeerSong

  def bottles(x)
    {1=>"1 bottle", 0=>"no more bottles"}[x] || (x.to_s + " bottles")
  end

  def verse(x)
    result = "#{bottles(x).capitalize} of beer on the wall, #{bottles(x)} of beer.\n"
    part = {1=>Proc.new{result << "Take it down and pass it around"},
            0=> Proc.new{result<< "Go to the store and buy some more"; x=100}}
    part.default = Proc.new {result << "Take one down and pass it around"}
    part[x].call

    result << ", #{bottles(x-1)} of beer on the wall.\n"
  end

  def verses(first, last)
    first.downto(last).map {|num| verse(num) }.join("\n")
  end

end

module BookKeeping
  VERSION = 3
end
