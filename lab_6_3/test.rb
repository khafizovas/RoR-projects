# frozen_string_literal: true

require_relative 'main'
require 'minitest/autorun'

class TestCalculations < Minitest::Test
  def calculate_integrals(num)
    [
      intprg(num, [0, 1]) { |x| Math.exp(x) / (x + 1) },
      intprg(num, [0, 2], &->(x) { x * (x - 1) })
    ]
  end

  def test_calculations
    expected = [1.12538608308327, 0.666666666666667]

    1.upto(6) do |counter|
      num = 10**counter
      integrals_values = calculate_integrals(num)

      assert floats_equal? integrals_values[0], expected[0], func1_calculate_eps(num)
      assert floats_equal? integrals_values[1], expected[1], func2_calculate_eps(num)
    end
  end

  private

  def func1_calculate_eps(num)
    (1.0 / (24 * num**2)).ceil
  end

  def func2_calculate_eps(num)
    (4.0 / (24 * num**2)).ceil
  end

  def floats_equal?(lhs, rhs, eps)
    (lhs - rhs).abs < eps
  end
end
