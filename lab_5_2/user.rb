# frozen_string_literal: true

require_relative 'main'

puts 'Вводите строки по одной, окончание ввода по пустой строке.'
entered = []

ARGF.each_line do |line|
  line.chomp!

  break if ARGF.lineno > 1 && line == ''

  entered << line
end

corrected = entered.map { |string| correct string }

puts 'Исходные строки:'
print_strings entered

puts 'Скорректированные строки:'
print_strings corrected
