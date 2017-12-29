class RailFenceCipher
  VERSION = 1

  def self.encode(to_code, rails)
    return to_code if rails == 1
    container = empty_container(rails, to_code)

    def self.setter_fn(container, let, i, rail_idx, msg)
       container[rail_idx][i] = let
    end

    rail_accessor(method(:setter_fn), to_code, rails, container)
    container.flatten.compact.join("")
  end

  def self.decode(coded, rails)
    return coded if rails == 1

    coded_chars = coded.chars
    container = empty_container(rails, coded)

    def self.setter_fn(container, let, i, rail_idx, msg)
       container[rail_idx][i] = true
    end

    #mark places where letters go
    rail_accessor(method(:setter_fn), coded, rails, container)

    #fill in rails with letters
    container = container.map do |rail|
      rail.map do |val|
        coded_chars.shift if val
      end
    end

    def self.setter_fn(container, let, i, rail_idx, msg)
      msg << container[rail_idx][i]
    end

    message = ""
    #construct message from rails
    rail_accessor(method(:setter_fn), coded, rails, container, message)
    message
  end

  private

  def self.rail_accessor(setter_fn, letters, rails, container, msg="")
    rail_idx = 0
    inc_dec = false

    letters.chars.each_with_index do |let, i|
      setter_fn(container, let, i, rail_idx, msg)
      inc_dec = !inc_dec if [0, rails-1].include?(rail_idx) #flip condition
      rail_idx = rail_func[inc_dec].call(rail_idx)
    end
  end

  def self.rail_func()
    {true => -> x {x + 1}, false => -> x {x - 1}}
  end

  def self.empty_container(rails, string)
    rails.times.map { |_|  [nil] * string.length }
  end
end

