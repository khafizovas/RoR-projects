# frozen_string_literal: true

require 'test_helper'
require 'bencode'

class ResultTest < ActiveSupport::TestCase
  def gen()
    [
      { dec: 0, bin: 0 },
      { dec: 313, bin: 100111001 },
      { dec: 33, bin: 100001 },
      { dec: 585, bin: 1001001001 },
      { dec: 717, bin: 1011001101 },
    ]
  end

  def before_setup
    super
    @results = gen
  end

  test 'should set and get values' do
    instance = Result.new
    instance.values = @results
    assert_equal instance.values, @results
  end

  test 'should bencode values' do
    instance = Result.new
    instance.values = @results
    assert_equal instance.result, @results.map(&:values).flatten.bencode
  end

  test 'should error on non unique N' do
    instance = Result.new(n: 1)
    instance.values = [{ dec: 1, bin: 1 }]
    instance.validate
    assert_equal instance.errors[:n], ['has already been taken']
  end

  test 'should get data from db' do
    assert_equal Result.find_by(n: 1).values, [{ dec: 1, bin: 1 }]
  end

  test 'should save data into db' do
    instance = Result.new(n: 313)
    instance.values = [gen[1]]
    assert instance.save
  end
end
