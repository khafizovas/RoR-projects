# frozen_string_literal: true

require 'bencode'

class Result < ApplicationRecord
  validates :n, presence: true, numericality: { only_integer: true, greater_than: 0 }, uniqueness: true
  validates :result, presence: true, format: { with: /l(i\d+e)+e/, message: '%<value>s is not valid list of integers' }

  def values
    BEncode
      .load(self[:result])
      .each_slice(2)
      .map { |x| { dec: x[0], bin: x[1] } }
      .to_a
  end

  def values=(values)
    self[:result] =
      values
      .map { |res| [res[:dec], res[:bin]] }
      .flatten
      .bencode
  end
end
