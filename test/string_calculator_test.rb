require "test_helper"

class StringCalculatorTest < ActiveSupport::TestCase
  def test_add_empty_string_returns_zero
    calculator = StringCalculator.new
    assert_equal 0, calculator.add("")
  end
end
