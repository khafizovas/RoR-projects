# frozen_string_literal: true

require_relative 'main'

eps3 = calculate_sin(0.001)
eps4 = calculate_sin(0.0001)

puts "С точностью 0.001: sin(3) = #{eps3[0].round(3)}; #{eps3[1]} итераций"
puts "С точностью 0.0001: sin(3) = #{eps4[0].round(4)}; #{eps4[1]} итераций"
