# frozen_string_literal: true

require_relative 'main'
require 'minitest/autorun'

class TestCalculations < Minitest::Test
  def test_calculations
    assert equal_to_sin3? 1e-3
    assert equal_to_sin3? 1e-4
  end

  private

  def equal_to_sin3?(eps)
    (calculate_sin(eps)[0] - Math.sin(3)).abs < eps
  end
end
