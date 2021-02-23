# frozen_string_literal: true

require_relative 'main'
require 'minitest/autorun'

class TestCalculations < Minitest::Test
  def test_division_by_zero
    test1_params = [0, 0, 0]
    test1_y = y(*test1_params)

    assert_equal\
      test1_y, '0 / 0',
      assert_message(test1_params, test1_y)

    test2_params = [0, 0, 2.0]
    test2_y = y(*test2_params)

    assert_equal\
      test2_y, 'const / 0',
      assert_message(test2_params, test2_y)
  end

  def test_example
    test1_params = [3.14, 7.0, 13.0]
    test1_y = y(*test1_params)

    assert\
      float_equal?(test1_y, 3.8866),
      assert_message(test1_params, test1_y)

    test2_params = [1.0, 2.0, 3.0]
    test2_y = y(*test2_params)

    assert\
      float_equal?(test2_y, 1.75695),
      assert_message(test2_params, test2_y)
  end

  private

  def float_equal?(lhs, rhs)
    (lhs - rhs).abs < 1e-5
  end

  def assert_message(params, tested_y)
    "y(#{params.join(',')}) = #{tested_y}"
  end
end
