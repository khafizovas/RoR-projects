# frozen_string_literal: true

require 'minitest/autorun'
require './main'

class TestLine < Minitest::Test
  def test_include_point_returns_true
    assert Line.new(-1, 0, 0, 1).include_point?(0.5, 1.5)
    assert Line.new(1, 0, 0, -13).include_point?(2, 13)
    assert Line.new(0, 0.5, 1, 0.5).include_point?(10, 0.5)
  end

  def test_include_point_returns_false
    assert !Line.new(-1, 0, 0, 1).include_point?(0.5, 1)
    assert !Line.new(1, 0, 0, -13).include_point?(1.5, 13)
    assert !Line.new(0, 0.5, 1, 0.5).include_point?(10, 0.25)
  end
end

class TestThickLine < Minitest::Test
  def test_inheritance
    assert_kind_of Line, ThickLine.new(1, 2, 3, 4, 5)
  end

  def test_include_point_returns_true
    assert ThickLine.new(-1, 0, 0, 1, 0.1).include_point?(0.55, 1.5)
    assert ThickLine.new(1, 0, 0, -13, 0.5).include_point?(1.75, 13)
    assert ThickLine.new(0, 0.5, 1, 0.5, 1).include_point?(10, 0.65)
  end

  def test_include_point_returns_false
    assert !ThickLine.new(-1, 0, 0, 1, 0.1).include_point?(1, 13)
    assert !ThickLine.new(1, 0, 0, -13, 0.5).include_point?(2.6, 13)
    assert !ThickLine.new(0, 0.5, 1, 0.5, 1).include_point?(10, 1.75)
  end
end
