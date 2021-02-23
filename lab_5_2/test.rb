# frozen_string_literal: true

require 'minitest/autorun'
require_relative 'main'

class TestCorrection < Minitest::Test
  def test_correction
    50.times do
      given, expected = string_pair
      assert_equal expected, correct(given)
    end
  end

  def test_correction_example
    assert_equal 'Lived eated programmed', correct('Living eating programming')
  end

  private

  ALPHABET = ('A'..'z').to_a.freeze
  BOOLEAN = [true, false].freeze

  def word
    word = (ALPHABET.sample rand(1..10)).join.sub(/ing$/, 'f')
    expected = word

    flag = BOOLEAN.sample

    if flag
      word += 'ing'
      expected += 'ed'
    end

    [word, expected]
  end

  def string_pair
    given = []
    expected = []

    rand(1..7).times do
      cur = word

      given << cur[0]
      expected << cur[1]
    end

    [given.join(' '), expected.join(' ')]
  end
end
