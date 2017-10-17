require 'pry'
class School
  attr_accessor :data

  def initialize
    @data = []
  end

  def add(name, grade)
    data.push([name, grade])
  end

  def students(grade)
    names = data.select do |info|
      info[1] == grade
    end.transpose[0]
    names ||= [] #catch nil results from transpose
    names.sort
  end

  def students_by_grade
    data.chunk{|info| info[1]}.map do |grade_raw|
      {grade: grade_raw[0],
       students: grade_raw[1].transpose[0].sort}
    end.sort_by { |graded| graded[:grade]}
  end

end

module BookKeeping
  VERSION = 3 
end
