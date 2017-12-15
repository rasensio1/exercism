require 'minitest/autorun'
require_relative 'alphametics'
require 'pry'

# Common test data version: 1.0.0 b9bada8
class AlphameticsTest < Minitest::Test

  def test_letters
    input = 'I + BB == ILL'
    expected = ['I', 'B', 'L']
    assert_equal expected, Alphametics.unique_letters(input)
  end

  def test_potential_solns
    tests = [{"I"=> 1}, {"I"=> 9}]
    perms = Alphametics.potential_solns(["I"])
    assert_equal true, tests.all? { |value_map| perms.include?(value_map) }
  end

  def test_sub_numbers
    sub_map = {"A" => 1, "B" => 2}
    expected = "11212"
    assert_equal expected, Alphametics.sub_numbers("AABAB",sub_map)
  end

  def test_addends_and_result
    expected = {addends: [12, 21], result: 14}
    assert_equal expected, Alphametics.addends_and_result("12 + 21 == 14")
  end

  def test_addends_equal_result?
    assert_equal false, Alphametics.addends_equal_result?({addends: [12, 21], result: 14})
    assert_equal true, Alphametics.addends_equal_result?({addends: [12, 21], result: 33})
  end

  def test_more_potential_solns
    tests = [{"I"=> 1, "L"=> 9}, {"I"=> 9, "L"=> 4}]
    perms = Alphametics.potential_solns(["I", "L"])
    assert_equal true, tests.all? { |value_map| perms.include?(value_map) }
  end

  def test_puzzle_with_three_letters
    input = 'I + BB == ILL'
    expected = { 'B' => 9, 'I' => 1, 'L' => 0 }
    assert_equal expected, Alphametics.solve(input)
  end

  def test_solution_must_have_unique_value_for_each_letter
    input = 'A == B'
    expected = {}
    assert_equal expected, Alphametics.solve(input)
  end

  def test_leading_zero_solution_is_invalid
    input = 'ACA + DD == BD'
    expected = {}
    assert_equal expected, Alphametics.solve(input)
  end

  def test_puzzle_with_four_letters
    input = 'AS + A == MOM'
    expected = { 'A' => 9, 'M' => 1, 'O' => 0, 'S' => 2 }
    assert_equal expected, Alphametics.solve(input)
  end

  def test_puzzle_with_six_letters
    skip
    input = 'NO + NO + TOO == LATE'
    expected = { 'A' => 0, 'E' => 2, 'L' => 1, 'N' => 7,
                 'O' => 4, 'T' => 9 }
    assert_equal expected, Alphametics.solve(input)
  end

  def test_puzzle_with_seven_letters
    skip
    input = 'HE + SEES + THE == LIGHT'
    expected = { 'E' => 4, 'G' => 2, 'H' => 5, 'I' => 0,
                 'L' => 1, 'S' => 9, 'T' => 7 }
    assert_equal expected, Alphametics.solve(input)
  end

  # The obvious algorithm can take a long time to solve this puzzle,
  # but an optimised solution can solve it fairly quickly.
  # (It's OK to submit your solution without getting this test to pass.)
  def test_puzzle_with_eight_letters
    skip
    input = 'SEND + MORE == MONEY'
    expected = { 'D' => 7, 'E' => 5, 'M' => 1, 'N' => 6,
                 'O' => 0, 'R' => 8, 'S' => 9, 'Y' => 2 }
    assert_equal expected, Alphametics.solve(input)
  end

  # The obvious algorithm can take a long time to solve this puzzle,
  # but an optimised solution can solve it fairly quickly.
  # (It's OK to submit your solution without getting this test to pass.)
  def test_puzzle_with_ten_letters
    skip
    input = 'AND + A + STRONG + OFFENSE + AS + A + GOOD == DEFENSE'
    expected = { 'A' => 5, 'D' => 3, 'E' => 4, 'F' => 7,
                 'G' => 8, 'N' => 0, 'O' => 2, 'R' => 1,
                 'S' => 6, 'T' => 9 }
    assert_equal expected, Alphametics.solve(input)
  end

  # Problems in exercism evolve over time, as we find better ways to ask
  # questions.
  # The version number refers to the version of the problem you solved,
  # not your solution.
  #
  # Define a constant named VERSION inside of the top level BookKeeping
  # module, which may be placed near the end of your file.
  #
  # In your file, it will look like this:
  #
  # module BookKeeping
  #   VERSION = 1 # Where the version number matches the one in the test.
  # end
  #
  # If you are curious, read more about constants on RubyDoc:
  # http://ruby-doc.org/docs/ruby-doc-bundle/UsersGuide/rg/constants.html

  def test_bookkeeping
    assert_equal 4, BookKeeping::VERSION
  end
end
