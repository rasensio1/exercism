class Game

  def initialize
    @frames = [[]]
  end

  def roll(pins)
    validate_roll(pins)
    if last_frame_full?
      @frames.push([pins])
    else
      @frames.last << pins
    end
  end

  def score
    validate_score
    @frames.first(10).map.with_index do |frame, i|
      score_frame(frame, i)
    end.sum
  end

  private

  def validate_roll(pins)
    raise BowlingError.new if [pins.negative?, pins > 10 ].any?

#catches sums for a frame over 10
    if !last_frame_full? 
      raise BowlingError.new if @frames.last.sum + pins > 10
    end

#prevents bonus rolls if 10th frame wasn't strike or spare
    if @frames.size == 10 && last_frame_full? && @frames.last.sum != 10
      raise BowlingError.new
    end
  end

  def last_frame_full?
    [@frames.last[0] == 10, @frames.last.size == 2].any?
  end

  def validate_score
    raise BowlingError.new unless @frames.size >=10

   if @frames[9].first == 10 #must roll bonus roles for strike
     unless @frames.slice(10, 2).flatten.size == 2
      raise BowlingError.new
     end
   end

   if @frames[9].sum == 10 #must roll bonus roles for spare
      raise BowlingError.new unless @frames.slice(10)
   end
  end

  def score_frame(frame, i)
    if frame.sum < 10
      frame.sum
    elsif frame.first == 10 #strike
      10 + next_throws(2, i)
    else #spare
      10 + next_throws(1, i)
    end
  end

  def next_throws(number, idx)
    @frames.slice(idx + 1, 2) #start at next frame, take next two frames
      .flatten.first(number).reduce(:+)
  end

end

class Game::BowlingError < ArgumentError
end

module BookKeeping
  VERSION = 3
end
