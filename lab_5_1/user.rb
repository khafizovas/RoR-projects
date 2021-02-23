# frozen_string_literal: true

require_relative 'main'

puts 'Введите x в радианах, z и r через пробел:'
xzr = gets.split

y = y(*xzr.map(&:to_f)).round(6)
puts "y = #{y}"
