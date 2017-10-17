class School
  attr_accessor :data

  def initialize
    @data = Hash.new { |h, k| h[k] = [] }
  end

  def add(name, grade)
    data[grade].push(name).sort!
  end

  def students(grade)
    data[grade]
  end

  def students_by_grade
    data.map do |num, students|
      {grade: num, students: students}
    end.sort_by {|line| line[:grade]}
  end

end

module BookKeeping
  VERSION = 3 
end
