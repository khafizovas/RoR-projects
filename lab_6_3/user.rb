# frozen_string_literal: true

require_relative 'main'

puts 'Введите число отрезков разбиения:'
num = gets.chomp

unless num =~ /\d/
  puts 'Введите целое число!'
  exit 1
end

num = num.to_i

def_int1 = intprg(num, [0, 1]) { |x| Math.exp(x) / (x + 1) }
def_int2 = intprg(num, [0, 2], &->(x) { x * (x - 1) })

puts "Определённый интеграл e^x / (x + 1), a = 0, b = 1: #{def_int1}"
puts "Определённый интеграл x * (x - 1), a = 0, b = 2: #{def_int2}"
