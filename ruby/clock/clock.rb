class Clock
  attr_reader :hours, :minutes

  def self.at(hrs, mins)
    new(hrs, mins)
  end

  def initialize(hrs, mins)
    @hours = hrs
    @minutes = mins
    self.+
  end

  def to_s
    sprintf("%02i:%02i", @hours, @minutes)
  end

  def +(mins=0)
    @minutes += mins 
    @hours += @minutes / 60
    @minutes %= 60
    @hours %= 24
    self
  end

  def ==(clock)
    instance_variables.map do |v| 
      instance_variable_get(v) == clock.instance_variable_get(v)
    end.all?
  end

end

module BookKeeping
  VERSION = 2
end
