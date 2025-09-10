require "test_helper"

class StringCalculatorTest < ActiveSupport::TestCase
  def test_add_empty_string_returns_zero
    calculator = StringCalculator.new
    assert_equal 0, calculator.add("")
  end

  def test_add_single_number_returns_that_number
    calculator = StringCalculator.new
    assert_equal 1, calculator.add("1")
  end

  def test_add_two_numbers_returns_sum
    calculator = StringCalculator.new
    assert_equal 6, calculator.add("1,5")
  end

  def test_add_multiple_numbers_returns_sum
    calculator = StringCalculator.new
    assert_equal 10, calculator.add("1,5,4")
  end
end
