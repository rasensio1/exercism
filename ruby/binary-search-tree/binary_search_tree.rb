class Bst
  attr_accessor :data, :left, :right

  def initialize(num)
    @data = num
  end

  def direction(num)
    {true => [:right, :right=],
     false => [:left, :left=]}[num > data]
  end

  def insert(num)
    new_or_next(num, *direction(num))
  end

  def new_or_next(num, pos, set)
    command = send(pos) ? :next : :new
    {next: -> {send(pos).insert(num)},
     new: -> {send(set, Bst.new(num))}}[command].call
  end

  def t_data
    [left&.t_data, data, right&.t_data].compact
  end

  def each
    return enum_for(:each) unless block_given?
    t_data.flatten.each { |member| yield(member) }
  end
end

module BookKeeping
  VERSION = 1
end
