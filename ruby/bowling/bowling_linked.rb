require 'pry'

class Game

  def initialize
    @frames = []
  end

  def permit_more_rolls?
    return if @frames.size < 10
    max_frames = 10

    if (@frames.last.strike? || @frames.last.spare?)
      max_frames = 11
    end

    # if (!@frames.last.strike? && @frames.last.full?)
    #   raise BowlingError.new
    # end
    #
    raise BowlingError.new if @frames.size == max_frames
  end

  def roll(pins)
    sanity(pins)
    permit_more_rolls?
    if !@frames.empty?
        if @frames.last.full?
            frame = Frame.new(pins)
            if @frames.size > 0
              @frames.last.next_frame = frame
            end
            @frames << frame
        else
            @frames.last.pins2 = pins
        end
    else
      @frames << Frame.new(pins)
    end

  end

  def sanity(pins)
    if pins.negative? || pins > 10
      raise BowlingError.new
    end
  end

  def score
    raise Game::BowlingError.new if @frames.empty? || @frames.size < 10
    @frames.first(10).reduce(0) { |sum, frame| sum += frame.my_score }
  end
end


class Frame
  attr_accessor :next_frame, :pins2
  attr_reader :pins1

  def pins2=(pins)
    if pins1 + pins > 10
      raise Game::BowlingError.new
    end

    @pins2 = (pins)
  end

  def initialize (pins1)
    @pins1 = pins1
    @pins2 = 0 if strike?
  end

  def full?
    pins1 && pins2
  end

  def strike?
    @pins1 == 10
  end

  def spare?
    !strike? && ( @pins1 + @pins2 == 10 )
  end

  def my_score
    if strike?
      if next_frame.strike?
        20 + next_frame.next_frame.pins1
      else
        10 + next_frame.pins1 + next_frame.pins2
      end

    elsif (@pins1 + @pins2 == 10) #spare
      10 + next_frame.pins1

    else
      @pins1 + @pins2
    end
  end

end

class Game::BowlingError < ArgumentError
end

