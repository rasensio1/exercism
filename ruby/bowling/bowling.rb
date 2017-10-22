class Game

  def initialize
    @frames = [Frame.new()]
  end

  def roll(pins)
    validate_roll(pins)
    if @frames.last.start_new?
      @frames << Frame.new(pins) 
    else
      @frames.last.roll(pins)
    end
    @frames[0...-1].each { |f| f.rolls << pins if f.need_bonus?}
  end

  def score
    raise Game::BowlingError if @frames.size < 10
    @frames.first(10).reduce(0){ |sum, frame| sum + frame.score }
  end

  def validate_roll(pins)
    raise BowlingError if [ pins > 10, pins < 0,
                            [@frames.size == 10,
                             @frames.last.start_new?,
                             !@frames.last.need_bonus?].all?
                          ].any?
  end

  class BowlingError < ArgumentError; end

end

class Frame
  attr_accessor :rolls

  def initialize(pins=nil)
    @rolls = (pins ? [pins] : [])
  end

  def roll(pins)
    raise Game::BowlingError if (@rolls[0] || 0) + pins > 10
    @rolls << pins
  end

  def start_new?
    rolls.first == 10 || size == 2
  end

  def need_bonus?
    (strike? || spare?) && size < 3
  end

  def size
    rolls.size
  end

  def strike?
    rolls.first == 10
  end

  def spare?
    !strike? && rolls.first(2).sum == 10
  end

  def score
    raise Game::BowlingError if need_bonus?
    rolls.sum
  end

end

module BookKeeping VERSION = 3; end
