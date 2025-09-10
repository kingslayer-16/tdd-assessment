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
end
