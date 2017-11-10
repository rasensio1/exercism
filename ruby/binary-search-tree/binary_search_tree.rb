class Bst
  attr_accessor :data, :left, :right

  def initialize(num)
    @data = num
  end

  def insert(num)
    {true => lambda { insert_fac(num, :right, :right=)},
     false => lambda{ insert_fac(num, :left, :left=)}}[num > data].call
  end

  def insert_fac(num, pos, set)
    {true => lambda {send(pos).insert(num) },
     false => lambda {send(set, Bst.new(num))}}[!!send(pos)].call
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
